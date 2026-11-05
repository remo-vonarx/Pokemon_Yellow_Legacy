_EnemyAppearedText::
	text_ram wEnemyMonNick
	text_start
	line "taucht auf!"
	prompt

_TrainerWantsToFightText::
	text_ram wTrainerName
	text_start
	line "möchte kämpfen!"
	prompt

_UnveiledGhostText::
	text "Das SILPH SCOPE"
	line "hat den GEIST"
	cont "identifiziert!"
	prompt

_GhostCantBeIDdText::
	text "Mist! Dieser"
	line "GEIST ist nicht"
	cont "identifizierbar!"
	prompt

_GoText::
	text "Los! @"
	text_end

_DoItText::
	text "Los! @"
	text_end

_GetmText::
	text "Los! @"
	text_end

_EnemysWeakText::
	text "Mach es fertig!"
	line "Los! @"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text " @"
	text_end

_EnoughText::
	text "genug!@"
	text_end

_OKExclamationText::
	text "OK!@"
	text_end

_GoodText::
	text "klasse!@"
	text_end

_ComeBackText::
	text_start
	text_start
	line "Komm zurück!"
	done

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> sammelt"
	line "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " auf!"
	prompt

_ClearSaveDataText::
	text "Alle Spielstände"
	line "löschen?"
	done

_WhichFloorText::
	text "Wähle ein"
	line "Stockwerk aus:"
	done

_SleepingPikachuText1::
	text "Es gibt keine"
	line "Antwort..."
	prompt

_PartyMenuNormalText::
	text "Wähle ein #MON"
	line "aus!"
	done

_PartyMenuItemUseText::
	text "Welches #MON"
	line "erhält das Item?"
	done

_PartyMenuBattleText::
	text "Welches #MON"
	line "soll antreten?"
	done

_PartyMenuUseTMText::
	text "Wähle ein"
	line "#MON aus!"
	done

_PartyMenuSwapMonText::
	text "Mit wem soll das"
	line "#MON tauschen?"
	done

_PotionText::
	text_ram wcd6d
	text " erhält"
	line "@"
	text_decimal wHPBarHPDifference, 2, 3
	text " Kraftpunkte!"
	done

_AntidoteText::
	text "Die Vergiftung"
	line "wurde geheilt!"
	done

_ParlyzHealText::
	text "Die Paralyse"
	line "wurde aufgehoben!"
	done

_BurnHealText::
	text_ram wcd6d
	text_start
	line "wurde geheilt!"
	done

_IceHealText::
	text_ram wcd6d
	text_start
	line "wurde aufgetaut!"
	done

_AwakeningText::
	text_ram wcd6d
	text_start
	line "ist aufgewacht!"
	done

_FullHealText::
	text_ram wcd6d
	text " wurde"
	line "komplett geheilt!"
	done

_ReviveText::
	text_ram wcd6d
	text_start
	line "ist wieder fit!"
	done

_RareCandyText::
	text_ram wcd6d
	text_start
	line "erreicht"
	cont "Level @"
	text_decimal wCurEnemyLVL, 1, 3
	text "!@"
	text_end

_TurnedOnPC1Text::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_AccessedBillsPCText::
	text "Die Verbindung zu"
	line "BILLS PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_AccessedSomeonesPCText::
	text "Die Verbindung"
	line "zum GAST-PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_AccessedMyPCText::
	text "Die Verbindung zu"
	line "Deinem PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das ITEM-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_WhatDoYouWantText::
	text "Wähle einen"
	line "Menüpunkt aus."
	done

_WhatToDepositText::
	text "Welches Item soll"
	line "gelagert werden?"
	done

_DepositHowManyText::
	text "Anzahl?"
	done

_ItemWasStoredText::
	text_ram wcd6d
	text_start
	line "wurde gelagert."
	prompt

_NothingToDepositText::
	text "Du hast keine"
	line "Items, die Du"
	cont "lagern könntest."
	prompt

_NoRoomToStoreText::
	text "Die"
	line "Lagerkapazität"
	cont "ist erschöpft."
	prompt

_WhatToWithdrawText::
	text "Welches Item"
	line "möchtest Du"
	cont "mitnehmen?"
	done

_WithdrawHowManyText::
	text "Anzahl?"
	done

_WithdrewItemText::
	text_ram wcd6d
	text_start
	line "mitgenommen."
	prompt

_NothingStoredText::
	text "Hier lagern keine"
	line "Items."
	prompt

_CantCarryMoreText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "tragen."
	prompt

_WhatToTossText::
	text "Welches Item"
	line "möchtest Du"
	cont "ausmustern?"
	done

