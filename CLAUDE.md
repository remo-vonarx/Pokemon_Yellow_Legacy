# CLAUDE.md

Guardrails for translating a Pokémon ROM hack into German. They apply to every task unless the task explicitly overrides them.

Everything game-specific lives in **Project profile** and **Project decisions**. The rest of this file is the same for every hack and refers to those two sections.

## Project profile

Fill in once per hack. If a field is empty or turns out wrong, find the right value, tell me, and propose the change.

| Field | Value |
|---|---|
| Hack and repo | Pokémon Yellow Legacy, `cRz-Shadows/Pokemon_Yellow_Legacy`. Work happens on the fork `remo-vonarx/Pokemon_Yellow_Legacy`; PRs go there |
| Based on | pret `pokeyellow` |
| German original | Pokémon Gelbe Edition: Special Pikachu Edition. Text dump: `.claude/upload/german_text_dump.txt` (`[texts]`, `[pokemon names]`, `[names]`; each line starts with bank:address), made by `.claude/upload/dump_german_text.py`; verbatim, so it still has ß. ROM: `.claude/upload/Pokemon - Gelbe Edition - Special Pikachu Edition (Germany) (GBC,SGB Enhanced) 2.gb` (SHA-1 `42f3714e…`). `.claude/upload/` is excluded locally in `.git/info/exclude` |
| Previous translations to reuse | None. The only exception is the title screen logo `GELBES VERMÄCHTNIS` from branch `backup/main-before-reset-2026-11-12`; that branch's text is not a source |
| Textbox | 18 characters × 2 lines, fixed-width font (one tile per character) |
| Text commands | `text`, `line`, `cont`, `para`, `next`, `prompt`, `done`; Pokédex: `page`, `dex`; inline: `text_far`, `text_ram`, `text_bcd`, `text_decimal`, `text_start`, `text_end`, `text_asm` (`macros/scripts/text.asm`) |
| Length constants | `constants/text_constants.asm`: `NAME_LENGTH` 11 (10 characters + terminator), `ITEM_NAME_LENGTH` 13 (12 + terminator). Player and rival names: 7 characters (`engine/menus/naming_screen.asm:399`) |
| Charmap and font | `constants/charmap.asm`, `gfx/font/font.png`. Ä Ö Ü `$c9–$cb`, ä ö ü `$dc–$de`; no ß. The German ROM has them at `$c0–$c5`, so its RAM and tile bytes differ from ours |
| Build | `make RGBDS=~/.local/rgbds-0.6.1/bin/` (rgbds 0.6.1), builds `pokeyellow.gbc` and `pokeyellow_debug.gbc`. ROM0 has 22 bytes free, 7 in the debug ROM |
| Debug build | `make RGBDS=~/.local/rgbds-0.6.1/bin/ yellow_debug`. Hold SELECT on the title screen, pick DEBUG, press B through the intro and A at the difficulty choice: strong party, all badges except Earth, max money, full Pokédex |
| Check scripts | `python3 tools/check_text_width.py`, `python3 tools/check_text_mode.py`, `python3 tools/check_names.py`. Known false alarm: `text/SilphCo11F.asm:90` (`check_text_width.py` guesses TEAM ROCKET, the speaker is Giovanni) |
| Emulator | PyBoy 2.9 with Pillow, in a venv in the scratchpad |
| Tilemap symbol | `wTileMap`, 20×18 tiles. Without symbols (German ROM), read VRAM: most screens are drawn on the window, so when LCDC bit 5 is set and WY is 0 read the window map (`$9C00` if LCDC bit 6, else `$9800`), otherwise the BG map shifted by SCX/SCY |
| Test entry points | Debug menu (above). Warp without a hook: write `hWarpDestinationMap` and `wDestinationWarpID`, then set bit 3 of `wd72d`; outdoor-to-outdoor warps keep the old position, so warp through an interior first. Free RAM byte for a hook: `wUnusedD71F` (`wUnusedC000` is used by Legacy's audio and AI). Battles: walk into a trainer, or set a map's script index (e.g. `wOaksLabCurScript` = 13 starts the first rival battle); battle style SET (`wOptions` bit 6) skips the switch prompt. Link: in the slave's ROM copy, change the `3E 01` before `3E 81 E0 02` in `CableClubNPC` to `3E 02`; prepare a save below the Viridian link receptionist |

## Project decisions

Settled choices for this hack. If one of the topics below is not decided yet and a task touches it, ask before translating.

- Name casing: capitals as in the German ROM (PIKACHU, PROF. EICH, ALABASTIA).
- Spelling: new German spelling throughout, also in text taken from the German ROM (im Voraus, Tipp, kennenlernen); ss, never ß; capitalised Du / Dein / Dich / Dir.
- "Pokémon": the charmap token `#` (POKé), as in the German ROM (`#MON`, `#DEX`).
- Stat labels: as in the German ROM: KP, ANGR, VERT, INIT, SPEZ on screens; ANGRIFF, VERTEIDIGUNG, INITIATIVE, SPEZIAL in text.
- Pokédex: metric (m, kg) as in the German ROM; entries from the German Gelbe Edition. Legacy has only the original 151, so there are no newer Pokémon or forms. Shortening is not allowed.
- Trainer names: original German names from the German ROM, incl. unused slots. Characters Legacy added from later games (Nurse Joy, Officer Jenny, …) get their official German name from the game they come from; shorten the class, never the name.
- Characters from later games: official German names from the game they come from (PokéWiki).
- Player address: Legacy lets the player be a girl, so address the player neutrally (no Junge / Kleiner / Kleines; `Kind` or no word). Role words such as Trainer and Champion stay as in the German games. Propose every such change and let me confirm it.
- Choices from the first translation (branch `backup/main-before-reset-2026-11-12`) are not settled: follow the German ROM and ask again when one comes up. Only `KAMPF` in the battle menu is kept (see `GLOSSARY.md`).
- One-off NPC names without an official source: propose a German name and flag it.

## Source priority

For each string, use the first source that covers it:

1. `GLOSSARY.md`: decisions already made are final unless I reopen them.
2. Dump of the German original: if the string exists there, take it verbatim. If the hack changed the English text, start from the original German wording and change only what differs.
3. Previous translations: reuse them if they match the current English text.
4. Official German text from later games: PokéWiki (pokewiki.de); PokeAPI (pokeapi.co, language `de`) for species, moves, items, abilities and natures.
5. Own translation: allowed, but always flagged as such and listed for review. See "New content from the hack" below.

- PokeAPI documentation: https://pokeapi.co/docs/v2. Useful endpoints: `pokemon-species`, `move`, `item`, `ability`, `nature`. German text is in the `names`, `genera` and `flavor_text_entries` lists, filtered by `language.name == "de"` (e.g. https://pokeapi.co/api/v2/item/assault-vest).
- PokeAPI's German data is incomplete for some entries. If a German value is missing or looks wrong, check PokéWiki; if the two disagree, PokéWiki wins and you mention the difference.
- Cache PokeAPI responses locally in the scratchpad instead of requesting the same resource again.
- Bulbapedia and other English sources are for understanding context only, never for German wording.
- Never present a name as "official" without a source. If nothing is found, say so.

### New content from the hack

Text the hack added has no German original, so translate it faithfully:

- Keep the full meaning: every piece of information, instruction and hint. Add nothing, leave nothing out, don't "improve" or rewrite the content.
- Keep the tone, the character's voice, jokes and references. Write natural German, not word for word, but don't adapt freely beyond what German needs.
- Terms that already exist in the game (items, moves, places, characters) use their official German names, even inside new text.
- Wordplay, puns and references that don't work in German: propose a German equivalent that keeps the effect, explain the original, and flag it.
- Match the German original's style so new text doesn't stand out next to the old.

## Working agreement

- Code, labels, comments, file names and commit messages stay in English. Only player-visible text is translated.
- Read `GLOSSARY.md` before every task; add every new decision to it.
- State assumptions. Ask rather than guess, especially for names.
- Collect open questions during a task and ask them together, as a table:

  | File:line | English | German candidate(s) | Source | Where in game | Why unsure / what differs |

- Keep each task scoped to one area (one map, one data file, one menu). No drive-by refactors.
- Change string contents only. Don't rename labels, reorder data or touch game logic. If a translation needs a code change (e.g. wider menu), propose it first.
- Reference material (dumps, original ROMs, previous translations) is read-only.

## Text constraints

- Never exceed the textbox from the profile. With variable-width fonts, measure in pixels, not characters.
- Keep the semantics of the text commands: re-breaking lines is fine; changing how a box ends is not.
- Count variables (player and rival name, Pokémon, item and move names, numbers) at their maximum length. Take the limits from the length constants, never from memory.
- Names and fixed-width strings (menus, padded labels) must respect their length constant or exact padded width.
- Use only characters defined in the charmap. Verify that ä, ö, ü, Ä, Ö, Ü and any punctuation you use map to font tiles. Don't add charmap entries or font graphics without asking.
- Know the special charmap tokens (e.g. `#` for "POKé") and follow the project decisions on whether to use them.
- Avoid German constructions whose article, case or gender depends on a variable (e.g. "einen/eine <ITEM>"). Rephrase neutrally.
- If the player can be male or female, avoid gendered forms for the player, or follow how the German original handles it.

### When text doesn't fit

Never leave out a word, a piece of information or a nuance to make something fit. Work through these steps in order:

1. Fit the full words. In dialogue, re-break the lines or add another line or box before touching any word.
2. Look for an official abbreviation: the German original, later German games (PokéWiki) or `GLOSSARY.md`, in that order.
3. If none exists, suggest abbreviations yourself and ask before using them. For each, show the full word, the limit, one or two abbreviation options, and why each one stays unambiguous next to similar terms.
4. Abbreviate as little as possible: shorten one word, not several, and keep the meaning unambiguous. Use the same abbreviation for the same word everywhere and add it to `GLOSSARY.md`.

Example: *Assault Vest* is officially "Offensivweste" (13 characters); the item name limit is 12.

| Option | Verdict |
|---|---|
| Offensivwest | Bad: silently cut, looks like a typo |
| Weste | Bad: drops what makes this item distinct |
| Offensivw. | Weak: keeps the distinct part, but loses what kind of item it is |
| Offens.weste | Good: one word shortened, item type intact, still recognisable |

Ask me with the last two options, then record the choice in `GLOSSARY.md`.

When a name and a generic part (trainer class, title) share a limited space, shorten the generic part. Never shorten the name: it is what identifies the character.

Example: *OFFICER ROCKY* doesn't fit.

| Option | Verdict |
|---|---|
| OFFICER ROC | Bad: name silently cut |
| OFFICER RO. | Bad: the name is abbreviated and no longer recognisable |
| ROCKY | Bad: drops the trainer class |
| OFF. ROCKY | Good: class shortened, name intact |

Use the same class abbreviation for every trainer of that class.

Exceptions to these rules exist only where the project decisions say so (e.g. Pokédex entries that may be shortened).

## Style

- Never use ß. Always write ss (Strasse, gross, Stromstoss), also in official names and in text taken verbatim from the German original or a previous translation. Re-check the length afterwards: ss is one character longer.
- Match the tone of the German original; keep each NPC's voice (kids, elders, villain teams, gym leaders) consistent.
- Reuse the original's in-game terminology (e.g. "Arena", "Orden", "Beutel") rather than modern synonyms, unless the glossary says otherwise.

## Validation (every task)

- The build must succeed without errors. If a section or bank overflows because German text is longer, stop and report. Don't move sections on your own.
- Re-check every changed line against the textbox and length limits.
- Test every change in the game (see below).
- Finish with a summary: files touched, strings translated, own proposals (flagged), open questions, screens seen and screens not reached.

## Testing in the game

A text, menu or graphics change is done when you have seen it in the emulator and it matches the German original **by position**: the same tiles in the same places, unless the hack itself changed that spot or the original uses ß (ss instead is expected). Where it did, compare against the hack's English screen instead: same layout, German text fits. A string existing somewhere in the ROM proves nothing.

1. After any text edit, run the check scripts from the profile. Ignore only the known false alarms listed there.
2. Clone the repo into the scratchpad and do all test work there. Hooks, ROM patches and save states stay in that clone and are never committed.
3. Build the debug ROM (or the normal one if there is none) as described in the profile.
4. Drive it from a script with the emulator from the profile, with its dependencies in a venv in the scratchpad. Read the tilemap to check each position, and save a screenshot for me.
5. Open the same screen in the German original ROM and compare it tile by tile. For menus, compare the box coordinates too. The original ROM's RAM addresses differ from the hack's symbol file: never reuse those addresses on it.
6. Tell me which screens you saw, and name the ones you could not reach.

### Reaching a screen

- Use the debug menu if the hack has one.
- For screens you can't reach directly, add a hook at the top of a routine that runs every overworld frame. The hook reads an unused RAM byte and jumps to a test case: a warp, a battle, or any routine through a far call. Save a state in the overworld and reload it for each case.
- Battles can often be started by setting the opponent and level variables in the overworld and taking one step.
- If a warp keeps the old position (e.g. between maps with the same tileset), warp through an interior first.
- If the game has a real-time clock, set it so time-of-day and weekday texts appear.
- When you find a reliable way to reach a kind of screen, propose adding it to the profile.

### Link features (trades, link battles)

- Run two emulator instances that share the serial connection. With PyBoy: a shared subclass of `SerialSharedMemoryBuffer`, with `serial_interrupt_based=True` (worked with PyBoy 2.9).
- One side must be master and the other slave. Patch a copy of the ROM for the second instance so it takes the other role, and record the patch in the profile.
- Arm the slave only while the master waits (with PyBoy: write `$80` to `rSC` while `buf.barrier.n_waiting > 0`).
- Save states break serial, so each run boots from scratch. Prepare a save standing in front of the link receptionist.
- If the link menu misses inputs, hold each button longer (about 12 frames was needed in Yellow Legacy).

## Git

- One-line commit messages, no `Co-Authored-By` or session trailers.
- Don't push.