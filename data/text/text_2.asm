_AIBattleWithdrawText::
	text_ram wTrainerName
	text " ruft"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "zurück!"
	prompt

_AIBattleUseItemText::
	text_ram wTrainerName
	text_start
	line "gibt @"
	text_ram wcd6d
	text_start
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

_BoxFullDebugText::
	text "Die BOX ist voll!"
	done

_BoxWillBeClearedText::
	text "Die BOX wird"
	line "geleert."
	done

_TradeWentToText::
	text_ram wStringBuffer
	text " geht"
	line "zu @"
	text_ram wLinkEnemyTrainerName
	text "."
	done

_TradeForText::
	text "<PLAYER> tauscht"
	line "@"
	text_ram wStringBuffer
	text_start
	done

_TradeSendsText::
	text "gegen @"
	text_ram wLinkEnemyTrainerName
	text "s"
	line "@"
	text_ram wcd6d
	text "."
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text " winkt"
	line "zum Abschied, als"
	done

_TradeTransferredText::
	text "sein @"
	text_ram wcd6d
	text_start
	line "übertragen wird."
	done

_TradeTakeCareText::
	text "Kümmere Dich gut"
	line "um @"
	text_ram wcd6d
	text "."
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text " möchte"
	line "@"
	text_ram wcd6d
	text " gegen"
	done

_TradeforText::
	text "<PLAYER>s"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "tauschen."
	done

_PlaySlotMachineText::
	text "Ein einarmiger"
	line "Bandit! Möchtest"
	cont "Du spielen?"
	done

_OutOfCoinsSlotMachineText::
	text "Mist!"
	line "Ich habe keine"
	cont "Münzen mehr!"
	done

_BetHowManySlotMachineText::
	text "Wie viele Münzen"
	line "möchtest Du"
	cont "setzen?"
	done

_StartSlotMachineText::
	text "Auf geht's! "
	done

_NotEnoughCoinsSlotMachineText::
	text "Du hast nicht"
	line "genug Münzen!"
	prompt

_OneMoreGoSlotMachineText::
	text "Noch eine"
	line "Runde?"
	done

_LinedUpText::
	text "Super! Du hast"
	line "@"
	text_ram wStringBuffer
	text " Münzen"
	cont "gewonnen!"
	done

_NotThisTimeText::
	text "Vielleicht beim"
	line "nächsten Mal!"
	prompt

_YeahText::
	text "Ja!!!@"
	text_end

_DexSeenOwnedText::
	text "Gesehen: @"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text " PKMN"
	line "Besitz:   @"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text " PKMN@"
	text_end

_DexRatingText::
	text_start
	done

_GymStatueText1::
	text_ram wGymCityName
	text_start
	line "PKMN-ARENA"
	cont "LEITUNG:"
	cont "@"
	text_ram wGymLeaderName
	text " "

	para "BISHERIGE SIEGER:"
	line "<RIVAL>"
	done

_GymStatueText2::
	text_ram wGymCityName
	text_start
	line "PKMN-ARENA"
	cont "LEITUNG:"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "BISHERIGE SIEGER:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "Im PKMN-CENTER"
	line "kannst Du müde,"
	cont "verletzte und"
	cont "besiegte #MON"
	cont "heilen!"
	done

_PewterCityPokecenterGuyText::
	text "Gähn!"

	para "Von PUMMELUFFS"
	line "GESANG werden"
	cont "#MON ganz"
	cont "müde..."

	para "Ich auch..."
	line "Schnarch..."
	done

_CeruleanPokecenterGuyText::
	text "BILL besitzt"
	line "viele #MON!"

	para "Er hat einige"
	line "sehr seltene in"
	cont "seiner Sammlung!"
	done

_LavenderPokecenterGuyText::
	text "TRAGOSSO trägt"
	line "auf dem Kopf eine"
	cont "Schädelmaske!"

	para "Man zahlt dafür"
	line "eine Menge Geld!"
	done

_MtMoonPokecenterBenchGuyText::
	text "Wenn Du keine"
	line "weiteren #MON"
	cont "tragen kannst,"
	cont "solltest Du"
	cont "einige via PC"
	cont "ablegen!"
	done

