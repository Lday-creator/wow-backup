---@diagnostic disable: undefined-field, undefined-global
local _, TRB = ...
TRB.UiFunctions = {}


-- Code modified from this post by Reskie on the WoW Interface forums: http://www.wowinterface.com/forums/showpost.php?p=296574&postcount=18
function TRB.UiFunctions:BuildSlider(parent, title, minValue, maxValue, defaultValue, stepValue, numDecimalPlaces, sizeX, sizeY, posX, posY)
	local f = CreateFrame("Slider", nil, parent, "BackdropTemplate")
	f.EditBox = CreateFrame("EditBox", nil, f, "BackdropTemplate")
	f:SetPoint("TOPLEFT", posX+18, posY)
	f:SetMinMaxValues(minValue, maxValue)
	f:SetValueStep(stepValue)
	f:SetSize(sizeX-36, sizeY)
    f:EnableMouseWheel(true)
	f:SetObeyStepOnDrag(true)
    f:SetOrientation("Horizontal")
    f:SetBackdrop({
       bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
       edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
       tile = true,
       edgeSize = 8,
       tileSize = 8,
       insets = {left = 3, right = 3, top = 6, bottom = 6}
	})
    f:SetBackdropBorderColor(0.7, 0.7, 0.7, 1.0)
    f:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(1, 1, 1, 1)
    end)
	f:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.7, 0.7, 0.7, 1.0)
    end)
    --[[if:SetScript("OnMouseWheel", function(self, delta)
        if delta > 0 then
            self:SetValue(self:GetValue() + self:GetValueStep())
        else
            self:SetValue(self:GetValue() - self:GetValueStep())
        end
    end)]]
    f:SetScript("OnValueChanged", function(self, value)
		self.EditBox:SetText(value)
	end)
    f.MinLabel = f:CreateFontString(nil, "Overlay")
    f.MinLabel:SetFontObject(GameFontHighlightSmall)
    f.MinLabel:SetSize(0, 14)
    ---@diagnostic disable-next-line: redundant-parameter
    f.MinLabel:SetWordWrap(false)
    f.MinLabel:SetPoint("TopLeft", f, "BottomLeft", 0, -1)
    f.MinLabel:SetText(minValue)
    f.MaxLabel = f:CreateFontString(nil, "Overlay")
    f.MaxLabel:SetFontObject(GameFontHighlightSmall)
    f.MaxLabel:SetSize(0, 14)
    ---@diagnostic disable-next-line: redundant-parameter
    f.MaxLabel:SetWordWrap(false)
    f.MaxLabel:SetPoint("TopRight", f, "BottomRight", 0, -1)
    f.MaxLabel:SetText(maxValue)
    f.Title = f:CreateFontString(nil, "Overlay")
    f.Title:SetFontObject(GameFontNormal)
    f.Title:SetSize(0, 14)
    ---@diagnostic disable-next-line: redundant-parameter
    f.Title:SetWordWrap(false)
    f.Title:SetPoint("Bottom", f, "Top")
    f.Title:SetText(title)
    f.Thumb = f:CreateTexture(nil, "Artwork")
    f.Thumb:SetSize(32, 32)
    f.Thumb:SetTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
    f:SetThumbTexture(f.Thumb)

	local eb = f.EditBox
    eb:EnableMouseWheel(true)
    eb:SetAutoFocus(false)
    eb:SetNumeric(false)
    eb:SetJustifyH("Center")
    eb:SetFontObject(GameFontHighlightSmall)
    eb:SetSize(50, 14)
    eb:SetPoint("Top", f, "Bottom", 0, -1)
    eb:SetTextInsets(4, 4, 0, 0)
    eb:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = true,
        edgeSize = 1,
        tileSize = 5
	})
    eb:SetBackdropColor(0, 0, 0, 1)
    eb:SetBackdropBorderColor(0.2, 0.2, 0.2, 1.0)
    eb:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1.0)
    end)
    eb:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.2, 0.2, 0.2, 1.0)
    end)
    eb:SetScript("OnMouseWheel", function(self, delta)
        if delta > 0 then
            f:SetValue(f:GetValue() + f:GetValueStep())
        else
            f:SetValue(f:GetValue() - f:GetValueStep())
        end
    end)
    eb:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    eb:SetScript("OnEnterPressed", function(self)
        local value = tonumber(self:GetText())
        if value then
            local min, max = f:GetMinMaxValues()
            if value >= min and value <= max then
                f:SetValue(value)
            elseif value < min then
                f:SetValue(min)
            elseif value > max then
                f:SetValue(max)
            end
			value = TRB.Functions.RoundTo(value, numDecimalPlaces)
            eb:SetText(value)
        else
            f:SetValue(f:GetValue())
        end
        self:ClearFocus()
    end)
    eb:SetScript("OnEditFocusLost", function(self)
        self:HighlightText(0, 0)
    end)
    eb:SetScript("OnEditFocusGained", function(self)
        self:HighlightText(0, -1)
    end)
    f.Plus = CreateFrame("Button", nil, f)
    f.Plus:SetSize(18, 18)
    f.Plus:RegisterForClicks("AnyUp")
    f.Plus:SetPoint("Left", f, "Right", 0, 0)
    f.Plus:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
    f.Plus:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
    f.Plus:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
    f.Plus:SetScript("OnClick", function(self)
        f:SetValue(f:GetValue() + f:GetValueStep())
    end)
    f.Minus = CreateFrame("Button", nil, f)
    f.Minus:SetSize(18, 18)
    f.Minus:RegisterForClicks("AnyUp")
    f.Minus:SetPoint("Right", f, "Left", 0, 0)
    f.Minus:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
    f.Minus:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
    f.Minus:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
    f.Minus:SetScript("OnClick", function(self)
        f:SetValue(f:GetValue() - f:GetValueStep())
	end)

	f:SetValue(defaultValue)
    eb:SetText(defaultValue)
	eb:SetCursorPosition(0)

	return f
