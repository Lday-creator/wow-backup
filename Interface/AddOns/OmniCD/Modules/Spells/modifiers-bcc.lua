local E, L, C = select(2, ...):unpack()

if not E.isBCC then return end

local BLANK = {}

E.spell_cdmod_talents = {
	-- Hunter
	[3044]  = { -- Aracane Shot
		{ 19454,    0.2 },  -- Improved Arcane Shot (Rank 1)
		{ 19455,    0.4 },  -- Improved Arcane Shot (Rank 2)
		{ 19456,    0.6 },  -- Improved Arcane Shot (Rank 3)
		{ 19457,    0.8 },  -- Improved Arcane Shot (Rank 4)
		{ 19458,    1.0 },  -- Improved Arcane Shot (Rank 5)
	},
	[1499]  = { -- Freezing Trap
		{ 34491,    2   },  -- Resourcefulness (Rank 1)
		{ 34492,    4   },  -- Resourcefulness (Rank 2)
		{ 34493,    6   },  -- Resourcefulness (Rank 3)
	},
	[13795] = { -- Immolation Trap
		{ 34491,    2   },  -- Resourcefulness (Rank 1)
		{ 34492,    4   },  -- Resourcefulness (Rank 2)
		{ 34493,    6   },  -- Resourcefulness (Rank 3)
	},
	[13809] = { -- Frost Trap
		{ 34491,    2   },  -- Resourcefulness (Rank 1)
		{ 34492,    4   },  -- Resourcefulness (Rank 2)
		{ 34493,    6   },  -- Resourcefulness (Rank 3)
	},
	[13813] = { -- Explosive Trap
		{ 34491,    2   },  -- Resourcefulness (Rank 1)
		{ 34492,    4   },  -- Resourcefulness (Rank 2)
		{ 34493,    6   },  -- Resourcefulness (Rank 3)
	},
	[34600] = { -- Snake Trap
		{ 34491,    2   },  -- Resourcefulness (Rank 1)
		{ 34492,    4   },  -- Resourcefulness (Rank 2)
		{ 34493,    6   },  -- Resourcefulness (Rank 3)
	},
	[3045]  = { -- Rapid Fire
		{ 34948,    60  },  -- Rapid Killing (Rank 1)
		{ 34949,    120 },  -- Rapid Killing (Rank 2)
	},
	-- Mage
	[2136]  = { -- Fire Blast
		{ 11078,    0.5 },  -- Improved Fire Blast (Rank 1)
		{ 11080,    1.0 },  -- Improved Fire Blast (Rank 2)
		{ 12342,    1.5 },  -- Improved Fire Blast (Rank 3)
	},
	[122]   = { -- Frost Nova
		{ 11165,    2   },  -- Improved Frost Nova (Rank 1)
		{ 12475,    4   },  -- Improved Frost Nova (Rank 2)
	},
	[7814]  = { -- Lash of Pain(Succubus)
		{ 18128,    3   },  -- Improved Lash of Pain (Rank 1)
		{ 18129,    6   },  -- Improved Lash of Pain (Rank 2)
	},
	-- Paladin
	[1022]  = { -- Blessing of Protection
		{ 20174,    60  },  -- Guardian's Favor (Rank 1)
		{ 20175,    120 },  -- Guardian's Favor (Rank 2)
	},
	[1044]  = { -- Blessing of Freedom
		{ 20174,    2   },  -- Guardian's Favor (Rank 1)
		{ 20175,    4   },  -- Guardian's Favor (Rank 2)
	},
	[642]   = { -- Divine Shield
		{ 31848,    30  },  -- Sacred Duty (Rank 1)
		{ 31848,    60  },  -- Sacred Duty (Rank 2)
	},
	[853]   = { -- Hammer of Justice
		{ 20487,    5   },  -- Improved Hammer of Justice (Rank 1)
		{ 20488,    10  },  -- Improved Hammer of Justice (Rank 2)
		{ 20489,    15  },  -- Improved Hammer of Justice (Rank 3)
	},
	[20271] = { -- Judgement
		{ 25956,    2   },  -- Improved Judgement (Rank 1)
		{ 25957,    4   },  -- Improved Judgement (Rank 2)
	},
	[633]   = { -- Lay on Hands
		{ 20234,    600 },  -- Improved Lay on Hands (Rank 1)
		{ 20235,    1200},  -- Improved Lay on Hands (Rank 2)
	},
	-- Priest
	[586]   = { -- Fade
		{ 15274,    3   },  -- Improved Fade (Rank 1)
		{ 15311,    6   },  -- Improved Fade (Rank 2)
	},
	[8092]  = { -- Mind Blast
		{ 15273,    0.5},   -- Improved Mind Blast (Rank 1)
		{ 15312,    1.0},   -- Improved Mind Blast (Rank 2)
		{ 15313,    1.5},   -- Improved Mind Blast (Rank 3)
		{ 15314,    2.0},   -- Improved Mind Blast (Rank 4)
		{ 15316,    2.5},   -- Improved Mind Blast (Rank 5)
	},
	[8122]  = { -- Psychic Scream
		{ 15392,    2   },  -- Improved Psychic Scream (Rank 1)
		{ 15448,    4   },  -- Improved Psychic Scream (Rank 2)
	},
	-- Rouge
	[2094]  = { -- Blind
		{ 13981,    45  },  -- Elusiveness (Rank 1)
		{ 14066,    90  },  -- Elusiveness (Rank 2)
	},
	[1856]  = { -- Vanish
		{ 13981,    45  },  -- Elusiveness (Rank 1)
		{ 14066,    90  },  -- Elusiveness (Rank 2)
	},
	[5277]  = { -- Evasion
		{ 13742,    45},    -- Endurance (Rank 1)
		{ 13872,    90},    -- Endurance (Rank 2)
	},
	[2983]  = { -- Sprint
		{ 13742,    45},    -- Endurance (Rank 1)
		{ 13872,    90},    -- Endurance (Rank 2)
	},
	[1784]  = { -- Stealth
		{ 13975,    1   },  -- Camouflage (Rank 1)
		{ 14062,    2   },  -- Camouflage (Rank 2)
		{ 14063,    3   },  -- Camouflage (Rank 3)
		{ 14064,    4   },  -- Camouflage (Rank 4)
		{ 14065,    5   },  -- Camouflage (Rank 5)
	},
	-- Shaman
	[8042]  = { -- Earth Shock
		{ 16040,    0.2 },  -- Reverberation (Rank 1)
		{ 16113,    0.4 },  -- Reverberation (Rank 2)
		{ 16114,    0.6 },  -- Reverberation (Rank 3)
		{ 16115,    0.8 },  -- Reverberation (Rank 4)
		{ 16116,    1.0 },  -- Reverberation (Rank 5)
	},
	[8050]  = { -- Flame Shock
		{ 16040,    0.2 },  -- Reverberation (Rank 1)
		{ 16113,    0.4 },  -- Reverberation (Rank 2)
		{ 16114,    0.6 },  -- Reverberation (Rank 3)
		{ 16115,    0.8 },  -- Reverberation (Rank 4)
		{ 16116,    1.0 },  -- Reverberation (Rank 5)
	},
	[8056]  = { -- Frost Shock
		{ 16040,    0.2 },  -- Reverberation (Rank 1)
		{ 16113,    0.4 },  -- Reverberation (Rank 2)
		{ 16114,    0.6 },  -- Reverberation (Rank 3)
		{ 16115,    0.8 },  -- Reverberation (Rank 4)
		{ 16116,    1.0 },  -- Reverberation (Rank 5)
	},
	[8177]  = { -- Grounding Totem
		{ 16258,    1   },  -- Guardian Totems (Rank 1)
		{ 16293,    2   },  -- Guardian Totems (Rank 2)
	},
	[20608] = { -- Reincarnation
		{ 16184,    600 },  -- Improved Reincarnation (Rank 1)
		{ 16209,    1200},  -- Improved Reincarnation (Rank 2)
	},
	-- Warrior
	[1161]  = { -- Challenging Shout
		{ 12327,    120 },  -- Improved Challenging Shout (Rank 1)
		{ 12886,    180 },  -- Improved Challenging Shout (Rank 2)
	},
	[20252] = { -- Intercept
		{ 29888,    5   },  -- Improved Intercept (Rank 1)
		{ 29889,    10  },  -- Improved Intercept (Rank 2)
	},
	[12294] = { -- Mortal Strike
		{ 35446,    0.2 },  -- Improved Mortal Strike (Rank 1)
		{ 35448,    0.4 },  -- Improved Mortal Strike (Rank 2)
		{ 35449,    0.6 },  -- Improved Mortal Strike (Rank 3)
		{ 35450,    0.7 },  -- Improved Mortal Strike (Rank 4)
		{ 35451,    1.0 },  -- Improved Mortal Strike (Rank 5)
	},
	[1719]  = { -- Recklessness
		{ 29723,    240 },  -- Improved Disciplines (Rank 1)
		{ 29724,    420 },  -- Improved Disciplines (Rank 2)
		{ 29725,    600 },  -- Improved Disciplines (Rank 3)
	},
	[20230] = { -- Retaliation
		{ 29723,    240 },  -- Improved Disciplines (Rank 1)
		{ 29724,    420 },  -- Improved Disciplines (Rank 2)
		{ 29725,    600 },  -- Improved Disciplines (Rank 3)
	},
	[871]   = { -- Shield Wall
		{ 29723,    240 },  -- Improved Disciplines (Rank 1)
		{ 29724,    420 },  -- Improved Disciplines (Rank 2)
		{ 29725,    600 },  -- Improved Disciplines (Rank 3)
	},
	[355]   = { -- Taunt
		{ 12302,    1   },  -- Improved Taunt (Rank 1)
		{ 12765,    2   },  -- Improved Taunt (Rank 2)
	},
	[1680]  = { -- Whirlwind
		{ 29721,    1   },  -- Improved Whirlwind (Rank 1)
		{ 29776,    2   },  -- Improved Whirlwind (Rank 2)
	},
}