_RockTunnelPokecenterGuyText::
	text "Ich habe gehört,"
	line "dass in LAVANDIA"
	cont "böse GEISTER"
	cont "spuken!"
	done

_UnusedBenchGuyText1::
	text "Ich wünschte, ich"
	line "könnte #MON"
	cont "fangen..."
	done

_UnusedBenchGuyText2::
	text "Nach all dem Spaß"
	line "bin ich nun müde."
	done

_UnusedBenchGuyText3::
	text "Der Leiter der"
	line "SILPH CO."
	cont "versteckt sich in"
	cont "der SAFARI-ZONE."
	done

_VermilionPokecenterGuyText::
	text "Es stimmt, dass"
	line "ein #MON mit"
	cont "einem hohen Level"
	cont "sehr stark ist..."

	para "Allerdings haben"
	line "alle #MON"
	cont "Schwächen. Die"
	cont "richtige Attacke"
	cont "kann sie leicht"
	cont "besiegen!"

	para "Daher gibt es"
	line "kein Universal-"
	cont "#MON."
	done

_CeladonCityPokecenterGuyText::
	text "Wenn ich ein"
	line "FAHRRAD hätte,"
	cont "würde ich den"
	cont "RADWEG benutzen!"
	done

_FuchsiaCityPokecenterGuyText::
	text "Du studierst die"
	line "#MON?"
	cont "Dann gehe in die"
	cont "SAFARI-ZONE."

	para "Dort gibt es"
	line "viele seltene"
	cont "#MON."
	done

_CinnabarPokecenterGuyText::
	text "Brichst Du ihre"
	line "Entwicklung ab,"
	cont "dann können Deine"
	cont "#MON weitere"
	cont "Attacken lernen."

	para "Sie können sich"
	line "auch später noch"
	cont "weiterentwickeln."
	done

_SaffronCityPokecenterGuyText1::
	text "Ich wünschte, die"
	line "TOP VIER kämen"
	cont "und stampften"
	cont "TEAM ROCKET"
	cont "in den Boden!"
	done

_SaffronCityPokecenterGuyText2::
	text "TEAM ROCKET"
	line "ist geflohen! Wir"
	cont "können wieder aus"
	cont "dem Haus gehen!"
	done

_CeladonCityHotelText::
	text "Dieser Urlaub war"
	line "eine Idee meiner"
	cont "Schwester!"
	done

_BookcaseText::
	text "Wow! Unmengen"
	line "von Büchern über"
	cont "#MON!"
	done

_NewBicycleText::
	text "Ein brandneues"
	line "FAHRRAD!"
	done

_PushStartText::
	text "Drücke START,"
	line "um das MENÜ"
	cont "aufzurufen!"
	done

_SaveOptionText::
	text "Im MENÜ kannst Du"
	line "unter SICHERN"
	cont "Deinen Spielstand"
	cont "abspeichern."
	done

_StrengthsAndWeaknessesText::
	text "#MON besitzen"
	line "unterschiedliche"
	cont "Attacken, deren"
	cont "Wirkung je nach"
	cont "Gegner variiert."
	done

_TimesUpText::
	text "DURCHSAGE: Gong!"

	para "Die Zeit ist um!"
	prompt

_GameOverText::
	text "DURCHSAGE: Deine"
	line "SAFARI-TOUR ist"
	cont "vorüber!"
	done

_CinnabarGymQuizDummyIntroText::
	text "Willkommen beim"
	line "#MON-Quiz!"

	para "Weißt Du die"
	line "richtige Antwort,"
	cont "dann öffnet sich"
	cont "die Tür!"

	para "Ist die Antwort"
	line "falsch, dann"
	cont "musst Du"
	cont "kämpfen..."

	para "Je mehr Antworten"
	line "Du weißt, desto"
	cont "fitter sind Deine"
	cont "#MON beim"
	cont "Kampf gegen den"
	cont "ARENALEITER!"
	prompt

