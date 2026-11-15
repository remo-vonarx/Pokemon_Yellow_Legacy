"""Dump every text-like byte run of a ROM.  romtext.py ours|english|german ROM OUT.json [SYM]

A run is a maximal sequence of bytes that decode as characters, text controls or tokens; it ends at
the first byte that does not (text commands such as text_start $00 and text_ram $01 split runs).
Runs with fewer than 3 letters are dropped. With SYM, each run gets the nearest label at or before it.
"""
import bisect, json, re, sys

who, rom_path, out = sys.argv[1:4]
rom = open(rom_path, "rb").read()

C = {0x7F: " ", 0xE0: "'", 0xE1: "<PK>", 0xE2: "<MN>", 0xE3: "-", 0xE6: "?", 0xE7: "!", 0xE8: ".",
     0xEC: "▷", 0xED: "▶", 0xEE: "▼", 0xEF: "♂", 0xF0: "¥", 0xF1: "×", 0xF2: ".", 0xF3: "/", 0xF4: ",",
     0xF5: "♀", 0x9A: "(", 0x9B: ")", 0x9C: ":", 0x9D: ";", 0x9E: "[", 0x9F: "]",
     0x70: "‘", 0x71: "’", 0x72: "“", 0x73: "”", 0x75: "…"}
C.update({0x80 + i: chr(65 + i) for i in range(26)})
C.update({0xA0 + i: chr(97 + i) for i in range(26)})
C.update({0xF6 + i: str(i) for i in range(10)})
if who == "german":
    C.update({0xBA: "à", 0xBB: "è", 0xBC: "é", 0xBD: "ù", 0xBE: "ß", 0xBF: "ç", 0xC0: "Ä", 0xC1: "Ö",
              0xC2: "Ü", 0xC3: "ä", 0xC4: "ö", 0xC5: "ü", 0xE4: "+"})
else:
    C.update({0xBA: "é", 0xBB: "ʼd", 0xBC: "ʼl", 0xBD: "ʼs", 0xBE: "ʼt", 0xBF: "ʼv", 0xE4: "ʼr", 0xE5: "ʼm"})  # ʼ marks a contraction tile
    if who == "ours":
        C.update({0xC9: "Ä", 0xCA: "Ö", 0xCB: "Ü", 0xDC: "ä", 0xDD: "ö", 0xDE: "ü", 0xDF: "ß"})
CTRL = {0x49: "{page}", 0x4A: "<PKMN>", 0x4B: "{_cont}", 0x4C: "{scroll}", 0x4E: "{next}", 0x4F: "{line}",
        0x50: "@", 0x51: "{para}", 0x52: "<PLAYER>", 0x53: "<RIVAL>", 0x54: "#", 0x55: "{cont}", 0x56: "……",
        0x57: "{done}", 0x58: "{prompt}", 0x59: "<TARGET>", 0x5A: "<USER>", 0x5B: "PC", 0x5C: "TM",
        0x5D: "TRAINER", 0x5E: "ROCKET", 0x5F: "{dex}"}
LETTER = re.compile(r"[A-Za-zÄÖÜäöüßé]")

labels = []
if len(sys.argv) > 4:
    for l in open(sys.argv[4]):
        m = re.match(r"([0-9a-f]{2}):([0-9a-f]{4}) (\S+)", l)
        if m and "." not in m.group(3):
            b, a = int(m.group(1), 16), int(m.group(2), 16)
            if b == 0 and a >= 0x8000:
                continue
            off = a if b == 0 else b * 0x4000 + a - 0x4000
            labels.append((off, m.group(3)))
    labels.sort()
offs = [o for o, _ in labels]


def where(o):
    b = o // 0x4000
    return f"{b:02x}:{o % 0x4000 + (0x4000 if b else 0):04x}"


runs, i, n = [], 0, len(rom)
while i < n:
    if rom[i] not in C and rom[i] not in CTRL:
        i += 1; continue
    j, parts = i, []
    while j < n and (rom[j] in C or rom[j] in CTRL):
        parts.append(C.get(rom[j]) or CTRL[rom[j]]); j += 1
    text = "".join(parts)
    if len(LETTER.findall(text)) >= 3:
        lab = ""
        if labels:
            k = bisect.bisect_right(offs, i) - 1
            if k >= 0 and offs[k] // 0x4000 == i // 0x4000:
                lab = labels[k][1] + (f"+{i - offs[k]}" if i != offs[k] else "")
        runs.append({"at": where(i), "off": i, "label": lab, "text": text})
    i = j
json.dump(runs, open(out, "w"), ensure_ascii=False, indent=0)
print(who, len(runs), "runs")
