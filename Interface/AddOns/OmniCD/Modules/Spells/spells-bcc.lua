local E, L, C = select(2, ...):unpack()

if not E.isBCC then return end

E.spell_db = {
	["DRUID"] = {
		{ spellID = 16979,  duration = 15,  type = "interrupt", spec = true },  -- Feral Charge
		{ spellID = 5211,   duration = 60,  type = "cc"         },  -- Bash (Rank 1)
		{ spellID = 22812,  duration = 60,  type = "defensive"  },  -- Barksin
		{ spellID = 22842,  duration = 180, type = "defensive"  },  -- Frenzied Regeneration (Rank 1)
		{ spellID = 16689,  duration = 60,  type = "defensive", spec = true },  -- Nature's Grasp (Rank 1)
		{ spellID = 18562,  duration = 15,  type = "defensive", spec = true },  -- Swiftmend
		{ spellID = 740,    duration = 600, type = "raidDefensive"  },  -- Tranquility (Rank 1)
		{ spellID = 16914,  duration = 60,  type = "offensive"  },  -- Hurricane (Rank 1)
		{ spellID = 33878,  duration = 6,   type = "offensive"  },  -- Mangle (Rank 1)
		{ spellID = 5209,   duration = 600, type = "other"      },  -- Challenging Roar (aoe taunt)
		{ spellID = 8998,   duration = 10,  type = "other"      },  -- Cower (Rank 1)
		{ spellID = 1850,   duration = 300, type = "other"      },  -- Dash (Rank 1)
		{ spellID = 5229,   duration = 60,  type = "other"      },  -- Enrage
		{ spellID = 16857,  duration = 6,   type = "other",     spec = true },  -- Faerie Fire (Feral) (Rank 1)
		{ spellID = 33831,  duration = 180, type = "other",     spec = true },  -- Force of Nature
		{ spellID = 6795,   duration = 10,  type = "other"      },  -- Growl (taunt)
		{ spellID = 29166,  duration = 360, type = "other"      },  -- Innervate
		{ spellID = 17116,  duration = 180, type = "other",     spec = true },  -- Nature's Swiftness
		{ spellID = 5215,   duration = 10,  type = "other"      },  -- Prowl (Rank 1)
		{ spellID = 20484,  duration = 1200,    type = "other"  },  -- Rebirth (Rank 1)
	},
	["HUNTER"] = {
		{ spellID = 19801,  duration = 20,  type = "dispel"     },  -- Tranquilizing Shot
		{ spellID = 1499,   duration = 30,  type = "cc"         },  -- Freezing Trap (Rank 1)
		{ spellID = 19577,  duration = 60,  type = "cc",        spec = true },  -- Intimidation
		{ spellID = 1513,   duration = 30,  type = "cc"         },  -- Scare Beast (Rank 1)
		{ spellID = 19503,  duration = 30,  type = "cc",        spec = true },  -- Scatter Shot
		{ spellID = 19386,  duration = 120, type = "cc",        spec = true },  -- Wyvern Sting (Rank 1)
		{ spellID = 34490,  duration = 20,  type = "disarm",    spec = true },  -- Silencing Shot
		{ spellID = 19263,  duration = 300, type = "defensive", spec = true },  -- Deterrence
		{ spellID = 5384,   duration = 30,  type = "defensive"  },  -- Feign Death
		{ spellID = 23989,  duration = 300, type = "defensive", spec = true },  -- Readiness
		{ spellID = 19434,  duration = 6,   type = "offensive", spec = true },  -- Aimed Shot (Rank 1) -- CD = [6s + ranged weapon attack speed]
		{ spellID = 3044,   duration = 6,   type = "offensive"  },  -- Arcane Shot (Rank 1)
		{ spellID = 19574,  duration = 120, type = "offensive", spec = true },  -- Bestial Wrath
		{ spellID = 19306,  duration = 5,   type = "offensive", spec = true },  -- Counterattack (Rank 1) (active after parrying)
		{ spellID = 13813,  duration = 30,  type = "offensive"  },  -- Explosive Trap (Rank 1)
		{ spellID = 13795,  duration = 30,  type = "offensive"  },  -- Immolation Trap (Rank 1)
		{ spellID = 34026,  duration = 5,   type = "offensive"  },  -- Kill Command
		{ spellID = 1495,   duration = 5,   type = "offensive"  },  -- Mongoose Bite (Rank 1)
		{ spellID = 2643,   duration = 10,  type = "offensive"  },  -- Multi-Shot (Rank 1)
		{ spellID = 3045,   duration = 300, type = "offensive"  },  -- Rapid Fire
		{ spellID = 2973,   duration = 6,   type = "offensive"  },  -- Raptor Strike (Rank 1)
		{ spellID = 34600,  duration = 30,  type = "offensive"  },  -- Snake Trap
		{ spellID = 1510,   duration = 60,  type = "offensive"  },  -- Volley (Rank 1)
		{ spellID = 5116,   duration = 12,  type = "other"      },  -- Concussive Shot
		{ spellID = 781,    duration = 5,   type = "other"      },  -- Disengage (Rank 1)
		{ spellID = 20736,  duration = 8,   type = "other"      },  -- Distracting Shot (Rank 1) (taunt)
		{ spellID = 1543,   duration = 20,  type = "other"      },  -- Flare
		{ spellID = 13809,  duration = 30,  type = "other"      },  -- Frost Trap
		{ spellID = 34477,  duration = 120, type = "other"      },  -- Misdirection
		{ spellID = 3034,   duration = 15,  type = "other"      },  -- Viper Sting (Rank 1) (mana drain)
		-- Pet
		--[[
--      { spellID = 17253,  duration = 10,  type = "other"      },  -- Bite (Rank 1)
--      { spellID = 7371,   duration = 25,  type = "other"      },  -- Charge (Rank 1)
--      { spellID = 1742,   duration = 5,   type = "other"      },  -- Cower (Rank 1)
--      { spellID = 23099,  duration = 30,  type = "other"      },  -- Dash (Rank 1)
--      { spellID = 23145,  duration = 30,  type = "other"      },  -- Dive (Rank 1)
--      { spellID = 34889,  duration = 10,  type = "other"      },  -- Fire Breath (Rank 1)
--      { spellID = 24604,  duration = 10,  type = "other"      },  -- Furious Howl (Rank 1)
--      { spellID = 2649,   duration = 5,   type = "other"      },  -- Growl (Rank 1)
--      { spellID = 35387,  duration = 10,  type = "other"      },  -- Poison Spit (Rank 1)
--      { spellID = 24450,  duration = 10,  type = "other"      },  -- Prowl (Rank 1)
--      { spellID = 24640,  duration = 4,   type = "other"      },  -- Scorpid Poison (Rank 1)
--      { spellID = 26064,  duration = 180, type = "other"      },  -- Shell Shield
--      { spellID = 26090,  duration = 60,  type = "other"      },  -- Thunderstomp (Rank 1)
--      { spellID = 35346,  duration = 15,  type = "other"      },  -- Warp
		--]]
	},
	["MAGE"] = {
		{ spellID = 2139,   duration = 24,  type = "interrupt"  },  -- Counterspell
		{ spellID = 31661,  duration = 20,  type = "cc",        spec = true },  -- Dragon's Breath (Rank 1)
		{ spellID = 122,    duration = 25,  type = "disarm"     },  -- Frost Nova
		{ spellID = 45438,  duration = 300, type = "immunity"   },  -- Ice Block
		{ spellID = 11958,  duration = 480, type = "defensive", spec = true },  -- Cold Snap
		{ spellID = 543,    duration = 30,  type = "defensive"  },  -- Fire Ward (Rank 1)
		{ spellID = 6143,   duration = 30,  type = "defensive"  },  -- Frost Ward (Rank 1)
		{ spellID = 11426,  duration = 30,  type = "defensive", spec = true },  -- Ice Barrier (Rank 1)
		{ spellID = 66,     duration = 300, type = "defensive"  },  -- Invisibility
		{ spellID = 12042,  duration = 180, type = "offensive", spec = true },  -- Arcane Power
		{ spellID = 11113,  duration = 30,  type = "offensive", spec = true },  -- Blast Wave (Rank 1)
		{ spellID = 11129,  duration = 180, type = "offensive", spec = true },  -- Combustion
		{ spellID = 2136,   duration = 8,   type = "offensive"  },  -- Fire Blast (Rank 1)
		{ spellID = 12472,  duration = 180, type = "offensive", spec = true },  -- Icy Veins
		{ spellID = 12043,  duration = 180, type = "offensive", spec = true },  -- Presence of Mind
		{ spellID = 31687,  duration = 180, type = "offensive", spec = true },  -- Summon Water Elemental
		{ spellID = 1953,   duration = 15,  type = "other"      },  -- Blink
		{ spellID = 120,    duration = 10,  type = "other"      },  -- Cone of Cold (Rank 1)
		{ spellID = 12051,  duration = 480, type = "other"      },  -- Evocation
		{ spellID = 43987,  duration = 300, type = "other"      },  -- Ritual of Refreshment (Rank 1) -- TODO: make preactive til the ritual is completed
	},
	["PALADIN"] = {
		{ spellID = 853,    duration = 60,  type = "cc"         },  -- Hammer of Justice (Rank 1)
		{ spellID = 20066,  duration = 30,  type = "cc",        spec = true },  -- Repentance
		{ spellID = 10326,  duration = 30,  type = "cc"         },  -- Turn Evil
		{ spellID = 2878,   duration = 30,  type = "cc"         },  -- Turn Undead (Rank 1)
		{ spellID = 498,    duration = 300, type = "immunity"   },  -- Divine Protection (Rank 1)
		{ spellID = 642,    duration = 300, type = "immunity"   },  -- Divine Shield (Rank 1)
		{ spellID = 1022,   duration = 300, type = "externalDefensive"  },  -- Blessing of Protection (Rank 1)
		{ spellID = 6940,   duration = 30,  type = "externalDefensive"  },  -- Blessing of Sacrifice (Rank 1)
		{ spellID = 19752,  duration = 3600,    type = "externalDefensive"  },  -- Divine Intervention
		{ spellID = 20216,  duration = 120, type = "defensive", spec = true },  -- Divine Favor
		{ spellID = 20925,  duration = 10,  type = "defensive", spec = true },  -- Holy Shield (Rank 1)
		{ spellID = 633,    duration = 3600,type = "defensive"  },  -- Lay on Hands (Rank 1)
		{ spellID = 31935,  duration = 30,  type = "offensive", spec = true },  -- Avenger's Shield (Rank 1)
		{ spellID = 31884,  duration = 180, type = "offensive"  },  -- Avenging Wrath
		{ spellID = 26573,  duration = 8,   type = "offensive"  },  -- Consecration (Rank 1)
		{ spellID = 35395,  duration = 6,   type = "offensive", spec = true },  -- Crusader Strike
		{ spellID = 879,    duration = 15,  type = "offensive"  },  -- Exorcism (Rank 1)
		{ spellID = 24275,  duration = 6,   type = "offensive"  },  -- Hammer of Wrath (Rank 1)
		{ spellID = 20473,  duration = 15,  type = "offensive", spec = true },  -- Holy Shock (Rank 1)
		{ spellID = 2812,   duration = 60,  type = "offensive"  },  -- Holy Wrath (Rank 1)
		{ spellID = 20271,  duration = 10,  type = "offensive"  },  -- Judgement
		{ spellID = 1044,   duration = 25,  type = "other"      },  -- Blessing of Freedom
		{ spellID = 31842,  duration = 180, type = "other",     spec = true },  -- Divine Illumination
		{ spellID = 31789,  duration = 15,  type = "other"      },  -- Righteous Defense (taunts 3)
	},
	-- race specific spells use spec = { race1, race2... }
	["PRIEST"] = {
		{ spellID = 8122,   duration = 30,  type = "cc"         },  -- Psychic Scream (Rank 1)
		{ spellID = 44041,  duration = 30,  type = "disarm",    spec = {3,11}   },  -- Chastise (Rank 1)
		{ spellID = 15487,  duration = 45,  type = "disarm",    spec = true },  -- Silence
		{ spellID = 33206,  duration = 120, type = "externalDefensive", spec = true },  -- Pain Suppression
		{ spellID = 13908,  duration = 600, type = "defensive", spec = {1,3}    },  -- Desperate Prayer (Rank 1)
		{ spellID = 2944,   duration = 180, type = "defensive", spec = {5}  },  -- Devouring Plague (Rank 1)
		{ spellID = 2651,   duration = 180, type = "defensive", spec = {4}  },  -- Elune's Grace
		{ spellID = 13896,  duration = 180, type = "defensive", spec = {1}  },  -- Feedback (Rank 1)
		{ spellID = 724,    duration = 360, type = "defensive", spec = true },  -- Lightwell (Rank 1)
		{ spellID = 17,     duration = 4,   type = "defensive"  },  -- Power Word: Shield (Rank 1)
		{ spellID = 33076,  duration = 10,  type = "defensive"  },  -- Prayer of Mending
		{ spellID = 15286,  duration = 10,  type = "defensive", spec = true },  -- Vampiric Embrace
		{ spellID = 14751,  duration = 180, type = "offensive", spec = true },  -- Inner Focus
		{ spellID = 8092,   duration = 8,   type = "offensive"  },  --  Mind Blast (Rank 1)
		{ spellID = 10060,  duration = 180, type = "offensive", spec = true },  -- Power Infusion
		{ spellID = 32379,  duration = 12,  type = "offensive"  },  -- Shadow Word: Death (Rank 1)
		{ spellID = 34433,  duration = 300, type = "offensive"  },  -- Shadowfiend
		{ spellID = 15473,  duration = 90,  type = "offensive", spec = true },  -- Shadowform
		{ spellID = 10797,  duration = 30,  type = "offensive", spec = {4}  },  -- Starshards (Rank 1)
		{ spellID = 6346,   duration = 180, type = "counterCC"  },  -- Fear Ward
		{ spellID = 32676,  duration = 120, type = "other",     spec = {10} },  -- Consume Magic
		{ spellID = 586,    duration = 30,  type = "other"      },  -- Fade (Rank 1)
		{ spellID = 32548,  duration = 300, type = "other",     spec = {11} },  -- Symbol of Hope
	},
	["ROGUE"] = {
		{ spellID = 1766,   duration = 10,  type = "interrupt"  },  -- Kick (Rank 1)
		{ spellID = 2094,   duration = 180, type = "cc"         },  -- Blind
		{ spellID = 1776,   duration = 10,  type = "cc"         },  -- Gouge (Rank 1)
		{ spellID = 408,    duration = 20,  type = "cc"         },  -- Kidney Shot (Rank 1)
		{ spellID = 14251,  duration = 6,   type = "disarm",    spec = true },  -- Riposte (active only after parrying)
		{ spellID = 31224,  duration = 60,  type = "defensive"  },  -- Cloak of Shadows
		{ spellID = 5277,   duration = 300, type = "defensive"  },  -- Evasion (Rank 1)
		{ spellID = 14185,  duration = 600, type = "defensive", spec = true },  -- Preparation
		{ spellID = 1856,   duration = 300, type = "defensive"  },  -- Vanish (Rank 1)
		{ spellID = 13750,  duration = 300, type = "offensive", spec = true },  -- Adrenaline Rush
		{ spellID = 13877,  duration = 120, type = "offensive", spec = true },  -- Blade Flurry
		{ spellID = 14177,  duration = 180, type = "offensive", spec = true },  -- Cold Blood
		{ spellID = 14278,  duration = 20,  type = "offensive", spec = true },  -- Ghostly Strike
		{ spellID = 14183,  duration = 120, type = "offensive", spec = true },  -- Premeditation
		{ spellID = 1725,   duration = 30,  type = "other"      },  -- Distract
		{ spellID = 1966,   duration = 10,  type = "other"      },  -- Feint (Rank 1)
		{ spellID = 36554,  duration = 30,  type = "other",     spec = true },  -- Shadowstep
		{ spellID = 2983,   duration = 300, type = "other"      },  -- Sprint (Rank 1)
		{ spellID = 1784,   duration = 10,  type = "other"      },  -- Stealth (Rank 1)
	},
	["SHAMAN"] = {
		{ spellID = 8042,   duration = 6,   type = "interrupt"  },  -- Earth Shock (Rank 1) -- interrupt 2s lock out
		{ spellID = 30823,  duration = 120, type = "defensive", spec = true },  -- Shamanistic Rage
		{ spellID = 2825,   duration = 600, type = "offensive"  },  -- Bloodlust
--      { spellID = 32182,    duration = 600, type = "offensive"  },  -- Heroism -- Merged
		{ spellID = 421,    duration = 6,   type = "offensive"  },  -- Chain Lightning (Rank 1)
		{ spellID = 1535,   duration = 15,  type = "offensive"  },  -- Fire Nova Totem (Rank 1)
		{ spellID = 2894,   duration = 1200,    type = "offensive"  },  -- Fire Elemetal Totem
		{ spellID = 8050,   duration = 6,   type = "offensive"  },  -- Flame Shock (Rank 1)
		{ spellID = 16166,  duration = 180, type = "offensive", spec = true },  -- Elemental Mastery
		{ spellID = 17364,  duration = 10,  type = "offensive", spec = true },  -- Stormstrike
		{ spellID = 8177,   duration = 15,  type = "counterCC"  },  -- Grounding Totem
		{ spellID = 2062,   duration = 1200,    type = "other"  },  -- Earth Elemental Totem (aoe taunt)
		{ spellID = 2484,   duration = 15,  type = "other"      },  -- Earthbind Totem
		{ spellID = 8056,   duration = 6,   type = "other"      },  -- Frost Shock (Rank 1)
		{ spellID = 16190,  duration = 300, type = "other",     spec = true },  -- Mana Tide Totem
		{ spellID = 16188,  duration = 180, type = "other",     spec = true },  -- Nature's Swiftness
		{ spellID = 20608,  duration = 3600,    type = "other"  },  -- Reincarnation
		{ spellID = 5730,   duration = 30,  type = "other"      },  -- Stoneclaw Totem (Rank 1) -- (aoe taunt, 50% stun)
	},
	["WARLOCK"] = {
		{ spellID = 6789,   duration = 120, type = "cc"         },  -- Death Coil (Rank 1)
		{ spellID = 5484,   duration = 40,  type = "cc",        },  -- Howl of Terror (Rank 1)
		{ spellID = 30283,  duration = 20,  type = "cc",        spec = true },  -- Shadowfury (Rank 1)
		{ spellID = 6229,   duration = 30,  type = "defensive"  },  -- Shadow Ward (Rank 1)
		{ spellID = 18288,  duration = 180, type = "offensive", spec = true },  -- Amplify Curse
		{ spellID = 17962,  duration = 10,  type = "offensive", spec = true },  -- Conflagrate (Rank 1)
		{ spellID = 603,    duration = 60,  type = "offensive"  },  -- Curse of Doom (Rank 1)
		{ spellID = 1122,   duration = 3600,    type = "offensive"  },  -- Inferno (2sec stun)
		{ spellID = 17877,  duration = 15,  type = "offensive", spec = true },  -- Shadowburn (Rank 1)
		{ spellID = 6353,   duration = 60,  type = "offensive"  },  -- Soul Fire (Rank 1)
		{ spellID = 18708,  duration = 900, type = "other",     spec = true },  -- Fel Domination
		{ spellID = 18540,  duration = 3600,    type = "other"  },  -- Ritual of Doom -- TODO: req party members to cast
		{ spellID = 29893,  duration = 300, type = "other"      },  -- Ritual of Souls -- TODO: req party members to cast
		{ spellID = 29858,  duration = 300, type = "other"      },  -- Soulshatter
		-- Felhunter
		{ spellID = 19244,  duration = 24,  type = "interrupt"  },  -- Spell Lock (Rank 1)
		{ spellID = 19505,  duration = 8,   type = "dispel"     },  -- Devour Magic (Rank 1)
		-- Succubus
		{ spellID = 7814,   duration = 12,  type = "other"      },  -- Lash of Pain (Rank 1)
--      { spellID = 6360,   duration = 4,   type = "other"      },  -- Soothing Kiss (Rank 1)
		-- Imp
		{ spellID = 4511,   duration = 10,  type = "other"      },  -- Phase Shift
		-- Voidwalker
		{ spellID = 17735,  duration = 120, type = "other"      },  -- Suffering (Rank 1) (aoe taunt)
--      { spellID = 3716,   duration = 5,   type = "other"      },  -- Torment (Rank 1) (taunt)
		{ spellID = 20707,  duration = 1800, type = "other"     },  -- Soulstone Resurrection (Rank 1)
	},
	["WARRIOR"] = {
		{ spellID = 6552,   duration = 10,  type = "interrupt"  },  -- Pummel (Rank 1)
		{ spellID = 72,     duration = 12,  type = "interrupt"  },  -- Shield Bash (Rank 1)
		{ spellID = 100,    duration = 15,  type = "cc"         },  -- Charge (Rank 1)
		{ spellID = 12809,  duration = 45,  type = "cc",        spec = true },  -- Concussion Blow
		{ spellID = 20252,  duration = 30,  type = "cc"         },  -- Intercept (Rank 1)
		{ spellID = 5246,   duration = 180, type = "cc"         },  -- Intimidating Shout
		{ spellID = 676,    duration = 60,  type = "disarm"     },  -- Disarm
		{ spellID = 12975,  duration = 480, type = "defensive", spec = true },  -- Last Stand
		{ spellID = 2565,   duration = 5,   type = "defensive"  },  -- Shield Block
		{ spellID = 871,    duration = 1800,    type = "defensive"  },  -- Shield Wall
		{ spellID = 2687,   duration = 60,  type = "offensive"  },  -- Bloodrage
		{ spellID = 23881,  duration = 6,   type = "offensive", spec = true },  -- Bloodthirst (Rank 1)
		{ spellID = 12292,  duration = 180, type = "offensive", spec = true },  -- Death Wish (Fear immune)
		{ spellID = 12294,  duration = 6,   type = "offensive", spec = true },  -- Mortal Strike (Rank 1)
		{ spellID = 7384,   duration = 5,   type = "offensive"  },  -- Overpower (Rank 1) (active after dodge)
		{ spellID = 1719,   duration = 1800,    type = "offensive"  },  -- Recklessness
		{ spellID = 20230,  duration = 1800,    type = "offensive"  },  -- Retaliation
		{ spellID = 6572,   duration = 5,   type = "offensive"  },  -- Revenge (Rank 1) (active after block, dodge, parry)
		{ spellID = 23922,  duration = 6,   type = "offensive", spec = true },  -- Shield Slam (Rank 1)
		{ spellID = 12328,  duration = 30,  type = "offensive", spec = true },  -- Sweeping Strikes
		{ spellID = 6343,   duration = 4,   type = "offensive"  },  -- Thunder Clap (Rank 1)
		{ spellID = 1680,   duration = 10,  type = "offensive"  },  -- Whirlwind
		{ spellID = 18499,  duration = 30,  type = "counterCC"  },  -- Berserker Rage
		{ spellID = 3411,   duration = 30,  type = "counterCC"  },  -- Intervene
		{ spellID = 23920,  duration = 10,  type = "counterCC"  },  -- Spell Reflection
		{ spellID = 1161,   duration = 600, type = "other"      },  -- Challenging Shout
		{ spellID = 694,    duration = 120, type = "other"      },  -- Mocking Blow (Rank 1)
		{ spellID = 355,    duration = 10,  type = "other"      },  -- Taunt
	},
	["PVPTRINKET"] = {
		{ spellID = 42292,  duration = {[18859]=300,default=120},   type = "pvptrinket",    item = 37864,   item2 = 18859   },  -- PvP Trinket (Medallion of the Alliance, Insignia of the Alliance)
	},
	["RACIAL"] = {
		{ spellID = 28730,  duration = 120, type = "racial",    race = 10   },  -- Arcane Torrent (Paladin, Hunter, Priest, Mage, Warlock)
		{ spellID = 26297,  duration = 180, type = "racial",    race =  8   },  -- Berserking (Energy: Rogue)
		{ spellID = 20572,  duration = 120, type = "racial",    race =  2   },  -- Blood Fury (Warrior, Hunter, Rogue)
		{ spellID = 20589,  duration = 105, type = "racial",    race =  7   },  -- Escape Artist
		{ spellID = 28880,  duration = 180, type = "racial",    race = 11   },  -- Gift of the Naaru
		{ spellID = 20600,  duration = 180, type = "racial",    race =  1   },  -- Perception
		{ spellID = 20580,  duration = 10,  type = "racial",    race =  4   },  -- Shadowmeld
		{ spellID = 20594,  duration = 180, type = "racial",    race =  3   },  -- Stoneform
		{ spellID = 20549,  duration = 90,  type = "racial",    race =  6   },  -- War Stomp
		{ spellID = 7744,   duration = 120, type = "racial",    race =  5   },  -- Will of the Forsaken
	},
	["TRINKET"] = {
		{ spellID = 35166,  duration = 120, type = "trinket",   item = 29383    },  -- Bloodlust Brooch
		{ spellID = 35163,  duration = 120, type = "trinket",   item = 29370    },  -- Icon of the Silver Crescent
		{ spellID = 46784,  duration = 90,  type = "trinket",   item = 35702    },  -- Figurine - Shadowsong Panther
		{ spellID = 35165,  duration = 120, type = "trinket",   item = 29376    },  -- Essence of the Martyr
		{ spellID = 29601,  duration = 120, type = "trinket",   item = 28727    },  -- Pendant of the Violet Eye
		{ spellID = 38332,  duration = 120, type = "trinket",   item = 28590    },  -- Ribbon of Sacrifice
		{ spellID = 40396,  duration = 120, type = "trinket",   item = 32483    },  -- The Skull of Gul'dan
		{ spellID = 35169,  duration = 120, type = "trinket",   item = 29387    },  -- Gnomeregan Auto-Blocker 600
		{ spellID = 34519,  duration = 120, type = "trinket",   item = 28528    },  -- Moroes' Lucky Pocket Watch
		{ spellID = 43716,  duration = 120, type = "trinket",   item = 33831    },  -- Berserker's Call
		{ spellID = 33828,  duration = 120, type = "trinket",   item = 25829    },  -- Talisman of the Alliance
		{ spellID = 32140,  duration = 120, type = "trinket",   item = 24551    },  -- Talisman of the Horde
		{ spellID = 35352,  duration = 120, type = "trinket",   item = 29181    },  -- Timelapse Shard
		{ spellID = 43712,  duration = 120, type = "trinket",   item = 33829    },  -- Hex Shrunken Head
		{ spellID = 46783,  duration = 120, type = "trinket",   item = 35700    },  -- Figurine - Crimson Serpent
		{ spellID = 40464,  duration = 180, type = "trinket",   item = 32501    },  -- Shadowmoon Insignia (BM?)
		{ spellID = 45064,  duration = 120, type = "trinket",   item = 34471    },  -- Vial of the Sunwell
		{ spellID = 40402,  duration = 120, type = "trinket",   item = 30665    },  -- Earring of Soulful Meditation
		{ spellID = 38325,  duration = 120, type = "trinket",   item = 30620    },  -- Spyglass of the Hidden Fleet
		{ spellID = 45049,  duration = 300, type = "trinket",   item = 34428    },  -- Steely Naaru Sliver (BM?)
		{ spellID = 51953,  duration = 120, type = "trinket",   item = 38290    },  -- Dark Iron Smoking Pipe
		{ spellID = 46780,  duration = 120, type = "trinket",   item = 35693    },  -- Figurine - Empyrean Tortoise
		{ spellID = 45052,  duration = 300, type = "trinket",   item = 34430    },  -- Glimmering Naaru Sliver
		{ spellID = 43713,  duration = 120, type = "trinket",   item = 33830    },  -- Ancient Aqir Artifact
		{ spellID = 46782,  duration = 300, type = "trinket",   item = 35694    },  -- Figurine - Khorium Boar
		{ spellID = 51955,  duration = 120, type = "trinket",   item = 38287    },  -- Empty Mug of Direbrew
		{ spellID = 38351,  duration = 180, type = "trinket",   item = 30629    },  -- Scarab of Displacement
		{ spellID = 46785,  duration = 180, type = "trinket",   item = 35703    },  -- Figurine - Seaspray Albatross
		{ spellID = 51952,  duration = 120, type = "trinket",   item = 38289    },  -- Coren's Lucky Coin
		{ spellID = 43710,  duration = 120, type = "trinket",   item = 33828    },  -- Tome of Diabolic Remedy
		{ spellID = 43995,  duration = 600, type = "trinket",   item = 34029    },  -- Tiny Voodoo Mask
		{ spellID = 51954,  duration = 120, type = "trinket",   item = 38288    },  -- Direbrew Hops
		{ spellID = 48042,  duration = 600, type = "trinket",   item = 37128    },  -- Balebrew Charm
		{ spellID = 48041,  duration = 600, type = "trinket",   item = 37127    },  -- Brightbrew Charm
		{ spellID = 32604,  duration = 120, type = "trinket",   item = 25798    },  -- 130 Epic Warrior Trinket
		{ spellID = 44055,  duration = 180, type = "trinket",   item = 34050    },  -- Battlemaster's Perseverance <BM>
	},
}

local BLANK = {}
local iconFix = BLANK
local buffFix = BLANK
E.buffFixNoCLEU = BLANK

for k, v in pairs(E.spell_db) do
	local n = #v
	for i = n, 1, -1 do
		local t = v[i]
		local id = t.spellID
		local itemID = t.item

		if not C_Spell.DoesSpellExist(id) then
			tremove(v, i)
--          E.Write("Removing Invalid ID: |cffffd200" .. id)
		else
			if k == "TRINKET" or k == "PVPTRINKET" then
				t.icon = GetItemIcon(itemID)
			else
				t.icon = t.icon or select(2, GetSpellTexture(id))
			end
			t.name = GetSpellInfo(id) or "" -- update spell to item name in mixin (need initial name for sorting!)
			t.class = k

			local buff = t.buff or buffFix[id] or id
			if E.L_HIGHLIGHTS[t.type] then
				E.spell_highlighted[buff] = true
			end
			t.buff = buff
		end
	end
end
