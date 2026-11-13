TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	db LICKITUNG,  DUGTRIO,  TRADE_DIALOGSET_CASUAL,    "BODO@@@@@@@"
	db CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL,    "MICKY@@@@@@"
	db BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,     "SPIKY@@@@@@" ; unused
	db KANGASKHAN, MUK,      TRADE_DIALOGSET_CASUAL,    "STINKER@@@@"
	db MEW,        MEW,      TRADE_DIALOGSET_HAPPY,     "BART@@@@@@@" ; unused
	db TANGELA,    PARASECT, TRADE_DIALOGSET_CASUAL,    "SEPP@@@@@@@"
	db POLIWHIRL,  JYNX,     TRADE_DIALOGSET_EVOLUTION, "LILLI@@@@@@"
	db GOLDUCK,    RHYDON,   TRADE_DIALOGSET_EVOLUTION, "DICKIE@@@@@"
	db GROWLITHE,  DEWGONG,  TRADE_DIALOGSET_HAPPY,     "ROBBIE@@@@@"
	db CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,     "PROLO@@@@@@"
	assert_table_length NUM_NPC_TRADES
