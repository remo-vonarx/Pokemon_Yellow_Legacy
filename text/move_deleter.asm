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
	line "soll es vergessen?"
	done

_MoveDeleterConfirmText::
	text "Soll es"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "vergessen?"
	prompt

_MoveDeleterForgotText::
	text "@"
	text_ram wStringBuffer
	text " wurde"
	line "vergessen!"
	prompt

_MoveDeleterByeText::
	text "Komm wieder!"
	done

_MoveDeleterOneMoveText::
	text "Dieses #MON"
	line "kennt nur eine"
	cont "Attacke. Ein"
	cont "anderes wählen?"
	done