_CinnabarGymQuizIntroText::
	text "Willkommen beim"
	line "#MON-Quiz!"

	para "Weißt Du die"
	line "richtige Antwort,"
	cont "dann öffnet sich"
	cont "die Tür!"

	para "Ist die Antwort"
	line "falsch, dann"
	cont "musst Du"
	cont "kämpfen..."

	para "Je mehr Antworten"
	line "Du weißt, desto"
	cont "fitter sind Deine"
	cont "#MON beim"
	cont "Kampf gegen den"
	cont "ARENALEITER!"

	para ""
	done

_CinnabarGymQuizShortIntroText::
	text "#MON-Quiz!"
	line "Prüfe Dein"
	cont "Wissen!"

	para ""
	done

_CinnabarQuizQuestionsText1::
	text "Entwickelt sich"
	line "RAUPY zu SMETTBO?"
	done

_CinnabarQuizQuestionsText2::
	text "Gibt es neun"
	line "offizielle"
	cont "#MON-ORDEN?"
	done

_CinnabarQuizQuestionsText3::
	text "Entwickelt sich"
	line "QUAPSEL dreimal?"
	done

_CinnabarQuizQuestionsText4::
	text "Sind DONNER-"
	line "ATTACKEN gegen"
	cont "BODEN-#MON"
	cont "sehr effektiv?"
	done

_CinnabarQuizQuestionsText5::
	text "Unterscheiden"
	line "sich zwei gleiche"
	cont "#MON mit"
	cont "gleichem Level?"
	done

_CinnabarQuizQuestionsText6::
	text "Ist TM28 die "
	line "FROSCH-ATTACKE?"
	done

_CinnabarGymQuizCorrectText::
	text "Und die Antwort"
	line "ist... RICHTIG!"

	para "Geh weiter!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "FALSCH!"
	line "So ein Pech!"
	prompt

_MagazinesText::
	text "#MON-"
	line "Zeitschriften!"

	para "#MON-"
	line "Notizbücher!"

	para "#MON-"
	line "Schaubilder!"
	done

_BillsHouseMonitorText::
	text "Auf dem PC läuft"
	line "ein Programm zur"
	cont "Steuerung des"
	cont "TELEPORTERS."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> hat den"
	line "ZELL-SEPARATOR"
	cont "in Gang gesetzt!@"
	text_end

_BillsHousePokemonListText1::
	text "Eine Liste von"
	line "BILLs LIEBLINGS-"
	cont "#MON!"
	prompt

_BillsHousePokemonListText2::
	text "Welches #MON"
	line "möchtest Du"
	cont "betrachten?"
	done

_OakLabEmailText::
	text "Im Briefkasten"
	line "ist eine E-Mail!"

	para "..."

	para "An alle"
	line "#MON-TRAINER!"

	para "Die TRAINER-ELITE"
	line "der PKMN-LIGA"
	cont "wartet auf mutige"
	cont "Herausforderer!"

	para "Bringt Eure"
	line "stärksten #MON"
	cont "mit und zeigt,"
	cont "wie gut Ihr seid!"

	para "PKMN-LIGA-LEITUNG"
	line "INDIGO-PLATEAU"

	para "PS.: PROF. EICH,"
	line "bitte melden Sie"
	cont "sich bei uns!"
	cont "..."
	done

_GameCornerCoinCaseText::
	text "Du benötigst"
	line "einen MÜNZKORB!"
	done

_GameCornerNoCoinsText::
	text "Du hast keine"
	line "Münzen!"
	done

_GameCornerOutOfOrderText::
	text "AUSSER BETRIEB!"
	done

_GameCornerOutToLunchText::
	text "BIN ZU TISCH!"
	line "Oh, dieser Platz"
	cont "ist besetzt."
	done

_GameCornerSomeonesKeysText::
	text "Da liegt ein"
	line "Schlüsselbund."

	para "Der Platz scheint"
	line "besetzt zu sein."
	done

_JustAMomentText::
	text "Warte einen"
	line "Augenblick."
	done

TMNotebookText::
	text "Ein INFOBLATT"
	line "über TM."

	para "..."

	para "Es gibt"
	line "insgesamt 50 TM."

	para "Außerdem gibt es"
	line "fünf VM, die"
	cont "mehrfach nutzbar"
	cont "sind."

	para "SILPH CO.@"
	text_end

_TurnPageText::
	text "Umblättern?"
	done

