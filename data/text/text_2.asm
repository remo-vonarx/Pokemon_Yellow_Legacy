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
	text "The BOX is full!"
	done

_BoxWillBeClearedText::
	text "The BOX will be"
	line "cleared."
	done

_TradeWentToText::
	text_ram wStringBuffer
	text " went"
	line "to @"
	text_ram wLinkEnemyTrainerName
	text "."
	done

_TradeForText::
	text "For <PLAYER>'s"
	line "@"
	text_ram wStringBuffer
	text ","
	done

_TradeSendsText::
	text_ram wLinkEnemyTrainerName
	text " sends"
	line "@"
	text_ram wcd6d
	text "."
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text " waves"
	line "farewell as"
	done

_TradeTransferredText::
	text_ram wcd6d
	text " is"
	line "transferred."
	done

_TradeTakeCareText::
	text "Take good care of"
	line "@"
	text_ram wcd6d
	text "."
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text " will"
	line "trade @"
	text_ram wcd6d
	text_start
	done

_TradeforText::
	text "for <PLAYER>'s"
	line "@"
	text_ram wStringBuffer
	text "."
	done

_PlaySlotMachineText::
	text "A slot machine!"
	line "Want to play?"
	done

_OutOfCoinsSlotMachineText::
	text "Darn!"
	line "Ran out of coins!"
	done

_BetHowManySlotMachineText::
	text "Bet how many"
	line "coins?"
	done

_StartSlotMachineText::
	text "Start!"
	done

_NotEnoughCoinsSlotMachineText::
	text "Not enough"
	line "coins!"
	prompt

_OneMoreGoSlotMachineText::
	text "One more "
	line "go?"
	done

_LinedUpText::
	text " lined up!"
	line "Scored @"
	text_ram wStringBuffer
	text " coins!"
	done

_NotThisTimeText::
	text "Not this time!"
	prompt

_YeahText::
	text "Yeah!@"
	text_end

_DexSeenOwnedText::
	text "#DEX   Seen:@"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text_start
	line "         Owned:@"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text_end

_DexRatingText::
	text "#DEX Rating<COLON>"
	done

_GymStatueText1::
	text_ram wGymCityName
	text_start
	line "#MON GYM"
	cont "LEADER: @"
	text_ram wGymLeaderName
	text_start

	para "WINNING TRAINERS:"
	line "<RIVAL>"
	done

_GymStatueText2::
	text_ram wGymCityName
	text_start
	line "#MON GYM"
	cont "LEADER: @"
	text_ram wGymLeaderName
	text_start

	para "WINNING TRAINERS:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "#MON CENTERs"
	line "heal your tired,"
	cont "hurt or fainted"
	cont "#MON!"
	done

_PewterCityPokecenterGuyText::
	text "Yawn!"

	para "When JIGGLYPUFF"
	line "sings, #MON"
	cont "get drowsy..."

	para "...Me too..."
	line "Snore..."
	done

_CeruleanPokecenterGuyText::
	text "BILL has lots of"
	line "#MON!"

	para "He collects rare"
	line "ones too!"
	done

_LavenderPokecenterGuyText::
	text "CUBONEs wear"
	line "skulls, right?"

	para "People will pay a"
	line "lot for one!"
	done

_MtMoonPokecenterBenchGuyText::
	text "If you have too"
	line "many #MON, you"
	cont "should store them"
	cont "via PC!"
	done

_RockTunnelPokecenterGuyText::
	text "I heard that"
	line "GHOSTs haunt"
	cont "LAVENDER TOWN!"
	done

_UnusedBenchGuyText1::
	text "I wish I could"
	line "catch #MON."
	done

_UnusedBenchGuyText2::
	text "I'm tired from"
	line "all the fun..."
	done

_UnusedBenchGuyText3::
	text "SILPH's manager"
	line "is hiding in the"
	cont "SAFARI ZONE."
	done

_VermilionPokecenterGuyText::
	text "It is true that a"
	line "higher level"
	cont "#MON will be"
	cont "more powerful..."

	para "But, all #MON"
	line "will have weak"
	cont "points against"
	cont "specific types."

	para "So, there is no"
	line "universally"
	cont "strong #MON."
	done

