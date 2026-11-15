# Text checks for the German translation

Checks that find text problems the build does not: lines too wide for the box, text that runs on into the next bytes, typos, English left in the ROM.

The checks read a **built checkout**: a clone with `pokeyellow.gbc` and `pokeyellow.sym` made by `make`.

## Requirements

- Python 3 with PyBoy, needed by the sweep only: `python3 -m venv venv && venv/bin/pip install -r tools/qa/requirements.txt`
- zsh, for `check_all.sh`
- For `spellcheck.py`:
  - `hunspell`, e.g. `brew install hunspell`
  - the German dictionary `de_DE_frami.dic` and `de_DE_frami.aff` from [LibreOffice's dictionaries](https://github.com/LibreOffice/dictionaries/tree/master/de), which use the new spelling
- For `engscan.py`: `/usr/share/dict/words`

## Before a merge

```sh
PYTHON=venv/bin/python tools/qa/check_all.sh PR_CLONE [MAIN_CLONE]
```

This takes about two minutes and prints:

1. **The check scripts:** `tools/check_text_width.py`, `tools/check_text_mode.py` and `tools/check_names.py`.
2. **The source scan** (`cmdscan.py`):
   - a string without `@` right before `text_end`, so the text runs on into the next bytes;
   - a second `line` in one box, which overwrites the bottom row instead of scrolling.
3. **The sweep:**
   - `labels.py` lists every text label.
   - `sweep.py` shows each one in a real dialogue box in PyBoy, with every name and number at its longest (`maxvalues.py`).
   - `expect.py` compares each box with the text rendered from the source. It flags:
     - lines that never appear in full;
     - lines wider than 18 tiles;
     - box borders that were overwritten;
     - tiles that are not in the charmap.
   - Only new flags are printed: known cases are left out.
4. **The rerun:** the texts in `realvalues.json` only ever print one value, so they run again with that value.
5. **The screen diff**, with `MAIN_CLONE`: every text that looks different from main (`diffsweep.py`). It sorts them into two groups:
   - **changed:** texts the diff touches (`touched.py`);
   - **regression?:** texts the diff does not touch.

   A touched text that looks the same is reported too.

The runs go to `$QA_OUT`, default `$TMPDIR/yellow-legacy-qa`. The main run is cached there by commit.

A clean result looks like this:

```text
== sweep
  2815 texts, 0 with new flags
== texts that only ever print one value, at that value
  18 texts rerun
```

## Single checks

| Script | Finds | Run |
|---|---|---|
| `tools/check_text_width.py --max` | lines too wide when every name and number is at its longest | `python3 tools/check_text_width.py --max` |
| `spellcheck.py` | typos, old spelling (daß), lowercase du, doubled words, double spaces | `spellcheck.py REPO DUMP GLOSSARY.md DICT OUT.json` (`DICT`: the dictionary path without `.dic`) |
| `consist.py` | one English text with more than one German version | `consist.py ENGLISH_LEGACY_REPO REPO` |
| `romtext.py` + `engscan.py` | English left anywhere in the ROM, even outside the text files | see below |

**spellcheck.py** sorts its findings into buckets in `OUT.json`, the likeliest errors first:

| Bucket | What's in it |
|---|---|
| `typo` | words hunspell rejects and the German ROM doesn't have |
| `oldspell` | words the German ROM has in the old spelling |
| `compound` | compounds of two known words |
| `caps` | capitalised words no name table has |
| `style` | lowercase du, doubled words, double spaces |

Most hits are names, loanwords and the German ROM's own wording, so read each bucket rather than counting it.

**English in the ROM:**

```sh
python3 tools/qa/romtext.py ours pokeyellow.gbc DIR/ours.json pokeyellow.sym
python3 tools/qa/romtext.py english ENGLISH_LEGACY.gbc DIR/english.json
python3 tools/qa/romtext.py german GERMAN.gb DIR/german.json
python3 tools/qa/engscan.py DIR
```

`engscan.py` flags three kinds of run:

- a run with a contraction tile;
- a run with a word that only the English text uses;
- a run identical to an English run that the German ROM lacks.

Expect hits on `wär's`, `geht's` and the like: our `'s` is a single tile, and the German ROM has a single `'s` tile too.

## Known false alarms

- **`check_text_width.py`:** `text/SilphCo11F.asm:90`. The speaker is GIOVANNI, but the script guesses TEAM ROCKET.
- **`check_text_width.py --max`:** the texts in `realvalues.json`, because they never print the longest value. `check_all.sh` reruns them at their real value instead.
- **The sweep:** `_MoveNameText` runs on into `_ExclamationPointText` by design.