E.spell_cdmod_talents_mult = {
	-- Mage
	[120]   = { -- Cone of Cold
		{ 31670,    .90 },  -- Ice Floes (Rank 1)
		{ 31672,    .80 },  -- Ice Floes (Rank 2)
	},
	[11958] = { -- Cold Snap
		{ 31670,    .90 },  -- Ice Floes (Rank 1)
		{ 31672,    .80 },  -- Ice Floes (Rank 2)
	},
	[11426] = { -- Ice Barrier
		{ 31670,    .90 },  -- Ice Floes (Rank 1)
		{ 31672,    .80 },  -- Ice Floes (Rank 2)
	},
	[45438] = { -- Ice Block
		{ 31670,    .90 },  -- Ice Floes (Rank 1)
		{ 31672,    .80 },  -- Ice Floes (Rank 2)
	},
}

E.spell_chmod_talents = BLANK

E.spell_cdmod_haste = {
	[19434] = 3,    -- Aimed Shot (Rank1)
}

E.spell_cdmod_aura_temp = BLANK


E.talentNameToRankID = {}

local temp = {}
for _, v in E.pairs(E.spell_cdmod_talents, E.spell_cdmod_talents_mult) do -- check for duplicate names
	if type(v[1]) == "table" then
		for i = 1, #v do
			local t = v[i]
			local id = t[1]
			local name = GetSpellInfo(id)
			if name and not temp[id] then
				E.talentNameToRankID[name] = E.talentNameToRankID[name] or {}
				tinsert(E.talentNameToRankID[name], id)
				temp[id] = true
			end
		end
	else
		local id = v[1]
		local name = GetSpellInfo(id)
		if name and not temp[id] then
			E.talentNameToRankID[name] = E.talentNameToRankID[name] or {}
			tinsert(E.talentNameToRankID[name], id)
			temp[id] = true
		end
	end
end
temp = nil

local itemBonus = {
	-- Druid
	[29166] = { 37297,  48  },  -- Improved Innervate
	[17116] = { 37292,  24  },  -- Improved Nature's Swiftness
	[20484] = { 26106,  600 },  -- Genesis Rebirth Bonus
	[18562] = { 38417,  2   },  -- Reduced Swiftmend Cooldown
	-- Hunter
	[5116]  = { -- Concussive Shot
		{ 23158,    1   },  -- Concussive Shot Cooldown Reduction
		{ 24465,    1   },  -- Improved Concussive Shot
	},
	[1499]  = { 37481,  4   },  -- Trap Cooldown - Freezing Trap
	[13795] = { 37481,  4   },  -- Trap Cooldown - Immolation Trap
	[13809] = { 37481,  4   },  -- Trap Cooldown - Frost Trap
	[13813] = { 37481,  4   },  -- Trap Cooldown - Explosive Trap
	[34600] = { 37481,  4   },  -- Trap Cooldown - Snake Trap
	[5384]  = { 24432,  2   },  -- Improved Feign Death (Item equip bonus)
	[2643]  = { 44292,  1   },  -- Improved Multi-Shot
--  [3045]  = { 26174,  120 },  -- Striker's Rapid Fire Bonus (20% proc chance)
	-- Mage
	[1953]  = { 23025,  2   },  -- Blink Cooldown Reduction
	[11113] = { 37439,  4   },  -- Cooldown Reduction - Blast Wave
	[45438] = { 37439,  40  },  -- Cooldown Reduction - Ice Block
	[12043] = { 37439,  24  },  -- Cooldown Reduction - Presence of Mind
	[12051] = { 28763,  60  },  -- Evocation
	-- Paladin
	[20216] = { 37183,  15  },  -- Divine Favor Cooldown
	[853]   = { 23302,  10  },  -- Hammer of Justice Cooldown Reduction
	[633]   = { 28774,  720 },  -- Lay Hands
	[31789] = { 37181,  2   },  -- Reduced Righteous Defense Cooldown
	-- Priest
	[586]   = { 18388,  2   },  -- Quick Fade (Item equip bonus)
	[8122]  = { 44297,  3   },  -- Improved Psychic Scream (Item equip bonus)
	-- Rogue
	[2094]  = { 24469,  5   },  -- Improved Blind
	[5277]  = { 26112,  60  },  -- Deathdealer Evasion Bonus
	[1776]  = { 23048,  1   },  -- Gouge Cooldown Reduction
	[1766]  = { 24434,  0.5 },  -- Improved Kick (Item equip bonus)
	[1856]  = { -- Vanish
		{ 21874,    30  },  -- Improved Vanish
		{ 14064,    60  },  -- Vanish Cooldown Reduction -- TODO: Where is this from ???
	},
	-- Shaman
	[8177]  = { 44299,  1.5 },  -- Improved Grounding Totem
	[16188] = { -- Nature's Swiftness
		{ 37211,    24  },  -- Improved Nature's Swiftness
		{ 38466,    24  },  -- Nature's Swiftness Cooldown Reduction
		{ 38499,    24  },  -- Nature's Swiftness Cooldown Reduction
	},
	[20608] = { 27797,  600 },  -- Reduced Reincarnation Cooldown (Item equip bonus)
	[17364] = { 33018,  1   },  -- Shaman Stormstrike Cooldown Reduction (Rank 1)
	-- Warrior
	[20252] = { 22738,  5   },  -- Intercept Cooldown Reduction
	[5246]  = { 24456,  15  },  -- improved Intimidating Shout
}

local itemBonusMult = {
	-- Druid
	[16914] = { 23556,  .50 },  -- Hurricane        Decreased Tranquility and Hurricane Cooldown
	[740]   = { 23556,  .50 },  -- Tranquility      Decreased Tranquility and Hurricane Cooldown
	-- Warlock
	[6789]  = { 24487,  .85 },  -- Death Coil       Improved Death Coil
}

local function MergeTable(src, dest)
	for id, t in pairs(src) do
		dest[id] = dest[id] or {}
		if type(t[1]) == "table" then
			for i = 1, #t do
				v = t[i]
				tinsert(dest[id], v)
			end
		else
			tinsert(dest[id], t)
		end
	end
end
MergeTable(itemBonus, E.spell_cdmod_talents)
MergeTable(itemBonusMult, E.spell_cdmod_talents_mult)
itemBonus = nil
itemBonusMult = nil


------------------------------------------------------------------------------------
-- Cooldowns

-- Shared cooldowns
E.spell_linked = {
	[1499]  = { nil,    1499,   13813,  13795,  13809,  34600   },  -- Freezing Trap (Rank 1)
	[13813] = { nil,    1499,   13813,  13795,  13809,  34600   },  -- Explosive Trap (Rank 1)
	[13795] = { nil,    1499,   13813,  13795,  13809,  34600   },  -- Immolation Trap (Rank 1)
	[13809] = { nil,    1499,   13813,  13795,  13809,  34600   },  -- Frost Trap
	[34600] = { nil,    1499,   13813,  13795,  13809,  34600   },  -- Snake Trap
	[543]   = { nil,    543,    6143    },  -- Fire Ward (Rank 1)
	[6143]  = { nil,    543,    6143    },  -- Frost Ward (Rank 1)
	[498]   = { nil,    498,    642     },  -- Divine Protection (Rank 1)
	[642]   = { nil,    498,    642     },  -- Divine Shield (Rank 1)
	[2878]  = { nil,    2878,   10326   },  -- Turn Undead (Rank 1)
	[10326] = { nil,    2878,   10326   },  -- Turn Evil
	[8042]  = { nil,    8042,   8050,   8056    },  -- Earth Shock (Rank 1) -- diff spell-types
	[8050]  = { nil,    8042,   8050,   8056    },  -- Flame Shock (Rank 1)
	[8056]  = { nil,    8042,   8050,   8056    },  -- Frost Shock (Rank 1)
	[2894]  = { 120,    2894,   2062    },  -- Fire Elemetal Totem
	[2062]  = { 120,    2894,   2062    },  -- Earth Elemental Totem
}

E.spell_merged = {
	-- Shaman
	[32182] = 2825,     -- Heroism
	-- Racial
	[33697] = 20572,    -- Blood Fury (Shaman)
	[33702] = 20572,    -- Blood Fury (Warlock)
	[20554] = 26297,    -- Berserking (Mana: Hunter, Priest, Shaman, Mage)
	[26296] = 26297,    -- Berserking (Rage: Warrior)
	[25046] = 28730,    -- Arcane Torrent (Rogue)
}

