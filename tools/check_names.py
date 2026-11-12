#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python check_names.py [--table-only | --tables | --category mon|people|place]

Check that the German names from german_names.py are used everywhere.
--table-only      only check data/pokemon/names.asm against the official German names
--tables          check the name tables (Pokemon, town map, trades, default names)
--category NAME   only look for leftover English names of one category in text strings
Without options, everything is checked. Exits with status 1 if anything is found.
"""

import re
import sys
from pathlib import Path

import german_names as names

ROOT = Path(__file__).resolve().parent.parent
SCAN_DIRS = ('text', 'data', 'scripts', 'engine', 'home')
SKIP_LINE = re.compile(r'^\s*(INCLUDE|INCBIN|SECTION)\b')

def changed(mapping):
	return {en: de for en, de in mapping.items() if en != de}

CATEGORIES = {
	'mon': changed({en: de for en, de in names.POKEMON.values()}
		| names.POKEMON_TEXT_ALIASES | names.NPC_NICKNAMES),
	'people': changed(names.PEOPLE),
	'place': changed(names.PLACES),
}

TABLE_FILES = {
	'data/maps/names.asm': CATEGORIES['mon'] | CATEGORIES['place'],
	'data/events/trades.asm': changed(names.TRADE_NICKNAMES),
	'data/player_names.asm': changed(names.DEFAULT_NAMES),
	'data/player_names_list.asm': changed(names.DEFAULT_NAMES),
}

def code_part(line):
	# drop a trailing comment, but not a ';' inside a string
	return re.match(r'^((?:[^";]|"[^"]*")*)', line).group(1)

def strings(line):
	if SKIP_LINE.match(line):
		return []
	return re.findall(r'"([^"]*)"', code_part(line))

def word_re(*words):
	return re.compile(r'(?<![A-Z])(?:' + '|'.join(map(re.escape, words)) + r')(?![A-Z])')

def scan(paths, mapping):
	# longest names first, so "PALLET" isn't reported again inside "PALLET TOWN"
	patterns = [(en, mapping[en], word_re(en)) for en in sorted(mapping, key=len, reverse=True)]
	hits = []
	for path in paths:
		for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
			for string in strings(line):
				taken = set()
				for en, de, pattern in patterns:
					for match in pattern.finditer(string):
						span = set(range(*match.span()))
						if span & taken:
							continue
						taken |= span
						hits.append(f'{path.relative_to(ROOT)}:{number}: {en} -> {de}: "{string}"')
	return hits

def check_pokemon_table():
	constants = {}
	for line in (ROOT / 'constants/pokemon_constants.asm').read_text().splitlines():
		match = re.match(r'\s*const\s+(\w+)\s*;\s*\$([0-9A-Fa-f]+)', line)
		if match:
			constants[int(match.group(2), 16)] = match.group(1)
	entries = re.findall(r'db "([^"]*)"', (ROOT / 'data/pokemon/names.asm').read_text(encoding='utf-8'))
	problems = []
	for index, entry in enumerate(entries, 1):
		constant = constants.get(index)
		if constant not in names.POKEMON:
			continue
		got, want = entry.rstrip('@'), names.POKEMON[constant][1]
		if got != want:
			problems.append(f'data/pokemon/names.asm: {constant}: "{got}" should be "{want}"')
	return problems

def check_tables():
	problems = check_pokemon_table()
	for path, mapping in TABLE_FILES.items():
		problems += scan([ROOT / path], mapping)
	return problems

def check_category(category):
	paths = sorted(p for d in SCAN_DIRS for p in (ROOT / d).rglob('*.asm'))
	return scan(paths, CATEGORIES[category])

def main():
	args = sys.argv[1:]
	if args == ['--table-only']:
		problems = check_pokemon_table()
	elif args == ['--tables']:
		problems = check_tables()
	elif len(args) == 2 and args[0] == '--category' and args[1] in CATEGORIES:
		problems = check_category(args[1])
	elif not args:
		problems = check_tables()
		for category in CATEGORIES:
			problems += check_category(category)
	else:
		print(__doc__, file=sys.stderr)
		sys.exit(2)
	for problem in problems:
		print(problem)
	print(f'{len(problems)} problem(s) found', file=sys.stderr)
	sys.exit(1 if problems else 0)

if __name__ == '__main__':
	main()
