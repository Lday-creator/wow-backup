local addonName, addonTable = ...

local L = LibStub("AceLocale-3.0"):GetLocale("Rarity")
local CONSTANTS = addonTable.constants

local wodPets = {
	-- 6.0
	["Albino Chimaeraling"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Albino Chimaeraling"],
		spellId = 177212,
		itemId = 119434,
		items = {118697},
		chance = 15,
		creatureId = 77021,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Eye of Observation"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Eye of Observation"],
		spellId = 170275,
		itemId = 119170,
		creatureId = 88490,
		npcs = {87668},
		chance = 8,
		groupSize = 5,
		equalOdds = true,
		coords = {{m = 535, x = 31.2, y = 47}},
		sourceText = L[
			"Five players are needed to activate the runes on the floor. The boss can be attacked only after all runes have been activated."
		],
		questId = {37344}
	},
	["Firewing"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Firewing"],
		spellId = 170291,
		itemId = 118578,
		items = {118697},
		chance = 15,
		creatureId = 87704,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Land Shark"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.COLLECTION,
		name = L["Land Shark"],
		spellId = 172695,
		itemId = 117404,
		creatureId = 86445,
		collectedItemId = {117397, 127994, 116820, 116818, 116819, 116821, 122696, 116817, 116822},
		chance = 50,
		obtain = L["Fished anywhere in Draenor (except your garrison) with the help of Nat Pagle"],
		sourceText = L[
			"Lunkers can be fished anywhere in Draenor (except in your garrison) after you've obtained a level 3 Fishing Shack and acquired Nat Pagle as a follower."
		],
		coords = {
			{m = 572},
			{m = 588},
			{m = 525},
			{m = 543},
			{m = 550},
			{m = 539},
			{m = 542},
			{m = 622},
			{m = 535},
			{m = 534},
			{m = 624}
		}
	},
	["Nightshade Sproutling"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Nightshade Sproutling"],
		spellId = 167394,
		itemId = 118595,
		npcs = {85407, 85408, 85409, 85410, 85411, 85412, 95132},
		chance = 1000,
		creatureId = 83594,
		sourceText = L["Dropped by Disturbed Podling, which has a chance to spawn when picking herbs in Draenor."],
		coords = {{m = 572}}
	},
	["Puddle Terror"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Puddle Terror"],
		spellId = 119467,
		itemId = 119467,
		items = {118697},
		chance = 15,
		creatureId = 88300,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Red Goren Egg"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Red Goren Egg"],
		spellId = 170280,
		itemId = 118919,
		npcs = {85294},
		chance = 1000,
		creatureId = 85667,
		sourceText = L["Dropped by Goren Protector, which has a chance to spawn when mining ore in Draenor."],
		coords = {{m = 572}}
	},
	["Sea Calf"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.COLLECTION,
		name = L["Sea Calf"],
		spellId = 168977,
		itemId = 114919,
		creatureId = 84441,
		collectedItemId = {117397, 127994, 116820, 116818, 116819, 116821, 122696, 116817, 116822},
		chance = 50,
		obtain = L["Fished anywhere in Draenor (except your garrison) with the help of Nat Pagle"],
		sourceText = L[
			"Lunkers can be fished anywhere in Draenor (except in your garrison) after you've obtained a level 3 Fishing Shack and acquired Nat Pagle as a follower."
		],
		coords = {
			{m = 572},
			{m = 588},
			{m = 525},
			{m = 543},
			{m = 550},
			{m = 539},
			{m = 542},
			{m = 622},
			{m = 535},
			{m = 534},
			{m = 624}
		}
	},
	["Servant of Demidos"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Servant of Demidos"],
		spellId = 170278,
		itemId = 119431,
		npcs = {84911},
		chance = 7,
		creatureId = 88692,
		coords = {{m = 104, x = 46, y = 71.8}}
	},
	["Sky-Bo"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Sky-Bo"],
		spellId = 170292,
		itemId = 115483,
		items = {86623, 113258},
		chance = 200,
		creatureId = 85284,
		questId = {31752, 34774},
		tooltipNpcs = {77789},
		coords = {
			{m = CONSTANTS.UIMAPIDS.NONE}
		}
	},
	["Spectral Bell"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Spectral Bell"],
		spellId = 167731,
		itemId = 113623,
		items = {118697},
		chance = 15,
		creatureId = 83817,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Sun Sproutling"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Sun Sproutling"],
		spellId = 167397,
		itemId = 118598,
		items = {118697},
		chance = 15,
		creatureId = 83588,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Sunfire Kaliri"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Sunfire Kaliri"],
		spellId = 177227,
		itemId = 119468,
		items = {118697},
		chance = 15,
		creatureId = 88367,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Time-Locked Box"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Time-Locked Box"],
		spellId = 10699,
		itemId = 118675,
		npcs = {
			82458,
			77653,
			78193,
			76886,
			77767,
			77790,
			78921,
			77090,
			76556,
			78345,
			82774,
			78348,
			78670,
			76673,
			77771,
			76189,
			77640,
			77101,
			78695,
			77724,
			78488,
			77643,
			78696,
			77723,
			77644,
			78667,
			73458,
			76672,
			82918,
			73446,
			77721,
			82451,
			73459,
			78674,
			76651
		},
		chance = 500,
		creatureId = 7546,
		coords = {{m = 17}}
	},
	["Weebomination"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Weebomination"],
		spellId = 158261,
		itemId = 113558,
		items = {118697},
		chance = 15,
		creatureId = 78421,
		questId = {37644, 37645},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Zomstrok"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Zomstrok"],
		spellId = 167336,
		itemId = 113554,
		npcs = {82262, 82261, 84921},
		chance = 100,
		creatureId = 83562,
		coords = {{m = 104, x = 41, y = 80}}
	},
	-- 6.1
	["Bone Serpent"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Bone Serpent"],
		spellId = 177238,
		itemId = 122532,
		items = {122535},
		chance = 33,
		creatureId = 88577,
		questId = {382994, 38300},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Fragment of Anger"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Fragment of Anger"],
		spellId = 179832,
		itemId = 122107,
		npcs = {23420},
		chance = 10,
		creatureId = 90203,
		coords = {{m = 759, x = 61.3, y = 85, i = true}}
	},
	["Fragment of Desire"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Fragment of Desire"],
		spellId = 179834,
		itemId = 122109,
		npcs = {23420},
		chance = 10,
		creatureId = 90205,
		coords = {{m = 759, x = 61.3, y = 85, i = true}}
	},
	["Fragment of Suffering"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Fragment of Suffering"],
		spellId = 179833,
		itemId = 122108,
		npcs = {23420},
		chance = 10,
		creatureId = 90204,
		coords = {{m = 759, x = 61.3, y = 85, i = true}}
	},
	["Grotesque Statue"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Grotesque Statue"],
		spellId = 179811,
		itemId = 122105,
		npcs = {17842},
		chance = 10,
		creatureId = 90200,
		coords = {{m = 329, x = 35.7, y = 37.8, i = true}}
	},
	["Hyjal Wisp"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Hyjal Wisp"],
		spellId = 179837,
		itemId = 122112,
		npcs = {17968},
		chance = 10,
		creatureId = 90208,
		coords = {{m = 329, x = 77.3, y = 28.3, i = true}}
	},
	["Leviathan Egg"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Leviathan Egg"],
		spellId = 179830,
		itemId = 122104,
		npcs = {22887},
		chance = 10,
		creatureId = 90201,
		coords = {{m = 490, x = 43.9, y = 18.7, i = true}}
	},
	["Servant's Bell"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Servant's Bell"],
		spellId = 179840,
		itemId = 122115,
		npcs = {25165, 25166},
		chance = 10,
		creatureId = 90214,
		coords = {{m = 335, x = 64.1, y = 32.1, i = true}}
	},
	["Shard of Supremus"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Shard of Supremus"],
		spellId = 179831,
		itemId = 122106,
		npcs = {22898},
		chance = 10,
		creatureId = 90202,
		coords = {{m = 490, x = 66.3, y = 47.3, i = true}}
	},
	["Slithershock Elver"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Slithershock Elver"],
		spellId = 177223,
		itemId = 122534,
		items = {122535},
		chance = 33,
		creatureId = 91407,
		questId = {382994, 38300},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	["Smelly Gravestone"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Smelly Gravestone"],
		spellId = 179836,
		itemId = 122111,
		npcs = {17808},
		chance = 10,
		creatureId = 90207,
		coords = {{m = 329, x = 8.5, y = 68.1, i = true}}
	},
	["Sultry Grimoire"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Sultry Grimoire"],
		spellId = 179835,
		itemId = 122110,
		npcs = {22947},
		chance = 10,
		creatureId = 90206,
		coords = {{m = 490, x = 67.5, y = 36.7, i = true}}
	},
	["Sunblade Rune of Activation"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Sunblade Rune of Activation"],
		spellId = 179838,
		itemId = 122113,
		npcs = {24882},
		chance = 10,
		creatureId = 90212,
		coords = {{m = 335, x = 65.8, y = 86.4, i = true}}
	},
	["Void Collar"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Void Collar"],
		spellId = 179839,
		itemId = 122114,
		npcs = {25840},
		chance = 10,
		creatureId = 90213,
		coords = {{m = 335, x = 46.7, y = 23.8, i = true}}
	},
	["Young Talbuk"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Young Talbuk"],
		spellId = 177218,
		itemId = 122533,
		items = {122535},
		chance = 33,
		creatureId = 91408,
		questId = {382994, 38300},
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	},
	-- 6.2
	["Corrupted Nest Guardian"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.BOSS,
		name = L["Corrupted Nest Guardian"],
		spellId = 187532,
		itemId = 127749,
		npcs = {99999},
		tooltipNpcs = {95067},
		chance = 100,
		statisticId = {10228, 10227, 10226, 10225},
		creatureId = 94623,
		enableCoin = true,
		lockBossName = "Shadow-Lord Iskar",
		coords = {{m = 661, x = 40.1, y = 76.1, i = true}}
	},
	["Glittering Arcane Crystal"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Glittering Arcane Crystal"],
		spellId = 193589,
		itemId = 129218,
		npcs = {98200},
		chance = 10,
		creatureId = 98238,
		questId = 40074,
		coords = {{m = 550, x = 23.8, y = 37.9, n = L["Guk"]}}
	},
	["Nightmare Bell"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Nightmare Bell"],
		spellId = 185055,
		itemId = 127753,
		items = {127751},
		chance = 33,
		creatureId = 93483,
		sourceText = L[
			"Can drop from Fel-Touched Pet Supplies, which is obtained by defeating the Fel-corrupted legendary pets in Tanaan Jungle."
		],
		questId = {39157, 39160, 39161, 39162, 39163, 39164, 39165, 39166, 39167, 39168, 39169, 39170, 39171, 39172, 39173},
		defeatAllQuests = true,
		defeatSteps = {
			[39168] = L["Bleakclaw"],
			[39161] = L["Chaos Pup"],
			[39160] = L["Corrupted Thundertail"],
			[39162] = L["Cursed Spirit"],
			[39167] = L["Dark Gazer"],
			[39173] = L["Defiled Earth"],
			[39170] = L["Dreadwalker"],
			[39165] = L["Direflame"],
			[39163] = L["Felfly"],
			[39157] = L["Felsworn Sentry"],
			[39166] = L["Mirecroak"],
			[39171] = L["Netherfist"],
			[39172] = L["Skrillix"],
			[39164] = L["Tainted Maulclaw"],
			[39169] = L["Vile Blood of Draenor"]
		},
		coords = {
			{m = 534, x = 15.8, y = 44.6, q = 39168, n = L["Bleakclaw"]},
			{m = 534, x = 25, y = 76.2, q = 39161, n = L["Chaos Pup"]},
			{m = 534, x = 53, y = 65.2, q = 39160, n = L["Corrupted Thundertail"]},
			{m = 534, x = 31.4, y = 38, q = 39162, n = L["Cursed Spirit"]},
			{m = 534, x = 54, y = 29.8, q = 39167, n = L["Dark Gazer"]},
			{m = 534, x = 75.4, y = 37.4, q = 39173, n = L["Defiled Earth"]},
			{m = 534, x = 47.2, y = 52.6, q = 39170, n = L["Dreadwalker"]},
			{m = 534, x = 57.8, y = 37.2, q = 39165, n = L["Direflame"]},
			{m = 534, x = 55.8, y = 80.8, q = 39163, n = L["Felfly"]},
			{m = 534, x = 26, y = 31.6, q = 39157, n = L["Felsworn Sentry"]},
			{m = 534, x = 42.2, y = 71.6, q = 39166, n = L["Mirecroak"]},
			{m = 534, x = 48.4, y = 35.6, q = 39171, n = L["Netherfist"]},
			{m = 534, x = 48.4, y = 31.2, q = 39172, n = L["Skrillix"]},
			{m = 534, x = 43.4, y = 84.6, q = 39164, n = L["Tainted Maulclaw"]},
			{m = 534, x = 44, y = 45.8, q = 39169, n = L["Vile Blood of Draenor"]}
		}
	},
	["Periwinkle Calf"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Periwinkle Calf"],
		spellId = 187555,
		itemId = 127754,
		items = {127751},
		chance = 33,
		creatureId = 93352,
		sourceText = L[
			"Can drop from Fel-Touched Pet Supplies, which is obtained by defeating the Fel-corrupted legendary pets in Tanaan Jungle."
		],
		questId = {39157, 39160, 39161, 39162, 39163, 39164, 39165, 39166, 39167, 39168, 39169, 39170, 39171, 39172, 39173},
		defeatAllQuests = true,
		defeatSteps = {
			[39168] = L["Bleakclaw"],
			[39161] = L["Chaos Pup"],
			[39160] = L["Corrupted Thundertail"],
			[39162] = L["Cursed Spirit"],
			[39167] = L["Dark Gazer"],
			[39173] = L["Defiled Earth"],
			[39170] = L["Dreadwalker"],
			[39165] = L["Direflame"],
			[39163] = L["Felfly"],
			[39157] = L["Felsworn Sentry"],
			[39166] = L["Mirecroak"],
			[39171] = L["Netherfist"],
			[39172] = L["Skrillix"],
			[39164] = L["Tainted Maulclaw"],
			[39169] = L["Vile Blood of Draenor"]
		},
		coords = {
			{m = 534, x = 15.8, y = 44.6, q = 39168, n = L["Bleakclaw"]},
			{m = 534, x = 25, y = 76.2, q = 39161, n = L["Chaos Pup"]},
			{m = 534, x = 53, y = 65.2, q = 39160, n = L["Corrupted Thundertail"]},
			{m = 534, x = 31.4, y = 38, q = 39162, n = L["Cursed Spirit"]},
			{m = 534, x = 54, y = 29.8, q = 39167, n = L["Dark Gazer"]},
			{m = 534, x = 75.4, y = 37.4, q = 39173, n = L["Defiled Earth"]},
			{m = 534, x = 47.2, y = 52.6, q = 39170, n = L["Dreadwalker"]},
			{m = 534, x = 57.8, y = 37.2, q = 39165, n = L["Direflame"]},
			{m = 534, x = 55.8, y = 80.8, q = 39163, n = L["Felfly"]},
			{m = 534, x = 26, y = 31.6, q = 39157, n = L["Felsworn Sentry"]},
			{m = 534, x = 42.2, y = 71.6, q = 39166, n = L["Mirecroak"]},
			{m = 534, x = 48.4, y = 35.6, q = 39171, n = L["Netherfist"]},
			{m = 534, x = 48.4, y = 31.2, q = 39172, n = L["Skrillix"]},
			{m = 534, x = 43.4, y = 84.6, q = 39164, n = L["Tainted Maulclaw"]},
			{m = 534, x = 44, y = 45.8, q = 39169, n = L["Vile Blood of Draenor"]}
		}
	},
	["Savage Cub"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.COLLECTION,
		name = L["Savage Cub"],
		spellId = 190682,
		itemId = 128477,
		collectedItemId = 124099,
		chance = 1500,
		creatureId = 96126,
		obtain = L["Dropped from monsters in Fang'rila"],
		tooltipNpcs = {92922, 92466, 89747, 89695, 89746, 92481},
		sourceText = L[
			"Purchased from Z'tenga the Walker <Saberstalker Quartermaster> in Fang'rila in Tanaan Jungle. Blackfang Claws drop from all monsters in Fang'rila."
		],
		coords = {{m = 534, x = 55.2, y = 74.8}}
	},
	["Seaborne Spore"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Seaborne Spore"],
		spellId = 173544,
		itemId = 118105,
		items = {127751},
		chance = 33,
		creatureId = 86718,
		sourceText = L[
			"Can drop from Fel-Touched Pet Supplies, which is obtained by defeating the Fel-corrupted legendary pets in Tanaan Jungle."
		],
		questId = {39157, 39160, 39161, 39162, 39163, 39164, 39165, 39166, 39167, 39168, 39169, 39170, 39171, 39172, 39173},
		defeatAllQuests = true,
		defeatSteps = {
			[39168] = L["Bleakclaw"],
			[39161] = L["Chaos Pup"],
			[39160] = L["Corrupted Thundertail"],
			[39162] = L["Cursed Spirit"],
			[39167] = L["Dark Gazer"],
			[39173] = L["Defiled Earth"],
			[39170] = L["Dreadwalker"],
			[39165] = L["Direflame"],
			[39163] = L["Felfly"],
			[39157] = L["Felsworn Sentry"],
			[39166] = L["Mirecroak"],
			[39171] = L["Netherfist"],
			[39172] = L["Skrillix"],
			[39164] = L["Tainted Maulclaw"],
			[39169] = L["Vile Blood of Draenor"]
		},
		coords = {
			{m = 534, x = 15.8, y = 44.6, q = 39168, n = L["Bleakclaw"]},
			{m = 534, x = 25, y = 76.2, q = 39161, n = L["Chaos Pup"]},
			{m = 534, x = 53, y = 65.2, q = 39160, n = L["Corrupted Thundertail"]},
			{m = 534, x = 31.4, y = 38, q = 39162, n = L["Cursed Spirit"]},
			{m = 534, x = 54, y = 29.8, q = 39167, n = L["Dark Gazer"]},
			{m = 534, x = 75.4, y = 37.4, q = 39173, n = L["Defiled Earth"]},
			{m = 534, x = 47.2, y = 52.6, q = 39170, n = L["Dreadwalker"]},
			{m = 534, x = 57.8, y = 37.2, q = 39165, n = L["Direflame"]},
			{m = 534, x = 55.8, y = 80.8, q = 39163, n = L["Felfly"]},
			{m = 534, x = 26, y = 31.6, q = 39157, n = L["Felsworn Sentry"]},
			{m = 534, x = 42.2, y = 71.6, q = 39166, n = L["Mirecroak"]},
			{m = 534, x = 48.4, y = 35.6, q = 39171, n = L["Netherfist"]},
			{m = 534, x = 48.4, y = 31.2, q = 39172, n = L["Skrillix"]},
			{m = 534, x = 43.4, y = 84.6, q = 39164, n = L["Tainted Maulclaw"]},
			{m = 534, x = 44, y = 45.8, q = 39169, n = L["Vile Blood of Draenor"]}
		}
	},
	["Vibrating Arcane Crystal"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Vibrating Arcane Crystal"],
		spellId = 193572,
		itemId = 129216,
		npcs = {98198},
		chance = 10,
		creatureId = 98236,
		questId = 40075,
		coords = {{m = 550, x = 26.2, y = 34.2, n = L["Rukdug"]}}
	},
	["Warm Arcane Crystal"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Warm Arcane Crystal"],
		spellId = 193588,
		itemId = 129217,
		npcs = {98199},
		chance = 10,
		creatureId = 98237,
		questId = 40073,
		coords = {{m = 550, x = 28.5, y = 30.3, n = L["Pugg"]}}
	},
	["Zangar Spore"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Zangar Spore"],
		spellId = 173532,
		itemId = 118101,
		items = {127751},
		chance = 33,
		creatureId = 86715,
		sourceText = L[
			"Can drop from Fel-Touched Pet Supplies, which is obtained by defeating the Fel-corrupted legendary pets in Tanaan Jungle."
		],
		questId = {39157, 39160, 39161, 39162, 39163, 39164, 39165, 39166, 39167, 39168, 39169, 39170, 39171, 39172, 39173},
		defeatAllQuests = true,
		defeatSteps = {
			[39168] = L["Bleakclaw"],
			[39161] = L["Chaos Pup"],
			[39160] = L["Corrupted Thundertail"],
			[39162] = L["Cursed Spirit"],
			[39167] = L["Dark Gazer"],
			[39173] = L["Defiled Earth"],
			[39170] = L["Dreadwalker"],
			[39165] = L["Direflame"],
			[39163] = L["Felfly"],
			[39157] = L["Felsworn Sentry"],
			[39166] = L["Mirecroak"],
			[39171] = L["Netherfist"],
			[39172] = L["Skrillix"],
			[39164] = L["Tainted Maulclaw"],
			[39169] = L["Vile Blood of Draenor"]
		},
		coords = {
			{m = 534, x = 15.8, y = 44.6, q = 39168, n = L["Bleakclaw"]},
			{m = 534, x = 25, y = 76.2, q = 39161, n = L["Chaos Pup"]},
			{m = 534, x = 53, y = 65.2, q = 39160, n = L["Corrupted Thundertail"]},
			{m = 534, x = 31.4, y = 38, q = 39162, n = L["Cursed Spirit"]},
			{m = 534, x = 54, y = 29.8, q = 39167, n = L["Dark Gazer"]},
			{m = 534, x = 75.4, y = 37.4, q = 39173, n = L["Defiled Earth"]},
			{m = 534, x = 47.2, y = 52.6, q = 39170, n = L["Dreadwalker"]},
			{m = 534, x = 57.8, y = 37.2, q = 39165, n = L["Direflame"]},
			{m = 534, x = 55.8, y = 80.8, q = 39163, n = L["Felfly"]},
			{m = 534, x = 26, y = 31.6, q = 39157, n = L["Felsworn Sentry"]},
			{m = 534, x = 42.2, y = 71.6, q = 39166, n = L["Mirecroak"]},
			{m = 534, x = 48.4, y = 35.6, q = 39171, n = L["Netherfist"]},
			{m = 534, x = 48.4, y = 31.2, q = 39172, n = L["Skrillix"]},
			{m = 534, x = 43.4, y = 84.6, q = 39164, n = L["Tainted Maulclaw"]},
			{m = 534, x = 44, y = 45.8, q = 39169, n = L["Vile Blood of Draenor"]}
		}
	},
	["Strand Crawler"] = {
		-- Note: Also drops from the Northrend fishing bag (but Rarity can't track items from two different sources...)
		cat = CONSTANTS.ITEM_CATEGORIES.WOD,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Strand Crawler"],
		npcs = {85715, 81171},
		spellId = 62561,
		itemId = 44983,
		creatureId = 33226,
		chance = 1000,
		coords = {
			{m = CONSTANTS.UIMAPIDS.LUNARFALL_GARRISON},
			{m = CONSTANTS.UIMAPIDS.FROSTWALL_GARRISON}
		}
	}
}

Rarity.ItemDB.MergeItems(Rarity.ItemDB.pets, wodPets)
