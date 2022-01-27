-- colours nameplate healthbars depending on their name
-- (does not affect name-only mode)
local folder,ns=...
local addon = KuiNameplates
local core = KuiNameplatesCore
local mod = addon:NewPlugin('HealthBarByName',101)

-- table of names -> bar colours (r,g,b)
local names = {
     ['Duskwatch Battlemaster'] = {1,0,1},
}

-- comment out the next line (by adding two dashes at the start, like this) to
-- disable target colouring:
-- local COLOUR_TARGET = {.4,.8,.4}

-- To overwrite tank mode, set this to 6
-- To overwrite execute, set this to 5
local PRIORITY = 3

-- local functions #############################################################
-- reimplemented locally in execute & tankmode
local function CanOverwriteHealthColor(f)
    return not f.state.health_colour_priority or
           f.state.health_colour_priority <= PRIORITY
end
-- messages ####################################################################
function mod:NameUpdate(frame)
    if COLOUR_TARGET and frame.handler:IsTarget() then return end

    local col = frame.state.name and names[frame.state.name]

    if not col and frame.state.bar_is_name_coloured then
        frame.state.bar_is_name_coloured = nil

        if CanOverwriteHealthColor(frame) then
            frame.state.health_colour_priority = nil
            frame.HealthBar:SetStatusBarColor(unpack(frame.state.healthColour))
        end
    elseif col then
        if CanOverwriteHealthColor(frame) then
            frame.state.bar_is_name_coloured = true
            frame.state.health_colour_priority = PRIORITY

            frame.HealthBar:SetStatusBarColor(unpack(col))
        end
    end
end
function mod:UNIT_NAME_UPDATE(event,frame)
    self:NameUpdate(frame)
end
function mod:GainedTarget(frame)
    if not COLOUR_TARGET then return end
    if CanOverwriteHealthColor(frame) then
        frame.state.bar_is_name_coloured = true
        frame.state.health_colour_priority = PRIORITY
        frame.HealthBar:SetStatusBarColor(unpack(COLOUR_TARGET))
    end
end
-- initialise ##################################################################
function mod:Initialise()
    self:RegisterMessage('Show','NameUpdate')
    self:RegisterMessage('HealthColourChange','NameUpdate')
    self:RegisterMessage('LostTarget','NameUpdate')
    self:RegisterUnitEvent('UNIT_NAME_UPDATE')

    self:RegisterMessage('GainedTarget','TargetUpdate')
end







-- ##################################################################
-- Nyvias Code
-- Defines a GUI that let you change the above "names" - table (see above, line 9)
-- The table defines the name and color of targets.


-- ##################################################################
local addonParentName = 'Kui_Enemy_Colors';
local f = CreateFrame('Frame')
f.UpdateDisplay = {};


local defaultColor = {1,0,1};
local defaultEnemyNames = {
['Blutgebundener Schrecken'] = defaultColor,
}

mod.modified=false;
mod.selected = nil;
mod.currentEnemyColor = nil;


------------------------------------------------------------- Helper Func

local function pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
	i = i + 1
	if a[i] == nil then return nil
	else return a[i], t[a[i]]
	end
  end
  return iter
end




------------------------------------------------------------- Create GUI Elements

-- Option panel
mod.panel = CreateFrame( "Frame", "MyAddonPanel", InterfaceOptionsFramePanelContainer );
mod.panel.name = "Kui |cff9966ffEnemyColors|r";
mod.panel:Hide();

local enemyFrames  = {}; -- 

-- list for enemies
local listEnemies = CreateFrame('Frame', 'KUIEnemyColorsList', mod.panel)
listEnemies:SetSize(500, 300);

local listEnemiesScroll = CreateFrame('ScrollFrame', 'KUIEnemyColorsListScroll', mod.panel, 'UIPanelScrollFrameTemplate')
listEnemiesScroll:SetSize(500, 300)
listEnemiesScroll:SetScrollChild(listEnemies)
listEnemiesScroll:SetPoint('TOPLEFT', mod.panel, 'TOPLEFT', 45, -45)