_ViridianSchoolNotebookText5::
	text "MÄDCHEN: Hey! Lass"
	line "die Finger von"
	cont "meinen Notizen!@"
	text_end

_ViridianSchoolNotebookText1::
	text "Du schaust in"
	line "das Notizbuch!"

	para "Erste Seite..."

	para "Zum Fangen von"
	line "#MON benutzt"
	cont "man #BÄLLE."

	para "Man kann bis zu"
	line "sechs #MON auf"
	cont "einmal tragen."

	para "#MON-TRAINER"
	line "ziehen #MON"
	cont "groß und"
	cont "trainieren sie."
	prompt

_ViridianSchoolNotebookText2::
	text "Zweite Seite..."

	para "Ein #MON bei"
	line "voller Stärke ist"
	cont "schwer zu fangen!"
	cont "Man sollte es"
	cont "erst schwächen."

	para "Feuer, Gift und"
	line "andere Attacken"
	cont "wirken Wunder!"
	prompt

_ViridianSchoolNotebookText3::
	text "Dritte Seite..."

	para "#MON-TRAINER"
	line "suchen einander"
	cont "und lassen ihre"
	cont "#MON kämpfen."

	para "In den"
	line "PKMN-ARENEN"
	cont "finden stets"
	cont "Kämpfe statt."
	prompt

_ViridianSchoolNotebookText4::
	text "Vierte Seite..."

	para "Das Ziel jedes"
	line "#MON-TRAINERS"
	cont "ist es, die acht"
	cont "Leiter der"
	cont "PKMN-ARENEN"
	cont "zu besiegen."

	para "Nur dann darf er"
	line "den TOP VIER in"
	cont "der PKMN-LIGA"
	cont "gegenübertreten!"
	prompt

_EnemiesOnEverySideText::
	text "Wandle Dich"
	line "abhängig vom"
	cont "Gegner!"
	done

_WhatGoesAroundComesAroundText::
	text "Wie die Saat,"
	line "so die Ernte!"
	done

_FightingDojoText::
	text "KAMPFARENA"
	done

_IndigoPlateauHQText::
	text "INDIGO PLATEAU"
	line "#MON-LIGA"
	cont "HAUPTQUARTIER"
	done

_RedBedroomSNESText::
	text "<PLAYER> spielt"
	line "SUPER NINTENDO!"
	cont "...OK! Die Reise"
	cont "kann beginnen!"
	done

_Route15UpstairsBinocularsText::
	text "Du schaust durch"
	line "das Fernrohr..."

	para "Ein großer Vogel"
	line "fliegt anmutig"
	cont "aufs Meer hinaus."
	done

_AerodactylFossilText::
	text "AERODACTYL-Fossil"
	line "Ein urzeitliches"
	cont "und seltenes"
	cont "#MON."
	done

_KabutopsFossilText::
	text "KABUTOPS-Fossil"
	line "Ein urzeitliches"
	cont "und seltenes"
	cont "#MON."
	done

_FanClubPicture1Text::
	text "Mein geliebtes"
	line "GALLOPA..."
	done

_FanClubPicture2Text::
	text "Mein geliebtes"
	line "IBITAK..."
	done

_LinkCableHelpText1::
	text "TIPPS FÜR TRAINER"

	para "Die Benutzung des"
	line "Link-Kabels"
	prompt

_LinkCableHelpText2::
	text "Wähle bitte ein"
	line "Themengebiet aus."
	done

_LinkCableInfoText1::
	text "Spricht man die"
	line "Bedienung hinter"
	cont "der rechten Theke"
	cont "im PKMN-CENTER"
	cont "an, während zwei"
	cont "GAME BOYS per"
	cont "Game Link Dialog-"
	cont "Kabel verbunden"
	cont "sind, so gelangt"
	cont "man in den KABEL-"
	cont "CLUB."
	prompt

_LinkCableInfoText2::
	text "Im KOLOSSEUM"
	line "kannst Du gegen"
	cont "einen Freund"
	cont "antreten."
	prompt

_LinkCableInfoText3::
	text "Im HANDELSCENTER"
	line "können #MON"
	cont "getauscht werden."
	prompt

