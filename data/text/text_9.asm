_ItemUseBallText00::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "lässt sich nicht"
	cont "fangen!"
	prompt

_ItemUseBallText01::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

_ItemUseBallText02::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

_ItemUseBallText03::
	text "Fast hätte es"
	line "geklappt! "
	prompt

_ItemUseBallText04::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

_ItemUseBallText05::
	text "Wunderbar!"
	line "@"
	text_ram wEnemyMonNick
	text " wurde"
	cont "gefangen!@"
	text_end

_ItemUseBallText07::
	text_ram wBoxMonNicks
	text " wurde"
	line "auf BILLS PC"
	cont "übertragen!"
	prompt

_ItemUseBallText08::
	text_ram wBoxMonNicks
	text " wurde"
	line "auf den GAST-PC"
	cont "übertragen!"
	prompt

_ItemUseBallText06::
	text "Für @"
	text_ram wEnemyMonNick
	text_start
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt!@"
	text_end

_SurfingGotOnText::
	text "<PLAYER> steigt"
	line "auf @"
	text_ram wcd6d
	text "!"
	prompt

_SurfingNoPlaceToGetOffText::
	text "Hier kann man"
	line "nicht absteigen!"
	prompt

_RefusingText::
	text_ram wcd6d
	text_start
	line "weigert sich!"
	prompt

_VitaminStatRoseText::
	text_ram wcd6d
	text "s"
	line "@"
	text_ram wStringBuffer
	text " ist"
	cont "gestiegen."
	prompt

_VitaminNoEffectText::
	text "Das würde keinen"
	line "Effekt haben."
	prompt

_ThrewBaitText::
	text "<PLAYER> wirft"
	line "einen KÖDER aus."
	done

_ThrewRockText::
	text "<PLAYER> wirft"
	line "einen STEIN."
	done

_PlayedFluteNoEffectText::
	text "Die #FLÖTE"
	line "wurde gespielt!"

	para "Eine schöne"
	line "Melodie!"
	prompt

_FluteWokeUpText::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> spielt"
	line "die #FLÖTE.@"
	text_end

_CoinCaseNumCoinsText::
	text "Münzen"
	line "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Oh! Der DETEKTOR"
	line "zeigt an, dass"
	cont "ein Item in der"
	cont "Nähe liegt!"
	prompt

_ItemfinderFoundNothingText::
	text "Nichts! Der"
	line "DETEKTOR schlägt"
	cont "nicht an."
	prompt

_RaisePPWhichTechniqueText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erhöht"
	cont "werden?"
	done

_RestorePPWhichTechniqueText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

_PPMaxedOutText::
	text "Die AP von"
	line "@"
	text_ram wStringBuffer
	text " sind"
	cont "auf dem Maximum!"
	prompt

_PPIncreasedText::
	text "Die AP von"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "sind gestiegen."
	prompt

_PPRestoredText::
	text "Die AP wurden"
	line "aufgefüllt!"
	prompt

_BootedUpTMText::
	text "TM aktiviert!"
	prompt

_BootedUpHMText::
	text "VM aktiviert!"
	prompt

_TeachMachineMoveText::
	text "Sie enthält"
	line "@"
	text_ram wStringBuffer
	text "!"

	para "@"
	text_ram wStringBuffer
	text_start
	line "einem #MON"
	cont "beibringen?"
	done

_MonCannotLearnMachineMoveText::
	text_ram wcd6d
	text_start
	line "passt nicht zu"
	cont "@"
	text_ram wStringBuffer
	text "."

	para "Es kann"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "nicht lernen."
	prompt

_ItemUseNotTimeText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen!"
	prompt

_ItemUseNotYoursToUseText::
	text "Dies gehört Dir"
	line "nicht!"
	prompt

_ItemUseNoEffectText::
	text "Das hätte keinen"
	line "Effekt!"
	prompt

