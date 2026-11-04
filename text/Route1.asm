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
	text "Kennst Du die"
	line "STATUS-Erfahrung?"

	para "Kämpft ein"
	line "#MON, erhält es"
	cont "EP."

	para "Diese EP erhöhen"
	line "seine Statuswerte,"
	cont "was gegnerische"
	cont "Trainer nicht"
	cont "haben."

	para "Ein #MON, das"
	line "von Level 5 auf"
	cont "Level 50 trainiert"
	cont "wird, kann die"
	cont "Werte eines"
	cont "Gegners mit"
	cont "Level 60 haben!"
	done

_Route1SignText::
	text "ROUTE 1"
	line "ALABASTIA -"
	cont "VERTANIA CITY"
	done

_OakBeforeBattleText::
	text "EICH: Oh je! Du"
	line "erwischst mich in"
	cont "der Mittagspause!"

	para "<PLAYER>, Du hast"
	line "Dich wirklich"
	cont "entwickelt!"

	para "Deine Herausforde-"
	line "rung in der PKMN-"
	cont "LIGA hat einen"
	cont "Geist geweckt, der"
	cont "mich vor langer"
	cont "Zeit verlassen"
	cont "hatte..."

	para "Wie wäre es mit"
	line "einem kleinen"
	cont "Kampf? Was meinst"
	cont "Du?"
	done

_OakRealChallengeBattleText::
	text "Ausgezeichnet!"
	line "Mach Dich auf eine"
	cont "echte Herausfor-"
	cont "derung gefaßt!"
	done

_OakRefusedBattleText::
	text "Vielleicht ein"
	line "andermal!"
	done

_OakDefeatedText::
	text "Hmm..."
	line "Ich muß noch viel"
	cont "lernen!"
	prompt

_OakWonText::
	text "Früher"
	line "war ich ein ernst-"
	cont "hafter TRAINER!"
	prompt

_OakPostBattleText::
	text "Gut gemacht,"
	line "<PLAYER>! Du hast"
	cont "Dich bewiesen."

	para "Im Alter werde ich"
	line "wohl etwas rostig."

	para "Ein guter Trainer"
	line "strebt stets nach"
	cont "Verbesserung, und"
	cont "das tue ich auch."

	para "Möge Deine Reise"
	line "weiter voller"
	cont "Wachstum und"
	cont "Entdeckungen sein."
	done