_CeladonCityPokecenterGuyText::
	text "If I had a BIKE,"
	line "I would go to"
	cont "CYCLING ROAD!"
	done

_FuchsiaCityPokecenterGuyText::
	text "If you're studying "
	line "#MON, visit"
	cont "the SAFARI ZONE."

	para "It has all sorts"
	line "of rare #MON."
	done

_CinnabarPokecenterGuyText::
	text "#MON can still"
	line "learn techniques"
	cont "after canceling"
	cont "evolution."

	para "Evolution can wait"
	line "until new moves"
	cont "have been learned."
	done

_SaffronCityPokecenterGuyText1::
	text "It would be great"
	line "if the ELITE FOUR"
	cont "came and stomped"
	cont "TEAM ROCKET!"
	done

_SaffronCityPokecenterGuyText2::
	text "TEAM ROCKET took"
	line "off! We can go"
	cont "out safely again!"
	cont "That's great!"
	done

_CeladonCityHotelText::
	text "My sis brought me"
	line "on this vacation!"
	done

_BookcaseText::
	text "Crammed full of"
	line "#MON books!"
	done

_NewBicycleText::
	text "A shiny new"
	line "BICYCLE!"
	done

_PushStartText::
	text "Push START to"
	line "open the MENU!"
	done

_SaveOptionText::
	text "The SAVE option is"
	line "on the MENU"
	cont "screen."
	done

_StrengthsAndWeaknessesText::
	text "All #MON types"
	line "have strong and"
	cont "weak points"
	cont "against others."
	done

_TimesUpText::
	text "PA: Ding-dong!"

	para "Time's up!"
	prompt

_GameOverText::
	text "PA: Your SAFARI"
	line "GAME is over!"
	done

_CinnabarGymQuizDummyIntroText::
	text "#MON Quiz!"

	para "Get it right and"
	line "the door opens to"
	cont "the next room!"

	para "Get it wrong and"
	line "face a trainer!"

	para "If you want to"
	line "conserve your"
	cont "#MON for the"
	cont "GYM LEADER..."

	para "Then get it right!"
	line "Here we go!"
	prompt

_CinnabarGymQuizIntroText::
	text "#MON Quiz!"

	para "Get it right and"
	line "the door opens to"
	cont "the next room!"

	para "Get it wrong and"
	line "face the trainer"
	cont "blocking the way!"

	para "If you want to"
	line "conserve your"
	cont "#MON for the"
	cont "GYM LEADER..."

	para "Then get it right!"
	line "Here we go!"
	para ""
	done

_CinnabarGymQuizShortIntroText::
	text "#MON Quiz!"

	line "Test your skill!"
	para ""
	done

_CinnabarQuizQuestionsText1::
	text "CATERPIE evolves"
	line "into BUTTERFREE?"
	done

_CinnabarQuizQuestionsText2::
	text "There are 9"
	line "certified #MON"
	cont "LEAGUE BADGEs?"
	done

_CinnabarQuizQuestionsText3::
	text "POLIWAG evolves 3"
	line "times?"
	done

_CinnabarQuizQuestionsText4::
	text "Are thunder moves"
	line "effective against"
	cont "ground element-"
	cont "type #MON?"
	done

_CinnabarQuizQuestionsText5::
	text "#MON of the"
	line "same kind and"
	cont "level are not"
	cont "identical?"
	done

_CinnabarQuizQuestionsText6::
	text "TM28 contains"
	line "TOMBSTONER?"
	done

_CinnabarGymQuizCorrectText::
	text "You're absolutely"
	line "correct!"

	para "Go on through!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "Sorry! Bad call!"
	prompt

_MagazinesText::
	text "#MON magazines!"

	para "#MON notebooks!"

	para "#MON graphs!"
	done

_BillsHouseMonitorText::
	text "TELEPORTER is"
	line "displayed on the"
	cont "PC monitor."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> initiated"
	line "TELEPORTER's Cell"
	cont "Separator!@"
	text_end

