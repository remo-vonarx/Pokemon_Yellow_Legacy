"""The longest value of every variable a text prints: the values sweep.py writes into RAM and expect.py renders.

Name buffers hold the longest string they can get (a 12-letter item or move, a 10-letter Pokémon, a 7-letter player),
numbers their largest value, BCD numbers 9 in every digit. Some texts only ever print one value (one gift item,
a Pokémon name in an item buffer): realvalues.json lists those with their real value.
"""

NAMES = {
    "wPlayerName": "SPIELER", "wRivalName": "RIVALIN", "wcd6d": "KARATESCHLAG", "wStringBuffer": "TOP-GENESUNG",
    "wEnemyMonNick": "KNUDDELUFF", "wBattleMonNick": "KNUDDELUFF", "wInGameTradeGiveMonName": "KNUDDELUFF",
    "wInGameTradeReceiveMonName": "KNUDDELUFF", "wLearnMoveMonName": "KNUDDELUFF",
    "wNameOfPlayerMonToBeTraded": "KNUDDELUFF", "wDayCareMonName": "KNUDDELUFF", "wBuffer": "KNUDDELUFF",
    "wBoxMonNicks": "KNUDDELUFF", "wTrainerName": "KÄFERSAMMLER", "wLinkEnemyTrainerName": "FREUNDE",
    "wOaksAideRewardItemName": "DETEKTOR", "wGymCityName": "FUCHSANIA CITY", "wGymLeaderName": "MAJOR BOB",
    "wBoxNumString": "12",
}
# numbers: (bytes, value)
NUMS = {
    "hOaksAideRequirement": (1, 150), "wCurEnemyLVL": (1, 100), "hOaksAideNumMonsOwned": (1, 151),
    "wWhichPewterGuy": (1, 255), "wPlayerNumHits": (1, 5), "wHPBarHPDifference": (2, 999),
    "wExpressionNumber": (1, 99), "wExpAmountGained": (2, 9999), "wEnemyNumHits": (1, 5),
    "wDexRatingNumMonsSeen": (1, 151), "wDexRatingNumMonsOwned": (1, 151), "wDayCareNumLevelsGrown": (1, 100),
    "hDexRatingNumMonsSeen": (1, 151), "hDexRatingNumMonsOwned": (1, 151),
}
# BCD numbers: bytes
BCD = {"hMoney": 3, "hCoins": 2, "wTotalPayDayMoney": 3, "wPriceTemp": 3, "wPlayerCoins": 2, "wDayCareTotalCost": 2,
       "wAmountMoneyWon": 3}


def names(override=""):
    """NAMES with "var=VALUE,var=VALUE" applied on top."""
    out = dict(NAMES)
    for kv in filter(None, override.split(",")):
        k, v = kv.split("=", 1)
        out[k] = v
    return out
