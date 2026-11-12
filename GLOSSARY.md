# Glossary

Settled translation decisions for Yellow Legacy. Read before every task; add each new decision here. General rules live in `CLAUDE.md` (Project decisions).

| English | German | Where | Source / note |
|---|---|---|---|
| PROF.OAK (dialogue) | PROF. EICH | dialogue | German ROM (24×) |
| PROF.OAK (trainer class) | PROF.EICH | trainer class list (fixed width) | German ROM |
| OAK: (speaker) | EICH: | dialogue | German ROM |
| PROFESSOR OAK | PROFESSOR EICH | lab sign | German ROM |
| OAK's | EICHs | possessive | My choice over the ROM's capital S (`PROF. EICHS Gehilfe`, `EICHS PC`); same lowercase s for every possessive (BILLs, ROCKOs) |
| FIGHT | KAMPF | battle menu | My choice over the ROM's `KMPF`, if it fits the menu; otherwise ask |
| SHIFT / SET (battle style) | WECHSEL / FOLGEND | options; in text "Kampfstil FOLGEND" | German ROM (`[ WECHSEL ]`, `[ FOLGEND ]`) |
| NEW NAME | NAME | default-name lists in the intro | German ROM |
| YELLOW, BLUE (default names) | GELB, BLAU | player / rival default names | German ROM; ASH, JACK, GARY, JOHN stay |
| GREEN, LEAF, AMANDA (girl default names) | GRÜN, LEAF, AMANDA | girl default names (Legacy) | My choice: GRÜN like GELB / BLAU; Leaf keeps her name as on PokéWiki; AMANDA stays like ASH / JACK |
| BOY / GIRL | JUNGE / MÄDCHEN | boy/girl menu (Legacy) | My choice: box widened from 5 to 8 tiles by its width byte only; it grows to the right |
| CONTINUE / NEW GAME / OPTION | WEITER / NEUES SPIEL / OPTIONEN | main menu | German ROM (the start menu keeps `OPTION`) |
| PLAYER / BADGES / TIME | SPIELER / ORDEN / ZEIT | save summary box (CONTINUE, saving) | German ROM; box one column further left and one wider, as in the German ROM (my choice) |
| YES / NO | JA / NEIN | yes/no menus | German ROM; box one tile wider and one column further left, as in the German ROM (my choice) |
| TRADE / CANCEL, HEAL / CANCEL | TAUSCH / ZURÜCK, HEILEN / ZURÜCK | link trade and Pokémon Center menus | German ROM |
| YOUR NAME? / RIVAL's NAME? / NICKNAME? | DEIN NAME? / GEGNER-NAME? / ALIAS? | naming screen titles | German ROM |
| lower case / UPPER CASE | kleinbuchstaben / GROSSBUCHSTABEN | naming screen case switch | German ROM |
| nickname (in text) | Spitzname | dialogue | German ROM ("Möchtest Du … einen Spitznamen geben?") |
| POKéDEX / SAVE / EXIT | #DEX / SICHERN / ZURÜCK | start menu | German ROM; #MON, ITEM, RESET and OPTION stay |
| USE / TOSS | OK / MÜLL | item menu | German ROM |
| STATS / SWITCH / CANCEL | STATUS / TAUSCH / ZURÜCK | party menu | German ROM |
| CUT, FLY, SURF, STRENGTH, FLASH, DIG, TELEPORT, SOFTBOILED | ZERSCHNEIDER, FLIEGEN, SURFER, STÄRKE, BLITZ, SCHAUFLER, TELEPORT, WEICHEI | field moves in the party menu | German ROM; menu widths as in the German ROM (my choice) |
| NAME / MONEY / TIME / BADGES | NAME / GELD / ZEIT / ORDEN | trainer card | German ROM |
| TEXT SPEED / ANIMATION / BATTLESTYLE / SOUND / PRINT / CANCEL | TEXT-TEMPO / KAMPFANIMATION / KAMPFSTIL / SOUND / DRUCKEN / ZURÜCK | options screen | German ROM; each value on the line below its label, in brackets, as in the German ROM (my choice) |
| FAST / MID / SLOW | SCHNELL / NORMAL / LANGSAM | options: text speed | German ROM |
| ON / OFF | AN / AUS | options: battle animation | German ROM |
| MONO / EARPHONE1–3 | MONO / KOPFHÖRER 1–3 | options: sound | German ROM |
| LIGHTEST / LIGHTER / NORMAL / DARKER / DARKEST | SEHR HELL / HELL / NORMAL / DUNKEL / SEHR DUNKEL | options: printer brightness | German ROM |
| HM | VM | everywhere | German ROM (`VM03 ist SURFER!`) |
| m, é (font glyphs) | German ROM glyphs | every text | German ROM (`gfx/font/font.png`): narrower m, proper acute on é (my choice) |
| HP: / No. / IDNo / to (font tiles) | KP: / Nr. / ID·Nr / ➔ | party menu, status screen, battle HP bars, Pokédex, trade screen | German ROM tiles copied into `gfx/font/font_battle_extra.png` (my choice) |
| PP (status screen) | AP | status screen, move page | German ROM, with its own routine that prints A and P (my choice) |
| SLP / PSN / BRN / FRZ / PAR / FNT | SLF / GIF / BRT / GFR / PAR / BSG | status conditions: party menu, status screen, battle | German ROM |
| ABLE / NOT ABLE | OK / NEIN | party menu for TMs and evolution stones | German ROM |
| Choose a #MON. / Use item on which #MON? / Bring out which #MON? / Teach to which #MON? / Move #MON where? | Wähle ein #MON aus! / Welches #MON erhält das Item? / Welches #MON soll antreten? / Wähle ein #MON aus! / Mit wem soll das #MON tauschen? | party menu prompts | German ROM |
| TYPE1/ / TYPE2/ / EXP POINTS | TYP1/ / TYP2/ / EP-PUNKTE | status screen | German ROM; OT/, STATUS/, OK and LEVEL UP stay |
| ATTACK / DEFENSE / SPEED / SPECIAL (stat box) | ANGR / VERT / INIT / SPEZ | status screen, level-up box | German ROM |
| SEEN / OWN / CONTENTS | GES / BES / INHALT | Pokédex list | German ROM |
| DATA / CRY / AREA / QUIT | DATA / RUF / GEB. / ZUR. | Pokédex menu | German ROM |
| MOVE (Pokédex menu, Legacy) | ATK. | Pokédex menu | My choice: short for ATTACKEN, dot as in GEB. / ZUR.; stays apart from ANGR (the attack stat) |
| LEVEL UP MOVES: / TM/HM MOVES: | LEVEL UP-ATTACKEN: / TM/VM-ATTACKEN: | Pokédex move page (Legacy) | My choice: LEVEL UP as on the German status screen, VM as in the German ROM |
| Pokémon names | German ROM names (RIZEROS, PIKACHU, RELAXO, …) | everywhere | German ROM table, by index (`data/pokemon/names.asm`) |
| EEVEE / FLAREON / JOLTEON / VAPOREON / CANCEL | EVOLI / FLAMARA / BLITZA / AQUANA / ZURÜCK | Bill's PC menu | German ROM |
| FURBALL (nickname of Craig's ARCANINE, Legacy) | FELLKNÄUEL | Craig's battle | My proposal; Craig's other nicknames are species names and take the German species name |
| Move names | German ROM names (DONNERSCHOCK, …); WEISSNEBEL, FUSSKICK with ss | everywhere | German ROM table, by index (`data/moves/names.asm`) |
| Item names | German ROM names (TRANK, SONDERBONBON, …) | everywhere | German ROM table, by index (`data/items/names.asm`) |
| OAK's PARCEL | EICHs PAKET | item | German ROM `EICHS PAKET`, with the lowercase possessive s |
| B2F, B1F, 1F, 2F … 11F, B4F | UG2, UG1, EG, S1 … S10, UG4 | elevator floor lists | German ROM |
| Type names | NORMAL, KAMPF, FLUG, GIFT, FEUER, WASSER, PFLANZE, ELEKTRO, PSYCHO, EIS, BODEN, GESTEIN, VOGEL, KÄFER, GEIST, DRACHEN | status screen, battle | German ROM (DRACHEN as in the first games; later games say DRACHE) |
| TM / HM names in the bag (Legacy, `TM01 MEGPNCH`) | `TM01 MEGHIEB`, `VM01 ZERSCHN`, … (German move name, 7 letters at most) | bag, marts | My proposal, reviewed: names that fit stay whole; shared word parts always end the same (STRAHL → STRL, STURM → STRM, WELLE → WELL, DONNER → DNR, MEGA → MEG, BODY → BDY, -TOR → TR); a last word squeezed to its consonants keeps its final R (ÜBRROLR, TRMFRSR, GEOFISR, HORNBHR, HMLFEGR, REFLKTR, DELGATR); a last word cut after its start stays cut (ZERSCHN, MEGSAUG, SCHAUFL, STRNSCH); full list in `text/tmhm_names.asm` |