local spellRanks = {    -- Duplicate names* are ok for non-talents
	-- Druid
	{5211,  6798,   8983    },  -- Bash
	{8998,  9000,   9892,   31709,  27004   },  -- Cower
	{1850,  9821,   33357   },  -- Dash
	{16914, 17401,  17402,  27012   },  -- Hurricane
	{22842, 22895,  22896,  26999   },  -- Frenzied Regeneration
	{33878, 33986,  33987   },  -- Mangle
	{5215,  6783,   9913    },  -- Prowl
	{20484, 20739,  20742,  20747,  20748,  26994   },  -- Rebirth
	{740,   8918,   9862,   9863,   26983   },  -- Tranquility
	-- Hunter
	{3044,  14281,  14282,  14283,  14284,  14285,  14286,  14287,  27019   },  -- Arcane Shot
	{781,   14272,  14273,  27015   },  -- Disengage
	{20736, 14274,  15629,  15630,  15631,  15632,  27020   },  -- Distracting Shot
	{13813, 14316,  14317,  27025   },  -- Explosive Trap
	{1499,  14310,  14311   },  -- Freezing Trap
	{13795, 14302,  14303,  14304,  14305,  27023   },  -- Immolation Trap
	{1495,  14269,  14270,  14271,  36916   },  -- Mongoose Bite
	{2643,  14288,  14289,  14290,  25294,  27021   },  -- Multi-Shot
	{2973,  14260,  14261,  14262,  14263,  14264,  14265,  14266,  27014   },  -- Raptor Strike
	{1513,  14326,  14327   },  -- Scare Beast
	{3034,  14279,  14280,  27018   },  -- Viper Sting
	{1510,  14294,  14295,  27022   },  -- Volley
	-- Hunter Pet
	{1742,  1753,   1754,   1755,   1756,   16697,  27048   },  -- Cower*
	{2649,  14916,  14917,  14918,  14919,  14920,  14921,  27047   },  -- Growl
	{7371,  26177,  26178,  26179,  26201,  27685   },  -- Charge*
	{17253, 17255,  17256,  17257,  17258,  17259,  17260,  17261,  27050   },  -- Bite
	{23099, 23109,  23110   },  -- Dash*
	{23145, 23147,  23148   },  -- Dive*
	{24450, 24452,  24453   },  -- Prowl*
	{24640, 24583,  24586,  24587,  27060   },  -- Scorpid Poison
	{24604, 24605,  24603,  24597   },  -- Furious Howl
	{26090, 26187,  26188,  27063   },  -- Thunderstomp
	{34889, 35323   },  -- Fire Breath
	{35387, 35389,  35392   },  -- Poison Spit
	-- Mage
	{120,   8492,   10159,  10160,  10161,  27087   },  -- Cone of Cold
	{543,   8457,   8458,   10223,  10225,  27128   },  -- Fire Ward
	{2136,  2137,   2138,   8412,   8413,   10197,  10199,  27078,  27079   },  -- Fire Blast
	{122,   865,    6131,   10230,  27088   },  -- Frost Nova
	{6143,  8461,   8462,   10177,  28609,  32796   },  -- Frost Ward
	-- Paladin
	{6940,  20729,  27147,  27148   },  -- Blessing of Sacrifice
	{1022,  5599,   10278   },  -- Blessing of Protection
	{26573, 20116,  20922,  20923,  20924,  27173   },  -- Consecration
	{642,   1020    },  -- Divine Shield
	{498,   5573    },  -- Divine Protection
	{879,   5614,   5615,   10312,  10313,  10314,  27138   },  -- Exorcism
	{853,   5588,   5589,   10308   },  -- Hammer of Justice
	{24275, 24274,  24239,  27180   },  -- Hammer of Wrath
	{2812,  10318,  27139   },  -- Holy Wrath
	{633,   2800,   10310,  27154   },  -- Lay on Hands
	{2878,  5627    },  -- Turn Undead
	-- Priest
	{44041, 44043,  44044,  44045,  44046,  44047   },  -- Chastise
	{13908, 19236,  19238,  19240,  19241,  19242,  19243,  25437   },  -- Desperate Prayer
	{2944,  19276,  19277,  19278,  19279,  19280,  25467   },  -- Devouring Plague
	{586,   9578,   9579,   9592,   10941,  10942,  25429   },  -- Fade
	{13896, 19271,  19273,  19274,  19275,  25441   },  -- Feedback
	{8092,  8102,   8103,   8104,   8105,   8106,   10945,  10946,  10947,  25372,  25375   },  -- Mind Blast
	{17,    592,    600,    3747,   6065,   6066,   10898,  10899,  10900,  10901,  25217,  25218   },  -- Power Word: Shield
	{8122,  8124,   10888,  10890   },  -- Psychic Scream
	{32379, 32996   },  -- Shadow Word: Death
	{10797, 19296,  19299,  19302,  19303,  19304,  19305,  25446   },  -- Starshards
	-- Rogue
	{5277,  26669   },  -- Evasion
	{1966,  6768,   8637,   11303,  25302,  27448   },  -- Feint
	{1776,  1777,   8629,   11285,  11286,  38764   },  -- Gouge
	{1766,  1767,   1768,   1769,   38768   },  -- Kick
	{408,   8643    },  -- Kidney Shot
	{2983,  8696,   11305   },  -- Sprint
	{1784,  1785,   1786,   1787    },  -- Stealth
	{1856,  1857,   26889   },  -- Vanish
	-- Shaman
	{421,   930,    2860,   10605,  25439,  25442   },  -- Chain Lightning
	{8042,  8044,   8045,   8046,   10412,  10413,  10414,  25454   },  -- Earth Shock
	{1535,  8498,   8499,   11314,  11315,  25546,  25547   },  -- Fire Nova Totem
	{8050,  8052,   8053,   10447,  10448,  29228,  25457   },  -- Flame Shock
	{8056,  8058,   10472,  10473,  25464   },  -- Frost Shock (Rank 5)
	{5730,  6390,   6391,   6392,   10427,  10428,  25525   },  -- Stoneclaw Totem
	-- Warlock
	{603,   30910   },  -- Curse of Doom
	{6789,  17925,  17926,  27223   },  -- Death Coil
	{5484,  17928   },  -- Howl of Terror
	{6229,  11739,  11740,  28610   },  -- Shadow Ward
	{6353,  17924,  27211,  30545   },  -- Soul Fire
	{20707, 20762,  20763,  20764,  20765,  27239}, -- Soulstone Resurrection
	-- Warlock Pet
	{19244, 19647   },  -- Spell Lock
	{19505, 19731,  19734,  19736,  27276,  27277   },  -- Devour Magic
	{17735, 17750,  17751,  17752,  27271,  33701   },  -- Suffering
	{7814,  7815,   7816,   11778,  11779,  11780,  27274   },  -- Lash of Pain
	{6360,  7813,   11784,  11785,  27275   },  -- Soothing Kiss
	{3716,  7809,   7810,   7811,   11774,  11775,  27270   },  -- Torment
	-- Warrior
	{100,   6178,   11578   },  -- Charge
	{20252, 20616,  20617,  25272,  25275   },  -- Intercept
	{694,   7400,   7402,   20559,  20560,  25266   },  -- Mocking Blow
	{7384,  7887,   11584,  11585   },  -- Overpower
	{6552,  6554    },  -- Pummel
	{6572,  6574,   7379,   11600,  11601,  25288,  25269,  30357   },  -- Revenge
	{72,    1671,   1672,   29704   },  -- Shield Bash
	{6343,  8198,   8204,   8205,   11580,  11581,  25264   },  -- Thunder Clap
}

local talentRanks = {
	-- Druid
	{16979  },  -- Feral Charge
	{33831  },  -- Force of Nature
	{17116  },  -- Nature's Swiftness
	{18562  },  -- Swiftmend
	{16857, 17390,  17391,  17392,  27011   },  -- Faerie Fire
	{16689, 16810,  16811,  16812,  16813,  17329,  27009   },  -- Nature's Grasp
	-- Hunter
	{19574  },  -- Bestial Wrath
	{19263  },  -- Deterrence
	{19577  },  -- Intimidation
	{23989  },  -- Readiness
	{19503  },  -- Scatter Shot
	{34490  },  -- Silencing Shot
	{19434, 20900,  20901,  20902,  20903,  20904,  27065   },  -- Aimed Shot
	{19306, 20909,  20910,  27067   },  -- Counterattack
	{19386, 24132,  24133,  27068   },  -- Wyvern Sting
	-- Mage
	{12042  },  -- Arcane Power
	{11958  },  -- Cold Snap
	{11129  },  -- Combustion
	{12472  },  -- Icy Veins
	{12043  },  -- Presence of Mind
	{31687  },  -- Summon Water Elemental
	{11113, 13018,  13019,  13020,  13021,  27133,  33933   },  -- Blast Wave
	{31661, 33041,  33042,  33043   },  -- Dragon's Breath
	{11426, 13031,  13032,  13033,  27134,  33405   },  -- Ice Barrier
	-- Paladin
	{35395  },  -- Crusader Strike
	{20216  },  -- Divine Favor
	{31842  },  -- Divine Illumination
	{20066  },  -- Repentance
	{31935, 32699,  32700   },  -- Avenger's Shield
	{20925, 20927,  20928,  27179   },  -- Holy Shield
	{20473, 20929,  20930,  27174,  33072   },  -- Holy Shock
	-- Priest
	{14751  },  -- Inner Focus
	{33206  },  -- Pain Suppression
	{10060  },  -- Power Infusion
	{15473  },  -- Shadowform
	{15487  },  -- Silence
	{15286  },  -- Vampiric Embrace
	{724,   27870,  27871,  28275   },  -- Lightwell
	-- Rogue
	{13750  },  -- Adrenaline Rush
	{13877  },  -- Blade Flurry
	{14177  },  -- Cold Blood
	{14278  },  -- Ghostly Strike
	{14183  },  -- Premeditation
	{14185  },  -- Preparation
	{14251  },  -- Riposte
	{36554  },  -- Shadowstep
	-- Shaman
	{16166  },  -- Elemental Mastery
	{16190  },  -- Mana Tide Totem
	{16188  },  -- Nature's Swiftness*
	{30823  },  -- Shamanistic Rage
	{17364  },  -- Stormstrike
	-- Warlock
	{18288  },  -- Amplify Curse
	{18708  },  -- Fel Domination
	{17962, 18930,  18931,  18932,  27266,  30912   },  -- Conflagrate
	{17877, 18867,  18868,  18869,  18870,  18871,  27263,  30546   },  -- Shadowburn
	{30283, 30413,  30414   },  -- Shadowfury
	-- Warrior
	{12809  },  -- Concussion Blow
	{12292  },  -- Death Wish
	{12975  },  -- Last Stand
	{12328  },  -- Sweeping Strikes
	{23881, 23892,  23893,  23894,  25251,  30335   },  -- Bloodthirst
	{12294, 21551,  21552,  21553,  25248,  30330   },  -- Mortal Strike
	{23922, 23923,  23924,  23925,  25258,  30356   },  -- Shield Slam
}

