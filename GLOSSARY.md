# Glossary

Settled translation decisions for Yellow Legacy. Read before every task; add each new decision here. General rules live in `CLAUDE.md` (Project decisions).

| English | German | Where | Source / note |
|---|---|---|---|
| PROF.OAK (dialogue) | PROF. EICH | dialogue | German ROM (24×) |
| PROF.OAK (trainer class) | PROF.EICH | trainer class list (fixed width) | German ROM |
| OAK: (speaker) | EICH: | dialogue | German ROM |
| PROFESSOR OAK | PROFESSOR EICH | lab sign | German ROM |
| OAK's | EICHs | possessive | My choice over the ROM's capital S (`PROF. EICHS Gehilfe`, `EICHS PC`); same lowercase s for every possessive (BILLs, ROCKOs) |
| FIGHT / RUN | KAMPF / FLUCHT | battle menu | KAMPF: my choice over the ROM's `KMPF`; the box starts at column 5, one column left of the German ROM's. FLUCHT: German ROM |
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
| Move names | German ROM names (DONNERSCHOCK, …); WEISSNEBEL, FUSSKICK with SS, as in capitals everywhere | everywhere | German ROM table, by index (`data/moves/names.asm`) |
| Item names | German ROM names (TRANK, SONDERBONBON, …) | everywhere | German ROM table, by index (`data/items/names.asm`) |
| OAK's PARCEL | EICHs PAKET | item | German ROM `EICHS PAKET`, with the lowercase possessive s |
| B2F, B1F, 1F, 2F … 11F, B4F | UG2, UG1, EG, S1 … S10, UG4 | elevator floor lists | German ROM |
| Type names | NORMAL, KAMPF, FLUG, GIFT, FEUER, WASSER, PFLANZE, ELEKTRO, PSYCHO, EIS, BODEN, GESTEIN, VOGEL, KÄFER, GEIST, DRACHEN | status screen, battle | German ROM (DRACHEN as in the first games; later games say DRACHE) |
| TM / HM names in the bag (Legacy, `TM01 MEGPNCH`) | `TM01 MEGHIEB`, `VM01 ZERSCHN`, … (German move name, 7 letters at most) | bag, marts | My proposal, reviewed: names that fit stay whole; shared word parts always end the same (STRAHL → STRL, STURM → STRM, WELLE → WELL, DONNER → DNR, MEGA → MEG, BODY → BDY, -TOR → TR); full list in `text/tmhm_names.asm` |
| BALL× / BAIT / ROCK / RUN | BALL× / KÖDER / STEIN / FLUCHT | Safari Zone battle menu | German ROM, cursor positions as in the German ROM |
| SWITCH / STATS / CANCEL (battle) | TAUSCH / STATUS / ZURÜCK | party submenu in battle | German ROM |
| CANCEL (list menus) | ZURÜCK | bag, PC and mart lists | German ROM |
| TYPE/ / disabled | TYP/ / BLOCKIERT | battle move box | German ROM, slash at the German ROM's position |
| PP (battle move box, Legacy) | AP | battle move box | My choice: original Yellow and the German ROM show no label; Legacy added a bold PP. AP in normal letters, as on the status screen |
| WIN / LOSE / DRAW | GEWONNEN / VERLOREN / UNENTSCHIEDEN | link battle result | German ROM, at its positions; the versus box one tile wider, as in the German ROM |
| VS (link battle versus box) | `VS` in plain letters | link battle versus box | German ROM (`V` `S` from the font); English Yellow draws bold VS tiles |
| Which technique? | Welche Attacke? | MIMIC move list | German ROM |
| OLD MAN | GREIS | old man's catching demo | German ROM |
| Enemy (prefix) | Gegn. | battle texts (`Gegn. RATTFRATZ`) | German ROM |
| used (move) | ben. | battle texts (`SNORLAX` / `ben. FLIEGEN!`) | German ROM |
| Party gained (EXP. ALL, Legacy) | Das Team erhält | EXP text when EXP. ALL is held | My proposal, reviewed; "Team" as in the German ROM (`Vogel-Team`) |
| ATTACK / DEFENSE / SPEED / SPECIAL / ACCURACY / EVADE (stat-change texts) | ANGR / VERT / INIT / SPEZ / GENA / FLU | battle texts (`RATTFRATZs ANGR sinkt!`) | German ROM; my choice over the full words that CLAUDE.md asks for in text |
| Trainer classes | German ROM names (TEENAGER, KÄFERSAMMLER, GÖRE, …, RIVALE1–3) | trainer class list, battle texts | German ROM table, by index (`data/trainers/names.asm`) |
| JANINE (trainer class, Legacy) | JANINA | Legacy's added trainer | PokéWiki (Janina) |
| NURSE JOY (trainer class, Legacy) | SCHW. JOY | Legacy's added trainer | My choice: SCHWESTER JOY is 13 characters, the limit is 12; class shortened, name intact |
| OFF.JENNY (trainer class, Legacy) | OFF. ROCKY | Legacy's added trainer | My choice: OFFICER ROCKY doesn't fit; class shortened, name intact (example in CLAUDE.md) |
| SMITH, CRAIG, WEEBRA (trainer classes, Legacy) | SMITH, CRAIG, WEEBRA | Legacy's added trainers | Cameos of the Legacy creators; names stay |
| Item name in a variable (Oak's aides) | no article: `GELB erhält VM05!`, `keinen Platz für VM05.` | Oak's aides | My choice: the German ROM writes `die` / `den` in front, which fits only some rewards (VM05, DETEKTOR, EP-TEILER) |
| grew to level (RARE CANDY) | `PIKACHU` / `erreicht` / `Level 30!` | party menu | My choice: the same as the battle level-up; the German ROM leaves out "Level" here (`erreicht` / `30!`) |
| deposit (items, PC) | lagern | Player's PC | German ROM (`#MON via PC lagern`); Legacy's "too important to deposit" is the German ROM's toss text with `lagern` |
| sort (bag, Legacy) | sortieren (`Möchtest Du die Items sortieren?`) | bag | My proposal |
| Repel wore off. Use another? (Legacy) | `Der SUPERSCHUTZ` / `wirkt nicht mehr.` / `Noch einen einsetzen?` | after a repel runs out | My proposal, reviewed, on the German ROM's `Der SCHUTZ wirkt nicht mehr.`; only SCHUTZ, SUPERSCHUTZ and TOP-SCHUTZ reach this text, all masculine, so the article is fixed |
| Please come again! (link closed, Virtual Console) | Komm jederzeit wieder vorbei! | Cable Club, VC build | German ROM's Cable Club text for the same English line |
| Item descriptions (Legacy's INFO) | German Gold/Silver/Crystal texts (`Der beste BALL.` / `Erfolg garantiert!`) | bag, INFO | PokéWiki (German GSC): Legacy's English is the GSC English. Crystal's wording where Gold/Silver and Crystal differ, except THUNDER WAVE (`evtl. paralysiert`) and X SPECIAL (`SPEZ-Wert`), where Gold/Silver matches the English and Gen 1; #MON, Du, ß as everywhere (`Starke Fuß-Attacke.`) |
| ▼ at the end of an item description | none: the text ends with `text_waitbutton` | bag, INFO | My choice: the GSC texts use all 18 tiles of the second line, which the ▼ would cover |
| ATTACK / DEFENSE / SPEED / SPECIAL (item descriptions) | ANGR-Wert / VERT-Wert / INIT-Wert / SPEZ-Wert | PROTEIN, IRON, CARBOS, CALCIUM, X items, TM03/11/20/29/33 | My choice: the German GSC wording; Gen 2's SPEZ. ANG and SPEZ.-VER become SPEZ-Wert, since Gen 1 has one SPECIAL stat |
| Repels for 100 / 200 / 250 steps | `Hält 100 Schritte` / `lang schwache` / `#MON ab.` | REPEL, SUPER REPEL, MAX REPEL descriptions | My choice: FireRed/LeafGreen's `Hält 100 Schritte lang schwache, wilde POKéMON ab.`; the German GSC leaves out the steps |
| + (FLASH description) | und | HM05 description | The charmap has no `+`: `Blendet Gegner und senkt Präzision.` |
| Key items without a German Gold/Silver/Crystal description (Legacy) | own wording with the German ROM's terms (`#MON-DNA`, `M.S. ANNE`, `WÄRTER`, `ROCKET-Versteck`, `SILPH CO.`) and the later games' `Bernstein` and `Muschel` | TOWN MAP, OLD AMBER, fossils, SECRET KEY, BIKE VOUCHER, CARD KEY, S.S. TICKET, GOLD TEETH, OAK's PARCEL, SILPH SCOPE, POKé FLUTE, LIFT KEY | Proposed, then reviewed. My choice: `Bernstein mit #MON-DNA`; HELIX FOSSIL (OMANYTE) `#MON-Muschel`, DOME FOSSIL (KABUTO) `#MON-Schale` (`#MON-Rückenschild` is 3 tiles too long), each with its own text; BIKE VOUCHER `Eintauschbar gegen ein neues FAHRRAD`. SILPH SCOPE's `Linse` from FireRed/LeafGreen |
| ß / ss (all text) | ß as the new spelling writes it: the German ROM's ß stays (groß, weiß, Spaß), its short-vowel ß becomes ss (daß → dass, läßt → lässt, Biß → Biss); capitals keep SS | everywhere | My choice (2026-11-13), replacing "ss, never ß": the German ROM's ß glyph at `$df` |
| Pokédex entries and categories | German ROM, in the new spelling (`dass`, `frisst`; ß kept: `großen`, `heißer`) | Pokédex | German ROM by index; Legacy's Pokédex is pret pokeyellow's English |
| Pokédex height / weight | `GR.  0.7m` / `GEW  6.9kg`, the German ROM's values | Pokédex data page | German ROM (its m/k tiles at `$60`/`$61`); the Petit Cup check uses 2.0 m / 20.0 kg (the German ROM forgot to convert it) |
| VICTREEBEL entry, last line | `und verschlingt` / `sie in einem Biss.` | Pokédex | My choice: the ROM's `mit einem Biß.` doesn't fit with `Biss` |
| ELECTRODE entry, page 2 | `Die geringste Er-` / `schütterung lässt` / `es explodieren.` | Pokédex | Re-broken: `lässt` is one character longer than the ROM's `läßt` |
| ZUBAT / GYARADOS entries | `Ultraschalllaute` / `zerstörungswütig` | Pokédex | New spelling for the ROM's `Ultraschallaute`; the ROM's typo `zerstörungwütig` fixed |
| Town and place names | German ROM names: ALABASTIA, VERTANIA CITY, MARMORIA CITY, AZURIA CITY, LAVANDIA, ORANIA CITY, PRISMANIA CITY, FUCHSANIA CITY, ZINNOBERINSEL, INDIGO PLATEAU, SAFFRONIA CITY, VERTANIA-WALD, MONDBERG, FELSTUNNEL, KÜSTENHAUS, M.S.ANNE, #MON LIGA, TUNNELPFAD, #MON TURM, SEESCHAUMINSELN, SIEGESSTRASSE, DIGDAs HÖHLE, TEAM ROCKET HQ, SILPH CO., PKMN-HAUS, SAFARI-ZONE, GEHEIMDUNGEON, KRAFTWERK | Town Map, gym statues | German ROM table, by index (`data/maps/names.asm`); the Town Map writes `M.S.ANNE`, the dialogue `M.S. ANNE`; `DIGDAs HÖHLE` with the lowercase possessive s (my choice over the ROM's `DIGDAS`, like `EICHs`; the ROM also uses `DIGDAS` as a plural) |
| SEA ROUTE 19–21 | ROUTE 19–21 | Town Map | German ROM: no "sea" |
| BROCK / MISTY / LT.SURGE / ERIKA / KOGA / SABRINA / BLAINE / GIOVANNI | ROCKO / MISTY / MAJOR BOB / ERIKA / KOGA / SABRINA / PYRO / GIOVANNI | gym statues (`LEITUNG:`) | German ROM |
| BOULDERBADGE … EARTHBADGE | FELSORDEN, QUELLORDEN, DONNERORDEN, FARBORDEN, SEELENORDEN, SUMPFORDEN, VULKANORDEN, ERDORDEN | Route 23 guards, dialogue | German ROM (FELSORDEN only in dialogue) |
| 's NEST / AREA UNKNOWN | `MEW FUNDORT` / `GEBIET UNB.` | Pokédex area page | German ROM |
| To (Fly screen header) | ` ➔` (` <to>` in the source) | Fly screen | German ROM (`7F 70`): tile `$70`, which shows the arrow on this screen |
| Menu boxes (this slice) | widths and positions as in the German ROM | PC menus, mart, vending machine, blackboard, prize menu, Cable Club, cup menu, trade screen, diploma, printer | My choice, approved for the menus and link slice |
| BUY / SELL / QUIT | KAUF / VERKAUF / TSCHÜSS! | mart menu | German ROM |
| MONEY | GELD | money box: marts, Game Corner, Hall of Fame | German ROM |
| SOMEONE's PC / BILL's PC / `<name>`'s PC / PROF.OAK's PC / `<PKMN>`LEAGUE / LOG OFF | JEMANDES PC / BILLs PC / PC VON GELB / EICHs PC / `<PKMN>`-LIGA / AUSLOGGEN | Pokémon Center PC menu | German ROM; `PC VON` comes before the player's name (the code prints the name after it); BILLs / EICHs with the lowercase possessive s (the ROM writes BILLS / EICHS) |
| WITHDRAW `<PKMN>` / DEPOSIT `<PKMN>` / RELEASE `<PKMN>` / CHANGE BOX / PRINT BOX / SEE YA! | `<PKMN>` MITNEHMEN / `<PKMN>` ABLEGEN / `<PKMN>` FREILASSEN / BOX WECHSELN / DRUCKEN / TSCHÜSS! | Bill's PC | German ROM; the submenu says ABLEGEN / MITNEHMEN, STATUS, ZURÜCK |
| WITHDRAW ITEM / DEPOSIT ITEM / TOSS ITEM / LOG OFF | ITEM AUFNEHMEN / ITEM ABLEGEN / ITEM WEGWERFEN / AUSLOGGEN | player's PC | German ROM |
| BOX No. | BOX Nr. | Bill's PC, save screen | German ROM |
| HALL OF FAME / HALL OF FAME No | RUHMESHALLE / RUHMESHALLE Nr. | Hall of Fame, `<PKMN>`-LIGA PC | German ROM |
| YELLOW LEGACY / HARD (Hall of Fame tag, Legacy) | GELBES VERMÄCHTNIS / SCHWER | Hall of Fame player screen | Approved: as in the backup branch, one box at `0,0` (2 × 18) with the title and the player's name below it, SCHWER at column 13 in hard mode |
| PLAY TIME | SPIELZEIT | Hall of Fame, diploma | German ROM |
| Diploma | `Diplom`; `Herzlichen Glück-` / `wunsch <name>!`; `Du hast es ge-` / `schafft, den` / `#DEX zu` / `vervollständigen.` | diploma (screen and print) | German ROM, with its layout: the player's name goes into the greeting's gap |
| FRESH WATER / SODA POP / LEMONADE | TAFELWASSER / SPRUDEL / LIMONADE | vending machine | German ROM |
| HOW TO LINK / COLOSSEUM / TRADE CENTER / STOP READING | LINK-INFO / KOLOSSEUM / HANDELSCENTER / VERLASSEN | Viridian school blackboard | German ROM; the status lists say SLF GIF PAR / BRT GFR ZUR. |
| NO THANKS / COIN | TSCHÜSS! / MÜNZEN | Game Corner prize menu and coin box | German ROM |
| BICYCLE | FAHRRAD | Bike Shop menu | German ROM |
| HEALTH / ATTACK / DEFENSE / SPEED / SPECIAL (vitamins) | GESU / ANGR / VERT / INIT / SPEZ (`RELAXOs` / `GESU ist` / `gestiegen.`) | vitamin texts | German ROM; `data/battle/stat_names.asm` serves only the vitamins |
| TRADE CENTER / COLOSSEUM / COLOSSEUM2 | HANDELSCENTER / KOLOSSEUM / KOLOSSEUM2 | Cable Club menu | German ROM; the ▷ marks the choice in the cursor column, as in the German ROM |
| View Rules / # Cup / Pika Cup / Petit Cup | Regeln zeigen / #-Cup / Pika-Cup / Mini-Cup | KOLOSSEUM2 cup menu | German ROM, also the rules (`<PKMN>-LV: 50-55` / `Kombi-LV: max. 155` / `MEW ausgenommen`; `Basis-<PKMN>: LV25-30` / `Kombi-LV: max. 80` / `Maximum 2 m, 20 kg`) |
| PLEASE WAIT! / Waiting...! | BITTE WARTEN! / BITTE WARTEN… | Cable Club table, link waiting box (trade and battle) | German ROM |
| STATS / TRADE (trade submenu) | STATUS / TAUSCH | trade screen | German ROM |
| CANCEL (trade screen) | ABBRECHEN | trade screen | German ROM, with its box (`lb bc, 1, 12`); lists keep ZURÜCK |
| Trade completed! / Too bad! The trade was canceled! | TAUSCH VOLLZOGEN! / `Schade! Der Tausch` / `wurde abgebrochen!` | trade screen | German ROM |
| Printer texts | `PRÜFE LINK...`, `ÜBERTRAGUNG...`, `DRUCKEN...`, `Abbrechen mit B`, `Druckfehler 1`–`5`, `Ziehe bitte das` / `Printer-Handbuch` / `zu Rate!`, `Es ist kein` / `Game Boy Printer` / `angeschlossen!` | printing | German ROM; `zu Rate!` in errors 1, 3 and 4 too (approved: the ROM writes `zur Rate!` there and `zu Rate!` in error 2) |
| Pikachu's Beach record (print) | `Pikachus Strand` / `<name>s Rekord` / `Punkte` | printed Surfing Pikachu high score | German ROM |
| The water is calm. Would you like to SURF? (Legacy) | `Das Wasser ist` / `ruhig.` / `Möchtest Du` / `SURFER einsetzen?` | Surf prompt | My proposal, approved (kept `Wasser` over `See`: the prompt also comes up at lakes and ponds) |
| This tree can be CUT! / Would you like to use CUT? (Legacy) | `Diesen Baum kann` / `man zerschneiden!`; `Möchtest Du` / `ZERSCHNEIDER` / `einsetzen?` | Cut prompt | My proposal, approved |
| HMs are really important! You should keep them on you at all times. (Legacy) | `VM sind wirklich` / `wichtig!` / `Du solltest sie` / `immer bei Dir` / `haben.` | Vermilion trade house | My proposal, approved |
| Map dialogue (vanilla Yellow text) | German ROM by position, in the new spelling (`dass`, `musst`, `Lass`, `bisschen`, `zu viele`, `so viel`, `zu viel`, `Stopp`, `Brennnesseln`, `des Weiteren`, `Tschüss`, `missglückt`, `in Acht`, `irgendetwas`, `als Erstes`, `so weit`, `wie viel`, `Gebiss`) | map texts | German ROM; where Legacy changed a text, the German ROM's wording is kept and only Legacy's change is translated |
| TRAINER TIPS / tip | TIPPS FÜR TRAINER / Tipp | signs, Pewter Gym guide | German ROM `TIPS FÜR TRAINER`, `Tip`, in the new spelling |
| RUNNING SHOES (Legacy) | TURBOTRETER | Pallet Town | PokéWiki: official name since Ruby/Sapphire |
| backpack (Legacy) | Rucksack | Pallet Town | My proposal; the bag itself stays BEUTEL |
| STAT experience (Legacy) | STATUS-Erfahrung | Route 1 | My proposal, approved: no official term (PokéWiki: "inoffiziell als Stat Experience bekannt"); STATUS as in the party menu. Not the later `Fleißpunkte`: they are a different mechanic |
| Diversity Value / DV, growth potential (Legacy) | Diversitätswert, kurz DV / Wachstumspotenzial | Viridian City, Pewter City sign | My proposal, approved: Legacy's own term; the later official German term is Individuelle Stärken (IS), "vielen bekannt unter DV" (PokéWiki), but IS go 0–31 and the text says DVs go 0–15 |
| `<PLAYER> received TM42 DRMEATR!` (Legacy) | `<PLAYER> erhält` / `TM42 TRAUMFRESSER!` (also `TM27 GEOFISSUR!`, `TM34 GEDULD!`) | every TM gift | Approved: the full German move name, not the bag's short name Legacy's English uses (`DRMEATR`) and not the German ROM's bare `TM42!`. Check each line: a 12-letter name fills all 18 tiles, so it fits only where no ▼ follows |
| rematch (Legacy) | Revanche | gym leader rematches | My proposal |
| MR MIME: MIME, MIME, MR MIME. (Legacy) | `PANTIMOS: Panti,` / `Panti, Pantimos.` | Red's house | My proposal, in the German ROM's style for cries (`NIDORAN: Nidoran!`, `PUMMELUFF: Puu!`) |
| Win texts of the rival and Oak | no `<RIVAL>:` prefix; first line short | battles | Upstream fix: the battle prints the trainer's name before them |
| All kids leave home (Legacy: boys → kids) | `alle Kinder` | Mom, Red's house | Approved; the German ROM says `alle Jungen` |
| young one (fishing guru) | `junges Blut` | Viridian Mart, OLD ROD | Approved over `mein Kind` and the ROM's `junger Freund`; neutral (das Blut), an old man's word |
| kid (put-down), German ROM `Kleiner` | `Grünschnabel` | Pewter Gym trainer, and every condescending `Kleiner` in the German ROM | Approved: used for anyone, keeps the put-down. Grudging respect takes `Kind` (approved: Mt. Moon Rocket `Du bist 'ne harte Nuss, Kind!`). Friendly `Kleiner` takes `Kumpel` (approved: S.S. ANNE sailor `Willst Du zur See fahren, Kumpel?`) |
| pal | `Kumpel` | rival, BILL, trainers | German ROM, approved: used for anyone in casual German, so it stays everywhere |
| Wait! Take this with you! (BROCK, before TM34) | `Warte! Nimm das` / `hier mit!` | Pewter Gym | Approved own wording, after SABRINA's German (MARSHBADGE) `Warte! Nimm noch` / `diese TM von mir!`. The German ROM plays Red/Blue's old advice text (`Du scheinst ein sehr begabter #MON-TRAINER zu sein!…`) in this slot instead |
| ROCK-hard will / Stones sharpen! (BROCK rematch, Legacy) | `STEIN-harter` / `Wille`; `Steine schärfen!` | Pewter Gym rematch | My proposal, approved: STEIN- as in his German `STEIN-#MON` |
| THUNDERBADGE / SOULBADGE stat (Legacy: DEFENSE / SPEED) | `Die VERTEIDIGUNG` / `Deiner #MON` / `nimmt zu.`; `Die INITIATIVE` / `Deiner #MON` / `wird verbessert.`; KOGA: `wird die` / `INITIATIVE Deiner` / `#MON steigen!` | Cerulean badge house, Fuchsia Gym | The German ROM's two texts with the stats swapped: Legacy matches them to the badges' real effects, the German ROM (like English Yellow) has them the wrong way round |
| critical hit / base SPEED (Legacy) | `Volltreffer` / `INITIATIVE-Basiswert` | Cerulean City sign | `Volltreffer!`: the German ROM's battle message. `Basiswert`: my proposal |
| Let's make a splash! (MISTY rematch, Legacy) | `Lass uns Wellen` / `schlagen!` | Cerulean Gym rematch | My proposal, approved: `Wellen schlagen` (to make waves) keeps the water pun |
| Ready to dive in, CHAMPION? (MISTY rematch, Legacy) | `Bereit, ins` / `Wasser zu` / `springen,` / `CHAMPION?` | Cerulean Gym rematch | My proposal, approved |
| German ROM slips | fixed: missing comma (`Bleib stehen, wo`), missing verb (Route 24: `… die rechte Hand vom Boss werden!`, approved), trailing spaces that push a line under the ▼, Route 10's TRAINERIN whose battle and end texts the German ROM points the wrong way round (`Ich bin nicht fit!` comes before the battle with a ▼, `… erschöpft...` after it with no ▼; swapped back, approved), the typos `Sitzungsaal` (`Sitzungssaal`, Silph Co. 7F) and `Mann kann` (`Man kann`, Route 16) | map texts | Listed in each PR |
| LT. SURGE's "kid" (German ROM `Junge`, `Kleiner`) | taunt before the battle `Grünschnabel`; respect and advice `Kind`; `You're special, kid!` → `Du bist etwas` / `Besonderes!` | Vermilion Gym | Approved |
| Ahoy there! (German ROM `Ahoi, Seemann!`) / You, mon petit! (`Du Leichtmatrose!`) | `Ahoi, Landratte!`; `Du Leichtmatrose!` stays | S.S. ANNE bow, kitchen | Approved: `Seemann` as an address makes the player male; `Leichtmatrose` stays as the cook's jab |
| Good Rod guru (Legacy moves him from Fuchsia to Vermilion) | the German ROM's Fuchsia texts (`Ich bin der ältere Bruder des PROFIANGLERS!`, `Nimm das hier und gehe angeln!`) | Vermilion fishing house | German ROM: the guru's own texts, wherever Legacy puts him; no address word, as in the German ROM |
| Our CHAIRMAN's new hobby is taking #MON photos… (CLEFAIRY fan) | `Der Vorsitzende hat ein neues Hobby: #MON-FOTOS!` / `Er hat mir ein schönes FOTO von meinem süßen PIEPI gedruckt.` | #MON FAN CLUB | Approved own wording: the German ROM repeats the receptionist's line in this slot |
| LT. SURGE rematch (Legacy): surge of power / jolt of reality / stay charged | `Stromstoß` / `Realitätsschock` / `Bleib so energiegeladen!` | Vermilion Gym rematch | Approved: electric terms in place of the pun on his name (MAJOR BOB has none) |
| It's part of the game! (Legacy) | `Das gehört zum` / `Spiel dazu!` | S.S. ANNE bow | My proposal |
| Come, child! (CHANNELER, purified zone), German ROM `mein Junge` | `Komm her, mein` / `Kind!` | #MON TOWER 5F | Approved: the English word, neutral |
| Ghost-type moves (Legacy): physical contact / SPECIAL damage / non-physical moves | `GEIST-#MON greifen nicht mit Körperkontakt an, sondern richten SPEZIAL-Schaden an!`; `Sie treffen zwar keine NORMAL-#MON, können aber als nicht-physische Attacken trotzdem hart treffen!` | #MON TOWER 1F (CHANNELER), 2F (rival) | Approved: Legacy makes GHOST a special type (`constants/type_constants.asm`), so the non-physical moves are the GHOST moves themselves; GEIST as the type name, SPEZIAL as the stat in text |
| Aren't you a little toughie! (Route 9 HIKER), German ROM `Du kleiner Rabauke!` | `Du kleiner Rabauke!`, `Kinder sollten kleine Rabauken sein!` | Route 9 | Approved: kept; `Rabauke` is said of girls too, like `Grünschnabel` |
| 5F: POWER ZONE (Legacy; vanilla DRUG STORE) | `S4: DROGERIE` | Celadon department store directory, 5F sign, diner | Approved: the German ROM's name stays; the German word has no drug sense to avoid |
| status-reduction moves / SPECIAL stat / non physical attacks (Legacy TRAINER TIPS) | `Attacken, die ihre Statuswerte senken`; `SPEZIAL-Wert`; `nicht-physische Attacken` | Celadon City signs | My proposal; `nicht-physische Attacken` as approved for the #MON TOWER rival |
| Oh! You! (Celadon Gym trainer), German ROM `Du Grobian!` | `Oh!` / `Wie grob!` | Celadon Gym | Approved: `Grobian` is a man's word |
| full bloom (ERIKA rematch, Legacy) | `in voller Blüte`, `die Schönheit der vollen Blüte` | Celadon Gym rematch | My proposal |
| Kid, do you want to play? (Game Corner fishing guru), German ROM `Junge` | `Möchtest Du auch` / `spielen, Kind?` | Game Corner | Approved: the English word (chosen over `junges Blut` and `Kumpel`) |
| brat (Rocket Hideout, Silph Co.), German ROM `Du Lausebengel!`, `Kleiner` | `Du Rotznase!`; JESSIE and JAMES: `Bleib sofort stehen, Rotznase!` | Rocket Hideout B1F, Silph Co. 10F | Approved: the German ROM's word for JESSIE and JAMES's "brat" (B4F) |
| I can't do it! (Rocket Hideout), German ROM `Ich konnte ihn nicht stoppen!!!` | `Ich konnte Dich nicht stoppen!!!` | Rocket Hideout B1F | Approved: `ihn` makes the player a boy |
| condescending `Kleiner` (Rocket Hideout) | `Wie kommst Du hierher, Grünschnabel?` | Rocket Hideout B1F | The `Grünschnabel` rule |
| SABRINA's pure psychic #MON / high SPECIAL / high ATTACK (Legacy gym guide) | `SABRINAs reine PSYCHO-#MON`; `mit ihrem hohen SPEZIAL-Wert`; `#MON mit hohem ANGRIFF` | Saffron Gym | My proposal; `nicht-physische Treffer` as approved for the #MON TOWER rival |
| SABRINA rematch (Legacy): psychic power / power within / psychic sense | `Meine PSYKRÄFTE spüren Deine Stärke.`; `Zeig mir die Kraft, die in Dir steckt!`; `übersinnliche Wahrnehmung` | Saffron Gym rematch | My proposal; `PSYKRÄFTE` as the German ROM's gym trainer says |
| Thanks, kid! (SAFARI ZONE WARDEN), German ROM `Danke, Junge!` | `WÄRTER: Danke,` / `Kind! Niemand` | WARDEN's house | Approved: the English word, as the Game Corner fishing guru |
| the CHAMPION (the player, in Legacy's new texts) | no gendered article: `jetzt, wo Du CHAMPION bist`, `ob Du als CHAMPION`, `des Titels CHAMPION wahrlich würdig` | NURSE JOY, KOGA rematch | My choice: `der` / `dem neuen CHAMPION` would make the player a man |
| #MON MASTER (NURSE JOY about herself, Legacy) | `#MON-MEISTERIN` | Fuchsia Pokémon Center | My proposal |
| Fwahahaha! (KOGA) | `Hahaha!` | Fuchsia Gym, KOGA rematch | German ROM |
| the first person (Safari Zone SECRET HOUSE), German ROM `Du bist der Erste, der` | `Du bist die` / `erste Person, die` | Safari Zone SECRET HOUSE | Approved: the English words, neutral |
| Role nouns for the player: KOGA's `würdiger Kämpfer` and `Träger des SEELENORDENS`, the Safari Zone gate's `Stammkunde` | kept | Fuchsia Gym, Safari Zone gate | Approved: role words, like Trainer and Champion |
| That'll be ¥…, please! (Safari Zone gate) | `Das kostet` / `¥…!`, with the price paid | Safari Zone gate | The German ROM writes `¥500` into the text; Legacy (like English Yellow) prints the price, which is lower when the player is short of money |
| You little brute! (Route 13 BEAUTY), German ROM `Du kleiner Wüstling, Du!` | `Du kleines` / `Biest, Du!` | Route 13 | Approved: `Wüstling` is a man's word |
| Oh, you're a little cutie! (Route 15 BEAUTY), German ROM `Du bist ein gewitzter Kerl!` | `Du bist ja ganz` / `schön gewitzt!` | Route 15 | Approved: drops `Kerl`, keeps the German ROM's `gewitzt` |
| PROF.OAK's AIDE on Route 15 (Legacy: no #DEX check, always the EXP.ALL) | the German ROM's aide wording: `Ich bin PROF. EICHs Gehilfe!`; `einen` / `den EP-TEILER` | Route 15 gate 2F | The item is fixed here, so the article fits (see the Oak's aides row) |
