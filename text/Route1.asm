_Route1Youngster1MartSampleText::
	text "Hi! Ich arbeite"
	line "in einem"
	cont "PKMN-SUPERMARKT."

	para "Wir verkaufen"
	line "viele praktische"
	cont "Dinge! Du findest"
	cont "unseren Laden in"
	cont "VERTANIA CITY."

	para "Am besten gebe"
	line "ich Dir ein"
	cont "Werbegeschenk!"
	cont "Hier, bitte!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "Willst Du #MON"
	line "fangen? Wir haben"
	cont "auch #BÄLLE"
	cont "im Sortiment!"
	done

_Route1Youngster1NoRoomText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen!"
	done

_Route1Youngster2Text::
	text "Weißt Du, was"
	line "STATUS-Erfahrung"
	cont "ist?"

	para "Wenn ein #MON"
	line "kämpft, erhält"
	cont "es EP."

	para "Diese EP geben"
	line "ihm höhere"
	cont "Statuswerte, die"
	cont "gegnerische"
	cont "Trainer nicht"
	cont "haben."

	para "Ein #MON, das"
	line "von Level 5 bis"
	cont "Level 50"
	cont "trainiert wurde,"
	cont "kann die Werte"
	cont "eines Gegners auf"
	cont "Level 60 haben!"
	done

_Route1SignText::
	text "ROUTE 1"
	line "ALABASTIA -"
	cont "VERTANIA CITY"
	done

_OakBeforeBattleText::
	text "EICH: Ach herrje!"

	para "Wie es aussieht,"
	line "erwischst Du mich"
	cont "in meiner"
	cont "Mittagspause!"

	para "<PLAYER>, Du hast"
	line "Dich wirklich"
	cont "prächtig"
	cont "entwickelt!"

	para "Deine Heraus-"
	line "forderung der"
	cont "PKMN-LIGA hat in"
	cont "mir einen Geist"
	cont "wiedererweckt,"
	cont "der mich vor"
	cont "langer Zeit"
	cont "verlassen hat..."

	para "Wie wär's mit"
	line "einem kleinen"
	cont "Übungskampf?"
	cont "Was meinst Du?"
	done

_OakRealChallengeBattleText::
	text "Ausgezeichnet!"

	para "Mach Dich auf"
	line "eine echte"
	cont "Herausforderung"
	cont "gefasst!"
	done

_OakRefusedBattleText::
	text "Vielleicht ein"
	line "andermal!"
	done

_OakDefeatedText::
	text "Hmm..."

	para "Ich muss noch"
	line "viel lernen!"
	prompt

_OakWonText::
	text "Früher"
	line "war ich ein"
	cont "ernsthafter"
	cont "TRAINER!"
	prompt

_OakPostBattleText::
	text "Gut gemacht,"
	line "<PLAYER>!"

	para "Du hast Dein"
	line "Können wahrlich"
	cont "unter Beweis"
	cont "gestellt."

	para "Wie es scheint,"
	line "roste ich auf"
	cont "meine alten Tage"
	cont "etwas ein."

	para "Ein guter Trainer"
	line "strebt stets nach"
	cont "Verbesserung, und"
	cont "das werde ich"
	cont "auch tun."

	para "Möge Deine Reise"
	line "auch weiterhin"
	cont "voller Wachstum"
	cont "und Entdeckungen"
	cont "sein."
	done