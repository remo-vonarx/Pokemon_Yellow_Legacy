"""Static scan for text command slips.
usage: cmdscan.py REPO
  noat:    a string command without "@" right before text_end (the text runs on into the next bytes)
  overwrite: a second `line` in the same box (after line or cont): the bottom row is overwritten, not scrolled"""
import re, sys
from pathlib import Path
repo = Path(sys.argv[1])
STR = ("text", "line", "cont", "para", "next", "page")
for d in ("text", "data", "scripts", "engine", "home"):
    for p in sorted((repo / d).rglob("*.asm")):
        rel = p.relative_to(repo)
        prev = None          # (command, has_at, n)
        row = None           # None / "top" / "bottom" within the current box
        label = None
        for n, l in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
            if re.match(r"^\.?[A-Za-z_][\w.]*::?", l):
                label, row, prev = l.split(":")[0], None, None
                continue
            m = re.match(r"^\s*([a-z_]+)\b(.*)$", l.split(";")[0] if '"' not in l else l)
            if not m:
                continue
            c, rest = m.groups()
            lit = re.findall(r'"([^"]*)"', rest)
            if c == "text_end" and prev and prev[0] in STR and not prev[1]:
                print(f"noat      {rel}:{prev[2]} {label}: {prev[0]} \"{prev[3]}\" + text_end")
            if c in ("text", "para", "page"):
                row = "top"
            elif c == "line":
                if row == "bottom":
                    print(f"overwrite {rel}:{n} {label}: line \"{lit[0] if lit else ''}\" after a bottom-row line")
                row = "bottom"
            elif c == "cont":
                row = "bottom"
            elif c in ("done", "prompt", "text_end", "text_far", "text_asm"):
                row = None
            if c in STR and lit:
                prev = (c, "@" in lit[-1], n, lit[-1])
            elif c in ("text_ram", "text_decimal", "text_bcd", "text_start", "text_far", "sound_get_item_1",
                       "sound_get_key_item", "text_promptbutton", "text_waitbutton", "text_pause") or c.startswith("sound_"):
                prev = None if not c.startswith("sound_") else prev
