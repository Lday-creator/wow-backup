-- by yaroot (yaroot#gmail.com)

if(GetLocale() ~= 'zhTW') then return end

local _, addon = ...
local baseLocale = {
    ["A binding that belongs to the 'default' binding-set will always be active on your unit frames, unless you override it with another binding."] = "默認組別, 設置將對所有框體有效, 除非有其他組別的相同的按鍵設置",
    ["A binding that belongs to the 'enemy' binding-set will always be active when clicking on unit frames that display enemy units, ie those you can attack. If you click on a unit that you cannot attack, nothing will happen." ] = "敵對組別, 設置只對敵對的框體有效, 當你對敵對的框體點擊施法時, 這個設置將被觸發.",
    ["A binding that belongs to the 'frield' binding-set will only be active when clicking on unit frames that display friendly units, ie those you can heal and assist. If you click on a unit that you cannot heal or assist, nothing will happen."] = "友善組別, 該組別設置只對友善的框體有效, 當你對友善的框體點擊施法時, 該設置將被觸發.",
    ["A binding that belongs to the 'hovercast' binding-set is active whenever the mouse is over a unit frame, or a character in the 3D world. This allows you to use 'hovercasting', where you hover over a unit in the world and press a key to cast a spell on them. THese bindings are also active over unit frames."] = "全局組別, 該組別按鍵設置為懸浮式施法, 將鼠標移動到其他玩家/怪物或者頭像框體上將可以直接對其施法.",
    ["A binding that belongs to the 'ooc' binding-set will only be active when the player is out-of-combat. As soon as the player enters combat, these bindings will no longer be active, so be careful when choosing this binding-set for any spells you use frequently."] = "非戰鬥組別, 這個組別的設置只在不戰鬥時有效.",
    ["Accept"] = "接受",
    ["Action"] = "動作",
    ["Add new profile"] = "添加新配置",
    ["Alt"] = "Alt",
    ["Arena enemy frames"] = "競技場敵對框體",
    ["Bind other"] = "綁定其他",
    ["Bind spell"] = "綁定技能",
    ["Binding"] = "綁定",
    ["Boss target frames"] = "首領目標框體",
    ["Cancel"] = "取消",
    ["Cast %s"] = "施放 %s",
    ["Change binding"] = "修改綁定",
    ["Change binding: %s"] = "修改綁定: %s",
    ["Clique Binding Configuration"] = "Clique 設置",
    ["Clique binding configuration"] = "Clique 設置",
    ["Clique: 'default' binding-set"] = "組別: 默認",
    ["Clique: 'enemy' binding-set"] = "組別: 敵對",
    ["Clique: 'friend' binding-set"] = "組別: 友善",
    ["Clique: 'global' binding-set"] = "組別: 全局",
["Clique: 'hovercast' binding-set"] = "組別: 懸浮施法",
    ["Clique: 'ooc' binding-set"] = "組別: 非戰鬥",

    ["Compact party frames"] = "小隊框體",
    ["Compact raid frames"] = "團隊框體",
    ["Configure binding: '%s'"] = "設置綁定: '%s'",
    ["Ctrl"] = "Ctrl",
    ["Current: "] = "當前: ",
    ["Default"] = "默認",
    ["Delete binding"] = "刪除綁定",
    ["Delete profile '%s'"] = "刪除配置: '%s'",
["Delete profile: %s"] = "Delete profile: %s",
    ["Disable out of combat clicks when party members enter combat"] = "當隊友進入戰鬥時禁用'非戰鬥' 組別的快捷鍵",
["Edit macro"] = "編輯宏",
    ["Enable/Disable click-sets"] = "設置組別...",
    ["Enemy"] = "敵對",
    ["Frame name"] = "框體名",
    ["Friend"] = "友善",
["Global bindings (no target)"] = "全局按鍵(無目標)",
["Hovercast bindings (target required)"] = "懸浮按鍵(需要目標)",
    ["In order to specify a binding, move your mouse over the button labelled 'Set binding' and either click with your mouse or press a key on your keyboard. You can modify the binding by holding down a combination of the alt, control and shift keys on your keyboard."] = "設置綁定先要將鼠標移動到'設置綁定' 按鈕上, 然後點擊需要設置的快捷鍵. 你可以使用crtl/shift/alt之類的組合鍵." ,
    ["LAlt"] = '左Alt',
    ["LCtrl"] = '左Ctrl',
    ["LShift"] = '左Shift',
    ["LeftButton"] = "左鍵點擊",
    ["MiddleButton"] = "中間點擊",
    ["MousewheelDown"] = "滾輪向下滾動",
    ["MousewheelUp"] = "滾輪向上滾動",
    ["No binding set"] = "無組別",
    ["Open unit menu"] = "打開右鍵菜單",
    ["Options"] = "設置",
    ["Out-of-combat only"] = "非戰鬥",
    ["Party member frames"] = "小隊框體",
    ["Player frame"] = "玩家頭像",
    ["Player's focus frame"] = "焦點頭像",
    ["Player's pet frame"] = "寵物頭像",
    ["Player's target frame"] = "目標頭像",
    ["Primary talent spec profile:"] = "主天賦配置",
    ["Profile Management:"] = "配置管理",
    ["RAlt"] = '右Alt',
    ["RCtrl"] = '右Ctrl',
    ["RShift"] = '右Shift',
    ["RightButton"] = "右鍵點擊",
    ["Run custom macro"] = "運行自定義宏",
    ["Run macro"] = "運行宏",
    ["Run macro '%s'"] = "運行宏 '%s'",
    ["Save"] = "保存",
    ["Secondary talent spec profile:"] = "第二天賦配置: ",
    ["Select All"] = "選擇所有",
    ["Select None"] = "清除所有選擇",
    ["Select a binding type"] = "選擇綁定類型",
    ["Select profile: %s"] = "選擇配置: %s",
    ["Set binding"] = "設置綁定",
    ["Set binding: %s"] = "設置綁定: %s",
    ["Shift"] = true,
    ["Show unit menu"] = "打開右鍵菜單",
    ["Swap profiles based on talent spec"] = "隨天賦切換配置",
    ["Target clicked unit"] = "選中點擊單位",
    ["Target of focus frame"] = "焦點的目標",
    ["Target of target frame"] = "目標的目標",
    ["These options control whether or not Clique automatically registers certain Blizzard-created frames for binding. Changes made to these settings will not take effect until the user interface is reloaded."] = "這些設置將決定Clique 是否將原始界面的框體註冊按鍵綁定. 修改該設置將只在重載界面後有效.",
    ["This binding is DISABLED"] = "此項設置已被>禁用<",
["This binding is invalid, please delete"] = "非法設置, 請刪除",
    ["This panel allows you to blacklist certain frames from being included for Clique bindings. Any frames that are selected in this list will not be registered, although you may have to reload your user interface to have them return to their original bindings."] = "在這頁設置裡, 你可以勾選框體以將其加入黑名單來防止Clique 設置其點擊施法. 任何你選中的框體都不會被Clique 註冊, 該頁設置改動將在重載後生效.",
    ["Trigger bindings on the 'down' portion of the click (requires reload)"] = "在'按下'按鍵時觸發(需要重載)",
["Unknown"] = "未知",
    ["Unknown binding type '%s'"] = "未知綁定類型'%s'",
    ["When both the Clique binding configuration window and the spellbook are open, you can set new bindings simply by performing them on the spell icon in your spellbook. Simply move your mouse over a spell and then click or press a key on your keyboard along with any combination of the alt, control, and shift keys. The new binding will be added to your binding configuration."] = "當Clique 設置界面和法術書同時打開時, 你只要用需要設置的快捷鍵點擊法術就可以將其添加到Clique 設置中. 將鼠標移動到法術圖標上, 同時可以按下ctrl, alt 和shift 中的一個或多個, 然後點擊鼠標的某一個按鍵, 這項設置就會被添加." ,
["You are in Clique binding mode"] = "你現在處於Clique 設置模式中",
    ["You can use this page to create a custom macro to be run when activating a binding on a unit. When creating this macro you should keep in mind that you will need to specify the target of any actions in the macro by using the ' mouseover' unit, which is the unit you are clicking on. For example, you can do any of the following:\n\n/cast [target=mouseover] Regrowth\n/cast [@mouseover] Regrowth\n/cast [ @mouseovertarget] Taunt\n\nHover over the 'Set binding' button below and either click or press a key with any modifiers you would like included. Then edit the box below to contain the macro you would like to have run when this binding is activated."] = "你可以在這頁創建一個用於點擊施放的自定義宏. 撰寫宏時需要注意, 你必須將施法動作的目標指定為'mouseover'. 例如, 你可以使用以下內容:\n\n/cast [target=mouseover] 癒合\n/cast [@mouseovertarget] 嘲諷\n\n將鼠標移動到設置綁定按鈕上然後按下鼠標和ctrl/alt/shift鍵來創建綁定. 然後撰寫你需要運行的宏",
}

addon:RegisterLocale('zhTW', baseLocale)
