local _, MySlot = ...

local MYSLOT_BINDS = {
    ["MOVEANDSTEER"] = 1,
    ["MOVEFORWARD"] = 2,
    ["MOVEBACKWARD"] = 3,
    ["TURNLEFT"] = 4,
    ["TURNRIGHT"] = 5,
    ["STRAFELEFT"] = 6,
    ["STRAFERIGHT"] = 7,
    ["JUMP"] = 8,
    ["SITORSTAND"] = 9,
    ["TOGGLESHEATH"] = 10,
    ["TOGGLEAUTORUN"] = 11,
    ["PITCHUP"] = 12,
    ["PITCHDOWN"] = 13,
    ["TOGGLERUN"] = 14,
    ["FOLLOWTARGET"] = 15,
    ["OPENCHAT"] = 16,
    ["OPENCHATSLASH"] = 17,
    ["CHATPAGEUP"] = 18,
    ["CHATPAGEDOWN"] = 19,
    ["CHATBOTTOM"] = 20,
    ["REPLY"] = 21,
    ["REPLY2"] = 22,
    ["COMBATLOGPAGEUP"] = 23,
    ["COMBATLOGPAGEDOWN"] = 24,
    ["COMBATLOGBOTTOM"] = 25,
    ["ACTIONBUTTON1"] = 26,
    ["ACTIONBUTTON2"] = 27,
    ["ACTIONBUTTON3"] = 28,
    ["ACTIONBUTTON4"] = 29,
    ["ACTIONBUTTON5"] = 30,
    ["ACTIONBUTTON6"] = 31,
    ["ACTIONBUTTON7"] = 32,
    ["ACTIONBUTTON8"] = 33,
    ["ACTIONBUTTON9"] = 34,
    ["ACTIONBUTTON10"] = 35,
    ["ACTIONBUTTON11"] = 36,
    ["ACTIONBUTTON12"] = 37,
    ["SHAPESHIFTBUTTON1"] = 38,
    ["SHAPESHIFTBUTTON2"] = 39,
    ["SHAPESHIFTBUTTON3"] = 40,
    ["SHAPESHIFTBUTTON4"] = 41,
    ["SHAPESHIFTBUTTON5"] = 42,
    ["SHAPESHIFTBUTTON6"] = 43,
    ["SHAPESHIFTBUTTON7"] = 44,
    ["SHAPESHIFTBUTTON8"] = 45,
    ["SHAPESHIFTBUTTON9"] = 46,
    ["SHAPESHIFTBUTTON10"] = 47,
    ["BONUSACTIONBUTTON1"] = 48,
    ["BONUSACTIONBUTTON2"] = 49,
    ["BONUSACTIONBUTTON3"] = 50,
    ["BONUSACTIONBUTTON4"] = 51,
    ["BONUSACTIONBUTTON5"] = 52,
    ["BONUSACTIONBUTTON6"] = 53,
    ["BONUSACTIONBUTTON7"] = 54,
    ["BONUSACTIONBUTTON8"] = 55,
    ["BONUSACTIONBUTTON9"] = 56,
    ["BONUSACTIONBUTTON10"] = 57,
    ["ACTIONPAGE1"] = 58,
    ["ACTIONPAGE2"] = 59,
    ["ACTIONPAGE3"] = 60,
    ["ACTIONPAGE4"] = 61,
    ["ACTIONPAGE5"] = 62,
    ["ACTIONPAGE6"] = 63,
    ["PREVIOUSACTIONPAGE"] = 64,
    ["NEXTACTIONPAGE"] = 65,
    ["TOGGLEACTIONBARLOCK"] = 66,
    ["TOGGLEAUTOSELFCAST"] = 67,
    ["MULTICASTSUMMONBUTTON1"] = 68,
    ["MULTICASTACTIONBUTTON1"] = 69,
    ["MULTICASTACTIONBUTTON2"] = 70,
    ["MULTICASTACTIONBUTTON3"] = 71,
    ["MULTICASTACTIONBUTTON4"] = 72,
    ["MULTICASTSUMMONBUTTON2"] = 73,
    ["MULTICASTACTIONBUTTON5"] = 74,
    ["MULTICASTACTIONBUTTON6"] = 75,
    ["MULTICASTACTIONBUTTON7"] = 76,
    ["MULTICASTACTIONBUTTON8"] = 77,
    ["MULTICASTSUMMONBUTTON3"] = 78,
    ["MULTICASTACTIONBUTTON9"] = 79,
    ["MULTICASTACTIONBUTTON10"] = 80,
    ["MULTICASTACTIONBUTTON11"] = 81,
    ["MULTICASTACTIONBUTTON12"] = 82,
    ["MULTICASTRECALLBUTTON1"] = 83,
    ["TARGETNEARESTENEMY"] = 84,
    ["TARGETPREVIOUSENEMY"] = 85,
    ["TARGETNEARESTFRIEND"] = 86,
    ["TARGETPREVIOUSFRIEND"] = 87,
    ["TARGETNEARESTENEMYPLAYER"] = 88,
    ["TARGETPREVIOUSENEMYPLAYER"] = 89,
    ["TARGETNEARESTFRIENDPLAYER"] = 90,
    ["TARGETPREVIOUSFRIENDPLAYER"] = 91,
    ["TARGETSELF"] = 92,
    ["TARGETPARTYMEMBER1"] = 93,
    ["TARGETPARTYMEMBER2"] = 94,
    ["TARGETPARTYMEMBER3"] = 95,
    ["TARGETPARTYMEMBER4"] = 96,
    ["TARGETPET"] = 97,
    ["TARGETPARTYPET1"] = 98,
    ["TARGETPARTYPET2"] = 99,
    ["TARGETPARTYPET3"] = 100,
    ["TARGETPARTYPET4"] = 101,
    ["TARGETLASTHOSTILE"] = 102,
    ["TARGETLASTTARGET"] = 103,
    ["NAMEPLATES"] = 104,
    ["FRIENDNAMEPLATES"] = 105,
    ["ALLNAMEPLATES"] = 106,
    ["INTERACTMOUSEOVER"] = 107,
    ["INTERACTTARGET"] = 108,
    ["ASSISTTARGET"] = 109,
    ["ATTACKTARGET"] = 110,
    ["STARTATTACK"] = 111,
    ["PETATTACK"] = 112,
    ["FOCUSTARGET"] = 113,
    ["TARGETFOCUS"] = 114,
    ["TARGETMOUSEOVER"] = 115,
    ["TARGETTALKER"] = 116,
    ["TOGGLECHARACTER0"] = 117,
    ["TOGGLEBACKPACK"] = 118,
    ["TOGGLEBAG1"] = 119,
    ["TOGGLEBAG2"] = 120,
    ["TOGGLEBAG3"] = 121,
    ["TOGGLEBAG4"] = 122,
    ["OPENALLBAGS"] = 123,
    ["TOGGLEKEYRING"] = 124,
    ["TOGGLESPELLBOOK"] = 125,
    ["TOGGLEPROFESSIONBOOK"] = 126,
    ["TOGGLEPETBOOK"] = 127,
    ["TOGGLEINSCRIPTION"] = 128,
    ["TOGGLETALENTS"] = 129,
    ["TOGGLECHARACTER4"] = 130,
    ["TOGGLECHARACTER3"] = 131,
    ["TOGGLECHARACTER2"] = 132,
    ["TOGGLEQUESTLOG"] = 133,
    ["TOGGLEGAMEMENU"] = 134,
    ["TOGGLEMINIMAP"] = 135,
    ["TOGGLEWORLDMAP"] = 136,
    ["TOGGLEWORLDMAPSIZE"] = 137,
    ["TOGGLESOCIAL"] = 138,
    ["TOGGLEFRIENDSTAB"] = 139,
    ["TOGGLEWHOTAB"] = 140,
    ["TOGGLEGUILDTAB"] = 141,
    ["TOGGLECHATTAB"] = 142,
    ["TOGGLERAIDTAB"] = 143,
    ["TOGGLELFGPARENT"] = 144,
    ["TOGGLELFRPARENT"] = 145,
    ["TOGGLEWORLDSTATESCORES"] = 146,
    ["TOGGLEBATTLEFIELDMINIMAP"] = 147,
    ["TOGGLEMINIMAPROTATION"] = 148,
    ["TOGGLECHANNELPULLOUT"] = 149,
    ["TOGGLEACHIEVEMENT"] = 150,
    ["TOGGLESTATISTICS"] = 151,
    ["TOGGLECURRENCY"] = 152,
    ["STOPCASTING"] = 153,
    ["STOPATTACK"] = 154,
    ["DISMOUNT"] = 155,
    ["MINIMAPZOOMIN"] = 156,
    ["MINIMAPZOOMOUT"] = 157,
    ["TOGGLEMUSIC"] = 158,
    ["TOGGLESOUND"] = 159,
    ["MASTERVOLUMEUP"] = 160,
    ["MASTERVOLUMEDOWN"] = 161,
    ["TOGGLESELFMUTE"] = 162,
    ["TOGGLEUI"] = 163,
    ["TOGGLEFPS"] = 164,
    ["SCREENSHOT"] = 165,
    ["TOGGLESTATS"] = 166,
    ["TOGGLETRIS"] = 167,
    ["TOGGLEPORTALS"] = 168,
    ["TOGGLECOLLISION"] = 169,
    ["TOGGLECOLLISIONDISPLAY"] = 170,
    ["TOGGLEPLAYERBOUNDS"] = 171,
    ["TOGGLEPERFORMANCEDISPLAY"] = 172,
    ["TOGGLEPERFORMANCEPAUSE"] = 173,
    ["TOGGLEPERFORMANCEVALUES"] = 174,
    ["RESETPERFORMANCEVALUES"] = 175,
    ["TOGGLEANIMKITDISPLAY"] = 176,
    ["TOGGLECOMMENTATOR"] = 177,
    ["NEXTVIEW"] = 178,
    ["PREVVIEW"] = 179,
    ["CAMERAZOOMIN"] = 180,
    ["CAMERAZOOMOUT"] = 181,
    ["SETVIEW1"] = 182,
    ["SETVIEW2"] = 183,
    ["SETVIEW3"] = 184,
    ["SETVIEW4"] = 185,
    ["SETVIEW5"] = 186,
    ["SAVEVIEW1"] = 187,
    ["SAVEVIEW2"] = 188,
    ["SAVEVIEW3"] = 189,
    ["SAVEVIEW4"] = 190,
    ["SAVEVIEW5"] = 191,
    ["RESETVIEW1"] = 192,
    ["RESETVIEW2"] = 193,
    ["RESETVIEW3"] = 194,
    ["RESETVIEW4"] = 195,
    ["RESETVIEW5"] = 196,
    ["FLIPCAMERAYAW"] = 197,
    ["MULTIACTIONBAR1BUTTON1"] = 198,
    ["MULTIACTIONBAR1BUTTON2"] = 199,
    ["MULTIACTIONBAR1BUTTON3"] = 200,
    ["MULTIACTIONBAR1BUTTON4"] = 201,
    ["MULTIACTIONBAR1BUTTON5"] = 202,
    ["MULTIACTIONBAR1BUTTON6"] = 203,
    ["MULTIACTIONBAR1BUTTON7"] = 204,
    ["MULTIACTIONBAR1BUTTON8"] = 205,
    ["MULTIACTIONBAR1BUTTON9"] = 206,
    ["MULTIACTIONBAR1BUTTON10"] = 207,
    ["MULTIACTIONBAR1BUTTON11"] = 208,
    ["MULTIACTIONBAR1BUTTON12"] = 209,
    ["MULTIACTIONBAR2BUTTON1"] = 210,
    ["MULTIACTIONBAR2BUTTON2"] = 211,
    ["MULTIACTIONBAR2BUTTON3"] = 212,
    ["MULTIACTIONBAR2BUTTON4"] = 213,
    ["MULTIACTIONBAR2BUTTON5"] = 214,
    ["MULTIACTIONBAR2BUTTON6"] = 215,
    ["MULTIACTIONBAR2BUTTON7"] = 216,
    ["MULTIACTIONBAR2BUTTON8"] = 217,
    ["MULTIACTIONBAR2BUTTON9"] = 218,
    ["MULTIACTIONBAR2BUTTON10"] = 219,
    ["MULTIACTIONBAR2BUTTON11"] = 220,
    ["MULTIACTIONBAR2BUTTON12"] = 221,
    ["MULTIACTIONBAR3BUTTON1"] = 222,
    ["MULTIACTIONBAR3BUTTON2"] = 223,
    ["MULTIACTIONBAR3BUTTON3"] = 224,
    ["MULTIACTIONBAR3BUTTON4"] = 225,
    ["MULTIACTIONBAR3BUTTON5"] = 226,
    ["MULTIACTIONBAR3BUTTON6"] = 227,
    ["MULTIACTIONBAR3BUTTON7"] = 228,
    ["MULTIACTIONBAR3BUTTON8"] = 229,
    ["MULTIACTIONBAR3BUTTON9"] = 230,
    ["MULTIACTIONBAR3BUTTON10"] = 231,
    ["MULTIACTIONBAR3BUTTON11"] = 232,
    ["MULTIACTIONBAR3BUTTON12"] = 233,
    ["MULTIACTIONBAR4BUTTON1"] = 234,
    ["MULTIACTIONBAR4BUTTON2"] = 235,
    ["MULTIACTIONBAR4BUTTON3"] = 236,
    ["MULTIACTIONBAR4BUTTON4"] = 237,
    ["MULTIACTIONBAR4BUTTON5"] = 238,
    ["MULTIACTIONBAR4BUTTON6"] = 239,
    ["MULTIACTIONBAR4BUTTON7"] = 240,
    ["MULTIACTIONBAR4BUTTON8"] = 241,
    ["MULTIACTIONBAR4BUTTON9"] = 242,
    ["MULTIACTIONBAR4BUTTON10"] = 243,
    ["MULTIACTIONBAR4BUTTON11"] = 244,
    ["MULTIACTIONBAR4BUTTON12"] = 245,
    ["RAIDTARGET1"] = 246,
    ["RAIDTARGET2"] = 247,
    ["RAIDTARGET3"] = 248,
    ["RAIDTARGET4"] = 249,
    ["RAIDTARGET5"] = 250,
    ["RAIDTARGET6"] = 251,
    ["RAIDTARGET7"] = 252,
    ["RAIDTARGET8"] = 253,
    ["RAIDTARGETNONE"] = 254,
    ["VEHICLEEXIT"] = 255,
    ["VEHICLEPREVSEAT"] = 256,
    ["VEHICLENEXTSEAT"] = 257,
    ["VEHICLEAIMUP"] = 258,
    ["VEHICLEAIMDOWN"] = 259,
    ["VEHICLEAIMINCREMENT"] = 260,
    ["VEHICLEAIMDECREMENT"] = 261,
    ["VEHICLECAMERAZOOMIN"] = 262,
    ["VEHICLECAMERAZOOMOUT"] = 263,
    ["TURNORACTION"] = 264,
    ["CAMERAORSELECTORMOVE"] = 265,
    ["ITUNES_PLAYPAUSE"] = 266,
    ["ITUNES_NEXTTRACK"] = 267,
    ["ITUNES_BACKTRACK"] = 268,
    ["ITUNES_VOLUMEUP"] = 269,
    ["ITUNES_VOLUMEDOWN"] = 270,
    ["MOVIE_RECORDING_STARTSTOP"] = 271,
    ["MOVIE_RECORDING_CANCEL"] = 272,
    ["MOVIE_RECORDING_COMPRESS"] = 273,
    ["MOVIE_RECORDING_GUI"] = 274,
    ["HEADER_MOVEMENT"] = 275,
    ["HEADER_CHAT"] = 276,
    ["HEADER_ACTIONBAR"] = 277 ,
    ["HEADER_MULTICASTFUNCTIONS"] = 278,
    ["HEADER_BLANK"] = 279,
    ["HEADER_BLANK2"] = 280,
    ["HEADER_BLANK3"] = 281,
    ["HEADER_TARGETING"] = 282,
    ["HEADER_INTERFACE"] = 283,
    ["HEADER_MISC"] = 284,
    ["HEADER_CAMERA"] = 285,
    ["HEADER_MULTIACTIONBAR"] = 286,
    ["HEADER_BLANK4"] = 287,
    ["HEADER_BLANK5"] = 288,
    ["HEADER_BLANK6"] = 289,
    ["HEADER_RAID_TARGET"] = 290,
    ["HEADER_VEHICLE"] = 291,
    ["HEADER_ITUNES_REMOTE"] = 292,
    ["HEADER_MOVIE_RECORDING_SECTION"] = 293,
    ["TOGGLEENCOUNTERJOURNAL"] = 294,
    ["TARGETNEAREST"] = 295,
    ["TARGETPREVIOUS"] = 296,
    ["EXTRAACTIONBUTTON1"] = 297,
    ["TARGETARENA1"] = 298,
    ["TARGETARENA2"] = 299,
    ["TARGETARENA3"] = 300,
    ["TARGETARENA4"] = 301,
    ["TARGETARENA5"] = 302,
    ["FOCUSARENA1"] = 303,
    ["FOCUSARENA2"] = 304,
    ["FOCUSARENA3"] = 305,
    ["FOCUSARENA4"] = 306,
    ["FOCUSARENA5"] = 307,
    ["TOGGLECOREABILITIESBOOK"] = 308,
    ["TOGGLEGROUPFINDER"] = 309,
    ["TOGGLEDUNGEONSANDRAIDS"] = 310,
    ["TOGGLECOLLECTIONS"] = 311,
    ["TOGGLECOLLECTIONSMOUNTJOURNAL"] = 312,
    ["TOGGLECOLLECTIONSPETJOURNAL"] = 313,
    ["TOGGLECOLLECTIONSTOYBOX"] = 314,
    ["TOGGLEGARRISONLANDINGPAGE"] = 315,
    ["ITEMCOMPARISONCYCLING"] = 316,
    ["TOGGLEGRAPHICSSETTINGS"] = 317,
}


