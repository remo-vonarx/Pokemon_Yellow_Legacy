_FileDataDestroyedText::
	text "Die Speicherdaten"
	line "sind defekt!"
	prompt

; _WouldYouLikeToSaveText::
; 	text "Would you like to"
; 	line "SAVE the game?"
; 	done

; _SavingText::
; 	text "Saving..."
; 	done

_GameSavedText::
	text "<PLAYER> hat das"
	line "Spiel gesichert!"
	done

_OlderFileWillBeErasedText::
	text "Der bisherige"
	line "Spielstand wird"
	cont "überschrieben!"
	cont "OK?"
	done

_WhenYouChangeBoxText::
	text "Vor einem Wechsel"
	line "der #MON-BOX"
	cont "wird das Spiel"
	cont "gesichert!"

	para "Einverstanden?"
	done

_ChooseABoxText::
	text "Wähle eine"
	line "<PKMN>-BOX!@"
	text_end

_EvolvedText::
	text_ram wStringBuffer
	text " wurde"
	done

_IntoText::
	text_start
	line "zu @"
	text_ram wcd6d
	text "!"
	done

_StoppedEvolvingText::
	text "Hmm? @"
	text_ram wStringBuffer
	text "s"
	line "Entwicklung ist"
	cont "abgebrochen!"
	prompt

_SortItemsText::
	text "Möchtest Du Items"
	next "sortieren?"
	done

_SortComplete::
	text "Die Items wurden"
	line "sortiert."
	prompt

_NothingToSort::
	text "Es gibt nichts"
	line "zu sortieren."
	prompt
