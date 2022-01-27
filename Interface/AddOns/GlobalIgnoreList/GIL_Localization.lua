local _, L   = ...
local locale = GetLocale()

local function badString (L, key)
	return "BAD TEXT \"".. (key or "NIL") .. "\""
end

setmetatable (L, {__index=badString})

-- ENGLISH DEFAULTS

L["ON"]		= "ON"
L["OFF"]	= "OFF"
L["DAY"]	= "day"
L["DAYS"]	= "days"
L["EXP_NVR"]	= "Never"
L["EXP_TDY"]	= "Today"
L["LIST_1"]	= "Characters on ignore for %d or more days:"
L["LIST_2"]	= "All ignored NPC characters:"
L["LIST_3"]	= "All ignored players on server %s:"
L["LIST_4"]	= "All characters on global ignore:"
L["LIST_5"]	= "Listed %d character(s)"
L["SYNC_1"]	= "Removing %s from character's ignore list"
L["SYNC_2"]	= "Adding %s to character's ignore list"
L["LOAD_1"]	= "Type /gignore or /gi for help and options"
L["LOAD_2"]	= "New character found: Importing ignored players"
L["LOAD_3"]	= "Adding %s to global ignore list"
L["LOAD_4"] = "Synchronizing Ignore list..."
L["LOAD_5"] = "WARNING: Synchronization could not be preformed at this time because there were |cffffff00%s|cffffffff player(s) on Blizzard's ignore list reported as \"%s\". If synchronization continues to fail, the unknown player may need to be manually removed from Blizzard ignore list.  The list will try to synchronize the next time the GUI is opened, or by typing /gi sync in chat."
L["RCM_1"]	= "Edit note"
L["RCM_2"]	= "Set Expiration"
L["RCM_3"]	= "Reset Expiration"
L["RCM_4"]	= "Remove from Ignore"
L["RCM_5"]	= "Cancel"
L["RCM_6"]  = "Add to Ignore"
L["OVER_1"]	= "Realm:"
L["OVER_2"]	= "Faction:"
L["OVER_3"]	= "Ignored:"
L["OVER_4"]	= "Expires:"
L["OVER_5"]	= "After %d day(s) (%d day(s) from today)"
L["ADD_1"]	= "%s is already ignored"
L["ADD_2"]	= "%s added to global ignore"
L["ADD_3"]	= "You cannot ignore yourself, silly!"
L["ADD_4"]	= "Cannot ignore player due to Blizzard bug. Try ignoring again"
L["REM_1"]	= "%s removed from global ignore"
L["BOX_1"]	= "Remove after how many days on the list?\n(Use 0 to disable expiration)"
L["BOX_2"]	= "Are you sure you wish to reset to the latest default spam filters?  You will lose all custom filters!"
L["BOX_3"]	= "Save"
L["BOX_4"]	= "Reset"
L["BOX_5"]	= "Cancel"
L["BOX_6"]  = "Accept"
L["BOX_7"]  = "|cffffff00INVITE WARNING: %s\n\n|cffffffffThis player is on your Global Ignore List.  Do you still want to invite them?\n"
L["BOX_8"]  = "|cffffff00PARTY WARNING\n\n|cffffffffThere are |cffffff00%d |cffffffffplayer(s) on your ignore list in group:\n|cff69CCF0%s\n"
L["BOX_9"]	= "Are you sure wish to remove the selected filter?"
L["BOX_10"] = "Remove"
L["CMD_1"]	= "WARNING: You will remove all ignores on all characters on all servers. Type \"/gi clear confirm\" to clear the list"
L["CMD_2"]	= "Database cleared"
L["CMD_3"]	= "Newly ignored players will now be automatically removed after |cffffff00%d|cffffffff %s.  Existing ignored players will be unaffected.  If you want to disable auto expire, set this value to zero (0)."
L["CMD_4"]	= "Asking for ignore note when a player is ignored is now |cffffff00on"
L["CMD_5"]	= "Asking for ignore note when a player is ignored is now |cffffff00off"
L["CMD_6"]	= "Synchronization messages are now |cffffff00on"
L["CMD_7"]	= "Synchronization messages are now |cffffff00off"
L["CMD_8"]	= "UNUSED"
L["CMD_9"]	= "UNUSED"
L["CMD_10"]	= "Only sync same server characters is now |cffffff00on"
L["CMD_11"]	= "Only sync same server characters is now |cffffff00off"
L["CMD_12"]	= "|cffffff00%s|cffffffff has been removed from NPC ignore list"
L["CMD_13"]	= "|cffffff00%s|cffffffff has been added to NPC ignore list"
L["CMD_14"]	= "%s will be automatically removed after %d days."
L["CMD_15"]	= "Invalid command please double check what you've typed"
L["CMD_16"]	= "Remove players that have been ignored for |cffffff00%d|cffffffff or more days"
L["CMD_17"]	= "Type |cffffff00/gi prune confirm|cffffffff to prune |cffffff00%d|cffffffff players"
L["CMD_18"]	= "|cffffff00%s|cffffffff added to server ignore list"
L["CMD_19"]	= "|cffffff00%s|cffffffff removed from server ignore list"
L["HELP_1"]	= "|cffff99ffTYPE: |cffffffff/gi [command], where [command] is one of:"
L["HELP_2"]	= "|cffffff00list|cffffffff: List all players on global ignore list"
L["HELP_3"]	= "|cffffff00clear|cffffffff: Clear all names from global ignore list"
L["HELP_4"]	= "|cffffff00add player|cffffffff: Add [player] to ignore list"
L["HELP_5"]	= "|cffffff00remove player|cffffffff: Remove [player] from ignore list"
L["HELP_6"]	= "|cffffff00expire player days|cffffffff: Remove [player] from list after [days]"
L["HELP_7"]	= "|cffffff00prune days|cffffffff: Remove those on list for [days] or more days"
L["HELP_8"]	= "|cffffff00npc npcname|cffffffff: Add or remove an NPC character ignore"
L["HELP_9"]	= "|cffffff00sync|cffffffff: Synchronize ignore list"
L["HELP_10"]	= "|cffffff00showmsg on|off|cffffffff: Show actions during synchronization (%s)"
L["HELP_11"]	= "|cffffff00sameserver on|off|cffffffff: Only add same-server characters to account wide ignore (%s)"
L["HELP_12"]	= "|cffffff00defexpire days|cffffffff: Newly ignored players auto expire after (|cffffff00%d|cffffffff) days"
L["HELP_13"]	= "|cffffff00asknote on|off|cffffffff: Ask for ignore note on ignore (%s)"
L["HELP_14"]	= "|cffff99ffNOTE: |cffffffffUse /ignore, and UI as usual to add/remove players!"
L["HELP_15"]	= "|cffffff00server servername|cffffffff: Add or remove an entire server ignore"
L["HELP_16"]	= "|cffffff00gui|cffffffff: Open GIL user interface"
L["CHAT_1"]	= "WARNING: There are %d ignored player(s) in this group: |cffffff00%s"
L["MSG_1"]	= "[Global Ignore List] You are being ignored."
L["COL_1"]	= "Player Name"
L["COL_2"]	= "Server Name"
L["COL_3"]	= "Type"
L["COL_4"]	= "Listed"
L["COL_5"]	= "Expires"
L["COL_6"]	= "Note"
L["COL_7"]	= "Alts"
L["COL_8"]	= "Active"
L["COL_9"]	= "Description"
L["COL_10"]	= "Filter"
L["BUT_1"]	= "Remove Ignore"
L["BUT_2"]	= "Ignore Player"
L["BUT_3"]	= "Ignore NPC"
L["BUT_4"]	= "Ignore Server"
L["BUT_5"]	= "Create Filter"
L["BUT_6"]	= "Remove Filter"
L["BUT_7"]	= "Reset Defaults"
L["TAB_1"]	= "Ignore List"
L["TAB_2"]	= "Spam Filters"
L["TAB_3"]	= "Options"
L["INFO_1"]	= "%d entries in list"
L["INFO_2"]	= "Your spam filters have blocked a total of |cffffff00%d|cffffffff spammers"
L["INFO_3"]	= "This filter has blocked |cffffff00%d|cffffffff spammers"
L["OPT_1"]	= "Ask for note after adding a new ignore"
L["OPT_2"]	= "Open Global Ignore UI with Blizzard Friends/Ignore UI"
L["OPT_3"]	= "UNUSED"
L["OPT_4"]	= "Only add same server players to account-wide ignore (highly recommended on)"
L["OPT_5"]	= "Default expiration days for newly added ignores (Use 0 for never)"
L["OPT_6"]	= "Attempt to track character name changes and deleted characters (account wide ignore only)"
L["OPT_7"]	= "Enable chat spam filtering"
L["OPT_8"]	= "Ignore List Options:"
L["OPT_9"]	= "Spam Filtering Options:"
L["OPT_10"]	= "Perform reverse spam filtering (not recommended)"
L["OPT_11"] = "Automatically update default Spam Filters"
L["OPT_12"] = "Never filter Guild chat"
L["OPT_13"] = "Never filter Party/Group chat"
L["OPT_14"] = "Never filter private chat"
L["TIP_1"]  = "|cffffffffFilter Editing Help\n\n|cffffff00Enter chat filter in the box below.  Chat text is converted to lower cased letters before\napplying filters, so all filters must be defined using lower cased letters only.\n\nAny links entered into the edit box will be automatically converted to the appropriate\nfilter tag.\n\nPlease view the website for more detailed information on creating chat filters."
L["TIP_2"]  = "|cffffffffFilter Testing Help\n\n|cffffff00Enter chat text into the Filter Testing box and GIL will apply the current filter\nto the contents in the box whenever the Test button is clicked.\n\nThe result of the applied filter is shown as BLOCKED if the text would be\nfiltered, or PASSED if the text would not be filtered."

