#!/bin/zsh
# Every text check before a merge, about two minutes.  usage: tools/qa/check_all.sh REPO [BASE_REPO]
# REPO, BASE_REPO: built checkouts (pokeyellow.gbc and pokeyellow.sym), e.g. a clone of the PR branch and of main.
# Prints the check scripts, the source scans, the sweep result (with the texts in realvalues.json rerun at their
# real values) and, with BASE_REPO, every text that looks different on screen from the base.
# PYTHON: a Python with PyBoy (tools/qa/requirements.txt), default python3.
# QA_OUT: where the runs go, default $TMPDIR/yellow-legacy-qa; the base run is cached there by commit.
set -u
Q=${0:A:h}
PY=${PYTHON:-python3}
OUT=${QA_OUT:-${TMPDIR:-/tmp}/yellow-legacy-qa}
sweep() {  # sweep REPO OUT: all labels, in 6 processes
  local repo=$1 out=$2 pids=()
  $PY $Q/labels.py $repo $out/labels.json > /dev/null
  for k in 0 1 2 3 4 5; do
    $PY $Q/sweep.py $repo $out/labels.json $out/sweep/sweep_$k.json --chunk $k/6 > $out/log_$k.txt 2>&1 &
    pids+=($!)
  done
  wait $pids
}
repo=${1:A}; out=$OUT/run_$(basename $repo); rm -rf $out; mkdir -p $out/sweep
print "== $(git -C $repo log --oneline -1)"
print "== check scripts"
( cd $repo && python3 tools/check_text_width.py 2>&1 | tail -3; python3 tools/check_text_mode.py 2>&1 | tail -1; python3 tools/check_names.py 2>&1 | tail -1 )
print "== source scans (missing @ before text_end, a second line in a box)"
python3 $Q/cmdscan.py $repo | grep -v UnusedText || print "none"
if [ $# -ge 2 ]; then
  base=${2:A}; bout=$OUT/run_base_$(git -C $base rev-parse --short HEAD)
  if [ ! -f $bout/done ]; then rm -rf $bout; mkdir -p $bout/sweep; ( sweep $base $bout && touch $bout/done ) & fi
fi
sweep $repo $out
print "== sweep"
$PY $Q/expect.py $repo $out/labels.json $out/sweep $out/expect.json | tail -1
python3 - $out $Q <<'PY'
import json, sys
out, Q = sys.argv[1:3]
real = {l for g in json.load(open(f"{Q}/realvalues.json")) for l in g["labels"]}
falls = {"_MoveNameText"}            # falls through into _ExclamationPointText by design
rep = json.load(open(f"{out}/expect.json"))["report"]
bad = [x for x in rep if x["flags"] and x["label"] not in real | falls]
for x in bad:
    print("  FLAG", x["label"], x["file"], [(a, b[:50]) for a, b in x["flags"]][:4])
print(f"  {len(rep)} texts, {len(bad)} with new flags")
PY
print "== texts that only ever print one value, at that value"
$PY - $out $repo $Q $PY <<'PY'
import json, os, subprocess, sys
out, repo, Q, py = sys.argv[1:5]
n = 0
for i, g in enumerate(json.load(open(f"{Q}/realvalues.json"))):
    d = f"{out}/real_{i}"; os.makedirs(d, exist_ok=True)
    subprocess.run([py, f"{Q}/sweep.py", repo, f"{out}/labels.json", f"{d}/sweep_0.json",
                    "--names", g["names"], "--only", ",".join(g["labels"])], capture_output=True)
    subprocess.run([py, f"{Q}/expect.py", repo, f"{out}/labels.json", d, f"{d}/expect.json", "--names", g["names"]],
                   capture_output=True)
    for x in json.load(open(f"{d}/expect.json"))["report"]:
        n += 1
        if x["flags"]:
            print("  FLAG", x["label"], g["names"], x["flags"][:3])
print(f"  {n} texts rerun")
PY
if [ $# -ge 2 ]; then
  wait
  print "== screen diff against $(git -C $base log --oneline -1)"
  python3 $Q/touched.py $repo $(git -C $base rev-parse HEAD) $out/labels.json > $out/touched.txt
  python3 $Q/diffsweep.py $bout/sweep $out/sweep $out/touched.txt
fi