-- Merge spell ranks
for i = 1, #spellRanks do
	local t = spellRanks[i]
	local rank1 = t[1]
	for j = 2, #t do
		local rankN = t[j]
		E.spell_merged[rankN] = rank1
	end
end

-- Merge talent ranks
for i = 1, #talentRanks do -- check for duplicate names
	local t = talentRanks[i]
	local rank1 = t[1]
	local name = GetSpellInfo(rank1)
	if name then
		for j = 1, #t do
			local talentID = t[j]
			if j > 1 then
				local rankN = t[j]
				E.spell_merged[rankN] = rank1
			end
		end

		local dupe = E.talentNameToRankID[name]
		if dupe then -- nest tbl if it's a duplicate name (only works for duplicate names on different Class)
			if type(dupe[1]) == "table" then
				tinsert(E.talentNameToRankID[name], t)
			else
				E.talentNameToRankID[name] = { dupe, t }
			end
		else
			E.talentNameToRankID[name] = t
		end
	else
		--E.Write("Invalid TalentID: |cffffd200" .. talentID)
	end
end

-- Add rankN to RemoveHighlightByCLEU (dynamically updating icon.buff since we can cast whichever rank at will)
for k in pairs(E.spell_merged) do
	E.spell_highlighted[k] = true
end

E.merged_buff_fix = BLANK

E.spell_updateOnCast = {
	[19244]  = { 24 },  -- Felhunter: Spell Lock (Rank 1)
	[4511]   = { 10 },  -- Imp: Phase Shift
	[7814]   = { 30 },  -- Succubus: Lash of Pain (Rank 1)
	[17735]  = { 120 }, -- Voidwalker: Suffering (Rank 1)
}

for k, v in pairs(E.spell_updateOnCast) do
	if not v[2] then
		local _, icon = GetSpellTexture(k)
		v[2] = icon
	end
end

E.spell_preactive = {
	[17116]  = true,    -- Nature's Swiftness
	[5215]   = true,    -- Prowl (Rank 1)
	[6783]   = true,    -- Prowl (Rank 2)
	[9913]   = true,    -- Prowl (Rank 3)
	[5384]   = true,    -- Feign Death
	[34477]  = true,    -- Misdirection
	[12043]  = true,    -- POM
	[14177]  = true,    -- Cold Blood
	[1784]   = true,    -- Stealth (Rank 1)
	[1785]   = true,    -- Stealth (Rank 2)
	[1786]   = true,    -- Stealth (Rank 3)
	[1787]   = true,    -- Stealth (Rank 4)
	[20216]  = true,    -- Divine Favor
	[16188]  = true,    -- Nature's Swiftness (Shaman)
	[18288]  = true,    -- Amplify Curse
	[20580]  = true,    -- Shadowmeld
}

E.spell_sharedCDwTrinkets = BLANK

E.spell_noReset = {
	[20608] = true, -- Reincarnation
}

E.cd_reset_cast = {
	[23989] = { -- Readiness
		nil,
		"*",
	},
	[11958] = { -- Cold Snap
		nil,
		45438,  -- Ice Block
		11426,  -- Ice Barrier
		120,    -- Cone of Cold
		122,    -- Frost Nova
		12472,  -- Icy Veins
		6143,   -- Frost Ward
	},
	[14185] = { -- Preparation
		nil,
		5277,   -- Evasion
		2983,   -- Sprint
		1856,   -- Vanish
		14177,  -- Cold Blood
		36554,  -- Shadowstep
		14183,  -- Premeditation
	},
}

E.cd_reduce_cast = BLANK
E.cd_reduce_powerSpenders = BLANK

for id in E.pairs(E.spell_linked, E.spell_merged, E.spell_sharedCDwTrinkets, E.cd_reset_cast, E.cd_reduce_cast, E.cd_reduce_powerSpenders) do
	E.spell_modifiers[id] = true
end

------------------------------------------------------------------------------------
-- Sync

E.spell_cdmod_powerSpent = BLANK

------------------------------------------------------------------------------------
-- CLEU (incl all ranks)

E.aura_free_spender = BLANK

E.cd_start_aura_removed = {
	[17116]  = 17116,   -- Nature's Swiftness
	[5215]   = 5215,    -- Prowl (Rank 1)
	[6783]   = 5215,    -- Prowl (Rank 2)
	[9913]   = 5215,    -- Prowl (Rank 3)
	[34477]  = 34477,   -- Misdirection
	[12043]  = 12043,   -- POM
	[14177]  = 14177,   -- Cold Blood
	[1784]   = 1784,    -- Stealth (Rank 1)
	[1785]   = 1784,    -- Stealth (Rank 2)
	[1786]   = 1784,    -- Stealth (Rank 3)
	[1787]   = 1784,    -- Stealth (Rank 4)
	[20216]  = 20216,   -- Divine Favor
	[16188]  = 16188,   -- Nature's Swiftness (Shaman)
	[18288]  = 18288,   -- Amplify Curse
	-- Feign Death done in unit_aura
	[20580]  = 20580,   -- Shadowmeld
}

E.processSpell_aura_applied = BLANK
E.cd_start_dispels = BLANK

E.cd_disable_aura_applied = {
	[25771] = { -- Forbearance
		[1022]  = 1,    -- Blessing of Protection (Rank 1)
		[5599]  = 1,    -- Blessing of Protection (Rank 2)
		[10278] = 1,    -- Blessing of Protection (Rank 3)
		[498]   = true, -- Divine Protection (Rank 1)
		[5573]  = true, -- Divine Protection (Rank 2)
		[642]   = true, -- Divine Shield (Rank 1)
		[1020]  = true, -- Divine Shield (Rank 2)
		[31884] = true, -- Avenging Wrath
	},
	-- Hypothermia --> baked in ResetCooldown
}

E.selfLimitedMinMaxReducer = BLANK
E.cd_reduce_damage_totem = BLANK
E.cd_reduce_damage_pet = BLANK
E.cd_reduce_damage = BLANK
E.cd_reduce_energize = BLANK
E.cd_reduce_interrupts = BLANK

E.runeforge_bonusToDescID = BLANK
E.runeforge_specID = BLANK
E.runeforge_descToPowerID = BLANK
E.covenant_IDToSpellID = BLANK
E.covenant_abilities = BLANK
E.spell_benevolentFaeMajorCD = BLANK
E.covenant_cdmod_conduits = BLANK
E.covenant_chmod_conduits = BLANK
E.covenant_cdmod_items_mult = BLANK
E.soulbind_conduits_rank = BLANK
E.spell_cdmod_conduits = BLANK
E.spell_cdmod_conduits_mult = BLANK
E.spell_symbolOfHopeMajorCD = BLANK
E.spell_majorCD = BLANK

------------------------------------------------------------------------------------
-- Inspect

