"""Flag English in our ROM's text runs.  engscan.py DIR (with ours.json, english.json, german.json from romtext.py)

A run is flagged when it
- uses a contraction tile ('d 'l 's 't 'v 'r 'm, shown as ʼ), which only English text uses, or
- contains a word that is an English dictionary word, appears in the English Legacy ROM's text,
  and never appears in the German ROM's text ("English-only word"), or
- is identical to a run of the English ROM that the German ROM does not have.
Prints one line per flagged run: bank:addr label | hits | text.
"""
import json, os, re, sys
from collections import Counter

d = sys.argv[1]
ours, eng, ger = (json.load(open(os.path.join(d, f + ".json"))) for f in ("ours", "english", "german"))
TOK = re.compile(r"\{[a-z_]+\}|<[A-Z_]+>|@")
WORD = re.compile(r"[A-Za-zÄÖÜäöüßéʼ']+")
DICT = {w.strip().lower() for w in open("/usr/share/dict/words")}
SHORT = {"it", "is", "to", "of", "my", "me", "we", "be", "do", "go", "he", "if", "no", "on", "or", "up", "us",
         "at", "by", "oh", "ok", "hi", "am", "a", "i"}


def words(t):
    return [w.strip("'") for w in WORD.findall(TOK.sub(" ", t)) if w.strip("'")]


def loose(r):
    t = r["text"]
    return " " in t and bool(re.search(r"[a-zäöüß]{3}", t))


de_words = Counter(w.lower() for r in ger if loose(r) for w in words(r["text"]))
en_words = Counter(w.lower() for r in eng if loose(r) for w in words(r["text"]))
REAL = lambda w: (len(w) >= 2 and (w in de_words and de_words[w] >= 2 or w in DICT)) or ("ʼ" in w and en_words[w] >= 2)


def texty(r):
    """Real text, not code, music or graphics bytes: at least 60% of its letters are in real words,
    and one real word has 3+ letters."""
    ws = [w.lower() for w in words(r["text"])]
    total = sum(len(w) for w in ws)
    good = [w for w in ws if REAL(w)]
    if total > 0 and sum(len(w) for w in good) >= 0.6 * total and any(len(w) >= 3 for w in good):
        return True
    # or shaped like text: spaces, two lowercase words, mostly letters once tokens are removed
    clean = TOK.sub("", r["text"])
    lower = re.findall(r"\b[A-Za-zÄÖÜäöüß]*[a-zäöüß]{3,}\b", TOK.sub(" ", r["text"]))
    letters = len(re.findall(r"[A-Za-zÄÖÜäöüßé ]", clean))
    return " " in clean and len(lower) >= 2 and letters >= 0.8 * len(clean)
en_only = {w for w in en_words if w not in de_words and (w in DICT or "ʼ" in w) and (len(w) >= 3 or w in SHORT)}
en_runs = {r["text"] for r in eng if texty(r)}
de_runs = {r["text"] for r in ger}

flag = []
for r in ours:
    if not texty(r):
        continue
    t, ws = r["text"], words(r["text"])
    hits = sorted({w for w in ws if w.lower() in en_only})
    why = []
    if "ʼ" in t:
        why.append("contraction")
    if hits:
        why.append("words:" + ",".join(hits))
    if t in en_runs and t not in de_runs and re.search(r"[a-z]{3}", t):
        why.append("same-as-English")
    # a single short hit in an otherwise German run is usually a German word that is also English
    german = sum(1 for w in ws if w.lower() in de_words)
    if why == ["words:" + ",".join(hits)] and len(hits) == 1 and german >= 3 and len(hits[0]) <= 4:
        continue
    if why:
        flag.append((r, why, german, len(ws)))

for r, why, g, n in flag:
    print(f"{r['at']} {r['label']:<48} | {' '.join(why)} | de {g}/{n} | {r['text'][:160]}")
print(len(flag), "flagged of", len(ours), file=sys.stderr)