local MYSLOT_KEYS ={
    ["KEYCODE"] = 0,
    ["F1"] = 1,
    ["F2"] = 2,
    ["F3"] = 3,
    ["F4"] = 4,
    ["F5"] = 5,
    ["F6"] = 6,
    ["F7"] = 7,
    ["F8"] = 8,
    ["F9"] = 9,
    ["F10"] = 10,
    ["F11"] = 11,
    ["F12"] = 12,
    ["F13"] = 13,
    ["BUTTON1"] = 14,
    ["BUTTON2"] = 15,
    ["BUTTON3"] = 16,
    ["BUTTON4"] = 17,
    ["BUTTON5"] = 18,
    ["BUTTON6"] = 19,
    ["BUTTON7"] = 20,
    ["BUTTON8"] = 21,
    ["BUTTON9"] = 22,
    ["BUTTON10"] = 23,
    ["BUTTON11"] = 24,
    ["BUTTON12"] = 25,
    ["BUTTON13"] = 26,
    ["BUTTON14"] = 27,
    ["BUTTON15"] = 28,
    ["BUTTON16"] = 29,
    ["BUTTON17"] = 30,
    ["BUTTON18"] = 31,
    ["BUTTON19"] = 32,
    ["BUTTON20"] = 33,
    ["BUTTON21"] = 34,
    ["BUTTON22"] = 35,
    ["BUTTON23"] = 36,
    ["BUTTON24"] = 37,
    ["BUTTON25"] = 38,
    ["BUTTON26"] = 39,
    ["BUTTON27"] = 40,
    ["BUTTON28"] = 41,
    ["BUTTON29"] = 42,
    ["BUTTON30"] = 43,
    ["BUTTON31"] = 44,
    ["NUMPAD0"] = 45,
    ["NUMPAD1"] = 46,
    ["NUMPAD2"] = 47,
    ["NUMPAD3"] = 48,
    ["NUMPAD4"] = 49,
    ["NUMPAD5"] = 50,
    ["NUMPAD6"] = 51,
    ["NUMPAD7"] = 52,
    ["NUMPAD8"] = 53,
    ["NUMPAD9"] = 54,
    ["0"] = 55,
    ["1"] = 56,
    ["2"] = 57,
    ["3"] = 58,
    ["4"] = 59,
    ["5"] = 60,
    ["6"] = 61,
    ["7"] = 62,
    ["8"] = 63,
    ["9"] = 64,
    ["A"] = 65,
    ["B"] = 66,
    ["C"] = 67,
    ["D"] = 68,
    ["E"] = 69,
    ["F"] = 70,
    ["G"] = 71,
    ["H"] = 72,
    ["I"] = 73,
    ["J"] = 74,
    ["K"] = 75,
    ["L"] = 76,
    ["M"] = 77,
    ["N"] = 78,
    ["O"] = 79,
    ["P"] = 80,
    ["Q"] = 81,
    ["R"] = 82,
    ["S"] = 83,
    ["T"] = 84,
    ["U"] = 85,
    ["V"] = 86,
    ["W"] = 87,
    ["X"] = 88,
    ["Y"] = 89,
    ["Z"] = 90,
    ["`"] = 91,
    ["-"] = 92,
    ["="] = 93,
    ["["] = 94,
    ["]"] = 95,
    [";"] = 96,
    ["'"] = 97,
    ["\\"] = 98,
    [","] = 99,
    ["."] = 100,
    ["/"] = 101,
    ["CAPSLOCK"] = 102,
    ["NUMLOCK"] = 103,
    ["PAGEDOWN"] = 104,
    ["PAGEUP"] = 105,
    ["END"] = 106,
    ["HOME"] = 107,
    ["DELETE"] = 108,
    ["INSERT"] = 109,
    ["DOWN"] = 110,
    ["RIGHT"] = 111,
    ["UP"] = 112,
    ["LEFT"] = 113,
    ["TAB"] = 114,
    ["BACKSPACE"] = 115,
    ["ENTER"] = 116,
    ["ESCAPE"] = 117,
    ["NUMPAD"] = 118,
    ["NUMPADEQUALS"] = 119,
    ["NUMPADDECIMAL"] = 120,
    ["NUMPADDIVIDE"] = 121,
    ["NUMPADMULTIPLY"] = 122,
    ["NUMPADMINUS"] = 123,
    ["NUMPADPLUS"] = 124,
    ["SPACE"] = 125,
    ["MOUSEWHEELUP"] = 126,
    ["MOUSEWHEELDOWN"] = 127,
    ["SHIFT"] = 128,
    ["PRINTSCREEN"] = 129,
}


