"""Same English text (Legacy) -> different German text (ours)? usage: consist.py ENGLISH_REPO OUR_REPO"""
import re, sys
from collections import defaultdict
from pathlib import Path
CMD = re.compile(r'^\s*(text|line|cont|para|next|page|prompt|done|dex|text_end|text_ram|text_decimal|text_bcd|text_far)\b(.*)$')

def blocks(repo):
    out = {}
    for d in ("text", "data/text"):
        for p in sorted((Path(repo) / d).rglob("*.asm")):
            lab, buf = None, []
            for l in p.read_text(encoding="utf-8").splitlines() + ["END::"]:
                m = re.match(r'^(\w+)::?\s*$', l)
                if m:
                    if lab and buf:
                        out[lab] = (str(p.relative_to(repo)), " ".join(buf))
                    lab, buf = m.group(1), []
                    continue
                m = CMD.match(l)
                if m and lab:
                    c, rest = m.groups()
                    s = "".join(re.findall(r'"([^"]*)"', rest)) if '"' in rest else (f"{{{c} {rest.strip()}}}" if c.startswith(("text_ram", "text_dec", "text_bcd", "text_far")) else "")
                    buf.append(s.replace("@", ""))
    return {k: (f, re.sub(r"\s+", " ", v).strip()) for k, (f, v) in out.items()}

en, de = blocks(sys.argv[1]), blocks(sys.argv[2])
groups = defaultdict(set)
for lab, (f, t) in en.items():
    if lab in de and len(t) > 12:
        groups[t].add(lab)
n = 0
for t, labs in sorted(groups.items()):
    ger = defaultdict(list)
    for lab in labs:
        ger[de[lab][1]].append(lab)
    if len(ger) > 1:
        n += 1
        print(f"== EN: {t[:110]}")
        for g, ls in ger.items():
            print(f"   DE: {g[:110]}   <- {', '.join(sorted(ls))[:120]}")
print(n, "English texts with more than one German version")