_BillsHousePokemonListText1::
	text "BILL's favorite"
	line "#MON list!"
	prompt

_BillsHousePokemonListText2::
	text "Which #MON do"
	line "you want to see?"
	done

_OakLabEmailText::
	text "There's an e-mail"
	line "message here!"

	para "..."

	para "Calling all"
	line "#MON trainers!"

	para "The elite trainers"
	line "of #MON LEAGUE"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "#MON and see"
	cont "how you rate as a"
	cont "trainer!"

	para "#MON LEAGUE HQ"
	line "INDIGO PLATEAU"

	para "PS: PROF.OAK,"
	line "please visit us!"
	cont "..."
	done

_GameCornerCoinCaseText::
	text "A COIN CASE is"
	line "required!"
	done

_GameCornerNoCoinsText::
	text "You don't have"
	line "any coins!"
	done

_GameCornerOutOfOrderText::
	text "OUT OF ORDER"
	line "This is broken."
	done

_GameCornerOutToLunchText::
	text "OUT TO LUNCH"
	line "This is reserved."
	done

_GameCornerSomeonesKeysText::
	text "Someone's keys!"
	line "They'll be back."
	done

_JustAMomentText::
	text "Just a moment."
	done

TMNotebookText::
	text "It's a pamphlet"
	line "on TMs."

	para "..."

	para "There are 50 TMs"
	line "in all."

	para "There are also 5"
	line "HMs that can be"
	cont "used repeatedly."

	para "SILPH CO.@"
	text_end

_TurnPageText::
	text "Turn the page?"
	done

_ViridianSchoolNotebookText5::
	text "GIRL: Hey! Don't"
	line "look at my notes!@"
	text_end

_ViridianSchoolNotebookText1::
	text "Looked at the"
	line "notebook!"

	para "First page..."

	para "# BALLs are"
	line "used to catch"
	cont "#MON."

	para "Up to 6 #MON"
	line "can be carried."

	para "People who raise"
	line "and make #MON"
	cont "fight are called"
	cont "#MON trainers."
	prompt

_ViridianSchoolNotebookText2::
	text "Second page..."

	para "A healthy #MON"
	line "may be hard to"
	cont "catch, so weaken"
	cont "it first!"

	para "Poison, burns and"
	line "other damage are"
	cont "effective!"
	prompt

_ViridianSchoolNotebookText3::
	text "Third page..."

	para "#MON trainers"
	line "seek others to"
	cont "engage in #MON"
	cont "fights."

	para "Battles are"
	line "constantly fought"
	cont "at #MON GYMs."
	prompt

_ViridianSchoolNotebookText4::
	text "Fourth page..."

	para "The goal for"
	line "#MON trainers"
	cont "is to beat the "
	cont "top 8 #MON"
	cont "GYM LEADERs."

	para "Do so to earn the"
	line "right to face..."

	para "The ELITE FOUR of"
	line "#MON LEAGUE!"
	prompt

_EnemiesOnEverySideText::
	text "Enemies on every"
	line "side!"
	done

_WhatGoesAroundComesAroundText::
	text "What goes around"
	line "comes around!"
	done

_FightingDojoText::
	text "FIGHTING DOJO"
	done

_IndigoPlateauHQText::
	text "INDIGO PLATEAU"
	line "#MON LEAGUE HQ"
	done

_RedBedroomSNESText::
	text "<PLAYER> is"
	line "playing the SNES!"
	cont "...Okay!"
	cont "It's time to go!"
	done

_Route15UpstairsBinocularsText::
	text "Looked into the"
	line "binoculars..."

	para "A large, shining"
	line "bird is flying"
	cont "toward the sea."
	done

_AerodactylFossilText::
	text "AERODACTYL Fossil"
	line "A primitive and"
	cont "rare #MON."
	done

_KabutopsFossilText::
	text "KABUTOPS Fossil"
	line "A primitive and"
	cont "rare #MON."
	done

_FanClubPicture1Text::
	text "My cute RAPIDASH."
	done

_FanClubPicture2Text::
	text "My beloved FEAROW."
	done

