"""Show every text label of a build in a dialogue box, with names and numbers at their longest.

usage: sweep.py REPO LABELS.json OUT.json [--chunk K/N] [--only LABEL,...] [--names VAR=VALUE,...]

REPO is a built checkout (pokeyellow.gbc and pokeyellow.sym), LABELS.json comes from labels.py.
The script starts a new game in PyBoy and walks up to the scientist in Oak's lab. For each label it talks to him;
at his PrintText, HL is pointed at `text_far LABEL` / `text_end` in unused WRAM, and the variables the text prints
are filled with the values in maxvalues.py. OUT.json gets every stable state of the box until it closes.
--chunk K/N takes every N-th label from the K-th, so N processes can share the work.
"""
import argparse
import io
import json
import os
import re
import sys
from collections import deque

sys.dont_write_bytecode = True
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pyboy import PyBoy  # noqa: E402

import maxvalues  # noqa: E402

DIRS = ("up", "down", "left", "right")
STEP = {(0, 1): "down", (0, -1): "up", (1, 0): "right", (-1, 0): "left"}
EVENTS = ("EVENT_GOT_POKEDEX", "EVENT_OAK_GOT_PARCEL", "EVENT_GOT_STARTER", "EVENT_BATTLED_RIVAL_IN_OAKS_LAB")
SCIENTIST = 9  # Oak's lab: his text_asm calls PrintText once


def load_syms(repo):
    syms = {}
    for line in open(os.path.join(repo, "pokeyellow.sym")):
        m = re.match(r"([0-9a-f]{2}):([0-9a-f]{4}) (\S+)", line)
        if m:
            syms[m.group(3)] = (int(m.group(1), 16), int(m.group(2), 16))
    return syms


def load_charmap(repo):
    """Tile id -> one character, as the screen shows it (multi-character tiles as '·')."""
    cm = {}
    for line in open(os.path.join(repo, "constants/charmap.asm"), encoding="utf-8"):
        m = re.match(r'\s*charmap "(.+?)",\s*\$([0-9a-f]+)', line)
        if m:
            v = int(m.group(2), 16)
            if v >= 0x60 and v not in cm:
                cm[v] = m.group(1)
    cm[0x7F] = " "
    cm[0xED] = "▶"
    cm.update({0xC9: "Ä", 0xCA: "Ö", 0xCB: "Ü", 0xDC: "ä", 0xDD: "ö", 0xDE: "ü"})
    cm.update(zip(range(0x79, 0x7F), "┌─┐│└┘"))
    cm.update({0xEE: "▼", 0xEC: "▷", 0x6D: ":"})
    return {k: (v if len(v) == 1 else "·") for k, v in cm.items()}


def load_events(repo):
    """Event flag numbers from constants/event_constants.asm (const_def / const / const_skip / const_next)."""
    n, out = 0, {}
    for line in open(os.path.join(repo, "constants/event_constants.asm")):
        t = line.split(";")[0].split()
        if not t:
            continue
        if t[0] == "const_def":
            n = 0
        elif t[0] == "const":
            out[t[1]] = n
            n += 1
        elif t[0] == "const_skip":
            n += int(t[1]) if len(t) > 1 else 1
        elif t[0] == "const_next":
            n = int(t[1].replace("$", "0x"), 0)
    return out


def map_id(repo, name):
    i = 0
    for line in open(os.path.join(repo, "constants/map_constants.asm")):
        m = re.match(r"\s*map_const (\w+),", line)
        if m:
            if m.group(1) == name:
                return i
            i += 1
    raise KeyError(name)