E.item_merged = {
	-- PvP Trinket: item - Medallion of the Alliance
	[37865] = 37864,    -- Medallion of the Horde
	[28235] = 37864,    -- Medallion of the Alliance (Druid)
	[30348] = 37864,    -- Medallion of the Alliance (Warlock)
	[28238] = 37864,    -- Medallion of the Alliance (Mage)
	[30351] = 37864,    -- Medallion of the Alliance (Shaman)
	[28236] = 37864,    -- Medallion of the Alliance (Paladin)
	[30349] = 37864,    -- Medallion of the Alliance (Priest)
	[28234] = 37864,    -- Medallion of the Alliance (Rogue)
	[28237] = 37864,    -- Medallion of the Alliance (Hunter)
	[30350] = 37864,    -- Medallion of the Alliance (Warrior)
	[28240] = 37864,    -- Medallion of the Horde (Rogue)
	[28243] = 37864,    -- Medallion of the Horde (Hunter)
	[30345] = 37864,    -- Medallion of the Horde (Shaman)
	[28241] = 37864,    -- Medallion of the Horde (Druid)
	[30343] = 37864,    -- Medallion of the Horde (Warlock)
	[28239] = 37864,    -- Medallion of the Horde (Mage)
	[30346] = 37864,    -- Medallion of the Horde (Priest)
	[28242] = 37864,    -- Medallion of the Horde (Paladin)
	[30344] = 37864,    -- Medallion of the Horde (Warrior)
	[33046] = 37864,    -- Insignia of PvP Pwn
	-- PvP Trinket: item2 - Insignia of the Alliance (Mage)
	[29593] = 18859,    -- Insignia of the Alliance (Shaman)
	[18857] = 18859,    -- Insignia of the Alliance (Rogue)
	[18864] = 18859,    -- Insignia of the Alliance (Paladin)
	[18854] = 18859,    -- Insignia of the Alliance (Warrior)
	[18862] = 18859,    -- Insignia of the Alliance (Priest)
	[18858] = 18859,    -- Insignia of the Alliance (Warlock)
	[18856] = 18859,    -- Insignia of the Alliance (Hunter)
	[18863] = 18859,    -- Insignia of the Alliance (Druid)
	[18850] = 18859,    -- Insignia of the Horde (Mage)
	[18845] = 18859,    -- Insignia of the Horde (Shaman)
	[18849] = 18859,    -- Insignia of the Horde (Rogue)
	[29592] = 18859,    -- Insignia of the Horde (Paladin)
	[18834] = 18859,    -- Insignia of the Horde (Warrior)
	[18851] = 18859,    -- Insignia of the Horde (Priest)
	[18852] = 18859,    -- Insignia of the Horde (Warlock)
	[18846] = 18859,    -- Insignia of the Horde (Hunter)
	[18853] = 18859,    -- Insignia of the Horde (Druid)
	-- Trinket: item - Battlemaster's Perseverance
	[34049] = 34050,    -- Battlemaster's Determination
	[34578] = 34050,    -- Battlemaster's Determination
	[34163] = 34050,    -- Battlemaster's Cruelty
	[34579] = 34050,    -- Battlemaster's Audacity
	[33832] = 34050,    -- Battlemaster's Determination
	[34576] = 34050,    -- Battlemaster's Cruelty
	[35326] = 34050,    -- Battlemaster's Alacrity
	[34580] = 34050,    -- Battlemaster's Perseverance
	[35327] = 34050,    -- Battlemaster's Alacrity
	[34162] = 34050,    -- Battlemaster's Depravity
	[34577] = 34050,    -- Battlemaster's Depravity
}

E.item_equipBonus = {
	[19617] = 24434,    -- Zandalarian Shadow Mastery Talisman
	[14154] = 18388,    -- Truefaith Vestments
	[35053] = 44297,    -- Brutal Gladiator's Mooncloth Gloves
	[35083] = 44297,    -- Brutal Gladiator's Satin Gloves
	[33717] = 44297,    -- Vengeful Gladiator's Mooncloth Gloves
	[33744] = 44297,    -- Vengeful Gladiator's Satin Gloves
	[22345] = 20608,    -- Totem of Rebirth
	[19621] = 24432,    -- Maelstrom's Wrath
}