local MYSLOT_MOD_KEYS = {
    ["SHIFT"] = 1,
    ["CTRL"] = 2,
    ["ALT"] = 3,
    ["META"] = 4,
    ["NONE"] = 0,
    ["CTRL-ALT"] = 106,
    ["CTRL-SHIFT"] = 107,
    ["ALT-CTRL"] = 108,
    ["ALT-SHIFT"] = 109,
    ["SHIFT-CTRL"] = 100,
    ["SHIFT-ALT"] = 101,
    ["ALT-CTRL-SHIFT"] = 110,
    ["ALT-SHIFT-CTRL"] = 111,
    ["CTRL-ALT-SHIFT"] = 112,
    ["CTRL-SHIFT-ALT"] = 113,
    ["SHIFT-ALT-CTRL"] = 114,
    ["SHIFT-CTRL-ALT"] = 115,
    ["ALT-META"] = 116,
    ["CTRL-META"] = 117,
    ["SHIFT-META"] = 118,
    ["ALT-CTRL-META"] = 119,
    ["ALT-SHIFT-META"] = 120,
    ["CTRL-SHIFT-META"] = 121,
    ["CUSTOM"] = 255,
}

local function r(d)
    local t = {}
    for k,v in pairs(d) do
        t[v] = k    
    end
    return t
end


MySlot.BINDS = MYSLOT_BINDS
MySlot.KEYS = MYSLOT_KEYS
MySlot.MOD_KEYS = MYSLOT_MOD_KEYS

MySlot.R_BINDS = r(MYSLOT_BINDS)
MySlot.R_KEYS = r(MYSLOT_KEYS)
MySlot.R_MOD_KEYS = r(MYSLOT_MOD_KEYS)