_ThrowBallAtTrainerMonText1::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Sei kein Dieb!"
	prompt

_NoCyclingAllowedHereText::
	text "Das Radfahren ist"
	next "hier verboten!"
	prompt

_NoSurfingHereText::
	text "Hier kann nicht"
	line "auf @"
	text_ram wcd6d
	text_start
	cont "gesurft werden!"
	prompt

_BoxFullCannotThrowBallText::
	text "Die #MON-BOX"
	line "ist voll! Das"
	cont "Item kann nicht"
	cont "benutzt werden!"
	prompt

_DontHavePokemonText::
	text "Du besitzt noch"
	line "kein #MON!"
	prompt

_ItemUseText001::
	text "<PLAYER> setzt@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text " ein!"
	done

_GotOnBicycleText1::
	text "<PLAYER> steigt@"
	text_end

_GotOnBicycleText2::
	text_ram wStringBuffer
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> steigt@"
	text_end

_GotOffBicycleText2::
	text "vom @"
	text_ram wStringBuffer
	text " ab."
	prompt

_ThrewAwayItemText::
	text_ram wcd6d
	text_start
	line "weggeworfen!"
	prompt

_IsItOKToTossItemText::
	text "Willst Du"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "wegwerfen?"
	prompt

_TooImportantToTossText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "wegwerfen!"
	prompt

_TooImportantToDepositText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "lagern!"
	prompt

_AlreadyKnowsText::
	text_ram wcd6d
	text " kennt"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "bereits!"
	prompt

_ConnectCableText::
	text "OK, verbinde die"
	line "Kabel so! "
	prompt

_TradedForText::
	text "<PLAYER> hat"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " gegen"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text_start
	cont "getauscht!@"
	text_end

_WannaTrade1Text::
	text "Ich suche nach"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Tauschst Du es"
	line "gegen @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade1Text::
	text "Oje! Wenn"
	line "das so ist..."
	done

_WrongMon1Text::
	text "Was? Das ist aber"
	line "kein @"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Komm wieder,"
	line "wenn Du eins"
	cont "besitzt!"
	done

_Thanks1Text::
	text "Vielen Dank!"
	done

_AfterTrade1Text::
	text "Ist @"
	text_ram wInGameTradeReceiveMonName
	text_start
	line "nicht cool?"
	done

_WannaTrade2Text::
	text "Hallo! Willst Du"
	line "Dein @"
	text_ram wInGameTradeGiveMonName
	text_start

	para "nicht gegen ein"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text_start

	para "tauschen?"
	done

_NoTrade2Text::
	text "Wenn Du nicht"
	line "magst, kann man"
	cont "nichts machen!"
	done

_WrongMon2Text::
	text "Hm? Das ist kein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Denk an mich,"
	line "wenn Du eins"
	cont "gefangen hast!"
	done

_Thanks2Text::
	text "Danke!"
	done

_AfterTrade2Text::
	text "Hallo! Dein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text ","
	cont "ist einfach"
	cont "großartig!"
	done

_WannaTrade3Text::
	text "Besitzt Du ein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Willst Du es"
	line "gegen @"
	text_ram wInGameTradeReceiveMonName
	text_start
	cont "tauschen?"
	done

_NoTrade3Text::
	text "Schade!"
	done

_WrongMon3Text::
	text "Das ist kein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Komm wieder,"
	line "wenn Du eins"
	cont "besitzt!"
	done

_Thanks3Text::
	text "Vielen Dank!"
	done

_AfterTrade3Text::
	text "Wie geht es"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "Mein @"
	text_ram wInGameTradeGiveMonName
	text_start
	line "fühlt sich super!"
	done

_NothingToCutText::
	text "Hier kann"
	line "man nichts"
	cont "zerschneiden!"
	prompt

_UsedCutText::
	text_ram wcd6d
	text " setzt"
	line "den ZERSCHNEIDER"
	cont "ein!"
	prompt
