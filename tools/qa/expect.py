"""Compare the sweep's boxes with each text rendered from source with the sweep's maximum-length values.
usage: expect.py REPO LABELS.json SWEEP_DIR OUT.json [--names VAR=VALUE,...]
SWEEP_DIR holds the sweep_*.json files of sweep.py.
For every label: the lines the source says should appear (names and numbers filled in), and the lines seen.
Flags: missing (an expected line never appears exactly: cut off, hidden under the ▼, or overflowing),
       wide (an expected line is longer than 18 tiles), border (a box border tile was overwritten),
       unknown (a '·' tile inside the box), status (the text did not end normally)."""
import argparse, glob, json, os, re, sys
from pathlib import Path

ap = argparse.ArgumentParser()
for a in ("repo", "labels", "sweep", "out"):
    ap.add_argument(a)
ap.add_argument("--names", default="", help="VAR=VALUE,... on top of maxvalues.NAMES (as given to sweep.py)")
args = ap.parse_args()
repo, labels, sweep, out, names_override = Path(args.repo), args.labels, args.sweep, args.out, args.names
sys.dont_write_bytecode = True
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import maxvalues  # noqa: E402

NAMES = maxvalues.names(names_override)
NUMS = {k: v for k, (_, v) in maxvalues.NUMS.items()}
TOKENS = {"<PLAYER>": NAMES["wPlayerName"], "<RIVAL>": NAMES["wRivalName"], "<PKMN>": "<PK><MN>"}
ENC, DEC = {}, {}
for _l in open(repo / "constants/charmap.asm", encoding="utf-8"):
    _m = re.match(r'\s*charmap "(.+?)",\s*\$([0-9a-f]+)', _l)
    if _m:
        _v = int(_m.group(2), 16)
        ENC.setdefault(_m.group(1), _v)
        if _v >= 0x60 and _v not in DEC:
            DEC[_v] = _m.group(1)
DEC[0x7F] = " "
DEC.update({0xc9: "Ä", 0xca: "Ö", 0xcb: "Ü", 0xdc: "ä", 0xdd: "ö", 0xde: "ü"})
KNOWN = set(DEC) | set(range(0x79, 0x7F)) | {0xEE}
_KEYS = sorted(ENC, key=len, reverse=True)


def shown(s):
    """s as the screen reader shows it: charmap tiles, multi-character glyphs as '·'."""
    out, i = "", 0
    while i < len(s):
        if s[i] == "\x00":
            out += "\x00"; i += 1; continue
        k = next((k for k in _KEYS if s.startswith(k, i)), None)
        if k is None:
            out += "?"; i += 1; continue
        v = DEC.get(ENC[k], "·")
        out += v if len(v) == 1 else "·"
        i += len(k)
    return out


def body(lines, start):
    out = []
    for l in lines[start:]:
        if re.match(r"^\.?[A-Za-z_][\w.]*::?", l):
            break
        out.append(l.split(";")[0] if l.count('"') == 0 else l)
    return out


def render(lines, whose):
    """Expected visible lines, in order."""
    user = "Gegn. KNUDDELUFF" if whose == 1 else "KNUDDELUFF"
    target = "KNUDDELUFF" if whose == 1 else "Gegn. KNUDDELUFF"
    res, cur = [], ""

    def string(s):
        nonlocal cur
        s = s.split("@")[0]
        for t in re.findall(r"<[^>]+>|.", s):
            if t in ("<SCROLL>", "<_CONT>"):
                res.append(cur); cur = ""
            elif t == "<USER>":
                cur += user
            elif t == "<TARGET>":
                cur += target
            elif t == "#":
                cur += "POKé"
            else:
                cur += TOKENS.get(t, t)
        return "@" in s
    for l in lines:
        m = re.match(r"^\s*([a-z_]+)\b(.*)$", l)
        if not m:
            continue
        c, rest = m.groups()
        lit = re.findall(r'"([^"]*)"', rest)
        if c in ("line", "cont", "para", "next", "page"):
            res.append(cur); cur = ""
        if c in ("text", "line", "cont", "para", "next", "page") and lit:
            if string(lit[0]):
                break
        elif c == "text_ram":
            cur += NAMES[rest.split(",")[0].strip()]
        elif c == "text_decimal":
            cur += str(NUMS.get(rest.split(",")[0].strip(), "\x00"))
        elif c == "text_bcd":
            f = rest.split(",")[1].strip().split("|")[0].strip()
            n = int(f[1:], 16) if f.startswith("$") else int(f)
            cur += "9" * (2 * (n & 0x1F))
        elif c in ("done", "prompt", "text_end", "dex"):
            break
    res.append(cur)
    return [shown(r) for r in res if r.strip()]


def visible(box):
    rows = box["rows"]
    out = []
    for r in (rows[2], rows[4]):
        inner = r[1:19] if len(r) == 20 else r[1:]
        if inner.endswith("▼"):
            inner = inner[:-1]
        out.append(inner.rstrip())
    return out


lab = {x["label"]: x for x in json.load(open(labels))}
cache, report = {}, []
seen_labels = set()
for f in sorted(glob.glob(f"{sweep}/sweep_*.json")):
    for r in json.load(open(f)):
        x = lab[r["label"]]
        seen_labels.add(r["label"])
        lines = cache.setdefault(x["file"], (repo / x["file"]).read_text(encoding="utf-8").splitlines())
        whose = 0 if (x["target"] and not x["user"]) else 1
        exp = render(body(lines, x["line"]), whose)
        vis = [v for b in r["boxes"] for v in visible(b)]
        flags = []
        if r["status"] != "done":
            flags.append(("status", r["status"]))
        for e in exp:
            if len(e) > 18:
                flags.append(("wide", e))
            pat = re.compile(re.escape(e.rstrip()).replace("\x00", r"\d+") + "$")
            if not any(pat.match(v) for v in vis):
                flags.append(("missing", e))
        for b in r["boxes"]:
            rows = b["rows"]
            if not (rows[0] == "┌" + "─" * 18 + "┐" and rows[5] == "└" + "─" * 18 + "┘") or any(
                    len(rw) != 20 or rw[0] != "│" or rw[19] != "│" for rw in rows[1:5]):
                flags.append(("border", " | ".join(rows)))
                break
        for b in r["boxes"]:
            if any(t not in KNOWN for rw in b["raw"][1:5] for t in rw[1:19]):
                flags.append(("unknown", " | ".join(b["rows"][1:5])))
                break
        report.append({"label": r["label"], "file": f"{x['file']}:{x['line']}", "flags": flags, "expected": exp})
missing_labels = sorted(set(lab) - seen_labels)
json.dump({"report": report, "not_run": missing_labels}, open(out, "w"), ensure_ascii=False, indent=0)
from collections import Counter
print("labels checked:", len(report), "not run:", len(missing_labels))
print("labels with flags:", sum(1 for x in report if x["flags"]), Counter(k for x in report for k, _ in x["flags"]))
