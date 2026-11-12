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
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved."

	para "Is that okay?"
	done

_ChooseABoxText::
	text "Choose a"
	line "<PKMN> BOX.@"
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
	text "Would you like to"
	next "sort items?"
	done

_SortComplete::
	text "Sorting is"
	next "complete."
	prompt

_NothingToSort::
	text "There is nothing"
	next "to sort."
	prompt