"""Every label whose body starts with a text command, with its address in the build.
usage: labels.py REPO OUT.json"""
import json, re, sys
from pathlib import Path
repo, out = Path(sys.argv[1]), sys.argv[2]
sym = {}
for l in open(repo / "pokeyellow.sym"):
    m = re.match(r"([0-9a-f]{2}):([0-9a-f]{4}) (\S+)", l)
    if m:
        sym[m.group(3)] = (int(m.group(1), 16), int(m.group(2), 16))
START = re.compile(r"^\s*(text|text_ram|text_decimal|text_bcd|text_start)\b")
res, skipped = [], []
for d in ("text", "data", "scripts", "engine", "home"):
    for p in sorted((repo / d).rglob("*.asm")):
        rel = str(p.relative_to(repo))
        if rel == "data/pokemon/dex_text.asm":
            continue
        lines = p.read_text(encoding="utf-8").splitlines()
        parent = None
        for i, l in enumerate(lines):
            m = re.match(r"^(\.?[A-Za-z_][\w.]*)::?", l)
            if not m:
                continue
            name = m.group(1)
            if not name.startswith("."):
                parent = name
            full = f"{parent}{name}" if name.startswith(".") else name
            j = i + 1
            while j < len(lines) and (not lines[j].strip() or lines[j].strip().startswith(";")):
                j += 1
            if j >= len(lines) or not START.match(lines[j]):
                continue
            body = []
            for k in range(j, len(lines)):
                if re.match(r"^\.?[A-Za-z_][\w.]*::?", lines[k]) and k > j:
                    break
                body.append(lines[k])
            b = "\n".join(body)
            if full not in sym:
                skipped.append(full); continue
            res.append({"label": full, "file": rel, "line": i + 1, "bank": sym[full][0], "addr": sym[full][1],
                        "user": "<USER>" in b, "target": "<TARGET>" in b, "asm": "text_asm" in b,
                        "vars": re.findall(r"^\s*text_(?:ram|decimal|bcd)\s+(\w+)", b, re.M)})
json.dump(res, open(out, "w"), indent=0)
from collections import Counter
print(len(res), "labels", Counter(r["file"].split("/")[0] for r in res), "asm inside:", sum(r["asm"] for r in res), "not in sym:", len(skipped), skipped[:8])