end

function TRB.UiFunctions:BuildTextBox(parent, text, maxLetters, width, height, xPos, yPos)
	local f = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
	f:SetPoint("TOPLEFT", xPos, yPos)
	f:SetAutoFocus(false)
	f:SetMaxLetters(maxLetters)
    f:SetJustifyH("Left")
    f:SetFontObject(GameFontHighlight)
    f:SetSize(width, height)
    f:SetTextInsets(4, 4, 0, 0)
    f:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = true,
        edgeSize = 1,
        tileSize = 5
	})
    f:SetBackdropColor(0, 0, 0, 1)
    f:SetBackdropBorderColor(0.2, 0.2, 0.2, 1.0)
    f:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1.0)
    end)
    f:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.2, 0.2, 0.2, 1.0)
    end)
    f:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    f:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
	f:SetText(text)
	f:SetCursorPosition(0)

	return f
end

function TRB.UiFunctions:ShowColorPicker(r, g, b, a, callback)
	ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = 
		callback, callback, callback
	ColorPickerFrame:SetColorRGB(r, g, b)
	ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil), a
	ColorPickerFrame.previousValues = {r, g, b, a}
	ColorPickerFrame:Hide() -- Need to run the OnShow handler.
	ColorPickerFrame:Show()
end

function TRB.UiFunctions:BuildColorPicker(parent, description, settingsEntry, sizeTotal, sizeFrame, posX, posY)
    local settings = TRB.Data.settings
	local f = CreateFrame("Button", nil, parent, "BackdropTemplate")
	f:SetSize(sizeFrame, sizeFrame)
	f:SetPoint("TOPLEFT", posX, posY)
	f:SetBackdrop({
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
		tile = true, 
		tileSize=4, 
		edgeSize=12
	})
	f.Texture = f:CreateTexture(nil, settings.core.strata.level)
	f.Texture:ClearAllPoints()
	f.Texture:SetPoint("TOPLEFT", 4, -4)
	f.Texture:SetPoint("BOTTOMRIGHT", -4, 4)
	f.Texture:SetColorTexture(TRB.Functions.GetRGBAFromString(settingsEntry, true))
    f:EnableMouse(true)
	f.Font = f:CreateFontString(nil, settings.core.strata.level)
	f.Font:SetPoint("LEFT", f, "RIGHT", 10, 0)
	f.Font:SetFontObject(GameFontHighlight)
	f.Font:SetText(description)
    ---@diagnostic disable-next-line: redundant-parameter
	f.Font:SetWordWrap(true)
	f.Font:SetJustifyH("LEFT")
	f.Font:SetSize(sizeTotal - sizeFrame - 25, sizeFrame)
	return f
