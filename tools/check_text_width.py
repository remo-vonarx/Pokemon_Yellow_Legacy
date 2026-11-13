#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python check_text_width.py [file.asm|directory ...]

Report text lines that are wider than the 18-tile text box, and lines of
18 tiles in the box's bottom row where the game waits for a button
(before cont, para, prompt or text_promptbutton): the ▼ is drawn on the
18th tile and the character under it is lost.
Checks text/, data/, scripts/, engine/ and home/ when no paths are given.
End battle texts are checked with the "NAME: " of their trainer in front of
the first line. Lines whose width depends on runtime values (text_ram,
text_decimal, <USER>, ...) are skipped and need a manual check. Exits with
status 1 if any line is too wide.
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_PATHS = ('text', 'data', 'scripts', 'engine', 'home')
MAX_WIDTH = 18
UNKNOWN = -1000  # pushes a line with a runtime-sized part below any limit

# tiles printed for each control character; 1 tile if not listed
CONTROL_WIDTHS = {
	'<PLAYER>': 7, '<RIVAL>': 7, '<PKMN>': 2, '<TRAINER>': 7, '<ROCKET>': 6,
	'<PC>': 2, '<TM>': 2, '<……>': 2, '<DEXEND>': 0,
	'<USER>': UNKNOWN, '<TARGET>': UNKNOWN,
}
NEW_LINE = {'line', 'cont', 'para', 'next', 'page'}
BOTTOM_ROW = {'line', 'cont', 'next'}  # start the text box's bottom row
WAITS = {'cont', 'para', 'prompt', 'text_promptbutton'}  # draw ▼ on the bottom row's 18th tile
RUNTIME = {'text_ram', 'text_decimal', 'text_bcd', 'text_start', 'text_dots'}
RESET = {'done', 'prompt', 'text_end', 'text_far', 'text_asm', 'IF', 'ELSE', 'ELIF', 'ENDC'}
COMMAND = re.compile(r'^\s*(\w+)\b(.*)$')
LABEL = re.compile(r'^([A-Za-z_.][\w.]*)::?')
TOP_LABEL = re.compile(r'^([A-Za-z_]\w*)::?')
RIVALS = ('OPP_RIVAL1', 'OPP_RIVAL2', 'OPP_RIVAL3')  # print wRivalName instead
TOKEN = re.compile(r"<[^>]+>|'[dlstvrm]|.")

def string_width(string):
	string = string.split('@')[0]
	width = 0
	for token in TOKEN.findall(string):
		if token == '#':
			width += 4  # "POKé"
		else:
			width += CONTROL_WIDTHS.get(token, 1)
	return width

def read(path):
	return (ROOT / path).read_text(encoding='utf-8')

def trainer_name_widths():
	consts = re.findall(r'^\s*trainer_const (\w+)', read('constants/trainer_constants.asm'), re.M)
	names = re.findall(r'^\s*li "([^"]*)"', read('data/trainers/names.asm'), re.M)
	widths = {f'OPP_{const}': string_width(name) for const, name in zip(consts[1:], names)}
	widths.update(dict.fromkeys(RIVALS, CONTROL_WIDTHS['<RIVAL>']))
	return widths

def label_bodies():
	bodies, files = {}, {}
	for path in sorted(p for d in ('scripts', 'engine') for p in (ROOT / d).rglob('*.asm')):
		label = None
		for line in read(path).splitlines():
			match = TOP_LABEL.match(line)
			if match:
				label = match.group(1)
				bodies[label], files[label] = [], path
			elif label:
				bodies[label].append(line.split(';')[0].strip())
	return bodies, files

def loaded_opps(body):
	return {opp for line in body for opp in re.findall(r'^ld a, (OPP_\w+)', line)}

def first_text(bodies, label):
	for line in bodies.get(label, []):
		if line.startswith('text_far '):
			return line.split()[1]
		if line.startswith('text '):
			return label
	return None

def end_battle_prefixes():
	"""Map the label of each end battle text to the width of the "NAME: " printed before it."""
	widths = trainer_name_widths()
	bodies, files = label_bodies()
	opps_by_file = {}
	for label, body in bodies.items():
		opps_by_file.setdefault(files[label], set()).update(loaded_opps(body))
	opps_by_text = {}
	for path in sorted((ROOT / 'data/maps/objects').glob('*.asm')):
		for text, opp in re.findall(r'object_event.*\b(TEXT_\w+), (OPP_\w+)', read(path)):
			opps_by_text.setdefault(text, set()).add(opp)
	texts_by_label = {}
	for body in bodies.values():
		for match in filter(None, (re.match(r'dw_const (\w+),\s*(TEXT_\w+)', line) for line in body)):
			texts_by_label.setdefault(match.group(1), set()).add(match.group(2))
	prefixes = {}
	for label, body in bodies.items():
		opps = loaded_opps(body)
		for text in texts_by_label.get(label, ()):
			opps |= opps_by_text.get(text, set())
		# the opponent can be loaded by another script of the same map;
		# with no trainer at all it is a wild battle without a name
		opps = opps or opps_by_file[files[label]]
		end_texts = []
		hl = de = None
		for line in body:
			if line.startswith('ld hl, '):
				hl = line.split()[-1]
			elif line.startswith('ld de, '):
				de = line.split()[-1]
			elif line == 'call SaveEndBattleTextPointers':
				end_texts += [hl, de]
			elif line == 'call TalkToTrainer':
				header = [l for l in bodies.get(hl, []) if l.startswith('trainer ')]
				end_texts += [header[0].split(',')[3].strip()] if header else []
		for end_text in filter(None, (first_text(bodies, text) for text in end_texts)):
			for opp in opps:
				prefixes[end_text] = max(prefixes.get(end_text, 0), widths[opp] + len(': '))
	return prefixes

def check_file(path, prefixes):
	problems = []
	name = path.relative_to(ROOT) if path.is_relative_to(ROOT) else path
	width = 0
	bottom_row = False  # the current row is the text box's bottom row
	last = None  # (number, line) of the last string on the current row
	for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
		match = LABEL.match(line)
		if match:
			width = prefixes.get(match.group(1), 0)
			bottom_row = False
			continue
		match = COMMAND.match(line)
		if not match:
			continue
		command, rest = match.groups()
		if command in WAITS and bottom_row and width == MAX_WIDTH:
			problems.append(f'{name}:{last[0]}: width {width} under ▼: {last[1].strip()}')
		if command in RESET:
			width = 0
			bottom_row = False
			continue
		if command in RUNTIME:
			width = UNKNOWN
			continue
		if command in NEW_LINE:
			width = 0
			bottom_row = command in BOTTOM_ROW
		elif command != 'text':
			continue
		for string in re.findall(r'"([^"]*)"', rest):
			width += string_width(string)
			last = (number, line)
		if width > MAX_WIDTH:
			problems.append(f'{name}:{number}: width {width}: {line.strip()}')
	return problems

def main():
	args = [Path(arg).resolve() for arg in sys.argv[1:]] or [ROOT / p for p in DEFAULT_PATHS]
	paths = sorted(p for arg in args for p in (arg.rglob('*.asm') if arg.is_dir() else [arg]))
	prefixes = end_battle_prefixes()
	problems = [problem for path in paths for problem in check_file(path, prefixes)]
	for problem in problems:
		print(problem)
	print(f'{len(problems)} line(s) too wide for the text box in {len(paths)} file(s)', file=sys.stderr)
	sys.exit(1 if problems else 0)

if __name__ == '__main__':
	main()
