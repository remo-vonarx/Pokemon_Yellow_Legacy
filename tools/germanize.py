#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python germanize.py --category mon|people|place [--dry-run] [file.asm|directory ...]
       python germanize.py --selftest

Replace English names with their German names from german_names.py.
Only whole words inside "..." strings are changed; labels, constants,
comments and INCLUDE paths stay untouched. Every changed line is printed.
Checks text/, data/, scripts/, engine/ and home/ when no paths are given.
"""

import re
import sys
from pathlib import Path

from check_names import CATEGORIES, ROOT, SCAN_DIRS, SKIP_LINE, code_part, word_re

def name_pattern(mapping):
	# longest names first, so "PALLET TOWN" wins over "PALLET"
	return word_re(*sorted(mapping, key=len, reverse=True))

def replace_line(line, mapping, pattern):
	if SKIP_LINE.match(line):
		return line
	# only the code part; a trailing comment keeps its English names
	code = code_part(line)
	# several strings with the same length are a fixed-width table, like
	# "JOLTEON@@@@", "AERODACTYL@"
	strings = re.findall(r'"([^"]*)"', code)
	table = len(strings) > 1 and len(set(map(len, strings))) == 1
	def replace_string(match):
		old = match.group(1)
		new = pattern.sub(lambda name: mapping[name.group(0)], old)
		# fixed-width entries keep their length
		if new != old and (old.endswith('@@') or table):
			new = new.rstrip('@')
			# only a full-width entry can do without the "@"
			fits = len(new) < len(old) or (len(new) == len(old) and not old.endswith('@'))
			assert fits, f'"{new}" does not fit into "{old}"'
			new = new.ljust(len(old), '@')
		return f'"{new}"'
	return re.sub(r'"([^"]*)"', replace_string, code) + line[len(code):]

def germanize(paths, mapping, dry_run):
	pattern = name_pattern(mapping)
	changes = 0
	for path in paths:
		lines = path.read_text(encoding='utf-8').split('\n')
		changed = False
		for number, line in enumerate(lines):
			new = replace_line(line, mapping, pattern)
			if new != line:
				print(f'{path.relative_to(ROOT)}:{number + 1}: {line.strip()}  ->  {new.strip()}')
				lines[number] = new
				changed = True
				changes += 1
		if changed and not dry_run:
			path.write_text('\n'.join(lines), encoding='utf-8')
	return changes

def test_replace_word_boundaries():
	mapping = CATEGORIES['mon'] | CATEGORIES['people'] | CATEGORIES['place']
	pattern = name_pattern(mapping)
	cases = {
		'\ttext "CLOAK"': '\ttext "CLOAK"',
		'\tline "MEWTWO and MEW"': '\tline "MEWTU and MEW"',
		'\tline "SEEL\'s"': '\tline "JUROB\'s"',
		'\tline "CLEFAIRYs came"': '\tline "PIEPIs came"',
		'\ttext "PALLET TOWN"': '\ttext "ALABASTIA"',
		'\tline "VIRIDIAN FOREST?"': '\tline "VERTANIA FOREST?"',
		'\tpara "PROF.OAK, next"': '\tpara "PROF EICH, next"',
		'\ttext "OAK: Hey!"': '\ttext "EICH: Hey!"',
		'\ttext "LT.SURGE"': '\ttext "MAJOR BOB"',
		'\ttext "MR.MIME"': '\ttext "PANTIMOS"',
		'SeelText:': 'SeelText:',
		'\ttext_far _SEELText ; SEEL': '\ttext_far _SEELText ; SEEL',
		'\ttext "SEEL" ; SEEL': '\ttext "JUROB" ; SEEL',
		'INCLUDE "text/SEEL.asm"': 'INCLUDE "text/SEEL.asm"',
		'\tdb "JOLTEON@@@@", "SNORLAX@@@@"': '\tdb "BLITZA@@@@@", "RELAXO@@@@@"',
		'\tdb "BUTTERFREE@", "AERODACTYL@"': '\tdb "SMETTBO@@@@", "AERODACTYL@"',
		'\tdb "OLD MAN@"': '\tdb "OLD MAN@"',
		'\tdb "PROF.OAK@"': '\tdb "PROF EICH@"',
		'\ttext "MEOWTH: Meow!@"': '\ttext "MAUZI: Meow!@"',
	}
	for line, want in cases.items():
		got = replace_line(line, mapping, pattern)
		assert got == want, f'{line!r}: got {got!r}, want {want!r}'
	too_long = {'BUTTERFREE': 'SMETTBO-SMETTBO'}
	try:
		replace_line('\tdb "BUTTERFREE@", "AERODACTYL@"', too_long, name_pattern(too_long))
	except AssertionError:
		pass
	else:
		raise AssertionError('a longer name must not fit into a fixed-width entry')

def main():
	args = sys.argv[1:]
	if args == ['--selftest']:
		test_replace_word_boundaries()
		print('selftest passed')
		return
	dry_run = '--dry-run' in args
	args = [arg for arg in args if arg != '--dry-run']
	if len(args) < 2 or args[0] != '--category' or args[1] not in CATEGORIES:
		print(__doc__, file=sys.stderr)
		sys.exit(2)
	targets = [Path(arg).resolve() for arg in args[2:]] or [ROOT / d for d in SCAN_DIRS]
	paths = sorted(p for t in targets for p in (t.rglob('*.asm') if t.is_dir() else [t]))
	changes = germanize(paths, CATEGORIES[args[1]], dry_run)
	print(f'{changes} line(s) {"would change" if dry_run else "changed"}', file=sys.stderr)

if __name__ == '__main__':
	main()