_LinkCableHelpText1::
	text "TRAINER TIPS"

	para "Using a Game Link"
	line "Cable"
	prompt

_LinkCableHelpText2::
	text "Which heading do"
	line "you want to read?"
	done

_LinkCableInfoText1::
	text "When you have"
	line "linked your GAME"
	cont "BOY with another"
	cont "GAME BOY, talk to"
	cont "the attendant on"
	cont "the right in any"
	cont "#MON CENTER."
	prompt

_LinkCableInfoText2::
	text "COLOSSEUM lets"
	line "you play against"
	cont "a friend."
	prompt

_LinkCableInfoText3::
	text "TRADE CENTER is"
	line "used for trading"
	cont "#MON."
	prompt

_ViridianSchoolBlackboardText1::
	text "The blackboard"
	line "describes #MON"
	cont "STATUS changes"
	cont "during battles."
	prompt

_ViridianSchoolBlackboardText2::
	text "Which heading do"
	line "you want to read?"
	done

_ViridianBlackboardSleepText::
	text "A #MON can't"
	line "attack if it's"
	cont "asleep!"

	para "#MON will stay"
	line "asleep even after"
	cont "battles."

	para "Use AWAKENING to"
	line "wake them up!"
	prompt

_ViridianBlackboardPoisonText::
	text "When poisoned, a"
	line "#MON's health"
	cont "steadily drops."

	para "Poison lingers"
	line "after battles."

	para "Use an ANTIDOTE"
	line "to cure poison!"
	prompt

_ViridianBlackboardPrlzText::
	text "Paralysis could"
	line "make #MON"
	cont "moves misfire!"

	para "Paralysis remains"
	line "after battles."

	para "Use PARLYZ HEAL"
	line "for treatment!"
	prompt

_ViridianBlackboardBurnText::
	text "A burn reduces"
	line "power."
	
	para "It also causes"
	line "ongoing damage."

	para "Burns remain"
	line "after battles."

	para "Use BURN HEAL to"
	line "cure a burn!"
	prompt

_ViridianBlackboardFrozenText::
	text "If frozen, a"
	line "#MON becomes"
	cont "totally immobile!"

	para "It stays frozen"
	line "even after the"
	cont "battle ends."

	para "Use ICE HEAL to"
	line "thaw out #MON!"
	prompt

_VermilionGymTrashText::
	text "Nope, there's"
	line "only trash here."
	done

_VermilionGymTrashSuccessText1::
	text "Hey! There's a"
	line "switch under the"
	cont "trash!"
	cont "Turn it on!"

	para "The 1st electric"
	line "lock opened!@"
	text_end

_VermilionGymTrashSuccessText2::
	text "Hey! There's"
	line "another switch"
	cont "under the trash!"
	cont "Turn it on!"
	prompt

_VermilionGymTrashSuccessText3::
	text "The 2nd electric"
	line "lock opened!"

	para "The motorized door"
	line "opened!@"
	text_end

_VermilionGymTrashFailText::
	text "Nope! There's"
	line "only trash here.@"
	text_end

_FoundHiddenItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wcd6d
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "But, <PLAYER> has"
	line "no more room for"
	cont "other items!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> found"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " coins!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> found"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " coins!@"
	text_end

_DroppedHiddenCoinsText::
	text_start
	para "Oops! Dropped"
	line "some coins!"
	done

_IndigoPlateauStatuesText1::
	text "INDIGO PLATEAU"
	prompt

_IndigoPlateauStatuesText2::
	text "The ultimate goal"
	line "of trainers!"
	cont "#MON LEAGUE HQ"
	done

_IndigoPlateauStatuesText3::
	text "The highest"
	line "#MON authority"
	cont "#MON LEAGUE HQ"
	done

_PokemonBooksText::
	text "Crammed full of"
	line "#MON books!"
	done

_DiglettSculptureText::
	text "It's a sculpture"
	line "of DIGLETT."
	done

_ElevatorText::
	text "This is an"
	line "elevator."
	done

_TownMapText::
	text "A TOWN MAP.@"
	text_end

_PokemonStuffText::
	text "Wow! Tons of"
	line "#MON stuff!"
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