_TossHowManyText::
	text "Anzahl?"
	done

_AccessedHoFPCText::
	text "Verbindung zur"
	line "PKMN-LIGA-WEBSITE"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf die Datenbank"
	cont "der RUHMESHALLE."
	prompt

_SleepingPikachuText2::
	text "Es gibt keine"
	line "Antwort..."
	prompt

_SwitchOnText::
	text "Schalte ein!"
	prompt

_WhatText::
	text "Wähle!"
	done

_DepositWhichMonText::
	text "Welches #MON"
	line "lagern?"
	done

_MonWasStoredText::
	text_ram wStringBuffer
	text " wurde"
	line "in Box @"
	text_ram wBoxNumString
	text_start
	cont "transferiert."
	prompt

_CantDepositLastMonText::
	text "Du kannst Dein"
	line "letztes #MON"
	cont "nicht lagern!"
	prompt

_BoxFullText::
	text "In dieser Box ist"
	line "kein Platz für"
	cont "weitere #MON."
	prompt

_MonIsTakenOutText::
	text_ram wStringBuffer
	text " wurde"
	line "transferiert."

	para "@"
	text_ram wStringBuffer
	text_start
	line "erhalten."
	prompt

_NoMonText::
	text "Diese Box enthält"
	line "keine #MON!"
	prompt

_CantTakeMonText::
	text "Du kannst keine"
	line "#MON mehr"
	cont "tragen!"

	para "Du mußt erst"
	line "#MON via PC"
	cont "lagern."
	prompt

_PikachuUnhappyText::
	text_ram wcd6d
	text " sieht"
	line "unglücklich aus!"
	prompt

_ReleaseWhichMonText::
	text "Welches #MON"
	line "soll freigelassen"
	cont "werden?"
	done

_OnceReleasedText::
	text "Ist es erstmal"
	line "freigelassen,"
	cont "kommt @"
	text_ram wStringBuffer
	text_start
	cont "nicht wieder"
	cont "zurück. OK?"
	done

_MonWasReleasedText::
	text_ram wStringBuffer
	text " wurde"
	line "freigelassen. Leb"
	cont "wohl, @"
	text_ram wStringBuffer
	text "!"
	prompt

_RequireCoinCaseText::
	text "Du benötigst"
	line "einen MÜNZKORB!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "Wir tauschen"
	line "Münzen gegen"
	cont "Preise ein."
	prompt

_WhichPrizeText::
	text "Welcher Preis"
	line "soll es sein?"
	done

_HereYouGoText::
	text "Hier ist Dein"
	line "Preis!@"
	text_end

_SoYouWantPrizeText::
	text "Du möchtest also"
	line "@"
	text_ram wcd6d
	text_start
	cont "haben?"
	done

_SorryNeedMoreCoinsText::
	text "Schade. Du hast"
	line "zu wenig Münzen!@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "Ups! Du hast"
	line "momentan keinen"
	cont "Platz dafür!@"
	text_end

_OhFineThenText::
	text "Dann ist ja alles"
	line "klar.@"
	text_end

_GetDexRatedText::
	text "Soll Dein #DEX"
	line "bewertet werden?"
	done

_ClosedOaksPCText::
	text "Die Verbindung zu"
	line "PROF EICHs PC"
	cont "wurde getrennt.@"
	text_end

_AccessedOaksPCText::
	text "Die Verbindung zu"
	line "PROF EICHs PC"
	cont "wurde erstellt."

	para "Du hast Zugriff"
	line "auf die #DEX-"
	cont "BEWERTUNG."
	prompt

_ExpressionText::
	text "Dies ist Ausdruck"
	line "Nr. @"
	text_decimal wExpressionNumber, 1, 2
	text "."
	prompt

_NotEnoughMemoryText::
	text "Es ist zuwenig"
	line "Speicher frei!"
	done

_OakSpeechText1::
	text "Hallo! Herzlich"
	line "willkommen in der"
	cont "Welt der #MON!"

	para "Mein Name ist"
	line "EICH! Man nennt"
	cont "mich den #MON-"
	cont "PROFESSOR!"
	prompt

_NormalModeText::
	text "Bist Du sicher?"

	para "Klassische"
	line "#MON-Regeln."
	done

_HardModeText::
	text "Bist Du sicher?"

	para "Kampfstil FOLGEND,"
	line "keine Items im"
	cont "Kampf, Levellimit"
	cont "in den ARENEN."
	done

_OakSpeechText2A::
	text "Diese Welt wird"
	line "von Wesen"
	cont "bewohnt, die man"
	cont "#MON nennt!@"
	text_end

