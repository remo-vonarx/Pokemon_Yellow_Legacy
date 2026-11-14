_MoveDeleterGreetingText::
	text "Soll ein #MON"
	line "eine Attacke"
	cont "vergessen?"
	done

_MoveDeleterSaidYesText::
	text "Welches #MON"
	line "soll eine Attacke"
	cont "vergessen?"
	prompt

_MoveDeleterWhichMoveText::
	text "Welche Attacke"
	line "soll vergessen"
	cont "werden?"
	done

_MoveDeleterConfirmText::
	text "Soll @"
	text_ram wStringBuffer
	text_start
	line "vergessen werden?"
	prompt

_MoveDeleterForgotText::
	text "@"
	text_ram wStringBuffer
	text " wurde"
	line "vergessen!"
	prompt

_MoveDeleterByeText::
	text "Besuche mich"
	line "wieder!"
	done

_MoveDeleterOneMoveText::
	text "Dieses #MON"
	line "kennt nur eine"
	cont "Attacke."
	cont "Ein anderes?"
	done