end

function TRB.UiFunctions:BuildSectionHeader(parent, title, posX, posY)
    local settings = TRB.Data.settings
	local f = CreateFrame("Frame", nil, parent)
	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", parent)
	f:SetPoint("TOPLEFT", posX, posY)
	f:SetWidth(500)
	f:SetHeight(30)
	f.font = f:CreateFontString(nil, settings.core.strata.level)
	f.font:SetFontObject(GameFontNormalLarge)
	f.font:SetPoint("LEFT", f, "LEFT")
    f.font:SetSize(0, 14)
	f.font:SetJustifyH("LEFT")
	f.font:SetSize(500, 30)
	f.font:SetText(title)
	return f
end

function TRB.UiFunctions:BuildDisplayTextHelpEntry(parent, var, desc, posX, posY, offset, width, height, height2)
	height = height or 20
    height2 = height2 or (height * 3)
    local f = CreateFrame("Frame", nil, parent)
	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", parent)
	f:SetPoint("TOPLEFT", posX, posY)
	f:SetWidth(width)
	f:SetHeight(height)
	f.font = f:CreateFontString(nil, TRB.Data.settings.core.strata.level)
	f.font:SetFontObject(GameFontNormalSmall)
	f.font:SetPoint("LEFT", f, "LEFT")
    f.font:SetSize(0, 14)
	f.font:SetJustifyH("RIGHT")
    f.font:SetJustifyV("TOP")
	f.font:SetSize(offset, height)
	f.font:SetText(var)

	f.description = CreateFrame("Frame", nil, parent)
	local fd = f.description
	fd:ClearAllPoints()
	fd:SetPoint("TOPLEFT", parent)
	fd:SetPoint("TOPLEFT", posX+5, posY-height)
	fd:SetWidth(width-5)
	fd:SetHeight(height2)
	fd.font = fd:CreateFontString(nil, TRB.Data.settings.core.strata.level)
	fd.font:SetFontObject(GameFontHighlightSmall)
	fd.font:SetPoint("LEFT", fd, "LEFT")
    fd.font:SetSize(0, 14)
	fd.font:SetJustifyH("LEFT")
    fd.font:SetJustifyV("TOP")
	fd.font:SetSize(width, height2)
	fd.font:SetText(desc)
---@diagnostic disable-next-line: redundant-parameter
    fd.font:SetWordWrap(true)

	return f
end

function TRB.UiFunctions:BuildButton(parent, text, posX, posY, width, height)
    local f = CreateFrame("Button", nil, parent)
    f:SetPoint("TOPLEFT", parent, "TOPLEFT", posX, posY)
    f:SetWidth(width)
    f:SetHeight(height)
    f:SetText(text)
    f:SetNormalFontObject("GameFontNormal")
    f.ntex = f:CreateTexture()
    f.ntex:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    f.ntex:SetTexCoord(0, 0.625, 0, 0.6875)
    f.ntex:SetAllPoints()
    f:SetNormalTexture(f.ntex)
    f.htex = f:CreateTexture()
    f.htex:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    f.htex:SetTexCoord(0, 0.625, 0, 0.6875)
    f.htex:SetAllPoints()
    f:SetHighlightTexture(f.htex)
    f.ptex = f:CreateTexture()
    f.ptex:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
    f.ptex:SetTexCoord(0, 0.625, 0, 0.6875)
    f.ptex:SetAllPoints()
    f:SetPushedTexture(f.ptex)

    return f
