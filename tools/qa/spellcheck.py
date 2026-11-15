"""German spell check of every player-visible string, tuned to report as little noise as possible.
usage: spellcheck.py REPO GERMAN_DUMP GLOSSARY DICT_BASE OUT.json

Buckets (most likely errors first):
  typo       mixed-case word hunspell rejects, not in the German ROM, not a compound of known words
  oldspell   word hunspell rejects although the German ROM has it (old spelling such as daß, Tip)
  compound   word hunspell rejects, but it splits into two known words (low priority)
  caps       word in capitals that no name table, the German ROM or GLOSSARY.md has
  style      lowercase du/dein/dich/dir, doubled word, double space, space before punctuation
"""
import json, re, subprocess, sys
from collections import defaultdict
from pathlib import Path

repo, dump, glossary, dic, out = sys.argv[1:6]
repo = Path(repo)
CMD = re.compile(r'^\s*(text|line|cont|para|next|page|db|li)\s+(.*)$')
LIT = re.compile(r'"([^"]*)"')
L = "A-Za-zÄÖÜäöüßé"
WORD = re.compile(rf"[{L}]+")
CAPS = re.compile(r"^[A-ZÄÖÜÉ]{2,}s?$")


def strings():
    """(file, line, text) for every string literal of a text command, with <...> tokens removed."""
    for d in ("text", "data", "engine", "home", "scripts"):
        for p in sorted((repo / d).rglob("*.asm")):
            for n, l in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
                code = l.split(";")[0] if l.count('"') == 0 else l
                m = CMD.match(code)
                if not m:
                    continue
                for s in LIT.findall(m.group(2)):
                    s = s.split("@")[0]
                    s = re.sub(r"<[^>]*>", "\u2022", s).replace("#", "POKé")
                    yield str(p.relative_to(repo)), n, s


rows = list(strings())
# join words broken with a hyphen at the end of a line ("Ruck-" / "sack")
joined = []
for i, (f, n, s) in enumerate(rows):
    if joined and joined[-1][3] and f == joined[-1][0] and re.match(rf"[a-zäöüß]", s):
        pf, pn, ps, _ = joined[-1]
        first, rest = (s.split(" ", 1) + [""])[:2]
        joined[-1] = (pf, pn, ps[:-1] + first, False)
        s = rest
    joined.append((f, n, s, bool(re.search(rf"[{L}]-$", s))))

occ = defaultdict(list)       # word -> [(file, line, string)]
style = []
for f, n, s, _ in joined:
    for w in re.findall(rf"[{L}]+(?:-[{L}]+)*", s):
        for part in w.split("-"):
            if len(part) > 1:
                occ[part].append((f, n, s))
    for m in re.finditer(r"\b(du|dein\w*|dich|dir|euch|euer\w*)\b", s):
        style.append((f, n, s, f"lowercase {m.group(1)}"))
    for m in re.finditer(rf"\b([{L}]+) \1\b", s, re.I):
        style.append((f, n, s, f"doubled word {m.group(1)}"))
    if "  " in s.strip():
        style.append((f, n, s, "double space"))
    if re.search(r"\w [,.!?:;]", s):
        style.append((f, n, s, "space before punctuation"))
    if re.search(rf"[,][{L}]", s):
        style.append((f, n, s, "no space after comma"))


def hun(words, *opts):
    r = subprocess.run(["hunspell", "-d", dic, "-i", "utf-8", *opts], input="\n".join(words) + "\n",
                       capture_output=True, text=True, encoding="utf-8")
    return r.stdout


def rejected(words):
    return set(hun(sorted(set(words)), "-l").split())


def suggestions(words):
    sug = {}
    for l in hun(sorted(words), "-a").splitlines():
        m = re.match(r"^& (\S+) \d+ \d+: (.*)$", l)
        if m:
            sug[m.group(1)] = m.group(2).split(", ")[:5]
    return sug


dump_words = set(WORD.findall(open(dump, encoding="utf-8").read().replace("#", "POKé")))
gloss_words = set(WORD.findall(open(glossary, encoding="utf-8").read().replace("#", "POKé")))
name_words = set()
for p in repo.glob("data/**/names.asm"):
    name_words |= set(WORD.findall(p.read_text(encoding="utf-8").replace("#", "POKé")))
known_caps = {w for w in dump_words | gloss_words | name_words if w.isupper() or CAPS.match(w)}

caps = {w for w in occ if CAPS.match(w)}
mixed = [w for w in occ if w not in caps]
bad = rejected(mixed)

# compound split: a + optional linking letters + b, both known (hunspell or German ROM vocabulary)
cands = {}
for w in bad:
    lw = w.lower()
    for i in range(3, len(lw) - 2):
        for link in ("", "s", "n", "en", "es", "e"):
            if lw[i:].startswith(link) and len(lw) - i - len(link) >= 3:
                a, b = lw[:i], lw[i + len(link):]
                cands.setdefault(w, []).append((a, b))
parts = {x for v in cands.values() for a, b in v for x in (a, a.capitalize(), b.capitalize(), b)}
parts_bad = rejected(parts)
known_part = lambda x: x not in parts_bad or x in dump_words or x.capitalize() in dump_words


def splits(w):
    for a, b in cands.get(w, []):
        if (known_part(a) or known_part(a.capitalize())) and (known_part(b.capitalize()) or known_part(b)):
            return f"{a}+{b}"
    return None


res = defaultdict(list)
sug = suggestions(bad)
for w in sorted(bad):
    where = [f"{f}:{n}" for f, n, _ in occ[w]]
    item = {"word": w, "count": len(where), "where": where[:4], "context": occ[w][0][2], "suggest": sug.get(w, [])}
    if w in dump_words:
        if "ß" in w or w in ("Tip", "Tips"):
            res["oldspell"].append(item)
        else:
            res["dump_ok"].append(item)
        continue
    sp = splits(w)
    if sp:
        item["split"] = sp
        res["compound"].append(item)
    else:
        res["typo"].append(item)
for w in sorted(caps):
    base = w[:-1] if w.endswith("s") and w[:-1] in known_caps else w
    if base not in known_caps and w not in known_caps:
        where = [f"{f}:{n}" for f, n, _ in occ[w]]
        res["caps"].append({"word": w, "count": len(where), "where": where[:4], "context": occ[w][0][2]})
res["style"] = [{"where": f"{f}:{n}", "context": s, "what": why} for f, n, s, why in style]
json.dump(res, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print({k: len(v) for k, v in res.items()}, "words checked:", len(occ))