E.item_setBonus = { -- [item] = {bonusID, required num of set items}
	-- Druid
	[16828] = { 23556,  8   },  -- Cenarion Belt
	[16829] = { 23556,  8   },  -- Cenarion Boots
	[16830] = { 23556,  8   },  -- Cenarion Bracers
	[16833] = { 23556,  8   },  -- Cenarion Vestments
	[16831] = { 23556,  8   },  -- Cenarion Gloves
	[16834] = { 23556,  8   },  -- Cenarion Helm
	[16835] = { 23556,  8   },  -- Cenarion Leggings
	[16836] = { 23556,  8   },  -- Cenarion Spaulders
	[29087] = { 37292,  4   },  -- Chestguard of Malorne
	[29086] = { 37292,  4   },  -- Crown of Malorne
	[29090] = { 37292,  4   },  -- Handguards of Malorne
	[29088] = { 37292,  4   },  -- Legguards of Malorne
	[29089] = { 37292,  4   },  -- Shoulderguards of Malorne
	[31041] = { 38417,  2   },  -- Thunderheart Tunic
	[31032] = { 38417,  2   },  -- Thunderheart Gloves
	[31037] = { 38417,  2   },  -- Thunderheart Helmet
	[31045] = { 38417,  2   },  -- Thunderheart Legguards
	[31047] = { 38417,  2   },  -- Thunderheart Spaulders
	[34571] = { 38417,  2   },  -- Thunderheart Boots
	[34445] = { 38417,  2   },  -- Thunderheart Bracers
	[34554] = { 38417,  2   },  -- Thunderheart Belt
	[21355] = { 26106,  5   },  -- Genesis Boots
	[21353] = { 26106,  5   },  -- Genesis Helm
	[21354] = { 26106,  5   },  -- Genesis Shoulderpads
	[21356] = { 26106,  5   },  -- Genesis Trousers
	[21357] = { 26106,  5   },  -- Genesis Vest
	[29093] = { 37297,  4   },  -- Antlers of Malorne
	[29094] = { 37297,  4   },  -- Britches of Malorne
	[29091] = { 37297,  4   },  -- Chestpiece of Malorne
	[29092] = { 37297,  4   },  -- Gloves of Malorne
	[29095] = { 37297,  4   },  -- Pauldrons of Malorne
	-- Hunter
	[28228] = { 37481,  2   },  -- Beast Lord Cuirass
	[27474] = { 37481,  2   },  -- Beast Lord Handguards
	[28275] = { 37481,  2   },  -- Beast Lord Helm
	[27874] = { 37481,  2   },  -- Beast Lord Leggings
	[27801] = { 37481,  2   },  -- Beast Lord Mantle
	[28334] = { 44292,  4   },  -- Gladiator's Chain Armor
	[28335] = { 44292,  4   },  -- Gladiator's Chain Gauntlets
	[28331] = { 44292,  4   },  -- Gladiator's Chain Helm
	[28332] = { 44292,  4   },  -- Gladiator's Chain Leggings
	[28333] = { 44292,  4   },  -- Gladiator's Chain Spaulders
	--[[
--  [21366] = { 26174,  5   },  -- Striker's Diadem
--  [21365] = { 26174,  5   },  -- Striker's Footguards
--  [21370] = { 26174,  5   },  -- Striker's Hauberk
--  [21368] = { 26174,  5   },  -- Striker's Leggings
--  [21367] = { 26174,  5   },  -- Striker's Pauldrons
	--]]
	[19621] = { 24465,  3   },  -- Maelstrom's Wrath
	[19953] = { 24465,  3   },  -- Renataki's Charm of Beasts
	[19833] = { 24465,  3   },  -- Zandalar Predator's Bracers
	[19832] = { 24465,  3   },  -- Zandalar Predator's Belt
	[19831] = { 24465,  3   },  -- Zandalar Predator's Mantle
	[28613] = { 23158,  4   },  -- Grand Marshal's Chain Armor
	[28614] = { 23158,  4   },  -- Grand Marshal's Chain Gauntlets
	[28615] = { 23158,  4   },  -- Grand Marshal's Chain Helm
	[28616] = { 23158,  4   },  -- Grand Marshal's Chain Leggings
	[28617] = { 23158,  4   },  -- Grand Marshal's Chain Spaulders
	[28805] = { 23158,  4   },  -- High Warlord's Chain Armor
	[28806] = { 23158,  4   },  -- High Warlord's Chain Gauntlets
	[28807] = { 23158,  4   },  -- High Warlord's Chain Helm
	[28808] = { 23158,  4   },  -- High Warlord's Chain Leggings
	[28809] = { 23158,  4   },  -- High Warlord's Chain Spaulders
	[35376] = { 23158,  4   },  -- Stalker's Chain Armor
	[35377] = { 23158,  4   },  -- Stalker's Chain Gauntlets
	[35378] = { 23158,  4   },  -- Stalker's Chain Helm
	[35379] = { 23158,  4   },  -- Stalker's Chain Leggings
	[35380] = { 23158,  4   },  -- Stalker's Chain Spaulders
	[16466] = { 23158,  3   },  -- Field Marshal's Chain Breastplate
	[16465] = { 23158,  3   },  -- Field Marshal's Chain Helm
	[16468] = { 23158,  3   },  -- Field Marshal's Chain Spaulders
	[16462] = { 23158,  3   },  -- Marshal's Chain Boots
	[16463] = { 23158,  3   },  -- Marshal's Chain Grips
	[16467] = { 23158,  3   },  -- Marshal's Chain Legguards
	[16569] = { 23158,  3   },  -- General's Chain Boots
	[16571] = { 23158,  3   },  -- General's Chain Gloves
	[16567] = { 23158,  3   },  -- General's Chain Legguards
	[16565] = { 23158,  3   },  -- Warlord's Chain Chestpiece
	[16566] = { 23158,  3   },  -- Warlord's Chain Helmet
	[16568] = { 23158,  3   },  -- Warlord's Chain Shoulders
	[22843] = { 23158,  4   },  -- Blood Guard's Chain Greaves
	[22862] = { 23158,  4   },  -- Blood Guard's Chain Vices
	[23251] = { 23158,  4   },  -- Champion's Chain Helm
	[23252] = { 23158,  4   },  -- Champion's Chain Shoulders
	[22874] = { 23158,  4   },  -- Legionnaire's Chain Hauberk
	[22875] = { 23158,  4   },  -- Legionnaire's Chain Legguards
	[23292] = { 23158,  4   },  -- Knight-Captain's Chain Hauberk
	[23293] = { 23158,  4   },  -- Knight-Captain's Chain Legguards
	[23278] = { 23158,  4   },  -- Knight-Lieutenant's Chain Greaves
	[23279] = { 23158,  4   },  -- Knight-Lieutenant's Chain Vices
	[23306] = { 23158,  4   },  -- Lieutenant Commander's Chain Helm
	[23307] = { 23158,  4   },  -- Lieutenant Commander's Chain Shoulders
	[16531] = { 23158,  4   },  -- Blood Guard's Chain Boots
	[16530] = { 23158,  4   },  -- Blood Guard's Chain Gauntlets
	[16525] = { 23158,  4   },  -- Blood Guard's Chain Breastplate
	[16527] = { 23158,  4   },  -- Legionnaire's Chain Leggings
	[16526] = { 23158,  4   },  -- Champion's Chain Headguard
	[16528] = { 23158,  4   },  -- Champion's Chain Pauldrons
	[16425] = { 23158,  4   },  -- Knight-Captain's Chain Hauberk
	[16426] = { 23158,  4   },  -- Knight-Captain's Chain Leggings
	[16401] = { 23158,  4   },  -- Knight-Lieutenant's Chain Boots
	[16403] = { 23158,  4   },  -- Knight-Lieutenant's Chain Gauntlets
	[16428] = { 23158,  4   },  -- Lieutenant Commander's Chain Helmet
	[16427] = { 23158,  4   },  -- Lieutenant Commander's Chain Pauldrons
	-- Mage
	[35343] = { 23025,  4   },  -- Evoker's Silk Amice
	[35344] = { 23025,  4   },  -- Evoker's Silk Cowl
	[35345] = { 23025,  4   },  -- Evoker's Silk Handguards
	[35346] = { 23025,  4   },  -- Evoker's Silk Raiment
	[35347] = { 23025,  4   },  -- Evoker's Silk Trousers
	[28714] = { 23025,  4   },  -- Grand Marshal's Silk Amice
	[28715] = { 23025,  4   },  -- Grand Marshal's Silk Cowl
	[28716] = { 23025,  4   },  -- Grand Marshal's Silk Handguards
	[28717] = { 23025,  4   },  -- Grand Marshal's Silk Raiment
	[28718] = { 23025,  4   },  -- Grand Marshal's Silk Trousers
	[28866] = { 23025,  4   },  -- High Warlord's Silk Amice
	[28867] = { 23025,  4   },  -- High Warlord's Silk Cowl
	[28868] = { 23025,  4   },  -- High Warlord's Silk Handguards
	[28869] = { 23025,  4   },  -- High Warlord's Silk Raiment
	[28870] = { 23025,  4   },  -- High Warlord's Silk Trousers
	[16441] = { 23025,  3   },  -- Field Marshal's Coronet
	[16444] = { 23025,  3   },  -- Field Marshal's Silk Spaulders
	[16443] = { 23025,  3   },  -- Field Marshal's Silk Vestments
	[16437] = { 23025,  3   },  -- Marshal's Silk Footwraps
	[16440] = { 23025,  3   },  -- Marshal's Silk Gloves
	[16442] = { 23025,  3   },  -- Marshal's Silk Leggings
	[16536] = { 23025,  3   },  -- Warlord's Silk Amice
	[16533] = { 23025,  3   },  -- Warlord's Silk Cowl
	[16535] = { 23025,  3   },  -- Warlord's Silk Raiment
	[16539] = { 23025,  3   },  -- General's Silk Boots
	[16540] = { 23025,  3   },  -- General's Silk Handguards
	[16534] = { 23025,  3   },  -- General's Silk Trousers
	[22870] = { 23025,  4   },  -- Blood Guard's Silk Handwraps
	[22860] = { 23025,  4   },  -- Blood Guard's Silk Walkers
	[23263] = { 23025,  4   },  -- Champion's Silk Cowl
	[23264] = { 23025,  4   },  -- Champion's Silk Mantle
	[22883] = { 23025,  4   },  -- Legionnaire's Silk Legguards
	[22886] = { 23025,  4   },  -- Legionnaire's Silk Tunic
	[23304] = { 23025,  4   },  -- Knight-Captain's Silk Legguards
	[23305] = { 23025,  4   },  -- Knight-Captain's Silk Tunic
	[23290] = { 23025,  4   },  -- Knight-Lieutenant's Silk Handwraps
	[23291] = { 23025,  4   },  -- Knight-Lieutenant's Silk Walkers
	[23318] = { 23025,  4   },  -- Lieutenant Commander's Silk Cowl
	[23319] = { 23025,  4   },  -- Lieutenant Commander's Silk Mantle
	[16485] = { 23025,  4   },  -- Blood Guard's Silk Footwraps
	[16487] = { 23025,  4   },  -- Blood Guard's Silk Gloves
	[16491] = { 23025,  4   },  -- Legionnaire's Silk Robes
	[16490] = { 23025,  4   },  -- Legionnaire's Silk Pants
	[16489] = { 23025,  4   },  -- Champion's Silk Hood
	[16492] = { 23025,  4   },  -- Champion's Silk Shoulderpads
	[16369] = { 23025,  4   },  -- Knight-Lieutenant's Silk Boots
	[16391] = { 23025,  4   },  -- Knight-Lieutenant's Silk Gloves
	[16413] = { 23025,  4   },  -- Knight-Captain's Silk Raiment
	[16414] = { 23025,  4   },  -- Knight-Captain's Silk Leggings
	[16416] = { 23025,  4   },  -- Lieutenant Commander's Crown
	[16415] = { 23025,  4   },  -- Lieutenant Commander's Silk Spaulders
	[29076] = { 37439,  4   },  -- Collar of the Aldor
	[29080] = { 37439,  4   },  -- Gloves of the Aldor
	[29078] = { 37439,  4   },  -- Legwraps of the Aldor
	[29079] = { 37439,  4   },  -- Pauldrons of the Aldor
	[29077] = { 37439,  4   },  -- Vestments of the Aldor
	[22502] = { 28763,  2   },  -- Frostfire Belt
	[22503] = { 28763,  2   },  -- Frostfire Bindings
	[22498] = { 28763,  2   },  -- Frostfire Circlet
	[22501] = { 28763,  2   },  -- Frostfire Gloves
	[22497] = { 28763,  2   },  -- Frostfire Leggings
	[22496] = { 28763,  2   },  -- Frostfire Robe
	[22500] = { 28763,  2   },  -- Frostfire Sandals
	[22499] = { 28763,  2   },  -- Frostfire Shoulderpads
	[23062] = { 28763,  2   },  -- Frostfire Ring
	-- Paladin
	[22430] = { 28774,  4   },  -- Redemption Boots
	[22431] = { 28774,  4   },  -- Redemption Girdle
	[22426] = { 28774,  4   },  -- Redemption Handguards
	[22428] = { 28774,  4   },  -- Redemption Headpiece
	[22427] = { 28774,  4   },  -- Redemption Legguards
	[22429] = { 28774,  4   },  -- Redemption Spaulders
	[22425] = { 28774,  4   },  -- Redemption Tunic
	[22424] = { 28774,  4   },  -- Redemption Wristguards
	[23066] = { 28774,  4   },  -- Ring of Redemption
	[27702] = { 23302,  4   },  -- Gladiator's Lamellar Chestpiece
	[27703] = { 23302,  4   },  -- Gladiator's Lamellar Gauntlets
	[27704] = { 23302,  4   },  -- Gladiator's Lamellar Helm
	[27705] = { 23302,  4   },  -- Gladiator's Lamellar Legguards
	[27706] = { 23302,  4   },  -- Gladiator's Lamellar Shoulders
	[27879] = { 23302,  4   },  -- Gladiator's Scaled Chestpiece
	[27880] = { 23302,  4   },  -- Gladiator's Scaled Gauntlets
	[27881] = { 23302,  4   },  -- Gladiator's Scaled Helm
	[27882] = { 23302,  4   },  -- Gladiator's Scaled Legguards
	[27883] = { 23302,  4   },  -- Gladiator's Scaled Shoulders
	[35402] = { 23302,  4   },  -- Crusader's Ornamented Chestplate
	[35403] = { 23302,  4   },  -- Crusader's Ornamented Gloves
	[35404] = { 23302,  4   },  -- Crusader's Ornamented Headguard
	[35405] = { 23302,  4   },  -- Crusader's Ornamented Leggings
	[35406] = { 23302,  4   },  -- Crusader's Ornamented Spaulders
	[35476] = { 23302,  4   },  -- Crusader's Ornamented Spaulders (H)
	[35412] = { 23302,  4   },  -- Crusader's Scaled Chestpiece
	[35413] = { 23302,  4   },  -- Crusader's Scaled Gauntlets
	[35477] = { 23302,  4   },  -- Crusader's Scaled Gauntlets (H)
	[35414] = { 23302,  4   },  -- Crusader's Scaled Helm
	[35415] = { 23302,  4   },  -- Crusader's Scaled Legguards
	[35416] = { 23302,  4   },  -- Crusader's Scaled Shoulders
	[28679] = { 23302,  4   },  -- Grand Marshal's Lamellar Chestpiece
	[28680] = { 23302,  4   },  -- Grand Marshal's Lamellar Gauntlets
	[28681] = { 23302,  4   },  -- Grand Marshal's Lamellar Helm
	[28724] = { 23302,  4   },  -- Grand Marshal's Lamellar Legguards
	[28683] = { 23302,  4   },  -- Grand Marshal's Lamellar Shoulders
	[28709] = { 23302,  4   },  -- Grand Marshal's Scaled Chestpiece
	[28710] = { 23302,  4   },  -- Grand Marshal's Scaled Gauntlets
	[28711] = { 23302,  4   },  -- Grand Marshal's Scaled Helm
	[28712] = { 23302,  4   },  -- Grand Marshal's Scaled Legguards
	[28713] = { 23302,  4   },  -- Grand Marshal's Scaled Shoulders
	[28831] = { 23302,  4   },  -- High Warlord's Lamellar Chestpiece
	[28832] = { 23302,  4   },  -- High Warlord's Lamellar Gauntlets
	[28833] = { 23302,  4   },  -- High Warlord's Lamellar Helm
	[28834] = { 23302,  4   },  -- High Warlord's Lamellar Legguards
	[28835] = { 23302,  4   },  -- High Warlord's Lamellar Shoulders
	[28861] = { 23302,  4   },  -- High Warlord's Scaled Chestpiece
	[28862] = { 23302,  4   },  -- High Warlord's Scaled Gauntlets
	[28863] = { 23302,  4   },  -- High Warlord's Scaled Helm
	[28864] = { 23302,  4   },  -- High Warlord's Scaled Legguards
	[28865] = { 23302,  4   },  -- High Warlord's Scaled Shoulders
	[16473] = { 23302,  3   },  -- Field Marshal's Lamellar Chestplate
	[16474] = { 23302,  3   },  -- Field Marshal's Lamellar Faceguard
	[16476] = { 23302,  3   },  -- Field Marshal's Lamellar Pauldrons
	[16472] = { 23302,  3   },  -- Marshal's Lamellar Boots
	[16471] = { 23302,  3   },  -- Marshal's Lamellar Gloves
	[16475] = { 23302,  3   },  -- Marshal's Lamellar Legplates
	[29612] = { 23302,  3   },  -- General's Lamellar Boots
	[29613] = { 23302,  3   },  -- General's Lamellar Gloves
	[29614] = { 23302,  3   },  -- General's Lamellar Legplates
	[29615] = { 23302,  3   },  -- Warlord's Lamellar Chestplate
	[29616] = { 23302,  3   },  -- Warlord's Lamellar Faceguard
	[29617] = { 23302,  3   },  -- Warlord's Lamellar Pauldrons
	[29600] = { 23302,  3   },  -- Blood Guard's Lamellar Gauntlets
	[29601] = { 23302,  3   },  -- Blood Guard's Lamellar Sabatons
	[29602] = { 23302,  3   },  -- Legionnaire's Lamellar Breastplate
	[29603] = { 23302,  3   },  -- Legionnaire's Lamellar Leggings
	[29604] = { 23302,  3   },  -- Champion's Lamellar Headguard
	[29605] = { 23302,  3   },  -- Champion's Lamellar Shoulders
	[23272] = { 23302,  4   },  -- Knight-Captain's Lamellar Breastplate
	[23273] = { 23302,  4   },  -- Knight-Captain's Lamellar Leggings
	[23274] = { 23302,  4   },  -- Knight-Lieutenant's Lamellar Gauntlets
	[23275] = { 23302,  4   },  -- Knight-Lieutenant's Lamellar Sabatons
	[23276] = { 23302,  4   },  -- Lieutenant Commander's Lamellar Headguard
	[23277] = { 23302,  4   },  -- Lieutenant Commander's Lamellar Shoulders
	[16410] = { 23302,  4   },  -- Knight-Lieutenant's Lamellar Gauntlets
	[16409] = { 23302,  4   },  -- Knight-Lieutenant's Lamellar Sabatons
	[16433] = { 23302,  4   },  -- Knight-Captain's Lamellar Breastplate
	[16435] = { 23302,  4   },  -- Knight-Captain's Lamellar Leggings
	[16434] = { 23302,  4   },  -- Lieutenant Commander's Lamellar Headguard
	[16436] = { 23302,  4   },  -- Lieutenant Commander's Lamellar Shoulders
	[29062] = { 37183,  4   },  -- Justicar Chestpiece
	[29061] = { 37183,  4   },  -- Justicar Diadem
	[29065] = { 37183,  4   },  -- Justicar Gloves
	[29063] = { 37183,  4   },  -- Justicar Leggings
	[29064] = { 37183,  4   },  -- Justicar Pauldrons
	[28203] = { 37181,  4   },  -- Breastplate of the Righteous
	[27535] = { 37181,  4   },  -- Gauntlets of the Righteous
	[28285] = { 37181,  4   },  -- Helm of the Righteous
	[27839] = { 37181,  4   },  -- Legplates of the Righteous
	[27739] = { 37181,  4   },  -- Spaulders of the Righteous
	-- Rogue
	[28684] = { 23048,  4   },  -- Grand Marshal's Leather Gloves
	[28685] = { 23048,  4   },  -- Grand Marshal's Leather Helm
	[28686] = { 23048,  4   },  -- Grand Marshal's Leather Legguards
	[28687] = { 23048,  4   },  -- Grand Marshal's Leather Spaulders
	[28688] = { 23048,  4   },  -- Grand Marshal's Leather Tunic
	[28836] = { 23048,  4   },  -- High Warlord's Leather Gloves
	[28837] = { 23048,  4   },  -- High Warlord's Leather Helm
	[28838] = { 23048,  4   },  -- High Warlord's Leather Legguards
	[28839] = { 23048,  4   },  -- High Warlord's Leather Spaulders
	[28840] = { 23048,  4   },  -- High Warlord's Leather Tunic
	[35366] = { 23048,  4   },  -- Opportunist's Leather Gloves
	[35367] = { 23048,  4   },  -- Opportunist's Leather Helm
	[35368] = { 23048,  4   },  -- Opportunist's Leather Legguards
	[35369] = { 23048,  4   },  -- Opportunist's Leather Spaulders
	[35370] = { 23048,  4   },  -- Opportunist's Leather Tunic
	[16453] = { 23048,  3   },  -- Field Marshal's Leather Chestpiece
	[16457] = { 23048,  3   },  -- Field Marshal's Leather Epaulets
	[16455] = { 23048,  3   },  -- Field Marshal's Leather Mask
	[16446] = { 23048,  3   },  -- Marshal's Leather Footguards
	[16454] = { 23048,  3   },  -- Marshal's Leather Handgrips
	[16456] = { 23048,  3   },  -- Marshal's Leather Leggings
	[16563] = { 23048,  3   },  -- Warlord's Leather Breastplate
	[16561] = { 23048,  3   },  -- Warlord's Leather Helm
	[16562] = { 23048,  3   },  -- Warlord's Leather Spaulders
	[16564] = { 23048,  3   },  -- General's Leather Legguards
	[16560] = { 23048,  3   },  -- General's Leather Mitts
	[16558] = { 23048,  3   },  -- General's Leather Treads
	[22864] = { 23048,  4   },  -- Blood Guard's Leather Grips
	[22856] = { 23048,  4   },  -- Blood Guard's Leather Walkers
	[22879] = { 23048,  4   },  -- Legionnaire's Leather Chestpiece
	[22880] = { 23048,  4   },  -- Legionnaire's Leather Legguards
	[23257] = { 23048,  4   },  -- Champion's Leather Helm
	[23258] = { 23048,  4   },  -- Champion's Leather Shoulders
	[23298] = { 23048,  4   },  -- Knight-Captain's Leather Chestpiece
	[23299] = { 23048,  4   },  -- Knight-Captain's Leather Legguards
	[23284] = { 23048,  4   },  -- Knight-Lieutenant's Leather Grips
	[23285] = { 23048,  4   },  -- Knight-Lieutenant's Leather Walkers
	[23312] = { 23048,  4   },  -- Lieutenant Commander's Leather Helm
	[23313] = { 23048,  4   },  -- Lieutenant Commander's Leather Shoulders
	[16498] = { 23048,  4   },  -- Blood Guard's Leather Treads
	[16499] = { 23048,  4   },  -- Blood Guard's Leather Vices
	[16505] = { 23048,  4   },  -- Legionnaire's Leather Hauberk
	[16508] = { 23048,  4   },  -- Legionnaire's Leather Leggings
	[16506] = { 23048,  4   },  -- Champion's Leather Headguard
	[16507] = { 23048,  4   },  -- Champion's Leather Mantle
	[16392] = { 23048,  4   },  -- Knight-Lieutenant's Leather Boots
	[16396] = { 23048,  4   },  -- Knight-Lieutenant's Leather Gauntlets
	[16417] = { 23048,  4   },  -- Knight-Captain's Leather Armor
	[16419] = { 23048,  4   },  -- Knight-Captain's Leather Legguards
	[16420] = { 23048,  4   },  -- Lieutenant Commander's Leather Spaulders
	[16418] = { 23048,  4   },  -- Lieutenant Commander's Leather Veil
	[16827] = { 21874,  2   },  -- Nightslayer Belt
	[16824] = { 21874,  2   },  -- Nightslayer Boots
	[16825] = { 21874,  2   },  -- Nightslayer Bracelets
	[16820] = { 21874,  2   },  -- Nightslayer Chestpiece
	[16821] = { 21874,  2   },  -- Nightslayer Cover
	[16826] = { 21874,  2   },  -- Nightslayer Gloves
	[16822] = { 21874,  2   },  -- Nightslayer Pants
	[16823] = { 21874,  2   },  -- Nightslayer Shoulder Pads
	[19617] = { 24469,  3   },  -- Zandalarian Shadow Mastery Talisman
	[19954] = { 24469,  3   },  -- Renataki's Charm of Trickery
	[19836] = { 24469,  3   },  -- Zandalar Madcap's Bracers
	[19835] = { 24469,  3   },  -- Zandalar Madcap's Mantle
	[19834] = { 24469,  3   },  -- Zandalar Madcap's Tunic
	[21359] = { 26112,  3   },  -- Deathdealer's Boots
	[21360] = { 26112,  3   },  -- Deathdealer's Helm
	[21361] = { 26112,  3   },  -- Deathdealer's Spaulders
	[21362] = { 26112,  3   },  -- Deathdealer's Leggings
	[21364] = { 26112,  3   },  -- Deathdealer's Vest
	-- Shaman
	[31396] = { 44299,  4   },  -- Gladiator's Ringmail Armor
	[31397] = { 44299,  4   },  -- Gladiator's Ringmail Gauntlets
	[31400] = { 44299,  4   },  -- Gladiator's Ringmail Helm
	[31406] = { 44299,  4   },  -- Gladiator's Ringmail Leggings
	[31407] = { 44299,  4   },  -- Gladiator's Ringmail Spaulders
	[29032] = { 37211,  4   },  -- Cyclone Gloves
	[29029] = { 37211,  4   },  -- Cyclone Hauberk
	[29028] = { 37211,  4   },  -- Cyclone Headdress
	[29030] = { 37211,  4   },  -- Cyclone Kilt
	[29031] = { 37211,  4   },  -- Cyclone Shoulderpads
	[35391] = { 38466,  4   },  -- Seer's Ringmail Chestguard
	[35392] = { 38466,  4   },  -- Seer's Ringmail Gloves
	[35393] = { 38466,  4   },  -- Seer's Ringmail Headpiece
	[35394] = { 38466,  4   },  -- Seer's Ringmail Legguards
	[35395] = { 38466,  4   },  -- Seer's Ringmail Shoulderpads
	[31640] = { 38499,  4   },  -- Grand Marshal's Ringmail Chestguard
	[31641] = { 38499,  4   },  -- Grand Marshal's Ringmail Gloves
	[31642] = { 38499,  4   },  -- Grand Marshal's Ringmail Headpiece
	[31643] = { 38499,  4   },  -- Grand Marshal's Ringmail Legguards
	[31644] = { 38499,  4   },  -- Grand Marshal's Ringmail Shoulders
	[31646] = { 38499,  4   },  -- High Warlord's Ringmail Chestguard
	[31647] = { 38499,  4   },  -- High Warlord's Ringmail Gloves
	[31648] = { 38499,  4   },  -- High Warlord's Ringmail Headpiece
	[31649] = { 38499,  4   },  -- High Warlord's Ringmail Legguards
	[31650] = { 38499,  4   },  -- High Warlord's Ringmail Shoulderpads
	[25997] = { 33018,  4   },  -- Gladiator's Linked Armor
	[26000] = { 33018,  4   },  -- Gladiator's Linked Gauntlets
	[25998] = { 33018,  4   },  -- Gladiator's Linked Helm
	[26001] = { 33018,  4   },  -- Gladiator's Linked Leggings
	[25999] = { 33018,  4   },  -- Gladiator's Linked Spaulders
	[28689] = { 33018,  4   },  -- Grand Marshal's Linked Armor
	[28690] = { 33018,  4   },  -- Grand Marshal's Linked Gauntlets
	[28691] = { 33018,  4   },  -- Grand Marshal's Linked Helm
	[28692] = { 33018,  4   },  -- Grand Marshal's Linked Leggings
	[28693] = { 33018,  4   },  -- Grand Marshal's Linked Spaulders
	[28841] = { 33018,  4   },  -- High Warlord's Linked Armor
	[28842] = { 33018,  4   },  -- High Warlord's Linked Gauntlets
	[28843] = { 33018,  4   },  -- High Warlord's Linked Helm
	[28844] = { 33018,  4   },  -- High Warlord's Linked Leggings
	[28845] = { 33018,  4   },  -- High Warlord's Linked Spaulders
	[35381] = { 33018,  4   },  -- Seer's Linked Armor
	[35382] = { 33018,  4   },  -- Seer's Linked Gauntlets
	[35383] = { 33018,  4   },  -- Seer's Linked Helm
	[35384] = { 33018,  4   },  -- Seer's Linked Leggings
	[35385] = { 33018,  4   },  -- Seer's Linked Spaulders
	-- Warlock
	[19605] = { 24487,  5   },  -- ezan's Unstoppable Taint
	[19957] = { 24487,  5   },  -- Hazza'rah's Charm of Destruction
	[19848] = { 24487,  5   },  -- Zandalar Demoniac's Wraps
	[19849] = { 24487,  5   },  -- Zandalar Demoniac's Mantle
	[20033] = { 24487,  5   },  -- Zandalar Demoniac's Robe
	-- Warrior
	[19951] = { 24456,  3   },  -- Gri'lek's Charm of Might
	[19577] = { 24456,  3   },  -- Rage of Mugamba
	[19824] = { 24456,  3   },  -- Zandalar Vindicator's Armguards
	[19823] = { 24456,  3   },  -- Zandalar Vindicator's Belt
	[19822] = { 24456,  3   },  -- Zandalar Vindicator's Breastplate
	[24544] = { 22738,  4   },  -- Gladiator's Plate Chestpiece
	[24549] = { 22738,  4   },  -- Gladiator's Plate Gauntlets
	[24545] = { 22738,  4   },  -- Gladiator's Plate Helm
	[24547] = { 22738,  4   },  -- Gladiator's Plate Legguards
	[24546] = { 22738,  4   },  -- Gladiator's Plate Shoulders
	[28699] = { 22738,  4   },  -- Grand Marshal's Plate Chestpiece
	[28700] = { 22738,  4   },  -- Grand Marshal's Plate Gauntlets
	[28701] = { 22738,  4   },  -- Grand Marshal's Plate Helm
	[28702] = { 22738,  4   },  -- Grand Marshal's Plate Legguards
	[28703] = { 22738,  4   },  -- Grand Marshal's Plate Shoulders
	[28851] = { 22738,  4   },  -- High Warlord's Plate Chestpiece
	[28852] = { 22738,  4   },  -- High Warlord's Plate Gauntlets
	[28853] = { 22738,  4   },  -- High Warlord's Plate Helm
	[28854] = { 22738,  4   },  -- High Warlord's Plate Legguards
	[28855] = { 22738,  4   },  -- High Warlord's Plate Shoulders
	[35407] = { 22738,  4   },  -- Savage Plate Chestpiece
	[35408] = { 22738,  4   },  -- Savage Plate Gauntlets
	[35409] = { 22738,  4   },  -- Savage Plate Helm
	[35410] = { 22738,  4   },  -- Savage Plate Legguards
	[35411] = { 22738,  4   },  -- Savage Plate Shoulders
	[16477] = { 22738,  3   },  -- Field Marshal's Plate Armor
	[16478] = { 22738,  3   },  -- Field Marshal's Plate Helm
	[16480] = { 22738,  3   },  -- Field Marshal's Plate Shoulderguards
	[16483] = { 22738,  3   },  -- Marshal's Plate Boots
	[16484] = { 22738,  3   },  -- Marshal's Plate Gauntlets
	[16479] = { 22738,  3   },  -- Marshal's Plate Legguards
	[16541] = { 22738,  3   },  -- Warlord's Plate Armor
	[16542] = { 22738,  3   },  -- Warlord's Plate Headpiece
	[16544] = { 22738,  3   },  -- Warlord's Plate Shoulders
	[16545] = { 22738,  3   },  -- General's Plate Boots
	[16548] = { 22738,  3   },  -- General's Plate Gauntlets
	[16543] = { 22738,  3   },  -- General's Plate Leggings
	[22868] = { 22738,  4   },  -- Blood Guard's Plate Gauntlets
	[22858] = { 22738,  4   },  -- Blood Guard's Plate Greaves
	[22872] = { 22738,  4   },  -- Legionnaire's Plate Hauberk
	[22873] = { 22738,  4   },  -- Legionnaire's Plate Leggings
	[23244] = { 22738,  4   },  -- Champion's Plate Helm
	[23243] = { 22738,  4   },  -- Champion's Plate Shoulders
	[23300] = { 22738,  4   },  -- Knight-Captain's Plate Hauberk
	[23301] = { 22738,  4   },  -- Knight-Captain's Plate Leggings
	[23286] = { 22738,  4   },  -- Knight-Lieutenant's Plate Gauntlets
	[23287] = { 22738,  4   },  -- Knight-Lieutenant's Plate Greaves
	[23314] = { 22738,  4   },  -- Lieutenant Commander's Plate Helmet
	[23315] = { 22738,  4   },  -- Lieutenant Commander's Plate Shoulders
	[16509] = { 22738,  4   },  -- Blood Guard's Plate Boots
	[16510] = { 22738,  4   },  -- Blood Guard's Plate Gloves
	[16513] = { 22738,  4   },  -- Legionnaire's Plate Armor
	[16515] = { 22738,  4   },  -- Legionnaire's Plate Legguards
	[16514] = { 22738,  4   },  -- Champion's Plate Headguard
	[16516] = { 22738,  4   },  -- Champion's Plate Pauldrons
	[16405] = { 22738,  4   },  -- Knight-Lieutenant's Plate Boots
	[16406] = { 22738,  4   },  -- Knight-Lieutenant's Plate Gauntlets
	[16430] = { 22738,  4   },  -- Knight-Captain's Plate Chestguard
	[16431] = { 22738,  4   },  -- Knight-Captain's Plate Leggings
	[16429] = { 22738,  4   },  -- Lieutenant Commander's Plate Helm
	[16432] = { 22738,  4   },  -- Lieutenant Commander's Plate Pauldrons
}