end

function TRB.UiFunctions:BuildLabel(parent, text, posX, posY, width, height, fontObject, hAlign)
    if fontObject == nil then
        fontObject = GameFontNormal
    end

    if hAlign == nil or (string.upper(hAlign) ~= "LEFT" and string.upper(hAlign) ~= "CENTER" and string.upper(hAlign) ~= "RIGHT") then
        hAlign = "LEFT"
    end

    local f = CreateFrame("Frame", nil, parent)
    f:ClearAllPoints()
    f:SetPoint("TOPLEFT", parent)
    f:SetPoint("TOPLEFT", posX, posY)
    f:SetWidth(width)
    f:SetHeight(height)
    f.font = f:CreateFontString(nil, "BACKGROUND")
    f.font:SetFontObject(fontObject)
    f.font:SetPoint("LEFT", f, "LEFT")
    f.font:SetJustifyH(hAlign)
    f.font:SetSize(width, height)
    f.font:SetText(text)

    return f
end

function TRB.UiFunctions:CreateScrollFrameContainer(name, parent, width, height, scrollChild)
    width = width or 560
    height = height or 540
	local sf = CreateFrame("ScrollFrame", name, parent, "UIPanelScrollFrameTemplate")
	sf:SetWidth(width)
	sf:SetHeight(height)
    if scrollChild then
        sf.scrollChild = scrollChild
    else
	    sf.scrollChild = CreateFrame("Frame")
    end
	sf.scrollChild:SetWidth(width)
	sf.scrollChild:SetHeight(height-10)
	sf:SetScrollChild(sf.scrollChild)
	return sf
end

function TRB.UiFunctions:CreateTabFrameContainer(name, parent, width, height, isManualScrollFrame)
    width = width or 580
    height = height or 503
    local cf = CreateFrame("Frame", name, parent, "BackdropTemplate")
    cf:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile =  "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        edgeSize = 8,
        tileSize = 32,
        insets = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0,
        }
    })
    cf:SetBackdropColor(0, 0, 0, 0.5)
    cf:SetWidth(width)
    cf:SetHeight(height)
    cf:SetPoint("TOPLEFT", 0, 10)

    if not isManualScrollFrame then
        cf.scrollFrame = TRB.UiFunctions:CreateScrollFrameContainer(name .. "ScrollFrame", cf, width - 30, height - 8)
        cf.scrollFrame:SetPoint("TOPLEFT", cf, "TOPLEFT", 5, -5)
    end
    return cf
end

function TRB.UiFunctions:SwitchTab(self, tabId)
    local parent = self:GetParent()
    if parent.lastTab then
        parent.lastTab:Hide()
        parent.tabs[parent.lastTabId]:SetNormalFontObject(TRB.Options.fonts.options.tabNormalSmall)
	end
	parent.tabsheets[tabId]:Show()
    parent.tabs[tabId]:SetNormalFontObject(TRB.Options.fonts.options.tabHighlightSmall)
    parent.lastTab = parent.tabsheets[tabId]
    parent.lastTabId = tabId
end

function TRB.UiFunctions:CreateTab(name, displayText, id, parent, width, rightOf)
    width = width or 100
    local tab = CreateFrame("Button", name, parent, "TabButtonTemplate")
    tab.id = id
    tab:SetSize(width, 16)
    tab:SetText(displayText)
    tab:SetScript("OnClick", function(self)
        TRB.UiFunctions:SwitchTab(self, self.id)
    end)

    if rightOf ~= nil then
        tab:SetPoint("LEFT", rightOf, "RIGHT")
    else
        tab:SetPoint("LEFT", parent, "LEFT", 0, 0)
    end

    tab:SetNormalFontObject(TRB.Options.fonts.options.tabNormalSmall)
    return tab
end