_ViridianSchoolBlackboardText1::
	text "Die Tafel zeigt"
	line "Statuswechsel der"
	cont "#MON während"
	cont "des Kampfes an."
	prompt

_ViridianSchoolBlackboardText2::
	text "Wähle bitte ein"
	line "Themengebiet aus."
	done

_ViridianBlackboardSleepText::
	text "Wenn ein #MON"
	line "schläft, kann es"
	cont "nicht angreifen!"

	para "Ein schlafendes"
	line "#MON wacht"
	cont "auch nach dem"
	cont "Kampf nicht auf."

	para "Benutze"
	line "AUFWECKER, damit"
	cont "es aufwacht."
	prompt

_ViridianBlackboardPoisonText::
	text "Ein vergiftetes"
	line "#MON verliert"
	cont "stetig KP."

	para "Die Wirkung des"
	line "Giftes hält auch"
	cont "nach einem Kampf"
	cont "an."

	para "GEGENGIFT heilt"
	line "Vergiftungen."
	prompt

_ViridianBlackboardPrlzText::
	text "Ein paralysiertes"
	line "#MON"
	cont "verliert an"
	cont "Treffgenauigkeit!"

	para "Die Paralyse hält"
	line "auch nach einem"
	cont "Kampf an."

	para "Man behandelt sie"
	line "mit PARA-HEILER."
	prompt

_ViridianBlackboardBurnText::
	text "Eine Verbrennung"
	line "vermindert Kraft"
	cont "und Stärke. Die"
	cont "KP sinken stetig."

	para "Verbrennungen"
	line "dauern auch nach"
	cont "einem Kampf an."

	para "Man heilt sie mit"
	line "dem FEUERHEILER."
	prompt

_ViridianBlackboardFrozenText::
	text "Ein eingefrorenes"
	line "#MON ist"
	cont "bewegungsunfähig."

	para "Es behält auch"
	line "nach dem Kampf"
	cont "diesen Zustand"
	cont "bei."

	para "Nur der EISHEILER"
	line "kann es wieder"
	cont "auftauen!"
	prompt

_VermilionGymTrashText::
	text "Hier ist nichts,"
	line "bloß Abfall."
	done

_VermilionGymTrashSuccessText1::
	text "Hey! Hier ist ein"
	line "Hebel versteckt!"
	cont "Ich werde ihn"
	cont "betätigen!"

	para "Das erste Schloss"
	line "wurde entriegelt!@"
	text_end

_VermilionGymTrashSuccessText2::
	text "Hier ist noch ein"
	line "Hebel unter dem"
	cont "Abfall versteckt!"
	cont "Ich betätige ihn!"
	prompt

_VermilionGymTrashSuccessText3::
	text "Das zweite Schloss"
	line "wurde entriegelt!"

	para "Die mechanische"
	line "Tür hat sich"
	cont "geöffnet!@"
	text_end

_VermilionGymTrashFailText::
	text "Nichts! Hier ist"
	line "nur Abfall...@"
	text_end

_FoundHiddenItemText::
	text "<PLAYER> findet"
	line "@"
	text_ram wcd6d
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "Aber <PLAYER> kann"
	line "keine weiteren"
	cont "Items tragen!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> findet"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " Münzen!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> findet"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " Münzen!@"
	text_end

_DroppedHiddenCoinsText::
	text_start

	para "Ups! Ich glaube,"
	line "ich habe ein paar"
	cont "Münzen verloren!"
	done

_IndigoPlateauStatuesText1::
	text "INDIGO PLATEAU"
	prompt

_IndigoPlateauStatuesText2::
	text "Das große Ziel"
	line "aller Trainer:"
	cont "Die PKMN-LIGA!"
	done

_IndigoPlateauStatuesText3::
	text "Das PKMN-LIGA-"
	line "HAUPTQUARTIER"
	cont "ist die höchste"
	cont "PKMN-AUTORITÄT!"
	done

_PokemonBooksText::
	text "Wow! Unmengen"
	line "Bücher über"
	cont "#MON!"
	done

_DiglettSculptureText::
	text "Eine Plastik, die"
	line "DIGDA darstellt."
	done

_ElevatorText::
	text "Dies ist ein"
	line "Aufzug."
	done

_TownMapText::
	text "Eine KARTE!@"
	text_end