-- GERMAN
-- Translated by LadyBellaSilver
if locale == "deDE" then
L["DAY"]	= "tag"
L["DAYS"]	= "tage"

L["EXP_NVR"]	= "Nie"

L["COL_1"]	= "Spielername"
L["COL_2"]	= "Servername"
L["COL_3"]	= "Typ"
L["COL_4"]	= "Gelistet"
L["COL_5"]	= "Verfällt"
L["COL_6"]	= "Notiz"

L["OVER_1"]	= "Server:"
L["OVER_2"]	= "Fraktion:"
L["OVER_3"]	= "Ignoriert:"
L["OVER_4"]	= "Verfällt:"

L["OPT_1"]	= "Frage nach einer Notiz nach dem Hinzufügen einer neuen Ignorierung"
L["OPT_2"]	= "Öffne die Global-Ignore-Liste gleichzeitig mit der Blizzard-Freunde/Ignorieren-Liste"
L["OPT_4"]	= "Füge nur Spieler vom selben Server zur accountweiten Ignorierung hinzu. (\"an\" wird hoch empfohlen)"
L["OPT_5"]	= "Standardverfalltage für neu hinzugefügte Ignorierte (0 für nie)"
L["OPT_6"]	= "Versuche die Änderung von Charakternamen zu verfolgen und entferne gelöschte Charaktere"
end

