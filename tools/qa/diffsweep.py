"""Which texts look different between two sweeps (e.g. main and a PR branch)?
usage: diffsweep.py BASE_SWEEP_DIR NEW_SWEEP_DIR [CHANGED_LABELS_FILE]
Compares the visible lines of every label's boxes. With CHANGED_LABELS_FILE (one label per line: the labels the
PR's diff touches), reports labels that changed on screen without being touched (regressions) and touched labels
whose screen did not change."""
import glob, json, sys


def load(d):
    out = {}
    for f in glob.glob(f"{d}/sweep_*.json"):
        for r in json.load(open(f)):
            lines = []
            for b in r["boxes"]:
                for row in (b["rows"][2], b["rows"][4]):
                    v = row[1:19].rstrip(" ▼")
                    if v and (not lines or lines[-1] != v):
                        lines.append(v)
            out[r["label"]] = (r["status"], lines)
    return out


base, new = load(sys.argv[1]), load(sys.argv[2])
touched = set(open(sys.argv[3]).read().split()) if len(sys.argv) > 3 else None
changed = sorted(l for l in set(base) & set(new) if base[l] != new[l])
added, removed = sorted(set(new) - set(base)), sorted(set(base) - set(new))
print(f"labels: base {len(base)}, new {len(new)}; changed on screen {len(changed)}, new {len(added)}, gone {len(removed)}")
for l in changed:
    mark = "" if touched is None else ("  touched" if l in touched else "  NOT TOUCHED: regression?")
    print(f"  changed {l}{mark}")
    b, n = base[l][1], new[l][1]
    for x in b:
        if x not in n:
            print(f"      - {x}")
    for x in n:
        if x not in b:
            print(f"      + {x}")
for l in added:
    print(f"  new     {l}")
for l in removed:
    print(f"  gone    {l}")
if touched is not None:
    for l in sorted(touched - set(changed) - set(added)):
        if l in new:
            print(f"  touched but looks the same: {l}")