_OakSpeechText2B::
	text_start

	para "Für manche Leute"
	line "sind #MON"
	cont "Haustiere, andere"
	cont "tragen Kämpfe mit"
	cont "ihnen aus."

	para "Ich selbst..."

	para "...habe mein"
	line "Hobby zum Beruf"
	cont "gemacht und"
	cont "studiere #MON."
	prompt

_IntroducePlayerText::
	text "Wie lautet Dein"
	line "Name?"
	prompt

_IntroduceRivalText::
	text "Dies ist mein"
	line "Enkel."
	cont "Von jeher wollt"
	cont "Ihr einander"
	cont "übertrumpfen!"

	para "Hmm, wie war noch"
	line "gleich sein Name?"
	prompt

_OakSpeechText3::
	text "<PLAYER>!"

	para "Eine unglaubliche"
	line "Reise in die Welt"
	cont "der #MON"
	cont "erwartet Dich!"

	para "Eine Welt voller"
	line "Wunder, Abenteuer"
	cont "und Geheimnisse!"
	cont "Kurz gesagt, ein"
	cont "Traum wird wahr!"
	done

_DoYouWantToNicknameText::
	text "Möchtest Du"
	line "@"
	text_ram wcd6d
	text " einen"
	cont "Spitznamen geben?"
	done

_YourNameIsText::
	text "Richtig! Dein"
	line "Name ist <PLAYER>!"
	prompt

_HisNameIsText::
	text "<RIVAL>! Stimmt!"
	line "Es lag mir auf"
	cont "der Zunge!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " soll"
	line "gegen @"
	text_ram wcd6d
	text_start
	cont "getauscht werden."
	done

_Colosseum3MonsText::
	text "Du benötigst drei"
	line "#MON, um zu"
	cont "kämpfen!"
	prompt

_ColosseumMewText::
	text "MEW darf leider"
	line "nicht teilnehmen!"
	prompt

_ColosseumDifferentMonsText::
	text "Du mußt"
	line "unterschiedliche"
	cont "#MON"
	cont "einsetzen!!!"
	prompt

_ColosseumMaxL55Text::
	text "Kein #MON"
	line "darf Level 55"
	cont "überschreiten!"
	prompt

_ColosseumMinL50Text::
	text "Deine #MON"
	line "müssen mindestens"
	cont "Level 50 sein!"
	prompt

_ColosseumTotalL155Text::
	text "Die Summe Deiner"
	line "#MON-Level"
	cont "übersteigt 155!"
	prompt

_ColosseumMaxL30Text::
	text "Kein #MON"
	line "darf Level 30"
	cont "überschreiten!"
	prompt

_ColosseumMinL25Text::
	text "Deine #MON"
	line "müssen mindestens"
	cont "auf Level 25"
	cont "sein!"
	prompt

_ColosseumTotalL80Text::
	text "Die Summe Deiner"
	line "#MON-Level"
	cont "übersteigt 80!"
	prompt

_ColosseumMaxL20Text::
	text "Kein #MON"
	line "darf Level 20"
	cont "überschreiten!"
	prompt

_ColosseumMinL15Text::
	text "Deine #MON"
	line "müssen mindestens"
	cont "Level 15 sein!"
	prompt

_ColosseumTotalL50Text::
	text "Die Summe Deiner"
	line "#MON-Level"
	cont "übersteigt 50!"
	prompt

_ColosseumHeightText::
	text_ram wcd6d
	text " ist"
	line "größer als 2m!"
	prompt

_ColosseumWeightText::
	text_ram wcd6d
	text " wiegt"
	line "mehr als 20kg!"
	prompt

_ColosseumEvolvedText::
	text_ram wcd6d
	text " hat"
	line "sich bereits"
	cont "entwickelt!"
	prompt

_ColosseumIneligibleText::
	text "Dein Gegner wird"
	line "nicht zugelassen!"
	prompt

_ColosseumWhereToText::
	text "Wohin möchtest"
	line "Du gehen?"
	done

_ColosseumPleaseWaitText::
	text "OK! Bitte warte"
	line "einen Augenblick."
	done

_ColosseumCanceledText::
	text "Die Verbindung"
	line "wurde getrennt."
	done

_ColosseumVersionText::
	text "Diese Spiele sind"
	line "nicht kompatibel!"
	prompt

_TextIDErrorText::
	text_decimal hSpriteIndexOrTextID, 1, 2
	text " FEHLER"
	done

_ContCharText::
	text "<_CONT>@"
	text_end

_NoPokemonText::
	text "Hier gibt es"
	line "keine #MON!"
	prompt