-- PORTUGUESE
if locale == "ptBR" then
end

-- FRENCH
if locale == "frFR" then
end

-- RUSSIAN
if locale == "ruRU" then
end

-- SPANISH (SPAIN AND MEXICO)
if (locale == "esES") or (locale == "esMX") then
end

-- CHINESE (CHINA)
-- Translated by 堕落治疗
if locale == "zhCN" then
L["ON"]  = "开"
L["OFF"] = "关"
L["DAY"] = "天"
L["DAYS"] = "天数"
L["EXP_NVR"] = "永不"
L["EXP_TDY"] = "今天"
L["LIST_1"] = "被屏蔽 %d 天及以上的角色:"
L["LIST_2"] = "所有被屏蔽的NPC角色:"
L["LIST_3"] = "服务器上被屏蔽的所有玩家 %s:"
L["LIST_4"] = "共用屏蔽中被屏蔽的所有角色:"
L["LIST_5"] = "列出的 %d 角色"
L["SYNC_1"] = "把 %s 从角色屏蔽列表中删除"
L["SYNC_2"] = "把 %s 加入角色屏蔽列表"
L["LOAD_1"] = "输入 /gignore 或 /gi 查看帮助和设置"
L["LOAD_2"] = "发现新角色: 导入被屏蔽的玩家"
L["LOAD_3"] = "将 %s 加入共用屏蔽列表"
L["LOAD_4"] = "屏蔽列表同步中..."
L["LOAD_5"] = "警告：目前无法执行同步，因为有 |cffffff00%s|cffffffff 玩家 在暴雪的屏蔽列表中报告为 \"%s\". 如果同步仍旧无法进行，不可识别的玩家需要手动从暴雪屏蔽列表里移除.列表将在下次设置界面打开或者在聊天频道中输入/gi sync时再次尝试同步."
L["RCM_1"] = "编辑备注"
L["RCM_2"] = "设置过期时间"
L["RCM_3"] = "重置过期时间"
L["RCM_4"] = "从屏蔽中删除"
L["RCM_5"] = "取消"
L["RCM_6"]  = "加入屏蔽"
L["OVER_1"] = "服务器:"
L["OVER_2"] = "阵营:"
L["OVER_3"] = "已屏蔽:"
L["OVER_4"] = "过期:"
L["OVER_5"] = "在 %d 天后 (%d 从今天起)"
L["ADD_1"] = "%s 已经被屏蔽"
L["ADD_2"] = "%s 已加入通用屏蔽"
L["ADD_3"] = "笨蛋，你不能屏蔽你自己!"
L["ADD_4"] = "因暴雪爸爸的bug无法被忽略，请再次尝试"
L["REM_1"] = "%s 已从通用屏蔽中删除"
L["BOX_1"] = "几天后从列表中删除？\n(使用0禁用过期)"
L["BOX_2"] = "确认重置所有刷屏过滤条件？所有自定义条件将丢失！"
L["BOX_3"] = "保存"
L["BOX_4"] = "重置"
L["BOX_5"] = "取消"
L["BOX_6"]  = "接受"
L["BOX_7"]  = "|cffffff00邀请警告: %s\n\n|cffffffff该玩家在你的通用屏蔽列表中，仍旧邀请？\n"
L["BOX_8"]  = "|cffffff00队伍警告\n\n|cffffffff有 |cffffff00%d |cffffffff名玩家在你的屏蔽列表中:\n|cff69CCF0%s\n"
L["BOX_9"] = "确认删除选定的过滤条件?"
L["BOX_10"] = "删除"
L["CMD_1"] = "警告：你将删除屏蔽清单里所有服务器上的所有玩家. 输入 \"/gi clear confirm\" 清除列表"
L["CMD_2"] = "D数据已清理"
L["CMD_3"] = "新屏蔽玩家将在 |cffffff00%d|cffffffff %s 天后自动删除.  已在列表中存在的玩家不受影响。如果你想关闭自动过期功能，请将该值设置为0"
L["CMD_4"] = "屏蔽备注已 |cffffff00开"
L["CMD_5"] = "屏蔽备注已 |cffffff00关"
L["CMD_6"] = "同步信息已 |cffffff00开"
L["CMD_7"] = "同步信息已 |cffffff00关"
L["CMD_8"] = "未用"
L["CMD_9"] = "未用"
L["CMD_10"] = "仅同步同服务器角色已 |cffffff00开"
L["CMD_11"] = "仅同步同服务器角色已 |cffffff00关"
L["CMD_12"] = "|cffffff00%s|cffffffff 已从NPC屏蔽列表里移除"
L["CMD_13"] = "|cffffff00%s|cffffffff 已加入NPC屏蔽列表"
L["CMD_14"] = "%s 将自动移除在 %d 天后."
L["CMD_15"] = "无效命令，请检查输入是否正确"
L["CMD_16"] = "删除已被屏蔽 |cffffff00%d|cffffffff 天及以上的角色"
L["CMD_17"] = "输入 |cffffff00/gi prune confirm|cffffffff 以精简 |cffffff00%d|cffffffff 玩家"
L["CMD_18"] = "|cffffff00%s|cffffffff 加入服务器屏蔽列表"
L["CMD_19"] = "|cffffff00%s|cffffffff 从服务器屏蔽列表里移除"
L["HELP_1"] = "|cffff99ff输入: |cffffffff/gi [command],  [command] 包含:"
L["HELP_2"] = "|cffffff00list|cffffffff: 列出通用屏蔽列表中的所有玩家"
L["HELP_3"] = "|cffffff00clear|cffffffff: 清除通用列表中的所有名字"
L["HELP_4"] = "|cffffff00add player|cffffffff: 将 [player] 玩家加入屏蔽列表"
L["HELP_5"] = "|cffffff00remove player|cffffffff: 将 [player] 玩家从屏蔽列表中删除"
L["HELP_6"] = "|cffffff00expire player days|cffffffff:  [days] 天后将 [player] 玩家从屏蔽列表中删除"
L["HELP_7"] = "|cffffff00prune days|cffffffff: 删除已在屏蔽列表中 [days] 天及以上的都玩家"
L["HELP_8"] = "|cffffff00npc npcname|cffffffff: 添加或者删除NPC屏蔽"
L["HELP_9"] = "|cffffff00sync|cffffffff: 同步屏蔽列表"
L["HELP_10"] = "|cffffff00showmsg on|off|cffffffff: 同步时显示动作(%s)"
L["HELP_11"] = "|cffffff00sameserver on|off|cffffffff: 仅添加同服务器角色到账号屏蔽列表(%s)"
L["HELP_12"] = "|cffffff00defexpire days|cffffffff: 新屏蔽玩家将在 (|cffffff00%d|cffffffff) 天后自动过期"
L["HELP_13"] = "|cffffff00asknote on|off|cffffffff: 屏蔽时询问原因 (%s)"
L["HELP_14"] = "|cffff99ffNOTE: |cffffffff使用 /ignore, 和默认界面来新增/移除玩家!"
L["HELP_15"] = "|cffffff00server servername|cffffffff: 添加或者移除全部服务器屏蔽列表"
L["HELP_16"] = "|cffffff00gui|cffffffff: 打开用户设置界面"
L["CHAT_1"] = "警告: 队伍中有 %d 名被屏蔽玩家: |cffffff00%s"
L["MSG_1"] = "[通用屏蔽列表] 你已被屏蔽."
L["COL_1"] = "玩家姓名"
L["COL_2"] = "服务器名称"
L["COL_3"] = "阵营"
L["COL_4"] = "已列入"
L["COL_5"] = "过期"
L["COL_6"] = "备注"
L["COL_7"] = "小号"
L["COL_8"] = "启用"
L["COL_9"] = "描述"
L["COL_10"] = "过滤"
L["BUT_1"] = "移除屏蔽"
L["BUT_2"] = "屏蔽玩家"
L["BUT_3"] = "屏蔽NPC"
L["BUT_4"] = "屏蔽服务器"
L["BUT_5"] = "创建过滤条件"
L["BUT_6"] = "移除过滤条件"
L["BUT_7"] = "重设默认值"
L["TAB_1"] = "屏蔽列表"
L["TAB_2"] = "过滤规则"
L["TAB_3"] = "设置"
L["INFO_1"] = "%d 名玩家在屏蔽列表中"
L["INFO_2"] = "你已累计屏蔽 |cffffff00%d|cffffffff 名刷屏者"
L["INFO_3"] = "此过滤条件已经屏蔽 |cffffff00%d|cffffffff 名刷屏者"
L["OPT_1"] = "新增屏蔽玩家时添加原因"
L["OPT_2"] = "打开好友列表时显示Global Ignore插件"
L["OPT_3"] = "未用"
L["OPT_4"] = "仅添加同服务器玩家到账号屏蔽列表中(强烈推荐)"
L["OPT_5"] = "对新屏蔽的玩家设置默认过期天数( 0 表示从不)"
L["OPT_6"] = "尝试追踪改名玩家和已删除角色(仅账号屏蔽列表)"
L["OPT_7"] = "启用聊天刷屏过滤"
L["OPT_8"] = "屏蔽列表设置:"
L["OPT_9"] = "刷屏过滤设置:"
L["OPT_10"] = "执行反刷屏过滤 (不建议)"
L["OPT_11"] = "自动更新默认的刷屏过滤规则"
L["OPT_12"] = "从不过滤公会聊天"
L["OPT_13"] = "从不过滤小队/团队聊天"
L["OPT_14"] = "从不过滤密语"
L["TIP_1"]  = "|cffffffff过滤规则编辑帮助\n\n|cffffff00在下面输入框内输入过滤规则. 在应用过滤规则之前，所有字母必须转为小写。因此，必须仅使用小写字母定义所有过滤规则.\n\n输入到编辑框中的所有物品链接都将自动转换为相应的\n过滤标记.\n\n请查看网站以获取有关创建聊天过滤规则的更多详细信息."
L["TIP_2"]  = "|cffffffff过滤规则测试帮助\n\n|cffffff00在过滤规则测试框中输入聊天文本，每当单击测试按钮时\nGIL都会将当前过滤规则应用于该框中的内容.\n\n如果聊天文本被过滤，将显示BLOCKED\n如果聊天文本未被过滤，将显示PASSED."
end

-- CHINESE (TAIWAN)
if locale == "zhTW" then
end

-- KOREAN
if locale == "koKR" then
end

-- ITALIAN
if locale == "itIT" then
end