class Game:
    """PyBoy with the screen read from VRAM, and the moves the sweep needs."""

    def __init__(self, repo):
        self.sym = load_syms(repo)
        self.cm = load_charmap(repo)
        self.ram = io.BytesIO(bytes(0x8000))  # an explicit save stream: no .ram file next to the ROM
        self.pb = PyBoy(os.path.join(repo, "pokeyellow.gbc"), window="null", sound_emulated=False, ram_file=self.ram)
        self.pb.set_emulation_speed(0)
        self.m = self.pb.memory

    def a(self, name):
        return self.sym[name][1]

    def tick(self, n=1):
        for _ in range(n):
            self.pb.tick()

    def press(self, b, hold=4, after=12):
        self.pb.button_press(b)
        self.tick(hold)
        self.pb.button_release(b)
        self.tick(after)

    def raw(self):
        """Tile ids of the visible screen: the window map when the window covers the screen, else the BG map."""
        m = self.m
        lcdc = m[0xFF40]
        if lcdc & 0x20 and m[0xFF4A] == 0 and m[0xFF4B] <= 7:
            base, scx, scy = (0x9C00 if lcdc & 0x40 else 0x9800), 0, 0
        else:
            base = 0x9C00 if lcdc & 0x08 else 0x9800
            scx, scy = m[0xFF43] // 8, m[0xFF42] // 8
        return [[m[base + ((y + scy) % 32) * 32 + (x + scx) % 32] for x in range(20)] for y in range(18)]

    def screen(self):
        return ["".join(self.cm.get(t, "·") for t in row) for row in self.raw()]

    def text(self):
        return "\n".join(self.screen())

    def stable(self, frames=30, step=3, limit=1800):
        last, same = None, 0
        for _ in range(0, limit, step):
            s = self.screen()
            same = same + step if s == last else 0
            if same >= frames:
                return s
            last = s
            self.tick(step)
        return last

    def cursor_to(self, label, tries=12):
        for _ in range(tries):
            s = self.stable(12)
            rows = [i for i, r in enumerate(s) if label in r]
            cur = [i for i, r in enumerate(s) if "▶" in r]
            if rows and cur and rows[0] == cur[0]:
                return True
            self.press("down", 4, 16)
        return False

    def save(self):
        st = io.BytesIO()
        self.pb.save_state(st)
        return st.getvalue()

    def load(self, data):
        self.pb.load_state(io.BytesIO(data))

    # --- a new game in the overworld ----------------------------------------------------
    def new_game(self):
        for _ in range(60):
            self.press("start", 4, 50)
            if "NEUES SPIEL" in self.text():
                break
        self.stable(20)
        assert self.cursor_to("NEUES SPIEL"), "no main menu"
        self.press("a", 4, 30)
        for step in range(300):  # through the intro: default answers and the first default names
            s = self.stable(24)
            if step > 20 and "┌" not in s[12] and "┌" not in s[0]:
                self.tick(120)
                if "┌" not in self.screen()[12]:
                    self.tick(60)
                    return
            t = "\n".join(s)
            default = next((w for w in ("GELB", "BLAU") if w in t), None)  # the name menus
            if "▶" in t and default:
                self.cursor_to(default)
            self.press("a", 4, 16)
        raise RuntimeError("intro did not end")

    def pos(self):
        return self.m[self.a("wXCoord")], self.m[self.a("wYCoord")]

    def warp(self, mapid, warp=0):
        m, cur = self.m, self.a("wCurMap")
        m[self.a("hWarpDestinationMap")] = mapid
        m[self.a("wDestinationWarpID")] = warp
        m[self.a("wd72d")] |= 1 << 3
        for _ in range(60):
            self.tick(10)
            if m[cur] == mapid:
                break
        self.tick(90)
        self.stable(20)
        assert m[cur] == mapid, (hex(m[cur]), hex(mapid))

    def goto(self, tx, ty, maxnodes=500):
        """Walk to (tx, ty): breadth-first search over real steps."""
        start, mapid = self.pos(), self.m[self.a("wCurMap")]
        if start == (tx, ty):
            return
        q, seen = deque([(start, self.save())]), {start}
        while q:
            _, sv = q.popleft()
            for d in DIRS:
                self.load(sv)
                self.press(d, 8, 16)
                if self.m[self.a("wCurMap")] != mapid or "┌" in self.text():
                    continue
                np = self.pos()
                if np in seen:
                    continue
                seen.add(np)
                if np == (tx, ty):
                    self.stable(10)
                    return
                q.append((np, self.save()))
            if len(seen) > maxnodes:
                break
        raise RuntimeError(f"cannot reach {(tx, ty)} from {start}")

    def npc_tile(self, slot):
        s = self.a("wSpriteStateData2") + 16 * slot
        return self.m[s + 5] - 4, self.m[s + 4] - 4