function TRB.UiFunctions:CreateVariablesSidePanel(parent, name)
    local grandparent = parent:GetParent()
    local variablesPanelParent = TRB.UiFunctions:CreateTabFrameContainer("TRB_" .. name .. "_BarTextVariables_Frame", grandparent, 300, 500)
    local variablesPanel = variablesPanelParent.scrollFrame.scrollChild
    variablesPanelParent:SetBackdropColor(0, 0, 0, 0.8)
    variablesPanelParent:ClearAllPoints()
    variablesPanelParent:SetPoint("TOPLEFT", grandparent, "TOPRIGHT", 55, 5)
    TRB.UiFunctions:BuildSectionHeader(variablesPanel, "Bar Text Variables", 0, 5)
    return variablesPanel
end

function TRB.UiFunctions:CreateBarTextInputPanel(parent, name, text, width, height, xPos, yPos)
    --[[
    --local ebParent = ebFrame.scrollFrame
    local eb = TRB.UiFunctions:BuildTextBox(nil, text, 500, width, height, 0, 0)
    local ebFrame = TRB.UiFunctions:CreateScrollFrameContainer("TRB_" .. name .. "_BarText_Frame", parent, width, height, eb)
    eb:SetSize(ebFrame:GetSize())
    eb:SetMultiLine(true)
	ebFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", xPos, yPos)
    --ebFrame:SetScrollChild(eb)
    return eb]]

    local s = CreateFrame("ScrollFrame", "TRB_" .. name .. "_BarTextBox", parent, "UIPanelScrollFrameTemplate, BackdropTemplate") -- or your actual parent instead
    s:SetSize(width, height)
    s:SetPoint("TOPLEFT", parent, "TOPLEFT", xPos, yPos)
    
    s.ScrollFrame = CreateFrame("EditBox", nil, s, "BackdropTemplate")
    local e = s.ScrollFrame
    e:SetTextInsets(4, 4, 0, 0)
    s:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = true,
        edgeSize = 1,
        tileSize = 5
	})
    s:SetBackdropColor(0, 0, 0, 1)
    s:SetBackdropBorderColor(0.2, 0.2, 0.2, 1.0)
    e:SetScript("OnEnter", function(self)
        self:GetParent():SetBackdropBorderColor(0.4, 0.4, 0.4, 1.0)
    end)
    e:SetScript("OnLeave", function(self)
        self:GetParent():SetBackdropBorderColor(0.2, 0.2, 0.2, 1.0)
    end)
    e:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
	e:SetCursorPosition(0)
    e:SetScript("OnCursorChanged", function(self, arg1, arg2, arg3, arg4)
        local vs = self:GetParent():GetVerticalScroll();
        local h  = self:GetParent():GetHeight();
    
        if vs+arg2 > 0 or 0 > vs+arg2-arg4+h then
            self:GetParent():SetVerticalScroll(arg2*-1);
        end
    end)

    e:SetMultiLine(true)
    e:SetFontObject(ChatFontNormal)
    e:SetWidth(width)
    e:SetText(text)
    e:SetAutoFocus(false)


    s:SetScrollChild(e)
    return e
end

function TRB.UiFunctions:ToggleCheckboxEnabled(checkbox, enable)
    if enable then
---@diagnostic disable-next-line: undefined-field
        checkbox:Enable()
        getglobal(checkbox:GetName().."Text"):SetTextColor(1, 1, 1)
    else
---@diagnostic disable-next-line: undefined-field
        checkbox:Disable()
        getglobal(checkbox:GetName().."Text"):SetTextColor(0.5, 0.5, 0.5)
    end
end

function TRB.UiFunctions:ToggleCheckboxOnOff(checkbox, enable, changeText)
    if enable then
        getglobal(checkbox:GetName().."Text"):SetTextColor(0, 1, 0)

        if changeText == true then
            getglobal(checkbox:GetName().."Text"):SetText("Enabled")
        end
    else
        getglobal(checkbox:GetName().."Text"):SetTextColor(1, 0, 0)
        
        if changeText == true then
            getglobal(checkbox:GetName().."Text"):SetText("Disabled")
        end
    end
end
