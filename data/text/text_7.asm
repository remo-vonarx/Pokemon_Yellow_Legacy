_PokemonText::
	text "#MON!"
	done

_PokemartGreetingText::
	text "Hi there!"
	next "May I help you?"
	done

_PokemonFaintedText::
	text_ram wcd6d
	text_start
	line "wurde besiegt!"
	done

_PlayerBlackedOutText::
	text "<PLAYER> hat keine"
	line "einsatzbereiten"
	cont "#MON mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	prompt

_RepelWoreOffText::
	text "Repel's effect"
	line "wore off."
	done

_RepelWoreOffUseAnotherText::
	text_ram wStringBuffer
	text "'s"
	line "effect wore off."

	para "Use another?"
	done

_PokemartBuyingGreetingText::
	text "Take your time."
	done

_PokemartTellBuyPriceText::
	text_ram wStringBuffer
	text "?"
	line "That will be"
	cont "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text ". OK?"
	done

_PokemartBoughtItemText::
	text "Here you are!"
	line "Thank you!"
	prompt

_PokemartNotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	prompt

_PokemartItemBagFullText::
	text "You can't carry"
	line "any more items."
	prompt

_PokemonSellingGreetingText::
	text "What would you"
	line "like to sell?"
	done

_PokemartTellSellPriceText::
	text "I can pay you"
	line "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " for that."
	done

_PokemartItemBagEmptyText::
	text "You don't have"
	line "anything to sell."
	prompt

_PokemartUnsellableItemText::
	text "I can't put a"
	line "price on that."
	prompt

_PokemartThankYouText::
	text "Thank you!"
	done

_PokemartAnythingElseText::
	text "Is there anything"
	line "else I can do?"
	done

_LearnedMove1Text::
	text_ram wLearnMoveMonName
	text " lernt"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_WhichMoveToForgetText::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

_AbandonLearningText::
	text_ram wStringBuffer
	text_start
	line "nicht erlernen?"
	done

_DidNotLearnText::
	text_ram wLearnMoveMonName
	text_start
	line "hat @"
	text_ram wStringBuffer
	text_start
	cont "nicht erlernt!"
	prompt

_TryingToLearnText::
	text_ram wLearnMoveMonName
	text_start
	line "versucht,"
	cont "@"
	text_ram wStringBuffer
	text " zu"
	cont "erlernen!"

	para "Aber @"
	text_ram wLearnMoveMonName
	text_start
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen!"

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	text_ram wStringBuffer
	text_start
	cont "vergessen werden?"
	done

_OneTwoAndText::
	text "1, 2, @"
	text_end

_PoofText::
	text "schwupp!@"
	text_end

_ForgotAndText::
	text_start

	para "@"
	text_ram wLearnMoveMonName
	text " hat"
	line "@"
	text_ram wcd6d
	text_start
	cont "vergessen!"

	para "Und..."
	prompt

_HMCantDeleteText::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

_PokemonCenterWelcomeText::
	text "Welcome to our"
	line "#MON CENTER!"

	para "We heal your"
	line "#MON back to"
	cont "perfect health!"
	prompt

_ShallWeHealYourPokemonText::
	text "Shall we heal your"
	line "#MON?"
	done

_NeedYourPokemonText::
	text "OK. We'll need"
	line "your #MON."
	done

_TemPokemonOuNao::
	text "You don't have"
	line "any #MON!"
	done

_PokemonFightingFitText::
	text "Thank you!"
	line "Your #MON are"
	cont "fighting fit!"
	prompt

; _PokemonFightingFitShortText::
; 	text "Your #MON are"
; 	line "fighting fit!"
; 	done

_PokemonCenterFarewellText::
	text "We hope to see"
	line "you again!"
	done

_LooksContentText::
	text "It looks very"
	line "content asleep."
	done

_CableClubNPCAreaReservedFor2FriendsLinkedByCableText::
	text "This area is"
	line "reserved for 2"
	cont "friends who are"
	cont "linked by cable."
	done

_CableClubNPCWelcomeText::
	text "Welcome to the"
	line "Cable Club!"
	done

_CableClubNPCPleaseApplyHereHaveToSaveText::
	text "Please apply here."

	para "Before opening"
	line "the link, we have"
	cont "to save the game."
	done