local listEnemiesBg = CreateFrame('Frame', nil, mod.panel)
listEnemiesBg:SetBackdrop({
    bgFile = 'Interface/ChatFrame/ChatFrameBackground',
    edgeFile = 'Interface/Tooltips/UI-Tooltip-border',
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
listEnemiesBg:SetBackdropColor(.1, .1, .1, .3)
listEnemiesBg:SetBackdropBorderColor(.5, .5, .5)
listEnemiesBg:SetPoint('TOPLEFT', listEnemiesScroll, -10, 10)
listEnemiesBg:SetPoint('BOTTOMRIGHT', listEnemiesScroll, 30, -10)

-- list titles
local listEnemiesTitle = mod.panel:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
listEnemiesTitle:SetText('Kui Enemy Colors')
listEnemiesTitle:SetPoint('BOTTOMLEFT', listEnemiesBg, 'TOPLEFT', 10, 3)

-- enemy entry text box
local editEnemyName = CreateFrame('EditBox', 'KUIEnemyColorsEditEnemyName', mod.panel, 'InputBoxTemplate')
editEnemyName:SetAutoFocus(false)
editEnemyName:EnableMouse(true)
editEnemyName:SetMaxLetters(100)
editEnemyName:SetPoint('TOPLEFT', listEnemiesScroll, 'BOTTOMLEFT', 125, -20)
editEnemyName:SetSize(250, 25)

-- enemy name add button
local btnAddEnemyName = CreateFrame('Button', 'KUIEnemyColorsAddButtonEnemyName', mod.panel, 'UIPanelButtonTemplate')
btnAddEnemyName:SetText('Add')
btnAddEnemyName:SetPoint('LEFT', editEnemyName, 'RIGHT')
btnAddEnemyName:SetSize(65,25)
btnAddEnemyName.tooltipText = "Hotkey: |cffffff88Return|r"
btnAddEnemyName:SetEnabled(false);

-- Color Picker Button
local btnColorPick = CreateFrame('Button', nil, mod.panel );
btnColorPick:SetBackdrop({
    bgFile = 'Interface/ChatFrame/ChatFrameBackground',
    edgeFile = 'Interface/Tooltips/UI-Tooltip-border',
    edgeSize = 4,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
})
btnColorPick:SetSize(22,22);
btnColorPick:SetBackdropBorderColor(.5, .5, .5)
btnColorPick:SetPoint('TOPLEFT', editEnemyName, -32, -1)
btnColorPick.tooltipText = "Select current color...";
btnColorPick:EnableMouse(true);

-- Enabled Button
local btnAddonEnabled = CreateFrame('CheckButton', 'KUIEnemyColorsButtonEnabled', mod.panel, 'InterfaceOptionsCheckButtonTemplate ')
btnAddonEnabled:SetSize(25,25)
btnAddonEnabled:SetText('Enabled');
btnAddonEnabled:SetPoint('BOTTOMRIGHT', listEnemiesBg, 'TOPRIGHT', -70, 0);
btnAddonEnabled.tooltipText = "Click to (de)activate the colored nameplate";
btnAddonEnabled.text = _G["KUIEnemyColorsButtonEnabledText"];
btnAddonEnabled.text:SetText("Activated")
btnAddonEnabled:SetChecked(true);


-- Reset Color Button
local btnResetColor = CreateFrame('Button', 'KUIEnemyColorsResetColorButton', mod.panel, 'UIPanelButtonTemplate')
btnResetColor:SetText('Set all to current color')
btnResetColor:SetPoint('TOPLEFT', listEnemiesBg, 'BOTTOMLEFT', 0, -55)
btnResetColor:SetSize(160,25)
btnResetColor.tooltipText = "Resets nameplate colors for all enemies to the current one"

-- Send to share button
local btnSendToChat = CreateFrame('Button', nil, mod.panel, 'UIPanelButtonTemplate')
btnSendToChat:SetText('Send to instance chat')
btnSendToChat:SetPoint('TOPLEFT', btnResetColor, 'TOPRIGHT', 30, 0)
btnSendToChat:SetSize(160,25)
btnSendToChat.tooltipText = "Sends the selected enemy name or the complete list to the |cffffff88group|r,  |cffffff88raid|r or the default chat. Useful for other to copy the names.";


-- help text 1
local helpText1 = mod.panel:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
helpText1:SetText('');
helpText1:SetPoint('TOPLEFT',     editEnemyName, 'BOTTOMLEFT',  10,  - 2)
helpText1:SetPoint('BOTTOMRIGHT', editEnemyName, 'BOTTOMRIGHT', -10, - 22)
helpText1:SetJustifyH('CENTER')
helpText1:SetJustifyV('TOP')
helpText1:SetWordWrap(true)

-- help text
local helpText = mod.panel:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
helpText:SetText("Type the |cffffff88exact name|r of the enemy, select a color and press enter. Right click enemy names to remove them. Left click to edit the name or color.\n\n|cffffff88Note:|r If the enemy is currently visible, color changes will only appear after nameplates have been hidden and shown again.\n\n|cff0091ffCredits:|r All credits for Kui |cff9966ff NamePlates|r and the custom color functionality go to |cff0091ffKesava|r. This GUI was written by |cff0091ffNyvia - Aman'thul (EU)|r. (nyvia#2171)");
helpText:SetPoint('TOPLEFT', btnResetColor, 'BOTTOMLEFT', 0, -25)
helpText:SetPoint('BOTTOMRIGHT', -10, 0)
helpText:SetWordWrap(true)
helpText:SetJustifyH('LEFT')
helpText:SetJustifyV('TOP')




-------------------------------------------------------------	
local function SetCurrentColor (clr)
	
	local r,g,b = unpack(clr);
	mod.currentEnemyColor = {r,g,b}
	btnColorPick:SetBackdropColor( r,g,b, 1 );
end

local function AddEnemyName (name,clr)
	
	KuiCustomOptions.EnemyNames[name] = clr;
	mod.modified = true;
	f.UpdateDisplay();
end

local function RemoveEnemyName (name)
	KuiCustomOptions.EnemyNames[name] = nil;
	mod.modified = true;
	f.UpdateDisplay();
end

local function BeginEditEnemyName(id)
	local clr = KuiCustomOptions.EnemyNames[id];
	
	if clr == nil then return end
	
	editEnemyName:SetText(id);
	btnAddEnemyName:SetText('Modify');
	btnAddEnemyName:SetEnabled(true);
	helpText1:SetText( 'Press |cffffff88Esc|r to cancel' );
	helpText1:Show();
	
	SetCurrentColor(clr);
		
	mod.selected = id;
	editEnemyName:SetFocus()
end



-------------------------------------------------------------	Element Handlers

-- Clear Edit Box
local function ClearEditBoxEnemyName()
    editEnemyName:SetText('')
    
	btnAddEnemyName:SetText('Add');
	btnAddEnemyName:SetEnabled(false);
	helpText1:Hide ();
	mod.selected = nil;
end

-- Add Button On Click
local function btnAddEnemyNameOnClick(self)
	
	if mod.selected ~= nil then
		RemoveEnemyName ( mod.selected );
		
		mod.selected = nil;
	end
	
    AddEnemyName(editEnemyName:GetText(), mod.currentEnemyColor )
    ClearEditBoxEnemyName()
end



-- EditBox Enter Press
local function editEnemyNameOnEnterPress(self)
    btnAddEnemyName:Click();
end

-- EditBox Escape Press
local function editEnemyNameOnEscapePress(self)
	SetCurrentColor(KuiCustomOptions.defaultEnemyNameplateColor);
	ClearEditBoxEnemyName ();
	mod.selected = nil;
	f:UpdateDisplay ();
	editEnemyName:ClearFocus()
	
	-- if ( t == '' ) then editEnemyName:ClearFocus() end;
end

-- Text Changed in edit box
local function editEnemyNameOnTextChanged (self, user)

	if not user then return end
	local text = self:GetText();
	if text == '' then
		btnAddEnemyName:SetEnabled(false);
		helpText1:Hide();
	else
		btnAddEnemyName:SetEnabled(true);
		helpText1:SetText( 'Press |cffffff88Esc|r to cancel' );
		helpText1:Show();
	end
end



local function EnemyFrameOnEnter(self)
    self.highlight:Show()
end

local function EnemyFrameOnLeave(self)
	
	if self.id == mod.selected then return end;
	self.highlight:Hide()
end

local function EnemyFrameOnMouseUp(self, button)
    if button == 'RightButton' then
        RemoveEnemyName(self.id) -- remove an added spell
	else
		BeginEditEnemyName( self.id );
		f:UpdateDisplay()
    end
end

local function OnBtnColorPickClick (self)

 local r,g,b = unpack(mod.currentEnemyColor);
 ColorPickerFrame:SetColorRGB(r,g,b);
 ColorPickerFrame.hasOpacity = false;
 ColorPickerFrame.previousValues = mod.currentEnemyColor;
 ColorPickerFrame.func = function () 
 
	local r,g,b = ColorPickerFrame:GetColorRGB(); 
	SetCurrentColor({r,g,b});
	
	if ColorPickerFrame:IsVisible() == false then
		KuiCustomOptions.defaultEnemyNameplateColor = {r,g,b}
		ColorPickerFrame.func = function()end;
		ColorPickerFrame.cancelFunc= function()end;
	end
end
	
	
 ColorPickerFrame.cancelFunc = function (restore)
	ColorPickerFrame.func = function()end;
	ColorPickerFrame.cancelFunc= function()end;
	SetCurrentColor(restore);
	end
 
 ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
 ColorPickerFrame:Show();
end


local function OnBtnEnableClick(self)
	KuiCustomOptions.isActive = self:GetChecked();
	
	if  KuiCustomOptions.isActive then 
		names = KuiCustomOptions.EnemyNames;
		
	else
		names = {};
	end
	
	mod.modified = true;
	
	SetCVar("nameplateShowEnemies",0);
	-- SetCVar("nameplateShowEnemies","1");
	f:UpdateDisplay();
end

local function OnBtnResetColor(self)

	for k in pairs (KuiCustomOptions.EnemyNames) do
		KuiCustomOptions.EnemyNames[k] = KuiCustomOptions.defaultEnemyNameplateColor;
	end
	f:UpdateDisplay();
end

local function OnButtonSendToChat(self)

	if IsInRaid() then 			-- Print to raid
		if mod.selected then	SendChatMessage( mod.selected, "RAID" );
		else					for k in pairsByKeys ( KuiCustomOptions.EnemyNames ) do SendChatMessage( k, "RAID" ); end 
		end
	else
		if IsInGroup() then		-- Print to group
			if mod.selected then	SendChatMessage( mod.selected, "GROUP" );
			else					for k in pairsByKeys ( KuiCustomOptions.EnemyNames ) do SendChatMessage( k, "GROUP" ); end 
			end
		else
			if mod.selected then
				DEFAULT_CHAT_FRAME:AddMessage( mod.selected )
			else
				for k in pairsByKeys ( KuiCustomOptions.EnemyNames ) do DEFAULT_CHAT_FRAME:AddMessage(k) end 
		
			end
		end
	end
end


-------------------------------------------------------------	Functions
-- hides all spellFrames for reuse
local function HideAllEnemyListFrames()
    for _,frame in pairs(enemyFrames) do
        frame:Hide()
        frame.highlight:Hide()
    end
end


local function CreateEnemyListFrame (name,clr,active)
	local f;
	
	local clrS = 1;
	if (not active) then clrS = .5 end
	
	for _,frame in pairs(enemyFrames) do
        if not frame:IsShown() then
            -- recycle an old frame
            f = frame
        end
    end
	
	if not f then

		f = CreateFrame('Frame', nil, listEnemies );
		
		f:EnableMouse(true)
		
		f:SetSize(300, 20)
		
        f.highlight = f:CreateTexture('HIGHLIGHT')
        f.highlight:SetTexture('Interface/BUTTONS/UI-Listbox-Highlight')
        f.highlight:SetBlendMode('add')
        f.highlight:SetAlpha(.5)
        f.highlight:Hide()
		f.highlight:SetAllPoints(f);
		
		f.icon = f:CreateTexture('ARTWORK');
		f.icon:SetSize(30,12);
		f.icon:SetPoint('LEFT');
				
		
		f.name = f:CreateFontString(nil, 'ARTWORK')
        f.name:SetFont(STANDARD_TEXT_FONT, 12)
		f.name:SetSize(280, 18)
        f.name:SetPoint('LEFT', f.icon, 'RIGHT', 10, 0)
        f.name:SetJustifyH('LEFT')
		
		f:SetScript('OnMouseUp', EnemyFrameOnMouseUp)
		f:SetScript('OnEnter',   EnemyFrameOnEnter)
        f:SetScript('OnLeave',   EnemyFrameOnLeave)
	end
			
	f.id = name;
	f.name:SetText(name);
	f.name:SetTextColor(1*clrS, 1*clrS, 1*clrS)
		
	local r,g,b = unpack(clr);
	f.icon:SetColorTexture (r*clrS,g*clrS,b*clrS,1)
	tinsert( enemyFrames, f );
	return f;
end

local function Redisplay ()
	HideAllEnemyListFrames();
					
	pv = nil;
	-- for k,v in pairsByKeys ( KuiCustomOptions.EnemyNames ) do
	for k,v in pairsByKeys ( KuiCustomOptions.EnemyNames ) do
	
		local f = CreateEnemyListFrame ( k, v, KuiCustomOptions.isActive );
		-- local f = CreateEnemyListFrame ( k, v, addon.data.isActive );
		if pv then
            f:SetPoint('TOPLEFT', pv, 'BOTTOMLEFT', 0, -2)
        else
            f:SetPoint('TOPLEFT')
        end
		f:Show();
		pv = f;
	end
end


-- Option Panel is shown
local function OnOptionsShow(self)
	editEnemyName:SetFocus();
	-- addon.data = deepcopy ( KuiCustomOptions );
	mod.modified = false;
	mod.selected = nil;
	f:UpdateDisplay ();
end

-- Option Panel is hidden
local function OnOptionsHide(self)
	HideAllEnemyListFrames ();
	ClearEditBoxEnemyName();
end



-------------------------------------------------------------	GUI - Handler Connections

local function OnEvent(self, event, ...)
    self[event](self, ...)
end


function f:ADDON_LOADED(loaded)

	if (loaded ~= addonParentName) then return end;
	self:UnregisterEvent('ADDON_LOADED')
	
	print("Kui Enemy Colors Loaded")	
	
	KuiCustomOptions = KuiCustomOptions or {};
	KuiCustomOptions.EnemyNames = KuiCustomOptions.EnemyNames or defaultEnemyNames;
	KuiCustomOptions.defaultEnemyNameplateColor = KuiCustomOptions.defaultEnemyNameplateColor or defaultColor;
	KuiCustomOptions.isActive = KuiCustomOptions.isActive or true;
	SetCurrentColor(KuiCustomOptions.defaultEnemyNameplateColor);
	btnAddonEnabled:SetChecked( KuiCustomOptions.isActive );
	if  KuiCustomOptions.isActive == true then 
		names = KuiCustomOptions.EnemyNames;
	else
		names = {};
	end
	self.UpdateDisplay = function () Redisplay() end;
end


------------------------------------------------------------- Set scripts
f:RegisterEvent ( 'ADDON_LOADED');
f:SetScript     ('OnEvent', OnEvent );

mod.panel:SetScript('OnShow', OnOptionsShow)
mod.panel:SetScript('OnHide', OnOptionsHide)

btnAddEnemyName:SetScript('OnClick',btnAddEnemyNameOnClick)
btnColorPick:SetScript ('OnClick', OnBtnColorPickClick );
btnAddonEnabled:SetScript ('OnClick', OnBtnEnableClick );
btnResetColor:SetScript('OnClick', OnBtnResetColor );
btnSendToChat:SetScript('OnClick', OnButtonSendToChat );

editEnemyName:SetScript('OnEnterPressed', editEnemyNameOnEnterPress)
editEnemyName:SetScript('OnEscapePressed', editEnemyNameOnEscapePress)
editEnemyName:SetScript('OnTextChanged', editEnemyNameOnTextChanged)

InterfaceOptions_AddCategory(mod.panel);