_PokemonStuffText::
	text "Wow! Jede Menge"
	line "#MON-"
	cont "Gegenstände!"
	done

_OutOfSafariBallsText::
	text "DURCHSAGE: Gong!"

	para "Du hast keine"
	line "SAFARIBÄLLE mehr!"
	prompt

_WildRanText::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text " ist"
	cont "geflüchtet!"
	prompt

_EnemyRanText::
	text_ram wEnemyMonNick
	text_start
	line "ist geflüchtet!"
	prompt

_HurtByPoisonText::
	text "Das Gift schadet"
	line "<USER>!"
	prompt

_HurtByBurnText::
	text "Die Verbrennung"
	line "schadet"
	cont "<USER>!"
	prompt

_HurtByLeechSeedText::
	text "Die SCHMAROTZER-"
	line "ATTACKE schadet"
	cont "<USER>!"
	prompt

_EnemyMonFaintedText::
	text_ram wEnemyMonNick
	text_start
	line "wurde besiegt!"
	prompt

_MoneyForWinningText::
	text "<PLAYER>"
	line "gewinnt ¥@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_TrainerDefeatedText::
	text "<PLAYER> besiegt"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	text_ram wBattleMonNick
	text_start
	line "wurde besiegt!"
	prompt

_UseNextMonText::
	text "Nächstes #MON"
	line "einsetzen?"
	done

_Rival1WinText::
	text "<RIVAL>: Ja! Ich"
	line "bin der Beste!"
	prompt

_PlayerBlackedOutText2::
	text "Alle #MON von"
	line "<PLAYER> wurden"
	cont "besiegt!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	prompt

_LinkBattleLostText::
	text_ram wTrainerName
	text " hat"
	line "<PLAYER> besiegt!"
	prompt

_TrainerAboutToUseText::
	text_ram wTrainerName
	text " wird"
	line "@"
	text_ram wEnemyMonNick
	text " in den"
	cont "Kampf schicken!"

	para "Möchtest Du das"
	line "#MON wechseln?"
	done

_TrainerSentOutText::
	text_ram wTrainerName
	text " setzt"
	line "@"
	text_ram wEnemyMonNick
	text " ein!"
	done

_NoWillText::
	text "Das #MON"
	line "wurde besiegt!"
	prompt

_CantEscapeText::
	text "Du kannst nicht"
	line "davonlaufen!"
	prompt

_NoRunningText::
	text "Man kann aus"
	line "TRAINER-KÄMPFEN"
	cont "nicht fliehen!"
	prompt

_GotAwayText::
	text "Du bist"
	line "entkommen!"
	prompt

_RunAwayText::
	text "Schnell weg!"
	prompt

_ItemsCantBeUsedHereText::
	text "Du kannst hier"
	line "keine Items "
	cont "einsetzen."
	prompt

_AlreadyOutText::
	text_ram wBattleMonNick
	text_start
	line "kämpft bereits!"
	prompt

_MoveNoPPText::
	text "Du hast keine AP"
	line "für diese Attacke"
	cont "mehr übrig!"
	prompt

_MoveDisabledText::
	text "Diese Attacke"
	line "ist blockiert!"
	prompt

_NoMovesLeftText::
	text_ram wBattleMonNick
	text " hat"
	line "keine Attacken"
	cont "mehr übrig!"
	done

_MultiHitText::
	text "Der Gegner wurde"
	line "@"
	text_decimal wPlayerNumHits, 1, 1
	text "mal getroffen!"
	prompt

_ScaredText::
	text_ram wBattleMonNick
	text " kann"
	line "sich vor Angst"
	cont "nicht bewegen!"
	prompt

_GetOutText::
	text "GEIST: Hau ab..."
	line "Verschwinde..."
	prompt

_FastAsleepText::
	text "<USER>"
	line "schläft fest!"
	prompt

_WokeUpText::
	text "<USER>"
	line "ist aufgewacht!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "ist festgefroren!"
	prompt

_FullyParalyzedText::
	text "<USER>"
	line "ist paralysiert!"
	prompt

_FlinchedText::
	text "<USER>"
	line "ist ausgewichen!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "muss sich wieder "
	cont "aufladen!"
	prompt

