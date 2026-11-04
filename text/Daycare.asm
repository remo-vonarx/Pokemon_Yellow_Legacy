_DaycareGentlemanIntroText::
	text "Ich leite diese"
	line "PENSION. Soll"
	cont "ich eines Deiner"
	cont "#MON"
	cont "großziehen?"
	done

_DaycareGentlemanWhichMonText::
	text "Welches #MON"
	line "soll hierbleiben?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "OK, ich kümmere"
	line "mich eine Weile"
	cont "um @"
	text_ram wcd6d
	text "."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Komm später"
	line "wieder vorbei, um"
	cont "es abzuholen."
	done

_DaycareGentlemanMonHasGrownText::
	text_ram wcd6d
	text_start
	line "hat sich toll"
	cont "entwickelt!"

	para "Es ist um @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text_start
	line "Level gestiegen!"

	para "Das habe ich gut"
	line "gemacht, oder?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "Bevor Du Dein"
	line "#MON wieder"
	cont "mitnimmst, "
	cont "bekomme ich noch"
	cont "¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " von Dir!"
	done

_DaycareGentlemanGotMonBackText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wDayCareMonName
	text_start
	cont "zurück!"
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "Du bist schon"
	line "wieder zurück?"
	cont "@"
	text_ram wcd6d
	text " sollte"
	cont "noch ein bißchen"
	cont "bei mir bleiben."
	prompt

_DaycareGentlemanAllRightThenText::
	text "Also,"
	line "@"
	text_end

_DaycareGentlemanComeAgainText::
	text "dann bis später."
	done

_DaycareGentlemanNoRoomForMonText::
	text "Du kannst kein"
	line "weiteres #MON"
	cont "mehr tragen!"
	done

_DaycareGentlemanOnlyHaveOneMonText::
	text "Du hast nur ein"
	line "#MON dabei!"
	done

_DaycareGentlemanCantAcceptMonWithHMText::
	text "Ein #MON, das"
	line "eine VM-Technik"
	cont "beherrscht, kann"
	cont "nicht bei mir"
	cont "bleiben!"
	done

_DaycareGentlemanHeresYourMonText::
	text "Vielen Dank! Hier"
	line "ist Dein #MON!"
	prompt

_DaycareGentlemanNotEnoughMoneyText::
	text "Oh, Du hast"
	line "nicht genug Geld!"
	done
