"""Labels whose source lines a diff touches. usage: touched.py REPO BASE_COMMIT LABELS.json"""
import json, re, subprocess, sys
from collections import defaultdict
repo, base, labels = sys.argv[1:4]
starts = defaultdict(list)
for x in json.load(open(labels)):
    starts[x["file"]].append((x["line"], x["label"]))
diff = subprocess.run(["git", "-C", repo, "diff", "-U0", base, "HEAD", "--", "text", "data", "scripts", "engine", "home"],
                      capture_output=True, text=True).stdout
f, out = None, set()
for l in diff.splitlines():
    if l.startswith("+++ "):
        f = l[6:] if l.startswith("+++ b/") else None
    m = re.match(r"^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@", l)
    if m and f in starts:
        a, n = int(m.group(1)), int(m.group(2) or 1)
        for ln in range(a, a + max(n, 1)):
            cand = [lab for s, lab in sorted(starts[f]) if s <= ln]
            if cand:
                out.add(cand[-1])
print("\n".join(sorted(out)))