ENC = {" ": 0x7F, "-": 0xE3, ".": 0xE8, "Ä": 0xC9, "Ö": 0xCA, "Ü": 0xCB, "ä": 0xDC, "ö": 0xDD, "ü": 0xDE, "ß": 0xDF}
ENC.update({chr(65 + i): 0x80 + i for i in range(26)})
ENC.update({chr(97 + i): 0xA0 + i for i in range(26)})
ENC.update({str(i): 0xF6 + i for i in range(10)})


def fill(g, names, whose, used):
    """Write the values of the variables this text prints. Only those: several buffers share memory."""
    m = g.m
    want = {"wPlayerName", "wRivalName", "wEnemyMonNick", "wBattleMonNick"} | set(used)
    for name, s in names.items():
        if name in want:
            a = g.a(name)
            for i, c in enumerate(s):
                m[a + i] = ENC[c]
            m[a + len(s)] = 0x50
    for name, (n, v) in maxvalues.NUMS.items():
        if name in want:
            a = g.a(name)
            for i in range(n):
                m[a + i] = (v >> (8 * (n - 1 - i))) & 0xFF
    for name, n in maxvalues.BCD.items():
        if name in want:
            a = g.a(name)
            for i in range(n):
                m[a + i] = 0x99
    m[g.a("hWhoseTurn")] = whose


def capture(g):
    """Distinct stable box states until the box closes."""
    boxes, last, same, idle = [], None, 0, 0
    for _ in range(300):
        rows = g.stable(6, 2, 240)
        if rows[12].startswith("┌") and rows[17].startswith("└"):
            idle = 0
            key = "\n".join(rows[12:18])
            if key != last:
                boxes.append({"rows": rows[12:18], "raw": g.raw()[12:18]})
                last, same = key, 0
            else:
                same += 1
                if same > 8:
                    return boxes, "stuck"
            g.press("a", 2, 4)
        else:
            idle += 1
            if idle > 3:
                return boxes, "done"
            g.tick(10)
    return boxes, "limit"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("repo")
    ap.add_argument("labels")
    ap.add_argument("out")
    ap.add_argument("--chunk", default="0/1")
    ap.add_argument("--only", default="")
    ap.add_argument("--names", default="")
    args = ap.parse_args()
    k, n = map(int, args.chunk.split("/"))
    labels = json.load(open(args.labels))[k::n]
    if args.only:
        labels = [x for x in labels if x["label"] in args.only.split(",")]
    names = maxvalues.names(args.names)

    g = Game(args.repo)
    g.new_game()
    events = load_events(args.repo)
    for name, e in events.items():
        if name.startswith(EVENTS):
            g.m[g.a("wEventFlags") + e // 8] |= 1 << (e % 8)
    opt = g.a("wOptions")
    g.m[opt] = (g.m[opt] & 0xF0) | 1  # fast text
    g.warp(map_id(args.repo, "OAKS_LAB"), 0)
    g.tick(40)
    nx, ny = g.npc_tile(SCIENTIST)
    g.goto(nx + 1, ny, maxnodes=2000)
    g.press("left", 2, 12)
    start = g.save()

    stub, hook = g.a("wPlayerGender") + 1, g.a("PrintText")  # 54 unused bytes follow wPlayerGender
    res = []
    for i, x in enumerate(labels):
        g.load(start)
        armed = [True]
        whose = 0 if (x["target"] and not x["user"]) else 1

        def swap(_, x=x, whose=whose):
            if armed[0]:
                armed[0] = False
                fill(g, names, whose, x["vars"])
                for j, b in enumerate((0x17, x["addr"] & 0xFF, x["addr"] >> 8, x["bank"], 0x50)):
                    g.m[stub + j] = b
                g.pb.register_file.HL = stub
        g.pb.hook_register(0, hook, swap, None)
        g.press("a", 4, 4)
        boxes, status = capture(g)
        g.pb.hook_deregister(0, hook)
        res.append({"label": x["label"], "status": status if not armed[0] else "not fired", "boxes": boxes})
        if i % 25 == 0 or i == len(labels) - 1:
            json.dump(res, open(args.out, "w"), ensure_ascii=False)
            print(f"{i + 1}/{len(labels)} {x['label']} {status}", flush=True)
    g.pb.stop(save=False)


if __name__ == "__main__":
    main()