_DisabledNoMoreText::
	text "<USER>"
	line "wird nicht mehr"
	cont "blockiert!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "ist verwirrt!"
	prompt

_HurtItselfText::
	text "Es hat sich vor"
	line "Verwirrung selbst"
	cont "verletzt!"
	prompt

_ConfusedNoMoreText::
	text "<USER>"
	line "ist nicht mehr"
	cont "verwirrt!"
	prompt

_SavingEnergyText::
	text "<USER>"
	line "sammelt Kräfte!"
	prompt

_UnleashedEnergyText::
	text "<USER>"
	line "greift an!"
	prompt

_ThrashingAboutText::
	text "<USER>"
	line "schlägt um sich!"
	done

_AttackContinuesText::
	text "<USER>"
	line "greift weiter an!"
	done

_CantMoveText::
	text "<USER>"
	line "ist gelähmt!"
	prompt

_MoveIsDisabledText::
	text "<USER>s"
	line "@"
	text_ram wcd6d
	text " ist"
	cont "blockiert!"
	prompt

_MonName1Text::
	text "<USER>@"
	text_end

_UsedText::
	text_start
	line "ben. @"
	text_end

_InsteadText::
	text "stattdessen"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer
	text "@"

_ExclamationPointText::
	text "!"
	done

_AttackMissedText::
	text "<USER>s"
	line "Attacke ging"
	cont "daneben!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "verfehlt das Ziel"
	cont "und fällt hin!"
	prompt

_UnaffectedText::
	text "<TARGET>"
	line "ist unversehrt!"
	prompt

_DoesntAffectMonText::
	text "Keine Wirkung auf"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Volltreffer!"
	prompt

_OHKOText::
	text "K.O.-TREFFER!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text_start
	line "faulenzt!"
	prompt

_BeganToNapText::
	text_ram wBattleMonNick
	text " hält"
	line "ein Nickerchen!"
	prompt

_WontObeyText::
	text_ram wBattleMonNick
	text " will"
	line "nicht gehorchen!"
	prompt

_TurnedAwayText::
	text_ram wBattleMonNick
	text_start
	line "wendet sich ab!"
	prompt

_IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "missachtet die"
	cont "Befehle!"
	prompt

_SubstituteTookDamageText::
	text "Der DELEGATOR hat"
	line "<TARGET>"
	cont "vor Schaden"
	cont "bewahrt!"
	prompt

_SubstituteBrokeText::
	text "<TARGET>s"
	line "DELEGATOR wurde"
	cont "zerstört!"
	prompt

_BuildingRageText::
	text "<USER>"
	line "verfällt in"
	cont "RASEREI!"
	prompt

_MirrorMoveFailedText::
	text "Der SPIEGELTRICK"
	next "war erfolglos!"
	prompt

_HitXTimesText::
	text_decimal wEnemyNumHits, 1, 1
	text "mal getroffen!"
	prompt

_GainedText::
	text_ram wcd6d
	text " erhält"
	line "@"
	text_end

_WithExpAllText::
	text "Das Team erhält"
	line "@"
	text_end

_BoostedText::
	text "spezielle"
	cont "@"
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " EP!"
	prompt

_GrewLevelText::
	text_ram wcd6d
	text_start
	line "erreicht"
	cont "Level @"
	text_decimal wCurEnemyLVL, 1, 3
	text "!@"
	text_end

_SuperEffectiveText::
	text "Die Attacke ist"
	line "sehr effektiv!"
	prompt

_NotVeryEffectiveText::
	text "Die Attacke ist"
	line "nicht effektiv..."
	prompt

_SafariZoneEatingText::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text " frisst!"
	prompt

_SafariZoneAngryText::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text " ist"
	cont "wütend!"
	prompt

_WildMonAppearedText::
	text "Ein wildes"
	line "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

_HookedMonAttackedText::
	text "Das gefangene"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "greift an!"
	prompt

_DifficultyText::
    text "Wähle einen"
    line "Schwierigkeitsgrad"
    done

_AreYouSureText::
	text "Bist Du sicher?"
	done

_BoyGirlText::
    text "Als Junge oder als"
    line "Mädchen spielen?"
    done
