local _, TRB = ...
local _, _, classIndexId = UnitClass("player")
if classIndexId == 11 then --Only do this if we're on a Druid!
	local barContainerFrame = TRB.Frames.barContainerFrame
	local resourceFrame = TRB.Frames.resourceFrame
	local castingFrame = TRB.Frames.castingFrame
	local passiveFrame = TRB.Frames.passiveFrame
	local barBorderFrame = TRB.Frames.barBorderFrame

	local leftTextFrame = TRB.Frames.leftTextFrame
	local middleTextFrame = TRB.Frames.middleTextFrame
	local rightTextFrame = TRB.Frames.rightTextFrame

	local resourceFrame = TRB.Frames.resourceFrame
	local passiveFrame = TRB.Frames.passiveFrame
	local targetsTimerFrame = TRB.Frames.targetsTimerFrame
	local timerFrame = TRB.Frames.timerFrame
	local combatFrame = TRB.Frames.combatFrame

	TRB.Options.Druid = {}
	TRB.Options.Druid.Balance = {}
	TRB.Options.Druid.Feral = {}
	TRB.Options.Druid.Guardian = {}
	TRB.Options.Druid.Restoration = {}
    TRB.Frames.interfaceSettingsFrameContainer.controls.balance = {}
    TRB.Frames.interfaceSettingsFrameContainer.controls.feral = {}
    TRB.Frames.interfaceSettingsFrameContainer.controls.guardian = {}
    TRB.Frames.interfaceSettingsFrameContainer.controls.restoration = {}

	--[[ 
		Balance Defaults
	]]

	local function BalanceLoadDefaultBarTextSimpleSettings()
		local textSettings = {
			fontSizeLock=true,
			fontFaceLock=true,
			left={
				text="$haste%",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			},
			middle={
				text="{$eclipse}[$eclipseTime sec.]",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			},
			right={
				text="{$casting}[$casting + ]{$passive}[$passive + ]$astralPower",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			}
		}

		return textSettings
	end

    local function BalanceLoadDefaultBarTextAdvancedSettings()
		local textSettings = {
			fontSizeLock = false,
			fontFaceLock = true,
			left = {
				text = "#sunfire $sunfireCount    {$talentStellarFlare}[#stellarFlare $stellarFlareCount    ]$haste% ($gcd)||n#moonfire $moonfireCount     {$talentStellarFlare}[          ]{$ttd}[TTD: $ttd]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			middle = {
				text="{$eclipse}[#eclipse $eclipseTime #eclipse]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			right = {
				text = "{$casting}[#casting$casting+]{$passive}[$passive+]$astralPower",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 22
			}
		}

		return textSettings
	end

	local function BalanceLoadDefaultSettings()
		local settings = {
			hastePrecision=2,
			astralPowerPrecision=0,
			overcapThreshold=100,
			thresholds = {
				width = 2,
				overlapBorder=true,
				icons = {
					border=2,
					relativeTo = "BOTTOM",
					relativeToName = "Below",
					enabled=true,
					xPos=0,
					yPos=12,
					width=24,
					height=24
				},
				starsurgeThresholdOnlyOverShow = false,
				starsurge = { -- 1
					enabled = true,
					showIcon = true
				},
				starsurge2 = { -- 2
					enabled = true,
					showIcon = true
				},
				starsurge3 = { -- 3
					enabled = true,
					showIcon = true
				},
				starfall = { -- 4
					enabled = true,
					showIcon = true
				},
			},
			displayBar = {
				alwaysShow=false,
				notZeroShow=true,
				neverShow=false
			},
			endOfEclipse = {
				enabled=true,
				celestialAlignmentOnly=false,
				mode="gcd",
				gcdsMax=2,
				timeMax=3.0
			},
			bar = {
				width=555,
				height=34,
				xPos=0,
				yPos=-200,
				border=4,
				dragAndDrop=false,
				pinToPersonalResourceDisplay=false,
				showPassive=true,
				showCasting=true
			},
			colors = {
				text = {
					current="FFFFB668",
					casting="FFFFFFFF",
					passive="FF00AA00",
					overcap="FFFF0000",
					overThreshold="FF00FF00",
					overThresholdEnabled=false,
					overcapEnabled=true,
					left="FFFFFFFF",
					middle="FFFFFFFF",
					right="FFFFFFFF",
					dots={
						enabled=true,
						up="FFFFFFFF",
						down="FFFF0000",
						pandemic="FFFFFF00"
					}
				},
				bar = {
					border="FFC16920",
					borderOvercap="FFFF0000",
					background="66000000",
					base="FFFF7C0A",
					lunar="FF144D72",
					solar="FFFFEE00",
					celestial="FF4A95CE",
					casting="FFFFFFFF",
					passive="FF006600",
					eclipse1GCD="FFFF0000",
					moonkinFormMissing="FFFF0000",
					flashAlpha=0.70,
					flashPeriod=0.5,
					flashEnabled=true,
					flashSsEnabled=true,
					overcapEnabled=true
				},
				threshold = {
					under="FFFFFFFF",
					over="FF00FF00",
					starfallPandemic="FF8B0000"
				}
			},
			displayText = {},
			audio = {
				ssReady={
					name = "Starsurge Ready",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				sfReady={
					name = "Starfall Ready",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				onethsReady={
					name = "Oneth's Clear Vision Ready",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				overcap={
					name = "Overcap",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\AirHorn.ogg",
					soundName="TRB: Air Horn"
				}
            },
			textures = {
				background="Interface\\Tooltips\\UI-Tooltip-Background",
				backgroundName="Blizzard Tooltip",
				border="Interface\\Buttons\\WHITE8X8",
				borderName="1 Pixel",
				resourceBar="Interface\\TargetingFrame\\UI-StatusBar",
				resourceBarName="Blizzard",
				passiveBar="Interface\\TargetingFrame\\UI-StatusBar",
				passiveBarName="Blizzard",
				castingBar="Interface\\TargetingFrame\\UI-StatusBar",
				castingBarName="Blizzard",
				textureLock=true
			}
		}

		settings.displayText = BalanceLoadDefaultBarTextSimpleSettings()
		return settings
    end

	local function BalanceResetSettings()
		local settings = BalanceLoadDefaultSettings()
		return settings
	end


	--[[ 
		Feral Defaults
	]]

	local function FeralLoadDefaultBarTextSimpleSettings()
		local textSettings = {
			fontSizeLock=true,
			fontFaceLock=true,
			left={
				text="",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			},
			middle={
				text="",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			},
			right={
				text="{$casting}[$casting + ]{$passive}[$passive + ]$resource",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			}
		}

		return textSettings
	end

    local function FeralLoadDefaultBarTextAdvancedSettings()
		local textSettings = {
			fontSizeLock = false,
			fontFaceLock = true,
			left = {
				text = "#rake $rakeCount    #thrash $thrashCount||n#rip $ripCount    {$lunarInspiration}[#moonfire $moonfireCount]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			middle = {
				text="",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			right = {
				text = "{$casting}[#casting$casting+]{$passive}[$passive+]$resource",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 22
			}
		}

		return textSettings
	end

	local function FeralLoadDefaultSettings()
		local settings = {
			hastePrecision=2,
			overcapThreshold=120,
			thresholds = {
				width = 2,
				overlapBorder=true,
				bleedColors=true,
				icons = {
					border=2,
					relativeTo = "BOTTOM",
					relativeToName = "Below",
					enabled=true,
					xPos=0,
					yPos=12,
					width=24,
					height=24
				},
				-- Core Druid
				ferociousBite = {
					enabled = true, -- 1
				},
				shred = {
					enabled = true, -- 2
				},
				-- Feral
				maim = {
					enabled = false, -- 3
				},
				rake = {
					enabled = true, -- 4
				},
				rip = {
					enabled = true, -- 5
				},
				swipe = {
					enabled = false, -- 6
				},
				thrash = {
					enabled = true, -- 7
				},
				-- Talents
				moonfire = {
					enabled = true, -- 8
				},
				savageRoar = {
					enabled = true, -- 9
				},
				brutalSlash = {
					enabled = true, -- 10
				},
				primalWrath = {
					enabled = true, -- 11
				},
				bloodtalons = {
					enabled = false, -- 12
				},
				feralFrenzy = {
					enabled = true, -- 13
				},
				-- Extras
				ferociousBiteMinimum = {
					enabled = false -- 14
				},
				ferociousBiteMaximum = {
					enabled = true -- 15
				}
			},
			generation = {
				mode="gcd",
				gcds=1,
				time=1.5,
				enabled=true
			},
			displayBar = {
				alwaysShow=false,
				notZeroShow=true,
				neverShow=false
			},
			bar = {
				width=555,
				height=34,
				xPos=0,
				yPos=-200,
				border=4,
				dragAndDrop=false,
				pinToPersonalResourceDisplay=false,
				showPassive=true,
				showCasting=true
			},
            comboPoints = {
                width=25,
                height=13,
				xPos=0,
				yPos=4,
				border=1,
                spacing=14,
                relativeTo="TOP",
                relativeToName="Above - Middle",
                fullWidth=false
            },
			colors = {
				text = {
					current="FFFFFF00",
					casting="FFFFFFFF",
					spending="FF555555",
					passive="FFD59900",
					overcap="FFFF0000",
					overThreshold="FF00FF00",
					overThresholdEnabled=false,
					overcapEnabled=true,
					left="FFFFFFFF",
					middle="FFFFFFFF",
					right="FFFFFFFF",
					dots={
						enabled=true,
						same="FFFFFFFF",
						down="FFFF8888",
						worse="FFFF33BB",
						better="FF009955"
					}
				},
				bar = {
					border="FFFF7C0A",
					borderOvercap="FFFF0000",
					background="66000000",
					base="FFFFFF00",
					clearcasting="FF4A95CE",
					maxBite="FF009900",
					casting="FFFFFFFF",
					spending="FF555555",
					passive="FF9F4500",
					overcapEnabled=true,
				},
				comboPoints = {
					border="FFFF7C0A",
					background="66000000",
					base="FFFFFF00",
					penultimate="FFFF9900",
					final="FFFF0000",
					sameColor=false
				},
				threshold = {
					under="FFFFFFFF",
					over="FF00FF00",
					unusable="FFFF0000"
				}
			},
			displayText = {},
			audio = {
				overcap={
					name = "Overcap",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\AirHorn.ogg",
					soundName="TRB: Air Horn"
				},
				apexPredatorsCraving={
					name = "Apex Predator's Craving Proc",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\AirHorn.ogg",
					soundName="TRB: Air Horn"
				}
            },
			textures = {
				background="Interface\\Tooltips\\UI-Tooltip-Background",
				backgroundName="Blizzard Tooltip",
				border="Interface\\Buttons\\WHITE8X8",
				borderName="1 Pixel",
				resourceBar="Interface\\TargetingFrame\\UI-StatusBar",
				resourceBarName="Blizzard",
				passiveBar="Interface\\TargetingFrame\\UI-StatusBar",
				passiveBarName="Blizzard",
				castingBar="Interface\\TargetingFrame\\UI-StatusBar",
				castingBarName="Blizzard",
				textureLock=true,
				comboPointsBackground="Interface\\Tooltips\\UI-Tooltip-Background",
				comboPointsBackgroundName="Blizzard Tooltip",
				comboPointsBorder="Interface\\Buttons\\WHITE8X8",
				comboPointsBorderName="1 Pixel",
				comboPointsBar="Interface\\TargetingFrame\\UI-StatusBar",
				comboPointsBarName="Blizzard",
			}
		}
		settings.displayText = FeralLoadDefaultBarTextSimpleSettings()
		return settings
    end

	local function FeralResetSettings()
		local settings = FeralLoadDefaultSettings()
		return settings
	end


    local function LoadDefaultSettings()
		local settings = TRB.Options.LoadDefaultSettings()

		settings.druid.balance = BalanceLoadDefaultSettings()
		settings.druid.feral = FeralLoadDefaultSettings()
		return settings
	end
    TRB.Options.Druid.LoadDefaultSettings = LoadDefaultSettings

	--[[

		Balance Option Menus

	]]

	local function BalanceConstructResetDefaultsPanel(parent)
		if parent == nil then
			return
		end

		local controls = TRB.Frames.interfaceSettingsFrameContainer.controls.balance
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		StaticPopupDialogs["TwintopResourceBar_Druid_Balance_Reset"] = {
			text = "Do you want to reset Twintop's Resource Bar back to its default configuration? Only the Balance Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.balance = BalanceResetSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Druid_Balance_ResetBarTextSimple"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (simple) configuration? Only the Balance Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.balance.displayText = BalanceLoadDefaultBarTextSimpleSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Druid_Balance_ResetBarTextAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (advanced) configuration? Only the Balance Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.balance.displayText = BalanceLoadDefaultBarTextAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		--[[StaticPopupDialogs["TwintopResourceBar_Druid_Balance_ResetBarTextNarrowAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (narrow advanced) configuration? Only the Balance Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.balance.displayText = BalanceLoadDefaultBarTextNarrowAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}]]

		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar to Defaults", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton = TRB.UiFunctions:BuildButton(parent, "Reset to Defaults", xCoord, yCoord, 150, 30)
		controls.resetButton:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Balance_Reset")
		end)

		yCoord = yCoord - 40
		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar Text", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton1 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Simple)", xCoord, yCoord, 250, 30)
		controls.resetButton1:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Balance_ResetBarTextSimple")
        end)
		yCoord = yCoord - 40

		--[[
		controls.resetButton2 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Narrow Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton2:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Balance_ResetBarTextNarrowAdvanced")
		end)
		]]

		controls.resetButton3 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Full Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton3:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Balance_ResetBarTextAdvanced")
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.balance = controls
	end

	local function BalanceConstructBarColorsAndBehaviorPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.balance
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		local sanityCheckValues = TRB.Functions.GetSanityCheckValues(TRB.Data.settings.druid.balance)
		local maxBorderHeight = math.min(math.floor(TRB.Data.settings.druid.balance.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.balance.bar.width / TRB.Data.constants.borderWidthFactor))

		controls.buttons.exportButton_Druid_Balance_BarDisplay = TRB.UiFunctions:BuildButton(parent, "Export Bar Display", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Balance_BarDisplay:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Balance Druid (Bar Display).", 11, 1, true, false, false, false, false)
		end)

		controls.barPositionSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Position and Size", 0, yCoord)

		yCoord = yCoord - 40
		title = "Bar Width"
		controls.width = TRB.UiFunctions:BuildSlider(parent, title, TRB.Data.sanityCheckValues.barMinWidth, TRB.Data.sanityCheckValues.barMaxWidth, TRB.Data.settings.druid.balance.bar.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.width:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.bar.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.balance.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.balance.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.balance.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 1 then
				TRB.Functions.UpdateBarWidth(TRB.Data.settings.druid.balance)

				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[1], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starsurgeThreshold, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[2], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starsurgeThreshold*2, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[3], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starsurgeThreshold*3, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[4], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starfallThreshold, TRB.Data.character.maxResource)
			end
		end)

		title = "Bar Height"
		controls.height = TRB.UiFunctions:BuildSlider(parent, title, TRB.Data.sanityCheckValues.barMinHeight, TRB.Data.sanityCheckValues.barMaxHeight, TRB.Data.settings.druid.balance.bar.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.height:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.bar.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.balance.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.balance.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.balance.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 1 then
				TRB.Functions.UpdateBarHeight(TRB.Data.settings.druid.balance)
			end
		end)

		title = "Bar Horizontal Position"
		yCoord = yCoord - 60
		controls.horizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-TRB.Data.sanityCheckValues.barMaxWidth/2), math.floor(TRB.Data.sanityCheckValues.barMaxWidth/2), TRB.Data.settings.druid.balance.bar.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.horizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.bar.xPos = value

			if GetSpecialization() == 1 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.druid.balance.bar.xPos, TRB.Data.settings.druid.balance.bar.yPos)
			end
		end)

		title = "Bar Vertical Position"
		controls.vertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-TRB.Data.sanityCheckValues.barMaxHeight/2), math.floor(TRB.Data.sanityCheckValues.barMaxHeight/2), TRB.Data.settings.druid.balance.bar.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.vertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)

			if GetSpecialization() == 1 then
				TRB.Data.settings.druid.balance.bar.yPos = value
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.druid.balance.bar.xPos, TRB.Data.settings.druid.balance.bar.yPos)
			end
		end)

		title = "Bar Border Width"
		yCoord = yCoord - 60
		controls.borderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxBorderHeight, TRB.Data.settings.druid.balance.bar.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.borderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.bar.border = value

			if GetSpecialization() == 1 then
				barContainerFrame:SetWidth(TRB.Data.settings.druid.balance.bar.width-(TRB.Data.settings.druid.balance.bar.border*2))
				barContainerFrame:SetHeight(TRB.Data.settings.druid.balance.bar.height-(TRB.Data.settings.druid.balance.bar.border*2))
				barBorderFrame:SetWidth(TRB.Data.settings.druid.balance.bar.width)
				barBorderFrame:SetHeight(TRB.Data.settings.druid.balance.bar.height)
				if TRB.Data.settings.druid.balance.bar.border < 1 then
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.druid.balance.textures.border,
						tile = true,
						tileSize = 4,
						edgeSize = 1,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Hide()
				else
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.druid.balance.textures.border,
						tile = true,
						tileSize=4,
						edgeSize=TRB.Data.settings.druid.balance.bar.border,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Show()
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.border, true))

				TRB.Functions.SetBarMinMaxValues(TRB.Data.settings.druid.balance)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[1], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starsurgeThreshold, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[2], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starsurgeThreshold*2, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[3], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starsurgeThreshold*3, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.balance, resourceFrame.thresholds[4], resourceFrame, TRB.Data.settings.druid.balance.thresholds.width, TRB.Data.character.starfallThreshold, TRB.Data.character.maxResource)
			end

			local minsliderWidth = math.max(TRB.Data.settings.druid.balance.bar.border*2, 120)
			local minsliderHeight = math.max(TRB.Data.settings.druid.balance.bar.border*2, 1)
			controls.height:SetMinMaxValues(minsliderHeight, TRB.Data.sanityCheckValues.barMaxHeight)
			controls.height.MinLabel:SetText(minsliderHeight)
			controls.width:SetMinMaxValues(minsliderWidth, TRB.Data.sanityCheckValues.barMaxWidth)
			controls.width.MinLabel:SetText(minsliderWidth)
		end)

		title = "Threshold Line Width"
		controls.thresholdWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.druid.balance.thresholds.width, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.thresholds.width = value
			
			if GetSpecialization() == 1 then
				resourceFrame.thresholds[1]:SetWidth(TRB.Data.settings.druid.balance.thresholds.width)
				resourceFrame.thresholds[2]:SetWidth(TRB.Data.settings.druid.balance.thresholds.width)
				resourceFrame.thresholds[3]:SetWidth(TRB.Data.settings.druid.balance.thresholds.width)
				resourceFrame.thresholds[4]:SetWidth(TRB.Data.settings.druid.balance.thresholds.width)
			end
		end)

		yCoord = yCoord - 40

		--NOTE: the order of these checkboxes is reversed!

		controls.checkBoxes.lockPosition = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_dragAndDrop", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.lockPosition
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Drag & Drop Movement Enabled")
		f.tooltip = "Disable Drag & Drop functionality of the bar to keep it from accidentally being moved.\n\nWhen 'Pin to Personal Resource Display' is checked, this value is ignored and cannot be changed."
		f:SetChecked(TRB.Data.settings.druid.balance.bar.dragAndDrop)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.bar.dragAndDrop = self:GetChecked()
			
			if GetSpecialization() == 1 then
				barContainerFrame:SetMovable((not TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.balance.bar.dragAndDrop)
				barContainerFrame:EnableMouse((not TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.balance.bar.dragAndDrop)
			end
		end)

		TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay)

		controls.checkBoxes.pinToPRD = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_pinToPRD", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.pinToPRD
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Pin to Personal Resource Display")
		f.tooltip = "Pins the bar to the Blizzard Personal Resource Display. Adjust the Horizontal and Vertical positions above to offset it from PRD. When enabled, Drag & Drop positioning is not allowed. If PRD is not enabled, will behave as if you didn't have this enabled.\n\nNOTE: This will also be the position (relative to the center of the screen, NOT the PRD) that it shows when out of combat/the PRD is not displayed! It is recommended you set 'Bar Display' to 'Only show bar in combat' if you plan to pin it to your PRD."
		f:SetChecked(TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay = self:GetChecked()

			TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay)

			if GetSpecialization() == 1 then
				barContainerFrame:SetMovable((not TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.balance.bar.dragAndDrop)
				barContainerFrame:EnableMouse((not TRB.Data.settings.druid.balance.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.balance.bar.dragAndDrop)
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.balance, TRB.Frames.barContainerFrame)
			end
		end)


		yCoord = yCoord - 30
		controls.textBarTexturesSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Textures", 0, yCoord)
		yCoord = yCoord - 30

		-- Create the dropdown, and configure its appearance
		controls.dropDown.resourceBarTexture = CreateFrame("FRAME", "TwintopResourceBar_ResourceBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.resourceBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Main Bar Texture", xCoord, yCoord)
		controls.dropDown.resourceBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.resourceBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.resourceBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.druid.balance.textures.resourceBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.resourceBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.resourceBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.balance.textures.resourceBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.resourceBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.textures.resourceBar = newValue
			TRB.Data.settings.druid.balance.textures.resourceBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
			if TRB.Data.settings.druid.balance.textures.textureLock then
				TRB.Data.settings.druid.balance.textures.castingBar = newValue
				TRB.Data.settings.druid.balance.textures.castingBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
				TRB.Data.settings.druid.balance.textures.passiveBar = newValue
				TRB.Data.settings.druid.balance.textures.passiveBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			end

			if GetSpecialization() == 1 then
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.resourceBar)
				if TRB.Data.settings.druid.balance.textures.textureLock then
					castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.castingBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.passiveBar)
				end
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.castingBarTexture = CreateFrame("FRAME", "TwintopResourceBar_CastBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.castingBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Casting Bar Texture", xCoord2, yCoord)
		controls.dropDown.castingBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.castingBarTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.castingBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.druid.balance.textures.castingBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.castingBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.castingBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.balance.textures.castingBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.castingBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.textures.castingBar = newValue
			TRB.Data.settings.druid.balance.textures.castingBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			if TRB.Data.settings.druid.balance.textures.textureLock then
				TRB.Data.settings.druid.balance.textures.resourceBar = newValue
				TRB.Data.settings.druid.balance.textures.resourceBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.druid.balance.textures.passiveBar = newValue
				TRB.Data.settings.druid.balance.textures.passiveBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			end

			if GetSpecialization() == 1 then
				castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.castingBar)
				if TRB.Data.settings.druid.balance.textures.textureLock then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.resourceBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.passiveBar)
				end
			end

			CloseDropDownMenus()
		end

		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.passiveBarTexture = CreateFrame("FRAME", "TwintopResourceBar_PassiveBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.passiveBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Passive Bar Texture", xCoord, yCoord)
		controls.dropDown.passiveBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.passiveBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.passiveBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, TRB.Data.settings.druid.balance.textures.passiveBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.passiveBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.passiveBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.balance.textures.passiveBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.passiveBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.textures.passiveBar = newValue
			TRB.Data.settings.druid.balance.textures.passiveBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			if TRB.Data.settings.druid.balance.textures.textureLock then
				TRB.Data.settings.druid.balance.textures.resourceBar = newValue
				TRB.Data.settings.druid.balance.textures.resourceBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.druid.balance.textures.castingBar = newValue
				TRB.Data.settings.druid.balance.textures.castingBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			end

			if GetSpecialization() == 1 then
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.passiveBar)
				if TRB.Data.settings.druid.balance.textures.textureLock then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.resourceBar)
					castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.castingBar)
				end
			end

			CloseDropDownMenus()
		end

		controls.checkBoxes.textureLock = CreateFrame("CheckButton", "TwintopResourceBar_CB1_TEXTURE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.textureLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same texture for all bars")
		f.tooltip = "This will lock the texture for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.druid.balance.textures.textureLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.textures.textureLock = self:GetChecked()
			if TRB.Data.settings.druid.balance.textures.textureLock then
				TRB.Data.settings.druid.balance.textures.passiveBar = TRB.Data.settings.druid.balance.textures.resourceBar
				TRB.Data.settings.druid.balance.textures.passiveBarName = TRB.Data.settings.druid.balance.textures.resourceBarName
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.passiveBar)
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.druid.balance.textures.passiveBarName)
				TRB.Data.settings.druid.balance.textures.castingBar = TRB.Data.settings.druid.balance.textures.resourceBar
				TRB.Data.settings.druid.balance.textures.castingBarName = TRB.Data.settings.druid.balance.textures.resourceBarName
				castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.balance.textures.castingBar)
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.druid.balance.textures.castingBarName)
			end
		end)


		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.borderTexture = CreateFrame("FRAME", "TwintopResourceBar_BorderTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.borderTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Border Texture", xCoord, yCoord)
		controls.dropDown.borderTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.borderTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.borderTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.borderTexture, TRB.Data.settings.druid.balance.textures.borderName)
		UIDropDownMenu_JustifyText(controls.dropDown.borderTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.borderTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("border")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("border")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Border Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.balance.textures.border
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.borderTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.textures.border = newValue
			TRB.Data.settings.druid.balance.textures.borderName = newName
			
			if GetSpecialization() == 1 then
				if TRB.Data.settings.druid.balance.bar.border < 1 then
					barBorderFrame:SetBackdrop({ })
				else
					barBorderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.druid.balance.textures.border,
												tile = true,
												tileSize=4,
												edgeSize=TRB.Data.settings.druid.balance.bar.border,
												insets = {0, 0, 0, 0}
												})
				end				
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.border, true))
			end

			UIDropDownMenu_SetText(controls.dropDown.borderTexture, newName)
			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.backgroundTexture = CreateFrame("FRAME", "TwintopResourceBar_BackgroundTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.backgroundTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Background (Empty Bar) Texture", xCoord2, yCoord)
		controls.dropDown.backgroundTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.backgroundTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.backgroundTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, TRB.Data.settings.druid.balance.textures.backgroundName)
		UIDropDownMenu_JustifyText(controls.dropDown.backgroundTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.backgroundTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("background")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("background")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Background Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.balance.textures.background
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.backgroundTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.textures.background = newValue
			TRB.Data.settings.druid.balance.textures.backgroundName = newName
			if GetSpecialization() == 1 then
				barContainerFrame:SetBackdrop({
					bgFile = TRB.Data.settings.druid.balance.textures.background,
					tile = true,
					tileSize = TRB.Data.settings.druid.balance.bar.width,
					edgeSize = 1,
					insets = {0, 0, 0, 0}
				})
				barContainerFrame:SetBackdropColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.background, true))
			end
			
			UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, newName)
			CloseDropDownMenus()
		end


		yCoord = yCoord - 70
		controls.barDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display", 0, yCoord)

		yCoord = yCoord - 50

		title = "Bar Flash Alpha"
		controls.flashAlpha = TRB.UiFunctions:BuildSlider(parent, title, 0, 1, TRB.Data.settings.druid.balance.colors.bar.flashAlpha, 0.01, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.flashAlpha:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.colors.bar.flashAlpha = value
		end)

		title = "Bar Flash Period (sec)"
		controls.flashPeriod = TRB.UiFunctions:BuildSlider(parent, title, 0, 2, TRB.Data.settings.druid.balance.colors.bar.flashPeriod, 0.05, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.flashPeriod:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.colors.bar.flashPeriod = value
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.alwaysShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_2", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.alwaysShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Always show Resource Bar")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar always visible on your UI, even when out of combat."
		f:SetChecked(TRB.Data.settings.druid.balance.displayBar.alwaysShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(true)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.druid.balance.displayBar.alwaysShow = true
			TRB.Data.settings.druid.balance.displayBar.notZeroShow = false
			TRB.Data.settings.druid.balance.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.notZeroShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_3", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.notZeroShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-15)
		getglobal(f:GetName() .. 'Text'):SetText("Show Resource Bar when Astral Power > 0")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar show out of combat only if Astral Power > 0 (or < 50 with Nature's Balance), hidden otherwise when out of combat."
		f:SetChecked(TRB.Data.settings.druid.balance.displayBar.notZeroShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(true)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.druid.balance.displayBar.alwaysShow = false
			TRB.Data.settings.druid.balance.displayBar.notZeroShow = true
			TRB.Data.settings.druid.balance.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.combatShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_4", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.combatShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Only show Resource Bar in combat")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar only be visible on your UI when in combat."
		f:SetChecked((not TRB.Data.settings.druid.balance.displayBar.alwaysShow) and (not TRB.Data.settings.druid.balance.displayBar.notZeroShow))
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(true)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.druid.balance.displayBar.alwaysShow = false
			TRB.Data.settings.druid.balance.displayBar.notZeroShow = false
			TRB.Data.settings.druid.balance.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.neverShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_5", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.neverShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-45)
		getglobal(f:GetName() .. 'Text'):SetText("Never show Resource Bar (run in background)")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar never display but still run in the background to update the global variable."
		f:SetChecked(TRB.Data.settings.druid.balance.displayBar.neverShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(true)
			TRB.Data.settings.druid.balance.displayBar.alwaysShow = false
			TRB.Data.settings.druid.balance.displayBar.notZeroShow = false
			TRB.Data.settings.druid.balance.displayBar.neverShow = true
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.showCastingBar = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_showCastingBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showCastingBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show casting bar")
		f.tooltip = "This will show the casting bar when hardcasting a spell. Uncheck to hide this bar."
		f:SetChecked(TRB.Data.settings.druid.balance.bar.showCasting)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.bar.showCasting = self:GetChecked()
		end)

		controls.checkBoxes.showPassiveBar = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_showPassiveBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showPassiveBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord-20)
		getglobal(f:GetName() .. 'Text'):SetText("Show passive bar")
		f.tooltip = "This will show the passive bar. Uncheck to hide this bar. This setting supercedes any other passive tracking options!"
		f:SetChecked(TRB.Data.settings.druid.balance.bar.showPassive)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.bar.showPassive = self:GetChecked()
		end)

		controls.checkBoxes.flashEnabled = CreateFrame("CheckButton", "TwintopResourceBar_CB1_5", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-40)
		getglobal(f:GetName() .. 'Text'):SetText("Flash bar when Moonkin Form is missing")
		f.tooltip = "This will flash the bar when Moonkin Form is missing while in combat."
		f:SetChecked(TRB.Data.settings.druid.balance.colors.bar.flashEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.colors.bar.flashEnabled = self:GetChecked()
		end)

		controls.checkBoxes.flashSsEnabled = CreateFrame("CheckButton", "TwintopResourceBar_CB1_6", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashSsEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-60)
		getglobal(f:GetName() .. 'Text'):SetText("Flash bar when Starsurge is usable")
		f.tooltip = "This will flash the bar when Starsurge can be cast."
		f:SetChecked(TRB.Data.settings.druid.balance.colors.bar.flashSsEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.colors.bar.flashSsEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 70

		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.base = TRB.UiFunctions:BuildColorPicker(parent, "Astral Power", TRB.Data.settings.druid.balance.colors.bar.base, 300, 25, xCoord, yCoord)
		f = controls.colors.base
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.base, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.base.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.base = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.solar = TRB.UiFunctions:BuildColorPicker(parent, "Eclipse (Solar) is Active", TRB.Data.settings.druid.balance.colors.bar.solar, 275, 25, xCoord2, yCoord)
		f = controls.colors.solar
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.solar, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.solar.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.solar = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.border = TRB.UiFunctions:BuildColorPicker(parent, "Resource Bar's border", TRB.Data.settings.druid.balance.colors.bar.border, 300, 25, xCoord, yCoord)
		f = controls.colors.border
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.border, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.border.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.border = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					barBorderFrame:SetBackdropBorderColor(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.lunar = TRB.UiFunctions:BuildColorPicker(parent, "Eclipse (Lunar) is Active", TRB.Data.settings.druid.balance.colors.bar.lunar, 275, 25, xCoord2, yCoord)
		f = controls.colors.lunar
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.lunar, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.lunar.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.lunar = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.casting = TRB.UiFunctions:BuildColorPicker(parent, "Astral Power from hardcasting spells", TRB.Data.settings.druid.balance.colors.bar.casting, 300, 25, xCoord, yCoord)
		f = controls.colors.casting
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.casting, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.casting.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.casting = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					castingFrame:SetStatusBarColor(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.celestial = TRB.UiFunctions:BuildColorPicker(parent, "Celestial Alignment / Incarnation: Chosen of Elune is Active", TRB.Data.settings.druid.balance.colors.bar.celestial, 275, 25, xCoord2, yCoord)
		f = controls.colors.celestial
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.celestial, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.celestial.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.celestial = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30

		controls.colors.borderOvercap = TRB.UiFunctions:BuildColorPicker(parent, "Bar border color when your current hardcast will overcap Astral Power", TRB.Data.settings.druid.balance.colors.bar.borderOvercap, 300, 25, xCoord, yCoord)
		f = controls.colors.borderOvercap
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.borderOvercap, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.borderOvercap.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.borderOvercap = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.eclipse1GCD = TRB.UiFunctions:BuildColorPicker(parent, "Astral Power when Eclipse is ending", TRB.Data.settings.druid.balance.colors.bar.eclipse1GCD, 275, 25, xCoord2, yCoord)
		f = controls.colors.eclipse1GCD
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.eclipse1GCD, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.eclipse1GCD.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.eclipse1GCD = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30

		controls.colors.moonkinFormMissing = TRB.UiFunctions:BuildColorPicker(parent, "Moonkin Form missing when in combat", TRB.Data.settings.druid.balance.colors.bar.moonkinFormMissing, 300, 25, xCoord, yCoord)
		f = controls.colors.moonkinFormMissing
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.moonkinFormMissing, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.moonkinFormMissing.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.moonkinFormMissing = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.background = TRB.UiFunctions:BuildColorPicker(parent, "Unfilled bar background", TRB.Data.settings.druid.balance.colors.bar.background, 275, 25, xCoord2, yCoord)
		f = controls.colors.background
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.background, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.background.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.background = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					barContainerFrame:SetBackdropColor(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.passive = TRB.UiFunctions:BuildColorPicker(parent, "Astral Power from Fury of Elune and Nature's Balance", TRB.Data.settings.druid.balance.colors.bar.passive, 300, 25, xCoord, yCoord)
		f = controls.colors.passive
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.bar.passive, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.passive.Texture:SetColorTexture(r, g, b, 1-a)
					passiveFrame:SetStatusBarColor(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.bar.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)



		yCoord = yCoord - 40
		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Ability Threshold Lines", 0, yCoord)

		yCoord = yCoord - 25

		controls.colors.thresholdUnder = TRB.UiFunctions:BuildColorPicker(parent, "Under minimum required Astral Power", TRB.Data.settings.druid.balance.colors.threshold.under, 275, 25, xCoord2, yCoord)
		f = controls.colors.thresholdUnder
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.threshold.under, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.thresholdUnder.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.threshold.under = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.thresholdOver = TRB.UiFunctions:BuildColorPicker(parent, "Over minimum required Astral Power", TRB.Data.settings.druid.balance.colors.threshold.over, 275, 25, xCoord2, yCoord-30)
		f = controls.colors.thresholdOver
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.threshold.over, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.thresholdOver.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.threshold.over = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.starfallPandemic = TRB.UiFunctions:BuildColorPicker(parent, "Starfall outside Pandemic refresh range or on cooldown w/Stellar Drift", TRB.Data.settings.druid.balance.colors.threshold.starfallPandemic, 275, 25, xCoord2, yCoord-60)
		f = controls.colors.starfallPandemic
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.threshold.starfallPandemic, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.starfallPandemic.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.threshold.starfallPandemic = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.checkBoxes.thresholdOverlapBorder = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_thresholdOverlapBorder", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdOverlapBorder
		f:SetPoint("TOPLEFT", xCoord2, yCoord-90)
		getglobal(f:GetName() .. 'Text'):SetText("Threshold lines overlap bar border?")
		f.tooltip = "When checked, threshold lines will span the full height of the bar and overlap the bar border."
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.overlapBorder)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.overlapBorder = self:GetChecked()
			TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.balance)
		end)


		controls.checkBoxes.sfThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_Threshold_starfallEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.sfThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show Starfall threshold line")
		f.tooltip = "This will show the vertical line on the bar denoting how much Astral Power is required to cast Starfall."
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.starfall.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.starfall.enabled = self:GetChecked()

			if TRB.Data.settings.druid.balance.thresholds.starfall.enabled then
				TRB.Frames.resourceFrame.thresholds[4]:Show()
			else
				TRB.Frames.resourceFrame.thresholds[4]:Hide()
			end
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.ssThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_Threshold_starsurgeEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ssThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show Starsurge threshold line")
		f.tooltip = "This will show the vertical line on the bar denoting how much Astral Power is required to cast Starsurge."
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.starsurge.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.starsurge.enabled = self:GetChecked()

			if TRB.Data.settings.druid.balance.thresholds.starsurge.enabled then
				TRB.Frames.resourceFrame.thresholds[1]:Show()
			else
				TRB.Frames.resourceFrame.thresholds[1]:Hide()
			end
		end)

		yCoord = yCoord - 20
		controls.checkBoxes.ssThreshold2Show = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_Threshold_starsurge2Enabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ssThreshold2Show
		f:SetPoint("TOPLEFT", xCoord+20, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show 2x Starsurge threshold line")
		f.tooltip = "This will show the vertical line on the bar denoting how much Astral Power is required to cast two Starsurges in a row."
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.starsurge2.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.starsurge2.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 20
		controls.checkBoxes.ssThreshold3Show = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_Threshold_starsurge3Enabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ssThreshold3Show
		f:SetPoint("TOPLEFT", xCoord+20, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show 3x Starsurge threshold line")
		f.tooltip = "This will show the vertical line on the bar denoting how much Astral Power is required to cast three Starsurges in a row."
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.starsurge3.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.starsurge3.enabled = self:GetChecked()
		end)
		yCoord = yCoord - 20
		controls.checkBoxes.ssThresholdOnlyOverShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_Threshold_starsurgeOnlyOver", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ssThresholdOnlyOverShow
		f:SetPoint("TOPLEFT", xCoord+20, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Only show current + next threshold line?")
		f.tooltip = "This will only show Starsurge threshold lines if you already have enough Astral Power to cast it, or, if it is the next threshold you're approaching. Only triggers the next after the previous threshold line has been reached, even if it is not checked above!"
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.starsurgeThresholdOnlyOverShow)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.starsurgeThresholdOnlyOverShow = self:GetChecked()
		end)

		yCoord = yCoord - 30

		
        -- Create the dropdown, and configure its appearance
        controls.dropDown.thresholdIconRelativeTo = CreateFrame("FRAME", "TwintopResourceBar_Druid_Balance_thresholdIconRelativeTo", parent, "UIDropDownMenuTemplate")
        controls.dropDown.thresholdIconRelativeTo.label = TRB.UiFunctions:BuildSectionHeader(parent, "Relative Position of Threshold Line Icons", xCoord, yCoord)
        controls.dropDown.thresholdIconRelativeTo.label.font:SetFontObject(GameFontNormal)
        controls.dropDown.thresholdIconRelativeTo:SetPoint("TOPLEFT", xCoord, yCoord-30)
        UIDropDownMenu_SetWidth(controls.dropDown.thresholdIconRelativeTo, dropdownWidth)
        UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, TRB.Data.settings.druid.balance.thresholds.icons.relativeToName)
        UIDropDownMenu_JustifyText(controls.dropDown.thresholdIconRelativeTo, "LEFT")

        -- Create and bind the initialization function to the dropdown menu
        UIDropDownMenu_Initialize(controls.dropDown.thresholdIconRelativeTo, function(self, level, menuList)
            local entries = 25
            local info = UIDropDownMenu_CreateInfo()
            local relativeTo = {}
            relativeTo["Above"] = "TOP"
            relativeTo["Middle"] = "CENTER"
            relativeTo["Below"] = "BOTTOM"
            local relativeToList = {
                "Above",
                "Middle",
                "Below"
            }

            for k, v in pairs(relativeToList) do
                info.text = v
                info.value = relativeTo[v]
                info.checked = relativeTo[v] == TRB.Data.settings.druid.balance.thresholds.icons.relativeTo
                info.func = self.SetValue
                info.arg1 = relativeTo[v]
                info.arg2 = v
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        function controls.dropDown.thresholdIconRelativeTo:SetValue(newValue, newName)
            TRB.Data.settings.druid.balance.thresholds.icons.relativeTo = newValue
            TRB.Data.settings.druid.balance.thresholds.icons.relativeToName = newName
			
			if GetSpecialization() == 1 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.balance)
			end

            UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, newName)
            CloseDropDownMenus()
        end

		controls.checkBoxes.thresholdIconEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_thresholdIconEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdIconEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Show ability icons for threshold lines?")
		f.tooltip = "When checked, icons for the threshold each line represents will be displayed. Configuration of size and location of these icons is below."
		f:SetChecked(TRB.Data.settings.druid.balance.thresholds.icons.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.thresholds.icons.enabled = self:GetChecked()
			
			if GetSpecialization() == 1 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.balance)

				if TRB.Data.settings.druid.balance.thresholds.icons.enabled then
					resourceFrame.thresholds[1].icon:Show()
					resourceFrame.thresholds[2].icon:Show()
					resourceFrame.thresholds[3].icon:Show()
					resourceFrame.thresholds[4].icon:Show()
				else
					resourceFrame.thresholds[1].icon:Hide()
					resourceFrame.thresholds[2].icon:Hide()
					resourceFrame.thresholds[3].icon:Hide()
					resourceFrame.thresholds[4].icon:Hide()
				end
			end
		end)

		yCoord = yCoord - 80
		title = "Threshold Icon Width"
		controls.thresholdIconWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.druid.balance.thresholds.icons.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.thresholds.icons.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.balance.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.balance.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.balance.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
						
			if GetSpecialization() == 1 then
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[1], "starsurge", TRB.Data.settings.druid.balance)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[2], "starsurge2", TRB.Data.settings.druid.balance)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[3], "starsurge3", TRB.Data.settings.druid.balance)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[4], "starfall", TRB.Data.settings.druid.balance)
			end
		end)

		title = "Threshold Icon Height"
		controls.thresholdIconHeight = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.druid.balance.thresholds.icons.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconHeight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.thresholds.icons.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.balance.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.balance.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.balance.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
						
			if GetSpecialization() == 1 then
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[1], "starsurge", TRB.Data.settings.druid.balance)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[2], "starsurge2", TRB.Data.settings.druid.balance)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[3], "starsurge3", TRB.Data.settings.druid.balance)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[4], "starfall", TRB.Data.settings.druid.balance)
			end
		end)


		title = "Threshold Icon Horizontal Position (Relative)"
		yCoord = yCoord - 60
		controls.thresholdIconHorizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.druid.balance.thresholds.icons.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconHorizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.thresholds.icons.xPos = value

			if GetSpecialization() == 1 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.balance, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Threshold Icon Vertical Position (Relative)"
		controls.thresholdIconVertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.druid.balance.thresholds.icons.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconVertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.thresholds.icons.yPos = value
		end)

		local maxIconBorderHeight = math.min(math.floor(TRB.Data.settings.druid.balance.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.balance.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))

		title = "Threshold Icon Border Width"
		yCoord = yCoord - 60
		controls.thresholdIconBorderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxIconBorderHeight, TRB.Data.settings.druid.balance.thresholds.icons.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconBorderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.thresholds.icons.border = value

			local minsliderWidth = math.max(TRB.Data.settings.druid.balance.thresholds.icons.border*2, 1)
			local minsliderHeight = math.max(TRB.Data.settings.druid.balance.thresholds.icons.border*2, 1)

			controls.thresholdIconHeight:SetMinMaxValues(minsliderHeight, 128)
			controls.thresholdIconHeight.MinLabel:SetText(minsliderHeight)
			controls.thresholdIconWidth:SetMinMaxValues(minsliderWidth, 128)
			controls.thresholdIconWidth.MinLabel:SetText(minsliderWidth)

			if GetSpecialization() == 1 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.balance)
			end
		end)


		yCoord = yCoord - 60


		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "End of Eclipse Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.endOfEclipse = CreateFrame("CheckButton", "TRB_EOE_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.endOfEclipse
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change bar color at the end of Eclipse")
		f.tooltip = "Changes the bar color when Eclipse is ending in the next X GCDs or fixed length of time. Select which to use from the options below."
		f:SetChecked(TRB.Data.settings.druid.balance.endOfEclipse.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.endOfEclipse.enabled = self:GetChecked()
		end)
		yCoord = yCoord - 20
		controls.checkBoxes.endOfEclipseOnly = CreateFrame("CheckButton", "TRB_EOE_CB_CAO", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.endOfEclipseOnly
		f:SetPoint("TOPLEFT", xCoord+xPadding*2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Only change the bar color when in Celestial Alignment")
		f.tooltip = "Only changes the bar color when you are exiting an Eclipse from Celestial Alignment or Incarnation: Chosen of Elune."
		f:SetChecked(TRB.Data.settings.druid.balance.endOfEclipse.celestialAlignmentOnly)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.endOfEclipse.celestialAlignmentOnly = self:GetChecked()
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.endOfEclipseModeGCDs = CreateFrame("CheckButton", "TRB_EOE_M_GCD", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.endOfEclipseModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("GCDs until Eclipse ends")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many GCDs remain until Eclipse ends."
		if TRB.Data.settings.druid.balance.endOfEclipse.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.endOfEclipseModeGCDs:SetChecked(true)
			controls.checkBoxes.endOfEclipseModeTime:SetChecked(false)
			TRB.Data.settings.druid.balance.endOfEclipse.mode = "gcd"
		end)

		title = "Eclipse GCDs - 0.75sec Floor"
		controls.endOfEclipseGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0.5, 15, TRB.Data.settings.druid.balance.endOfEclipse.gcdsMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.endOfEclipseGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.endOfEclipse.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.endOfEclipseModeTime = CreateFrame("CheckButton", "TRB_EOE_M_TIME", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.endOfEclipseModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Time until Eclipse ends")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many seconds remain until Eclipse ends."
		if TRB.Data.settings.druid.balance.endOfEclipse.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.endOfEclipseModeGCDs:SetChecked(false)
			controls.checkBoxes.endOfEclipseModeTime:SetChecked(true)
			TRB.Data.settings.druid.balance.endOfEclipse.mode = "time"
		end)

		title = "Eclipse Time Remaining (sec)"
		controls.endOfEclipseTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 20, TRB.Data.settings.druid.balance.endOfEclipse.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.endOfEclipseTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.endOfEclipse.timeMax = value
		end)

		yCoord = yCoord - 40
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Overcapping Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.overcapEnabled = CreateFrame("CheckButton", "TwintopResourceBar_CB1_8", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapEnabled
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change border color when overcapping")
		f.tooltip = "This will change the bar's border color when your current hardcast spell will result in overcapping maximum Astral Power."
		f:SetChecked(TRB.Data.settings.druid.balance.colors.bar.overcapEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.colors.bar.overcapEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 40

		title = "Show Overcap Notification Above"
		controls.overcapAt = TRB.UiFunctions:BuildSlider(parent, title, 0, 100, TRB.Data.settings.druid.balance.overcapThreshold, 0.5, 1,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.overcapAt:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 1)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.overcapThreshold = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.balance = controls
	end

	local function BalanceConstructFontAndTextPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.balance
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		controls.buttons.exportButton_Druid_Balance_FontAndText = TRB.UiFunctions:BuildButton(parent, "Export Font & Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Balance_FontAndText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Balance Druid (Font & Text).", 11, 1, false, true, false, false, false)
		end)

		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Face", 0, yCoord)

		yCoord = yCoord - 30
		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontLeft = CreateFrame("FRAME", "TwintopResourceBar_FontLeft", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontLeft.label = TRB.UiFunctions:BuildSectionHeader(parent, "Left Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontLeft.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontLeft:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontLeft, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontLeft, TRB.Data.settings.druid.balance.displayText.left.fontFaceName)
		UIDropDownMenu_JustifyText(controls.dropDown.fontLeft, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.fontLeft, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local fonts = TRB.Details.addonData.libs.SharedMedia:HashTable("font")
			local fontsList = TRB.Details.addonData.libs.SharedMedia:List("font")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(fonts) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Fonts " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(fontsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = fonts[v]
						info.checked = fonts[v] == TRB.Data.settings.druid.balance.displayText.left.fontFace
						info.func = self.SetValue
						info.arg1 = fonts[v]
						info.arg2 = v
						info.fontObject = CreateFont(v)
						info.fontObject:SetFont(fonts[v], 12, "OUTLINE")
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		function controls.dropDown.fontLeft:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.displayText.left.fontFace = newValue
			TRB.Data.settings.druid.balance.displayText.left.fontFaceName = newName
			leftTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.left.fontFace, TRB.Data.settings.druid.balance.displayText.left.fontSize, "OUTLINE")
			UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
			if TRB.Data.settings.druid.balance.displayText.fontFaceLock then
				TRB.Data.settings.druid.balance.displayText.middle.fontFace = newValue
				TRB.Data.settings.druid.balance.displayText.middle.fontFaceName = newName
				middleTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.middle.fontFace, TRB.Data.settings.druid.balance.displayText.middle.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
				TRB.Data.settings.druid.balance.displayText.right.fontFace = newValue
				TRB.Data.settings.druid.balance.displayText.right.fontFaceName = newName
				rightTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.right.fontFace, TRB.Data.settings.druid.balance.displayText.right.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end
			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontMiddle = CreateFrame("FRAME", "TwintopResourceBar_FontMiddle", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontMiddle.label = TRB.UiFunctions:BuildSectionHeader(parent, "Middle Bar Font Face", xCoord2, yCoord)
		controls.dropDown.fontMiddle.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontMiddle:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontMiddle, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.druid.balance.displayText.middle.fontFaceName)
		UIDropDownMenu_JustifyText(controls.dropDown.fontMiddle, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.fontMiddle, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local fonts = TRB.Details.addonData.libs.SharedMedia:HashTable("font")
			local fontsList = TRB.Details.addonData.libs.SharedMedia:List("font")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(fonts) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Fonts " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(fontsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = fonts[v]
						info.checked = fonts[v] == TRB.Data.settings.druid.balance.displayText.middle.fontFace
						info.func = self.SetValue
						info.arg1 = fonts[v]
						info.arg2 = v
						info.fontObject = CreateFont(v)
						info.fontObject:SetFont(fonts[v], 12, "OUTLINE")
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		function controls.dropDown.fontMiddle:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.displayText.middle.fontFace = newValue
			TRB.Data.settings.druid.balance.displayText.middle.fontFaceName = newName
			middleTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.middle.fontFace, TRB.Data.settings.druid.balance.displayText.middle.fontSize, "OUTLINE")
			UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			if TRB.Data.settings.druid.balance.displayText.fontFaceLock then
				TRB.Data.settings.druid.balance.displayText.left.fontFace = newValue
				TRB.Data.settings.druid.balance.displayText.left.fontFaceName = newName
				leftTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.left.fontFace, TRB.Data.settings.druid.balance.displayText.left.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.druid.balance.displayText.right.fontFace = newValue
				TRB.Data.settings.druid.balance.displayText.right.fontFaceName = newName
				rightTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.right.fontFace, TRB.Data.settings.druid.balance.displayText.right.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end
			CloseDropDownMenus()
		end

		yCoord = yCoord - 40 - 20

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontRight = CreateFrame("FRAME", "TwintopResourceBar_FontRight", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontRight.label = TRB.UiFunctions:BuildSectionHeader(parent, "Right Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontRight.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontRight:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontRight, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.druid.balance.displayText.right.fontFaceName)
		UIDropDownMenu_JustifyText(controls.dropDown.fontRight, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.fontRight, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local fonts = TRB.Details.addonData.libs.SharedMedia:HashTable("font")
			local fontsList = TRB.Details.addonData.libs.SharedMedia:List("font")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(fonts) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Fonts " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(fontsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = fonts[v]
						info.checked = fonts[v] == TRB.Data.settings.druid.balance.displayText.right.fontFace
						info.func = self.SetValue
						info.arg1 = fonts[v]
						info.arg2 = v
						info.fontObject = CreateFont(v)
						info.fontObject:SetFont(fonts[v], 12, "OUTLINE")
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		function controls.dropDown.fontRight:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.displayText.right.fontFace = newValue
			TRB.Data.settings.druid.balance.displayText.right.fontFaceName = newName
			rightTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.right.fontFace, TRB.Data.settings.druid.balance.displayText.right.fontSize, "OUTLINE")
			UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			if TRB.Data.settings.druid.balance.displayText.fontFaceLock then
				TRB.Data.settings.druid.balance.displayText.left.fontFace = newValue
				TRB.Data.settings.druid.balance.displayText.left.fontFaceName = newName
				leftTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.left.fontFace, TRB.Data.settings.druid.balance.displayText.left.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.druid.balance.displayText.middle.fontFace = newValue
				TRB.Data.settings.druid.balance.displayText.middle.fontFaceName = newName
				middleTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.middle.fontFace, TRB.Data.settings.druid.balance.displayText.middle.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			end
			CloseDropDownMenus()
		end

		controls.checkBoxes.fontFaceLock = CreateFrame("CheckButton", "TwintopResourceBar_CB1_FONTFACE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontFaceLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font face for all text")
		f.tooltip = "This will lock the font face for text for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.druid.balance.displayText.fontFaceLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.displayText.fontFaceLock = self:GetChecked()
			if TRB.Data.settings.druid.balance.displayText.fontFaceLock then
				TRB.Data.settings.druid.balance.displayText.middle.fontFace = TRB.Data.settings.druid.balance.displayText.left.fontFace
				TRB.Data.settings.druid.balance.displayText.middle.fontFaceName = TRB.Data.settings.druid.balance.displayText.left.fontFaceName
				middleTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.middle.fontFace, TRB.Data.settings.druid.balance.displayText.middle.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.druid.balance.displayText.middle.fontFaceName)
				TRB.Data.settings.druid.balance.displayText.right.fontFace = TRB.Data.settings.druid.balance.displayText.left.fontFace
				TRB.Data.settings.druid.balance.displayText.right.fontFaceName = TRB.Data.settings.druid.balance.displayText.left.fontFaceName
				rightTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.right.fontFace, TRB.Data.settings.druid.balance.displayText.right.fontSize, "OUTLINE")
				UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.druid.balance.displayText.right.fontFaceName)
			end
		end)


		yCoord = yCoord - 70
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Size and Colors", 0, yCoord)

		title = "Left Bar Text Font Size"
		yCoord = yCoord - 50
		controls.fontSizeLeft = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.druid.balance.displayText.left.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeLeft:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.displayText.left.fontSize = value
			leftTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.left.fontFace, TRB.Data.settings.druid.balance.displayText.left.fontSize, "OUTLINE")
			if TRB.Data.settings.druid.balance.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		controls.checkBoxes.fontSizeLock = CreateFrame("CheckButton", "TwintopResourceBar_CB2_F1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontSizeLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font size for all text")
		f.tooltip = "This will lock the font sizes for each part of the bar to be the same size."
		f:SetChecked(TRB.Data.settings.druid.balance.displayText.fontSizeLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.displayText.fontSizeLock = self:GetChecked()
			if TRB.Data.settings.druid.balance.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(TRB.Data.settings.druid.balance.displayText.left.fontSize)
				controls.fontSizeRight:SetValue(TRB.Data.settings.druid.balance.displayText.left.fontSize)
			end
		end)

		controls.colors.leftText = TRB.UiFunctions:BuildColorPicker(parent, "Left Text", TRB.Data.settings.druid.balance.colors.text.left,
														250, 25, xCoord2, yCoord-30)
		f = controls.colors.leftText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.left, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.leftText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.left = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.middleText = TRB.UiFunctions:BuildColorPicker(parent, "Middle Text", TRB.Data.settings.druid.balance.colors.text.middle,
														225, 25, xCoord2, yCoord-70)
		f = controls.colors.middleText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.middle, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.middleText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.middle = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.rightText = TRB.UiFunctions:BuildColorPicker(parent, "Right Text", TRB.Data.settings.druid.balance.colors.text.right,
														225, 25, xCoord2, yCoord-110)
		f = controls.colors.rightText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.right, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.rightText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.right = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		title = "Middle Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeMiddle = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.druid.balance.displayText.middle.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeMiddle:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.displayText.middle.fontSize = value
			middleTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.middle.fontFace, TRB.Data.settings.druid.balance.displayText.middle.fontSize, "OUTLINE")
			if TRB.Data.settings.druid.balance.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		title = "Right Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeRight = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.druid.balance.displayText.right.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeRight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.displayText.right.fontSize = value
			rightTextFrame.font:SetFont(TRB.Data.settings.druid.balance.displayText.right.fontFace, TRB.Data.settings.druid.balance.displayText.right.fontSize, "OUTLINE")
			if TRB.Data.settings.druid.balance.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeMiddle:SetValue(value)
			end
		end)

		yCoord = yCoord - 40
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Astral Power Text Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.currentAstralPowerText = TRB.UiFunctions:BuildColorPicker(parent, "Current Astral Power", TRB.Data.settings.druid.balance.colors.text.current, 300, 25, xCoord, yCoord)
		f = controls.colors.currentAstralPowerText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.current, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.currentAstralPowerText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.current = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.castingAstralPowerText = TRB.UiFunctions:BuildColorPicker(parent, "Astral Power from hardcasting spells", TRB.Data.settings.druid.balance.colors.text.casting, 275, 25, xCoord2, yCoord)
		f = controls.colors.castingAstralPowerText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.casting, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.castingAstralPowerText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.casting = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.passiveAstralPowerText = TRB.UiFunctions:BuildColorPicker(parent, "Passive Astral Power", TRB.Data.settings.druid.balance.colors.text.passive, 300, 25, xCoord, yCoord)
		f = controls.colors.passiveAstralPowerText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.passive, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.passiveAstralPowerText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.thresholdAstralPowerText = TRB.UiFunctions:BuildColorPicker(parent, "Have enough Astral Power to cast Starsurge or Starfall", TRB.Data.settings.druid.balance.colors.text.overThreshold, 300, 25, xCoord, yCoord)
		f = controls.colors.thresholdAstralPowerText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.overThreshold, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.thresholdAstralPowerText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.overThreshold = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.overcapAstralPowerText = TRB.UiFunctions:BuildColorPicker(parent, "Cast will overcap Astral Power", TRB.Data.settings.druid.balance.colors.text.overcap, 300, 25, xCoord2, yCoord)
		f = controls.colors.overcapAstralPowerText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.overcap, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.overcapAstralPowerText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.balance.colors.text.overcap = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30

		controls.checkBoxes.overThresholdEnabled = CreateFrame("CheckButton", "TRB_OverThresholdTextEnable", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overThresholdEnabled
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "This will change the Astral Power text color when you are able to cast Starsurge or Starfall"
		f:SetChecked(TRB.Data.settings.druid.balance.colors.text.overThresholdEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.colors.text.overThresholdEnabled = self:GetChecked()
		end)

		controls.checkBoxes.overcapTextEnabled = CreateFrame("CheckButton", "TRB_OvercapTextEnable", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapTextEnabled
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "This will change the Astral Power text color when your current hardcast spell will result in overcapping maximum Astral Power."
		f:SetChecked(TRB.Data.settings.druid.balance.colors.text.overcapEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.colors.text.overcapEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 30
		controls.dotColorSection = TRB.UiFunctions:BuildSectionHeader(parent, "DoT Count and Time Remaining Tracking", 0, yCoord)

		yCoord = yCoord - 25

		controls.checkBoxes.dotColor = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_dotColor", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.dotColor
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change total DoT counter and DoT timer color based on DoT status?")
		f.tooltip = "When checked, the color of total DoTs up counters and DoT timers ($sunfireCount, $moonfireCount, $stellarFlareCount) will change based on whether or not the DoT is on the current target."
		f:SetChecked(TRB.Data.settings.druid.balance.colors.text.dots.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.colors.text.dots.enabled = self:GetChecked()
		end)

		controls.colors.dotUp = TRB.UiFunctions:BuildColorPicker(parent, "DoT is active on current target", TRB.Data.settings.druid.balance.colors.text.dots.up, 550, 25, xCoord, yCoord-30)
		f = controls.colors.dotUp
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.dots.up, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end

                    controls.colors.dotUp.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.balance.colors.text.dots.up = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotPandemic = TRB.UiFunctions:BuildColorPicker(parent, "DoT is active on current target but within Pandemic refresh range", TRB.Data.settings.druid.balance.colors.text.dots.pandemic, 550, 25, xCoord, yCoord-60)
		f = controls.colors.dotPandemic
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.dots.pandemic, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end

                    controls.colors.dotPandemic.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.balance.colors.text.dots.pandemic = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotDown = TRB.UiFunctions:BuildColorPicker(parent, "DoT is not active on current target", TRB.Data.settings.druid.balance.colors.text.dots.down, 550, 25, xCoord, yCoord-90)
		f = controls.colors.dotDown
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.balance.colors.text.dots.down, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end

                    controls.colors.dotDown.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.balance.colors.text.dots.down = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)


		yCoord = yCoord - 130
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Decimal Precision", 0, yCoord)

		yCoord = yCoord - 50
		title = "Haste / Crit / Mastery / Vers Decimal Precision"
		controls.hastePrecision = TRB.UiFunctions:BuildSlider(parent, title, 0, 10, TRB.Data.settings.druid.balance.hastePrecision, 1, 0,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.hastePrecision:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 0)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.hastePrecision = value
		end)

		title = "Astral Power Decimal Precision"
		controls.astralPowerPrecision = TRB.UiFunctions:BuildSlider(parent, title, 0, 1, TRB.Data.settings.druid.balance.astralPowerPrecision, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.astralPowerPrecision:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 0)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.balance.astralPowerPrecision = value
		end)

		TRB.Frames.interfaceSettingsFrame = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.balance = controls
	end

	local function BalanceConstructAudioAndTrackingPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.balance
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local sliderWidth = 260
		local sliderHeight = 20

		controls.buttons.exportButton_Druid_Balance_AudioAndTracking = TRB.UiFunctions:BuildButton(parent, "Export Audio & Tracking", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Balance_AudioAndTracking:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Balance Druid (Audio & Tracking).", 11, 1, false, false, true, false, false)
		end)

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Audio Options", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.ssReady = CreateFrame("CheckButton", "TwintopResourceBar_CB3_3", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ssReady
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when Starsurge is usable")
		f.tooltip = "Play an audio cue when Starsurge can be cast."
---@diagnostic disable-next-line: undefined-field
		f:SetChecked(TRB.Data.settings.druid.balance.audio.ssReady.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.audio.ssReady.enabled = self:GetChecked()

			if TRB.Data.settings.druid.balance.audio.ssReady.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.druid.balance.audio.ssReady.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.ssReadyAudio = CreateFrame("FRAME", "TwintopResourceBar_ssReadyAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.ssReadyAudio:SetPoint("TOPLEFT", xCoord, yCoord-30+10)
		UIDropDownMenu_SetWidth(controls.dropDown.ssReadyAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.ssReadyAudio, TRB.Data.settings.druid.balance.audio.ssReady.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.ssReadyAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.ssReadyAudio, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local sounds = TRB.Details.addonData.libs.SharedMedia:HashTable("sound")
			local soundsList = TRB.Details.addonData.libs.SharedMedia:List("sound")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(sounds) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Sounds " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(soundsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = sounds[v]
						info.checked = sounds[v] == TRB.Data.settings.druid.balance.audio.ssReady.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.ssReadyAudio:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.audio.ssReady.sound = newValue
			TRB.Data.settings.druid.balance.audio.ssReady.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.ssReadyAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.druid.balance.audio.ssReady.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.sfReady = CreateFrame("CheckButton", "TwintopResourceBar_CB3_MD_Sound", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.sfReady
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when Starfall is usable")
		f.tooltip = "Play an audio cue when Starfall is usable. This supercedes the regular Starsurge audio sound if both are usable."
---@diagnostic disable-next-line: undefined-field
		f:SetChecked(TRB.Data.settings.druid.balance.audio.sfReady.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.audio.sfReady.enabled = self:GetChecked()

			if TRB.Data.settings.druid.balance.audio.sfReady.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.druid.balance.audio.sfReady.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.sfReadyAudio = CreateFrame("FRAME", "TwintopResourceBar_sfReadyAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.sfReadyAudio:SetPoint("TOPLEFT", xCoord, yCoord-30+10)
		UIDropDownMenu_SetWidth(controls.dropDown.sfReadyAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.sfReadyAudio, TRB.Data.settings.druid.balance.audio.sfReady.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.sfReadyAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.sfReadyAudio, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local sounds = TRB.Details.addonData.libs.SharedMedia:HashTable("sound")
			local soundsList = TRB.Details.addonData.libs.SharedMedia:List("sound")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(sounds) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Sounds " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(soundsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = sounds[v]
						info.checked = sounds[v] == TRB.Data.settings.druid.balance.audio.sfReady.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.sfReadyAudio:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.audio.sfReady.sound = newValue
			TRB.Data.settings.druid.balance.audio.sfReady.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.sfReadyAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.druid.balance.audio.sfReady.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.onethsReady = CreateFrame("CheckButton", "TwintopResourceBar_CB3_oneths_Sound", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.onethsReady
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when Oneth's Clear Vision or Oneth's Perception proc occurs.")
		f.tooltip = "Play an audio cue when an Oneth's Clear Vision or Oneth's Perception proc occurs. This supercedes the regular Starsurge and Starfall audio sound if both are usable."
---@diagnostic disable-next-line: undefined-field
		f:SetChecked(TRB.Data.settings.druid.balance.audio.onethsReady.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.audio.onethsReady.enabled = self:GetChecked()

			if TRB.Data.settings.druid.balance.audio.onethsReady.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.druid.balance.audio.onethsReady.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.onethsReadyAudio = CreateFrame("FRAME", "TwintopResourceBar_onethsReadyAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.onethsReadyAudio:SetPoint("TOPLEFT", xCoord, yCoord-30+10)
		UIDropDownMenu_SetWidth(controls.dropDown.onethsReadyAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.onethsReadyAudio, TRB.Data.settings.druid.balance.audio.onethsReady.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.onethsReadyAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.onethsReadyAudio, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local sounds = TRB.Details.addonData.libs.SharedMedia:HashTable("sound")
			local soundsList = TRB.Details.addonData.libs.SharedMedia:List("sound")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(sounds) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Sounds " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(soundsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = sounds[v]
						info.checked = sounds[v] == TRB.Data.settings.druid.balance.audio.onethsReady.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.onethsReadyAudio:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.audio.onethsReady.sound = newValue
			TRB.Data.settings.druid.balance.audio.onethsReady.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.onethsReadyAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.druid.balance.audio.onethsReady.sound, TRB.Data.settings.core.audio.channel.channel)
		end



		yCoord = yCoord - 60
		controls.checkBoxes.overcapAudio = CreateFrame("CheckButton", "TwintopResourceBar_CB3_OC_Sound", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapAudio
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when you will overcap Astral Power")
		f.tooltip = "Play an audio cue when your hardcast spell will overcap Astral Power."
---@diagnostic disable-next-line: undefined-field
		f:SetChecked(TRB.Data.settings.druid.balance.audio.overcap.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.balance.audio.overcap.enabled = self:GetChecked()

			if TRB.Data.settings.druid.balance.audio.overcap.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.druid.balance.audio.overcap.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.overcapAudio = CreateFrame("FRAME", "TwintopResourceBar_overcapAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.overcapAudio:SetPoint("TOPLEFT", xCoord, yCoord-30+10)
		UIDropDownMenu_SetWidth(controls.dropDown.overcapAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.overcapAudio, TRB.Data.settings.druid.balance.audio.overcap.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.overcapAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.overcapAudio, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local sounds = TRB.Details.addonData.libs.SharedMedia:HashTable("sound")
			local soundsList = TRB.Details.addonData.libs.SharedMedia:List("sound")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(sounds) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Sounds " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(soundsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = sounds[v]
						info.checked = sounds[v] == TRB.Data.settings.druid.balance.audio.overcap.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.overcapAudio:SetValue(newValue, newName)
			TRB.Data.settings.druid.balance.audio.overcap.sound = newValue
			TRB.Data.settings.druid.balance.audio.overcap.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.overcapAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.druid.balance.audio.overcap.sound, TRB.Data.settings.core.audio.channel.channel)
		end

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.balance = controls
	end

	local function BalanceConstructBarTextDisplayPanel(parent, cache)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.balance
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1
		local namePrefix = "Druid_Balance"

		TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display Text Customization", 0, yCoord)
		controls.buttons.exportButton_Druid_Balance_BarText = TRB.UiFunctions:BuildButton(parent, "Export Bar Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Balance_BarText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Balance Druid (Bar Text).", 11, 1, false, false, false, true, false)
		end)

		yCoord = yCoord - 30
		TRB.UiFunctions:BuildLabel(parent, "Left Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.left = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Left", TRB.Data.settings.druid.balance.displayText.left.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.left
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.druid.balance.displayText.left.text = self:GetText()
			TRB.Data.barTextCache = {}
			TRB.Functions.IsTtdActive(TRB.Data.settings.druid.balance)
		end)


		yCoord = yCoord - 70
		TRB.UiFunctions:BuildLabel(parent, "Middle Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.middle = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Middle", TRB.Data.settings.druid.balance.displayText.middle.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.middle
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.druid.balance.displayText.middle.text = self:GetText()
			TRB.Data.barTextCache = {}
			TRB.Functions.IsTtdActive(TRB.Data.settings.druid.balance)
		end)


		yCoord = yCoord - 70
		TRB.UiFunctions:BuildLabel(parent, "Right Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.right = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Right", TRB.Data.settings.druid.balance.displayText.right.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.right
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.druid.balance.displayText.right.text = self:GetText()
			TRB.Data.barTextCache = {}
			TRB.Functions.IsTtdActive(TRB.Data.settings.druid.balance)
		end)

		yCoord = yCoord - 70
		local variablesPanel = TRB.UiFunctions:CreateVariablesSidePanel(parent, namePrefix)
		TRB.Options:CreateBarTextInstructions(parent, xCoord, yCoord)
		TRB.Options:CreateBarTextVariables(cache, variablesPanel, 5, -30)
	end

	local function BalanceConstructOptionsPanel(cache)
		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local parent = interfaceSettingsFrame.panel
		local controls = interfaceSettingsFrame.controls.balance or {}
		local yCoord = 0
		local f = nil
		local xPadding = 10
		local xPadding2 = 30
		local xMax = 550
		local xCoord = 0
		local xCoord2 = 325
		local xOffset1 = 50
		local xOffset2 = 275

		controls.colors = {}
		controls.labels = {}
		controls.textbox = {}
		controls.checkBoxes = {}
		controls.dropDown = {}
		controls.buttons = controls.buttons or {}

		interfaceSettingsFrame.balanceDisplayPanel = CreateFrame("Frame", "TwintopResourceBar_Options_Druid_Balance", UIParent)
		interfaceSettingsFrame.balanceDisplayPanel.name = "Balance Druid"
---@diagnostic disable-next-line: undefined-field
		interfaceSettingsFrame.balanceDisplayPanel.parent = parent.name
		InterfaceOptions_AddCategory(interfaceSettingsFrame.balanceDisplayPanel)

		parent = interfaceSettingsFrame.balanceDisplayPanel

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Balance Druid", xCoord+xPadding, yCoord-5)
	
		controls.checkBoxes.balanceDruidEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Balance_balanceDruidEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.balanceDruidEnabled
		f:SetPoint("TOPLEFT", 250, yCoord-10)		
		getglobal(f:GetName() .. 'Text'):SetText("Enabled")
		f.tooltip = "Is Twintop's Resource Bar enabled for the Balance Druid specialization? If unchecked, the bar will not function (including the population of global variables!)."
		f:SetChecked(TRB.Data.settings.core.enabled.druid.balance)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.core.enabled.druid.balance = self:GetChecked()
			TRB.Functions.EventRegistration()
			TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.balanceDruidEnabled, TRB.Data.settings.core.enabled.druid.balance, true)
		end)

		TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.balanceDruidEnabled, TRB.Data.settings.core.enabled.druid.balance, true)

		controls.buttons.importButton = TRB.UiFunctions:BuildButton(parent, "Import", 345, yCoord-10, 90, 20)
		controls.buttons.importButton:SetFrameLevel(10000)
		controls.buttons.importButton:SetScript("OnClick", function(self, ...)        
			StaticPopup_Show("TwintopResourceBar_Import")
		end)

		controls.buttons.exportButton_Druid_Balance_All = TRB.UiFunctions:BuildButton(parent, "Export Specialization", 440, yCoord-10, 150, 20)
		controls.buttons.exportButton_Druid_Balance_All:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Balance Druid (All).", 11, 1, true, true, true, true, false)
		end)

		yCoord = yCoord - 42

		local tabs = {}
		local tabsheets = {}

		tabs[1] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Balance_Tab2", "Bar Display", 1, parent, 85)
		tabs[1]:SetPoint("TOPLEFT", 15, yCoord)
		tabs[2] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Balance_Tab3", "Font & Text", 2, parent, 85, tabs[1])
		tabs[3] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Balance_Tab4", "Audio & Tracking", 3, parent, 120, tabs[2])
		tabs[4] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Balance_Tab5", "Bar Text", 4, parent, 60, tabs[3])
		tabs[5] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Balance_Tab1", "Reset Defaults", 5, parent, 100, tabs[4])

		PanelTemplates_TabResize(tabs[1], 0)
		PanelTemplates_TabResize(tabs[2], 0)
		PanelTemplates_TabResize(tabs[3], 0)
		PanelTemplates_TabResize(tabs[4], 0)
		PanelTemplates_TabResize(tabs[5], 0)
		yCoord = yCoord - 15

		for i = 1, 5 do 
			tabsheets[i] = TRB.UiFunctions:CreateTabFrameContainer("TwintopResourceBar_Druid_Balance_LayoutPanel" .. i, parent)
			tabsheets[i]:Hide()
			tabsheets[i]:SetPoint("TOPLEFT", 10, yCoord)
		end

		tabsheets[1]:Show()
		tabsheets[1].selected = true
		tabs[1]:SetNormalFontObject(TRB.Options.fonts.options.tabHighlightSmall)
		parent.tabs = tabs
		parent.tabsheets = tabsheets
		parent.lastTab = tabsheets[1]
		parent.lastTabId = 1

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.balance = controls

		BalanceConstructBarColorsAndBehaviorPanel(tabsheets[1].scrollFrame.scrollChild)
		BalanceConstructFontAndTextPanel(tabsheets[2].scrollFrame.scrollChild)
		BalanceConstructAudioAndTrackingPanel(tabsheets[3].scrollFrame.scrollChild)
		BalanceConstructBarTextDisplayPanel(tabsheets[4].scrollFrame.scrollChild, cache)
		BalanceConstructResetDefaultsPanel(tabsheets[5].scrollFrame.scrollChild)
	end


	--[[

	Feral Option Menus

	]]

	local function FeralConstructResetDefaultsPanel(parent)
		if parent == nil then
			return
		end

		local controls = TRB.Frames.interfaceSettingsFrameContainer.controls.feral
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		StaticPopupDialogs["TwintopResourceBar_Druid_Feral_Reset"] = {
			text = "Do you want to reset the Twintop's Resource Bar back to its default configuration? Only the Feral Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.feral = FeralResetSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Druid_Feral_ResetBarTextSimple"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (simple) configuration? Only the Feral Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.feral.displayText = FeralLoadDefaultBarTextSimpleSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Druid_Feral_ResetBarTextAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (advanced) configuration? Only the Feral Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.feral.displayText = FeralLoadDefaultBarTextAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		--[[StaticPopupDialogs["TwintopResourceBar_Druid_Feral_ResetBarTextNarrowAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (narrow advanced) configuration? Only the Feral Druid settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.druid.feral.displayText = FeralLoadDefaultBarTextNarrowAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}]]

		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar to Defaults", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton = TRB.UiFunctions:BuildButton(parent, "Reset to Defaults", xCoord, yCoord, 150, 30)
		controls.resetButton:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Feral_Reset")
		end)

		yCoord = yCoord - 40
		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar Text", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton1 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Simple)", xCoord, yCoord, 250, 30)
		controls.resetButton1:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Feral_ResetBarTextSimple")
        end)
		yCoord = yCoord - 40

		--[[
		controls.resetButton2 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Narrow Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton2:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Feral_ResetBarTextNarrowAdvanced")
		end)
		]]

		controls.resetButton3 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Full Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton3:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Druid_Feral_ResetBarTextAdvanced")
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.feral = controls
	end

	local function FeralConstructBarColorsAndBehaviorPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.feral
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		local maxBorderHeight = math.min(math.floor(TRB.Data.settings.druid.feral.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.bar.width / TRB.Data.constants.borderWidthFactor))

		local sanityCheckValues = TRB.Functions.GetSanityCheckValues(TRB.Data.settings.druid.feral)

		controls.buttons.exportButton_Druid_Feral_BarDisplay = TRB.UiFunctions:BuildButton(parent, "Export Bar Display", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Feral_BarDisplay:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Feral Druid (Bar Display).", 11, 2, true, false, false, false, false)
		end)

		controls.barPositionSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Position and Size", 0, yCoord)

		yCoord = yCoord - 40
		title = "Bar Width"
		controls.width = TRB.UiFunctions:BuildSlider(parent, title, sanityCheckValues.barMinWidth, sanityCheckValues.barMaxWidth, TRB.Data.settings.druid.feral.bar.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.width:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.bar.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.feral.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.feral.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 2 then
				TRB.Functions.UpdateBarWidth(TRB.Data.settings.druid.feral)
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)

				for k, v in pairs(TRB.Data.spells) do
					if TRB.Data.spells[k] ~= nil and TRB.Data.spells[k]["id"] ~= nil and TRB.Data.spells[k]["energy"] ~= nil and TRB.Data.spells[k]["energy"] < 0 and TRB.Data.spells[k]["thresholdId"] ~= nil then
						TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.feral, resourceFrame.thresholds[TRB.Data.spells[k]["thresholdId"]], resourceFrame, TRB.Data.settings.druid.feral.thresholdWidth, -TRB.Data.spells[k]["energy"], TRB.Data.character.maxResource)                
						TRB.Frames.resourceFrame.thresholds[TRB.Data.spells[k]["thresholdId"]]:Show()
					end
				end
			end
		end)

		title = "Bar Height"
		controls.height = TRB.UiFunctions:BuildSlider(parent, title, sanityCheckValues.barMinHeight, sanityCheckValues.barMaxHeight, TRB.Data.settings.druid.feral.bar.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.height:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.bar.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.feral.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.feral.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 2 then
				TRB.Functions.UpdateBarHeight(TRB.Data.settings.druid.feral)
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Bar Horizontal Position"
		yCoord = yCoord - 60
		controls.horizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.druid.feral.bar.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.horizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.bar.xPos = value

			if GetSpecialization() == 2 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.druid.feral.bar.xPos, TRB.Data.settings.druid.feral.bar.yPos)
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Bar Vertical Position"
		controls.vertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.druid.feral.bar.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.vertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.bar.yPos = value

			if GetSpecialization() == 2 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.druid.feral.bar.xPos, TRB.Data.settings.druid.feral.bar.yPos)
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Bar Border Width"
		yCoord = yCoord - 60
		controls.borderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxBorderHeight, TRB.Data.settings.druid.feral.bar.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.borderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.bar.border = value

			if GetSpecialization() == 2 then
				barContainerFrame:SetWidth(TRB.Data.settings.druid.feral.bar.width-(TRB.Data.settings.druid.feral.bar.border*2))
				barContainerFrame:SetHeight(TRB.Data.settings.druid.feral.bar.height-(TRB.Data.settings.druid.feral.bar.border*2))
				barBorderFrame:SetWidth(TRB.Data.settings.druid.feral.bar.width)
				barBorderFrame:SetHeight(TRB.Data.settings.druid.feral.bar.height)
				if TRB.Data.settings.druid.feral.bar.border < 1 then
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.druid.feral.textures.border,
						tile = true,
						tileSize = 4,
						edgeSize = 1,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Hide()
				else
					barBorderFrame:SetBackdrop({ 
						edgeFile = TRB.Data.settings.druid.feral.textures.border,
						tile = true,
						tileSize=4,
						edgeSize=TRB.Data.settings.druid.feral.bar.border,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Show()
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.border, true))

				TRB.Functions.SetBarMinMaxValues(TRB.Data.settings.druid.feral)                
				TRB.Functions.UpdateBarHeight(TRB.Data.settings.druid.feral)
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)

				for k, v in pairs(TRB.Data.spells) do
					if TRB.Data.spells[k] ~= nil and TRB.Data.spells[k]["id"] ~= nil and TRB.Data.spells[k]["energy"] ~= nil and TRB.Data.spells[k]["energy"] < 0 and TRB.Data.spells[k]["thresholdId"] ~= nil then
						TRB.Functions.RepositionThreshold(TRB.Data.settings.druid.feral, resourceFrame.thresholds[TRB.Data.spells[k]["thresholdId"]], resourceFrame, TRB.Data.settings.druid.feral.thresholdWidth, -TRB.Data.spells[k]["energy"], TRB.Data.character.maxResource)                
						TRB.Frames.resourceFrame.thresholds[TRB.Data.spells[k]["thresholdId"]]:Show()
					end
				end
			end

			local minsliderWidth = math.max(TRB.Data.settings.druid.feral.bar.border*2, 120)
			local minsliderHeight = math.max(TRB.Data.settings.druid.feral.bar.border*2, 1)

			local scValues = TRB.Functions.GetSanityCheckValues(TRB.Data.settings.druid.feral)
			controls.height:SetMinMaxValues(minsliderHeight, scValues.barMaxHeight)
			controls.height.MinLabel:SetText(minsliderHeight)
			controls.width:SetMinMaxValues(minsliderWidth, scValues.barMaxWidth)
			controls.width.MinLabel:SetText(minsliderWidth)
		end)

		title = "Threshold Line Width"
		controls.thresholdWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.druid.feral.thresholds.width, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.thresholds.width = value

			if GetSpecialization() == 2 then
				for x = 1, TRB.Functions.TableLength(resourceFrame.thresholds) do
					resourceFrame.thresholds[x]:SetWidth(TRB.Data.settings.druid.feral.thresholds.width)
				end
			end
		end)

		yCoord = yCoord - 40

		--NOTE: the order of these checkboxes is reversed!

		controls.checkBoxes.lockPosition = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_dragAndDrop", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.lockPosition
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Drag & Drop Movement Enabled")
		f.tooltip = "Disable Drag & Drop functionality of the bar to keep it from accidentally being moved.\n\nWhen 'Pin to Personal Resource Display' is checked, this value is ignored and cannot be changed."
		f:SetChecked(TRB.Data.settings.druid.feral.bar.dragAndDrop)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.bar.dragAndDrop = self:GetChecked()
			barContainerFrame:SetMovable((not TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.feral.bar.dragAndDrop)
			barContainerFrame:EnableMouse((not TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.feral.bar.dragAndDrop)
		end)
			
		TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay)

		controls.checkBoxes.pinToPRD = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_pinToPRD", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.pinToPRD
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Pin to Personal Resource Display")
		f.tooltip = "Pins the bar to the Blizzard Personal Resource Display. Adjust the Horizontal and Vertical positions above to offset it from PRD. When enabled, Drag & Drop positioning is not allowed. If PRD is not enabled, will behave as if you didn't have this enabled.\n\nNOTE: This will also be the position (relative to the center of the screen, NOT the PRD) that it shows when out of combat/the PRD is not displayed! It is recommended you set 'Bar Display' to 'Only show bar in combat' if you plan to pin it to your PRD."
		f:SetChecked(TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay = self:GetChecked()
			
			TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay)

			barContainerFrame:SetMovable((not TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.feral.bar.dragAndDrop)
			barContainerFrame:EnableMouse((not TRB.Data.settings.druid.feral.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.druid.feral.bar.dragAndDrop)
			TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
		end)


		yCoord = yCoord - 30
		controls.comboPointPositionSection = TRB.UiFunctions:BuildSectionHeader(parent, "Combo Points Position and Size", 0, yCoord)

		yCoord = yCoord - 40
		title = "Combo Point Width"
		controls.comboPointWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, TRB.Functions.RoundTo(sanityCheckValues.barMaxWidth / 6, 0, "floor"), TRB.Data.settings.druid.feral.comboPoints.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.comboPointWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.comboPoints.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.feral.comboPoints.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.comboPoints.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.feral.comboPoints.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.comboPointBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.comboPointBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.comboPointBorderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Combo Point Height"
		controls.comboPointHeight = TRB.UiFunctions:BuildSlider(parent, title, 1, sanityCheckValues.barMaxHeight, TRB.Data.settings.druid.feral.comboPoints.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.comboPointHeight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.comboPoints.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.feral.comboPoints.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.feral.comboPoints.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.comboPointBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.comboPointBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.comboPointBorderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)



		title = "Combo Points Horizontal Position (Relative)"
		yCoord = yCoord - 60
		controls.comboPointHorizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.druid.feral.comboPoints.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.comboPointHorizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.comboPoints.xPos = value

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Combo Points Vertical Position (Relative)"
		controls.comboPointVertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.druid.feral.comboPoints.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.comboPointVertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.comboPoints.yPos = value

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)



		title = "Combo Point Border Width"
		yCoord = yCoord - 60
		controls.comboPointBorderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxBorderHeight, TRB.Data.settings.druid.feral.comboPoints.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.comboPointBorderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.comboPoints.border = value

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)

				--TRB.Functions.SetBarMinMaxValues(TRB.Data.settings.druid.feral)
			end

			local minsliderWidth = math.max(TRB.Data.settings.druid.feral.comboPoints.border*2, 1)
			local minsliderHeight = math.max(TRB.Data.settings.druid.feral.comboPoints.border*2, 1)

			local scValues = TRB.Functions.GetSanityCheckValues(TRB.Data.settings.druid.feral)
			controls.comboPointHeight:SetMinMaxValues(minsliderHeight, scValues.comboPointsMaxHeight)
			controls.comboPointHeight.MinLabel:SetText(minsliderHeight)
			controls.comboPointWidth:SetMinMaxValues(minsliderWidth, scValues.comboPointsMaxWidth)
			controls.comboPointWidth.MinLabel:SetText(minsliderWidth)
		end)

		title = "Combo Points Spacing"
		controls.comboPointSpacing = TRB.UiFunctions:BuildSlider(parent, title, 0, TRB.Functions.RoundTo(sanityCheckValues.barMaxWidth / 6, 0, "floor"), TRB.Data.settings.druid.feral.comboPoints.spacing, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.comboPointSpacing:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.comboPoints.spacing = value

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		yCoord = yCoord - 40        
        -- Create the dropdown, and configure its appearance
        controls.dropDown.comboPointsRelativeTo = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_comboPointsRelativeTo", parent, "UIDropDownMenuTemplate")
        controls.dropDown.comboPointsRelativeTo.label = TRB.UiFunctions:BuildSectionHeader(parent, "Relative Position of Combo Points to Energy Bar", xCoord, yCoord)
        controls.dropDown.comboPointsRelativeTo.label.font:SetFontObject(GameFontNormal)
        controls.dropDown.comboPointsRelativeTo:SetPoint("TOPLEFT", xCoord, yCoord-30)
        UIDropDownMenu_SetWidth(controls.dropDown.comboPointsRelativeTo, dropdownWidth)
        UIDropDownMenu_SetText(controls.dropDown.comboPointsRelativeTo, TRB.Data.settings.druid.feral.comboPoints.relativeToName)
        UIDropDownMenu_JustifyText(controls.dropDown.comboPointsRelativeTo, "LEFT")

        -- Create and bind the initialization function to the dropdown menu
        UIDropDownMenu_Initialize(controls.dropDown.comboPointsRelativeTo, function(self, level, menuList)
            local entries = 25
            local info = UIDropDownMenu_CreateInfo()
            local relativeTo = {}
            relativeTo["Above - Left"] = "TOPLEFT"
            relativeTo["Above - Middle"] = "TOP"
            relativeTo["Above - Right"] = "TOPRIGHT"
            relativeTo["Below - Left"] = "BOTTOMLEFT"
            relativeTo["Below - Middle"] = "BOTTOM"
            relativeTo["Below - Right"] = "BOTTOMRIGHT"
            local relativeToList = {
                "Above - Left",
                "Above - Middle",
                "Above - Right",
                "Below - Left",
                "Below - Middle",
                "Below - Right"
            }

            for k, v in pairs(relativeToList) do
                info.text = v
                info.value = relativeTo[v]
                info.checked = relativeTo[v] == TRB.Data.settings.druid.feral.comboPoints.relativeTo
                info.func = self.SetValue
                info.arg1 = relativeTo[v]
                info.arg2 = v
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        function controls.dropDown.comboPointsRelativeTo:SetValue(newValue, newName)
            TRB.Data.settings.druid.feral.comboPoints.relativeTo = newValue
            TRB.Data.settings.druid.feral.comboPoints.relativeToName = newName
            UIDropDownMenu_SetText(controls.dropDown.comboPointsRelativeTo, newName)
            CloseDropDownMenus()

            if GetSpecialization() == 2 then
                TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
            end
        end


        controls.checkBoxes.comboPointsFullWidth = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_comboPointsFullWidth", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.comboPointsFullWidth
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Combo Points are full bar width?")
		f.tooltip = "Makes the Combo Point bars take up the same total width of the bar, spaced according to Combo Point Spacing (above). The horizontal position adjustment will be ignored and the width of Combo Point bars will be automatically calculated and will ignore the value set above."
		f:SetChecked(TRB.Data.settings.druid.feral.comboPoints.fullWidth)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.comboPoints.fullWidth = self:GetChecked()
            
			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

        yCoord = yCoord - 60
		controls.textBarTexturesSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar and Combo Point Textures", 0, yCoord)
		yCoord = yCoord - 30

		-- Create the dropdown, and configure its appearance
		controls.dropDown.resourceBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_EnergyBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.resourceBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Main Bar Texture", xCoord, yCoord)
		controls.dropDown.resourceBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.resourceBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.resourceBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.druid.feral.textures.resourceBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.resourceBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.resourceBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.resourceBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.resourceBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.resourceBar = newValue
			TRB.Data.settings.druid.feral.textures.resourceBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.castingBar = newValue
				TRB.Data.settings.druid.feral.textures.castingBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.passiveBar = newValue
				TRB.Data.settings.druid.feral.textures.passiveBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.comboPointsBar = newValue
				TRB.Data.settings.druid.feral.textures.comboPointsBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBarTexture, newName)
			end

			if GetSpecialization() == 2 then
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.resourceBar)
				if TRB.Data.settings.druid.feral.textures.textureLock then
					castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.castingBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.passiveBar)
					
					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						TRB.Frames.resource2Frames[x].resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.comboPointsBar)
					end
				end
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.castingBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_CastBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.castingBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Casting Bar Texture", xCoord2, yCoord)
		controls.dropDown.castingBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.castingBarTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.castingBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.druid.feral.textures.castingBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.castingBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.castingBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.castingBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.castingBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.castingBar = newValue
			TRB.Data.settings.druid.feral.textures.castingBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.resourceBar = newValue
				TRB.Data.settings.druid.feral.textures.resourceBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.passiveBar = newValue
				TRB.Data.settings.druid.feral.textures.passiveBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.comboPointsBar = newValue
				TRB.Data.settings.druid.feral.textures.comboPointsBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBarTexture, newName)
			end

			if GetSpecialization() == 2 then
				castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.castingBar)
				if TRB.Data.settings.druid.feral.textures.textureLock then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.resourceBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.passiveBar)
					
					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						TRB.Frames.resource2Frames[x].resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.comboPointsBar)
					end
				end
			end

			CloseDropDownMenus()
		end


		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.passiveBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_PassiveBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.passiveBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Passive Bar Texture", xCoord, yCoord)
		controls.dropDown.passiveBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.passiveBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.passiveBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, TRB.Data.settings.druid.feral.textures.passiveBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.passiveBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.passiveBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.passiveBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.passiveBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.passiveBar = newValue
			TRB.Data.settings.druid.feral.textures.passiveBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.resourceBar = newValue
				TRB.Data.settings.druid.feral.textures.resourceBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.castingBar = newValue
				TRB.Data.settings.druid.feral.textures.castingBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.comboPointsBar = newValue
				TRB.Data.settings.druid.feral.textures.comboPointsBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBarTexture, newName)
			end

			if GetSpecialization() == 2 then
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.passiveBar)
				if TRB.Data.settings.druid.feral.textures.textureLock then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.resourceBar)
					castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.castingBar)
					
					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						TRB.Frames.resource2Frames[x].resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.comboPointsBar)
					end
				end
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.comboPointsBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_ComboPointsBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.comboPointsBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Combo Points Texture", xCoord2, yCoord)
		controls.dropDown.comboPointsBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.comboPointsBarTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.comboPointsBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.comboPointsBarTexture, TRB.Data.settings.druid.feral.textures.comboPointsBarName)
		UIDropDownMenu_JustifyText(controls.dropDown.comboPointsBarTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.comboPointsBarTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("statusbar")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("statusbar")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Status Bar Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.comboPointsBar
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.comboPointsBarTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.comboPointsBar = newValue
			TRB.Data.settings.druid.feral.textures.comboPointsBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.comboPointsBarTexture, newName)
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.resourceBar = newValue
				TRB.Data.settings.druid.feral.textures.resourceBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.passiveBar = newValue
				TRB.Data.settings.druid.feral.textures.passiveBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
				TRB.Data.settings.druid.feral.textures.castingBar = newValue
				TRB.Data.settings.druid.feral.textures.castingBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			end

			if GetSpecialization() == 2 then					
				local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
				for x = 1, length do
					TRB.Frames.resource2Frames[x].resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.comboPointsBar)
				end

				if TRB.Data.settings.druid.feral.textures.textureLock then
				    castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.castingBar)
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.resourceBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.passiveBar)
				end
			end

			CloseDropDownMenus()
		end


		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.borderTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_BorderTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.borderTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Border Texture", xCoord, yCoord)
		controls.dropDown.borderTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.borderTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.borderTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.borderTexture, TRB.Data.settings.druid.feral.textures.borderName)
		UIDropDownMenu_JustifyText(controls.dropDown.borderTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.borderTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("border")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("border")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Border Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.border
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.borderTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.border = newValue
			TRB.Data.settings.druid.feral.textures.borderName = newName

			if GetSpecialization() == 2 then
				if TRB.Data.settings.druid.feral.bar.border < 1 then
					barBorderFrame:SetBackdrop({ })
				else
					barBorderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.druid.feral.textures.border,
												tile = true,
												tileSize=4,
												edgeSize=TRB.Data.settings.druid.feral.bar.border,
												insets = {0, 0, 0, 0}
												})
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.border, true))
			end

			UIDropDownMenu_SetText(controls.dropDown.borderTexture, newName)

			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.comboPointsBorder = newValue
				TRB.Data.settings.druid.feral.textures.comboPointsBorderName = newName
	
				if GetSpecialization() == 2 then
					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						if TRB.Data.settings.druid.feral.comboPoints.border < 1 then
							TRB.Frames.resource2Frames[x].borderFrame:SetBackdrop({ })
						else
							TRB.Frames.resource2Frames[x].borderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.druid.feral.textures.comboPointsBorder,
														tile = true,
														tileSize=4,
														edgeSize=TRB.Data.settings.druid.feral.comboPoints.border,
														insets = {0, 0, 0, 0}
														})
						end
						TRB.Frames.resource2Frames[x].borderFrame:SetBackdropColor(0, 0, 0, 0)
						TRB.Frames.resource2Frames[x].borderFrame:SetBackdropBorderColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.border, true))
					end
				end
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBorderTexture, newName)
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.backgroundTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_BackgroundTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.backgroundTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Background (Empty Bar) Texture", xCoord2, yCoord)
		controls.dropDown.backgroundTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.backgroundTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.backgroundTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, TRB.Data.settings.druid.feral.textures.backgroundName)
		UIDropDownMenu_JustifyText(controls.dropDown.backgroundTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.backgroundTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("background")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("background")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Background Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.background
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.backgroundTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.background = newValue
			TRB.Data.settings.druid.feral.textures.backgroundName = newName

			if GetSpecialization() == 2 then
				barContainerFrame:SetBackdrop({ 
					bgFile = TRB.Data.settings.druid.feral.textures.background,
					tile = true,
					tileSize = TRB.Data.settings.druid.feral.bar.width,
					edgeSize = 1,
					insets = {0, 0, 0, 0}
				})
				barContainerFrame:SetBackdropColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.background, true))
			end

			UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, newName)
			
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.comboPointsBackground = newValue
				TRB.Data.settings.druid.feral.textures.comboPointsBackgroundName = newName
	
				if GetSpecialization() == 2 then
					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						TRB.Frames.resource2Frames[x].containerFrame:SetBackdrop({ 
							bgFile = TRB.Data.settings.druid.feral.textures.comboPointsBackground,
							tile = true,
							tileSize = TRB.Data.settings.druid.feral.comboPoints.width,
							edgeSize = 1,
							insets = {0, 0, 0, 0}
						})
						TRB.Frames.resource2Frames[x].containerFrame:SetBackdropColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.background, true))
					end
				end

				UIDropDownMenu_SetText(controls.dropDown.comboPointsBackgroundTexture, newName)
			end

			CloseDropDownMenus()
		end


		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.comboPointsBorderTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_CB1_ComboPointsBorderTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.comboPointsBorderTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Combo Point Border Texture", xCoord, yCoord)
		controls.dropDown.comboPointsBorderTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.comboPointsBorderTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.comboPointsBorderTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.comboPointsBorderTexture, TRB.Data.settings.druid.feral.textures.comboPointsBorderName)
		UIDropDownMenu_JustifyText(controls.dropDown.comboPointsBorderTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.comboPointsBorderTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("border")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("border")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Border Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.comboPointsBorder
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.comboPointsBorderTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.comboPointsBorder = newValue
			TRB.Data.settings.druid.feral.textures.comboPointsBorderName = newName

			if GetSpecialization() == 2 then
				local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
				for x = 1, length do
					if TRB.Data.settings.druid.feral.comboPoints.border < 1 then
						TRB.Frames.resource2Frames[x].borderFrame:SetBackdrop({ })
					else
						TRB.Frames.resource2Frames[x].borderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.druid.feral.textures.comboPointsBorder,
													tile = true,
													tileSize=4,
													edgeSize=TRB.Data.settings.druid.feral.comboPoints.border,
													insets = {0, 0, 0, 0}
													})
					end
					TRB.Frames.resource2Frames[x].borderFrame:SetBackdropColor(0, 0, 0, 0)
					TRB.Frames.resource2Frames[x].borderFrame:SetBackdropBorderColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.border, true))
				end
			end

			UIDropDownMenu_SetText(controls.dropDown.comboPointsBorderTexture, newName)

			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.border = newValue
				TRB.Data.settings.druid.feral.textures.borderName = newName

				if TRB.Data.settings.druid.feral.bar.border < 1 then
					barBorderFrame:SetBackdrop({ })
				else
					barBorderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.druid.feral.textures.border,
												tile = true,
												tileSize=4,
												edgeSize=TRB.Data.settings.druid.feral.bar.border,
												insets = {0, 0, 0, 0}
												})
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.border, true))
				UIDropDownMenu_SetText(controls.dropDown.borderTexture, newName)
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.comboPointsBackgroundTexture = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_ComboPointsBackgroundTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.comboPointsBackgroundTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Background (Empty Combo Point) Texture", xCoord2, yCoord)
		controls.dropDown.comboPointsBackgroundTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.comboPointsBackgroundTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.comboPointsBackgroundTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.comboPointsBackgroundTexture, TRB.Data.settings.druid.feral.textures.comboPointsBackgroundName)
		UIDropDownMenu_JustifyText(controls.dropDown.comboPointsBackgroundTexture, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.comboPointsBackgroundTexture, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local textures = TRB.Details.addonData.libs.SharedMedia:HashTable("background")
			local texturesList = TRB.Details.addonData.libs.SharedMedia:List("background")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(textures) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Background Textures " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(texturesList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = textures[v]
						info.checked = textures[v] == TRB.Data.settings.druid.feral.textures.comboPointsBackground
						info.func = self.SetValue
						info.arg1 = textures[v]
						info.arg2 = v
						info.icon = textures[v]
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the texture
		function controls.dropDown.comboPointsBackgroundTexture:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.textures.comboPointsBackground = newValue
			TRB.Data.settings.druid.feral.textures.comboPointsBackgroundName = newName

			if GetSpecialization() == 2 then
				local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
				for x = 1, length do
					TRB.Frames.resource2Frames[x].containerFrame:SetBackdrop({ 
						bgFile = TRB.Data.settings.druid.feral.textures.comboPointsBackground,
						tile = true,
						tileSize = TRB.Data.settings.druid.feral.comboPoints.width,
						edgeSize = 1,
						insets = {0, 0, 0, 0}
					})
					TRB.Frames.resource2Frames[x].containerFrame:SetBackdropColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.background, true))
				end
			end

			UIDropDownMenu_SetText(controls.dropDown.comboPointsBackgroundTexture, newName)
			
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.background = newValue
				TRB.Data.settings.druid.feral.textures.backgroundName = newName

				if GetSpecialization() == 2 then
					barContainerFrame:SetBackdrop({ 
						bgFile = TRB.Data.settings.druid.feral.textures.background,
						tile = true,
						tileSize = TRB.Data.settings.druid.feral.bar.width,
						edgeSize = 1,
						insets = {0, 0, 0, 0}
					})
					barContainerFrame:SetBackdropColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.background, true))
				end

				UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, newName)
			end

			CloseDropDownMenus()
		end

		

		yCoord = yCoord - 60
		controls.checkBoxes.textureLock = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB1_TEXTURE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.textureLock
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same texture for all bars, borders, and backgrounds (respectively)")
		f.tooltip = "This will lock the texture for each type of texture to be the same for all parts of the bar. E.g.: All bar textures will be the same, all border textures will be the same, and all background textures will be the same."
		f:SetChecked(TRB.Data.settings.druid.feral.textures.textureLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.textures.textureLock = self:GetChecked()
			if TRB.Data.settings.druid.feral.textures.textureLock then
				TRB.Data.settings.druid.feral.textures.passiveBar = TRB.Data.settings.druid.feral.textures.resourceBar
				TRB.Data.settings.druid.feral.textures.passiveBarName = TRB.Data.settings.druid.feral.textures.resourceBarName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, TRB.Data.settings.druid.feral.textures.passiveBarName)
				TRB.Data.settings.druid.feral.textures.castingBar = TRB.Data.settings.druid.feral.textures.resourceBar
				TRB.Data.settings.druid.feral.textures.castingBarName = TRB.Data.settings.druid.feral.textures.resourceBarName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.druid.feral.textures.castingBarName)
				TRB.Data.settings.druid.feral.textures.comboPointsBar = TRB.Data.settings.druid.feral.textures.resourceBar
				TRB.Data.settings.druid.feral.textures.comboPointsBarName = TRB.Data.settings.druid.feral.textures.resourceBarName
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBarTexture, TRB.Data.settings.druid.feral.textures.resourceBarName)
				TRB.Data.settings.druid.feral.textures.comboPointsBorder = TRB.Data.settings.druid.feral.textures.border
				TRB.Data.settings.druid.feral.textures.comboPointsBorderName = TRB.Data.settings.druid.feral.textures.borderName
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBorderTexture, TRB.Data.settings.druid.feral.textures.comboPointsBorderName)
				TRB.Data.settings.druid.feral.textures.comboPointsBackground = TRB.Data.settings.druid.feral.textures.background
				TRB.Data.settings.druid.feral.textures.comboPointsBackgroundName = TRB.Data.settings.druid.feral.textures.backgroundName
				UIDropDownMenu_SetText(controls.dropDown.comboPointsBackgroundTexture, TRB.Data.settings.druid.feral.textures.comboPointsBackgroundName)

				if GetSpecialization() == 2 then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.resourceBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.passiveBar)
					castingFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.castingBar)

					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						TRB.Frames.resource2Frames[x].resourceFrame:SetStatusBarTexture(TRB.Data.settings.druid.feral.textures.comboPointsBar)
						
						TRB.Frames.resource2Frames[x].containerFrame:SetBackdrop({ 
							bgFile = TRB.Data.settings.druid.feral.textures.comboPointsBackground,
							tile = true,
							tileSize = TRB.Data.settings.druid.feral.comboPoints.width,
							edgeSize = 1,
							insets = {0, 0, 0, 0}
						})
						TRB.Frames.resource2Frames[x].containerFrame:SetBackdropColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.background, true))
						
						if TRB.Data.settings.druid.feral.comboPoints.border < 1 then
							TRB.Frames.resource2Frames[x].borderFrame:SetBackdrop({ })
						else
							TRB.Frames.resource2Frames[x].borderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.druid.feral.textures.comboPointsBorder,
														tile = true,
														tileSize=4,
														edgeSize=TRB.Data.settings.druid.feral.comboPoints.border,
														insets = {0, 0, 0, 0}
														})
						end
					end
				end
			end
		end)

		yCoord = yCoord - 30
		controls.barDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display", 0, yCoord)

		yCoord = yCoord - 40

        --[[
		title = "Beastial Wrath Flash Alpha"
		controls.flashAlpha = TRB.UiFunctions:BuildSlider(parent, title, 0, 1, TRB.Data.settings.druid.feral.colors.bar.flashAlpha, 0.01, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.flashAlpha:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.colors.bar.flashAlpha = value
		end)

		title = "Beastial Wrath Flash Period (sec)"
		controls.flashPeriod = TRB.UiFunctions:BuildSlider(parent, title, 0.05, 2, TRB.Data.settings.druid.feral.colors.bar.flashPeriod, 0.05, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.flashPeriod:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.colors.bar.flashPeriod = value
		end)

		yCoord = yCoord - 40]]

		controls.checkBoxes.alwaysShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_RB1_2", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.alwaysShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Always show Resource Bar")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar always visible on your UI, even when out of combat."
		f:SetChecked(TRB.Data.settings.druid.feral.displayBar.alwaysShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(true)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.druid.feral.displayBar.alwaysShow = true
			TRB.Data.settings.druid.feral.displayBar.notZeroShow = false
			TRB.Data.settings.druid.feral.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.notZeroShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_RB1_3", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.notZeroShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-15)
		getglobal(f:GetName() .. 'Text'):SetText("Show Resource Bar when Energy is not capped")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar show out of combat only if Energy is not capped, hidden otherwise when out of combat."
		f:SetChecked(TRB.Data.settings.druid.feral.displayBar.notZeroShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(true)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.druid.feral.displayBar.alwaysShow = false
			TRB.Data.settings.druid.feral.displayBar.notZeroShow = true
			TRB.Data.settings.druid.feral.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.combatShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_RB1_4", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.combatShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Only show Resource Bar in combat")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar only be visible on your UI when in combat."
		f:SetChecked((not TRB.Data.settings.druid.feral.displayBar.alwaysShow) and (not TRB.Data.settings.druid.feral.displayBar.notZeroShow))
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(true)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.druid.feral.displayBar.alwaysShow = false
			TRB.Data.settings.druid.feral.displayBar.notZeroShow = false
			TRB.Data.settings.druid.feral.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.neverShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_RB1_5", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.neverShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-45)
		getglobal(f:GetName() .. 'Text'):SetText("Never show Resource Bar (run in background)")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar never display but still run in the background to update the global variable."
		f:SetChecked(TRB.Data.settings.druid.feral.displayBar.neverShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(true)
			TRB.Data.settings.druid.feral.displayBar.alwaysShow = false
			TRB.Data.settings.druid.feral.displayBar.notZeroShow = false
			TRB.Data.settings.druid.feral.displayBar.neverShow = true
			TRB.Functions.HideResourceBar()
		end)

		--[[
		controls.checkBoxes.showCastingBar = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_showCastingBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showCastingBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show casting bar")
		f.tooltip = "This will show the casting bar when hardcasting a spell. Uncheck to hide this bar."
		f:SetChecked(TRB.Data.settings.druid.feral.bar.showCasting)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.bar.showCasting = self:GetChecked()
		end)]]

		controls.checkBoxes.showPassiveBar = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_showPassiveBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showPassiveBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show passive bar")
		f.tooltip = "This will show the passive bar. Uncheck to hide this bar. This setting supercedes any other passive tracking options!"
		f:SetChecked(TRB.Data.settings.druid.feral.bar.showPassive)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.bar.showPassive = self:GetChecked()
		end)

        --[[
		controls.checkBoxes.flashEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB1_5", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-40)
		getglobal(f:GetName() .. 'Text'):SetText("Flash Bar when Beastial Wrath is usable")
		f.tooltip = "This will flash the bar when Beastial Wrath can be cast."
		f:SetChecked(TRB.Data.settings.druid.feral.colors.bar.flashEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.colors.bar.flashEnabled = self:GetChecked()
		end)

		controls.checkBoxes.esThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB1_6", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.esThresholdShow
		f:SetPoint("TOPLEFT", xCoord2, yCoord-60)
		getglobal(f:GetName() .. 'Text'):SetText("Border color when Beastial Wrath is usable")
		f.tooltip = "This will change the bar's border color (as configured below) when Beastial Wrath is usable."
		f:SetChecked(TRB.Data.settings.druid.feral.colors.bar.beastialWrathEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.colors.bar.beastialWrathEnabled = self:GetChecked()
		end)
        ]]

		yCoord = yCoord - 60

		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.base = TRB.UiFunctions:BuildColorPicker(parent, "Energy", TRB.Data.settings.druid.feral.colors.bar.base, 300, 25, xCoord, yCoord)
		f = controls.colors.base
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
                local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.base, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    controls.colors.base.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.bar.base = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.border = TRB.UiFunctions:BuildColorPicker(parent, "Resource Bar's border", TRB.Data.settings.druid.feral.colors.bar.border, 225, 25, xCoord2, yCoord)
		f = controls.colors.border
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.border, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.border.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.bar.border = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                    barBorderFrame:SetBackdropBorderColor(r, g, b, 1-a)
                end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.clearcasting = TRB.UiFunctions:BuildColorPicker(parent, "Energy when Clearcasting proc is up", TRB.Data.settings.druid.feral.colors.bar.clearcasting, 275, 25, xCoord, yCoord)
		f = controls.colors.clearcasting
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.clearcasting, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.clearcasting.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.feral.colors.bar.clearcasting = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.passive = TRB.UiFunctions:BuildColorPicker(parent, "Energy gain from Passive Sources", TRB.Data.settings.druid.feral.colors.bar.passive, 275, 25, xCoord2, yCoord)
		f = controls.colors.passive
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.passive, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    
					controls.colors.passive.Texture:SetColorTexture(r, g, b, 1-a)
					passiveFrame:SetStatusBarColor(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.bar.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)


		yCoord = yCoord - 30
		controls.colors.maxBite = TRB.UiFunctions:BuildColorPicker(parent, "Energy when 5 Combo Points and Ferocious Bite will do max damage", TRB.Data.settings.druid.feral.colors.bar.maxBite, 275, 25, xCoord, yCoord)
		f = controls.colors.maxBite
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.noSliceAndDice, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.maxBite.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.feral.colors.bar.maxBite = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.background = TRB.UiFunctions:BuildColorPicker(parent, "Unfilled bar background", TRB.Data.settings.druid.feral.colors.bar.background, 275, 25, xCoord2, yCoord)
		f = controls.colors.background
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.bar.background, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.background.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.bar.background = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                    barContainerFrame:SetBackdropColor(r, g, b, 1-a)
                end)
			end
		end)

		yCoord = yCoord - 40

		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Combo Point Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.comboPointBase = TRB.UiFunctions:BuildColorPicker(parent, "Combo Points", TRB.Data.settings.druid.feral.colors.comboPoints.base, 300, 25, xCoord, yCoord)
		f = controls.colors.comboPointBase
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
                local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.base, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    controls.colors.comboPointBase.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.base = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.comboPointBorder = TRB.UiFunctions:BuildColorPicker(parent, "Combo Point's border", TRB.Data.settings.druid.feral.colors.comboPoints.border, 225, 25, xCoord2, yCoord)
		f = controls.colors.comboPointBorder
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.border, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end

                    controls.colors.comboPointBorder.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.border = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		yCoord = yCoord - 30		
		controls.colors.comboPointPenultimate = TRB.UiFunctions:BuildColorPicker(parent, "Penultimate Combo Point", TRB.Data.settings.druid.feral.colors.comboPoints.penultimate, 300, 25, xCoord, yCoord)
		f = controls.colors.comboPointPenultimate
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
                local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.penultimate, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    controls.colors.comboPointPenultimate.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.penultimate = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		--[[
		controls.colors.comboPointEchoingReprimand = TRB.UiFunctions:BuildColorPicker(parent, "Combo Point when Echoing Reprimand (|cFF68CCEFKyrian|r) buff is up", TRB.Data.settings.druid.feral.colors.comboPoints.echoingReprimand, 275, 25, xCoord2, yCoord)
		f = controls.colors.comboPointEchoingReprimand
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.echoingReprimand, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.comboPointEchoingReprimand.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.echoingReprimand = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)
		]]

		yCoord = yCoord - 30		
		controls.colors.comboPointFinal = TRB.UiFunctions:BuildColorPicker(parent, "Final Combo Point", TRB.Data.settings.druid.feral.colors.comboPoints.final, 300, 25, xCoord, yCoord)
		f = controls.colors.comboPointFinal
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
                local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.final, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    controls.colors.comboPointFinal.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.final = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		--[[
		controls.colors.comboPointSerratedBoneSpike = TRB.UiFunctions:BuildColorPicker(parent, "Combo Point that wil generate on next Serrated Bone Spike (|cFF40BF40Necrolord|r) use", TRB.Data.settings.druid.feral.colors.comboPoints.serratedBoneSpike, 275, 25, xCoord2, yCoord)
		f = controls.colors.comboPointSerratedBoneSpike
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.serratedBoneSpike, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.comboPointSerratedBoneSpike.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.serratedBoneSpike = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)
		]]

		yCoord = yCoord - 30

		controls.checkBoxes.sameColorComboPoint = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_comboPointsSameColor", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.sameColorComboPoint
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Use highest Combo Point color for all?")
		f.tooltip = "When checked, the highest Combo Point's color will be used for all Combo Points. E.g., if you have maximum 5 combo points and currently have 4, the Penultimate color will be used for all Combo Points instead of just the second to last."
		f:SetChecked(TRB.Data.settings.druid.feral.comboPoints.sameColor)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.comboPoints.sameColor = self:GetChecked()
		end)

		controls.colors.comboPointBackground = TRB.UiFunctions:BuildColorPicker(parent, "Unfilled Combo Point background", TRB.Data.settings.druid.feral.colors.comboPoints.background, 275, 25, xCoord2, yCoord)
		f = controls.colors.comboPointBackground
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.background, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.comboPointBackground.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.comboPoints.background = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                    
					local length = TRB.Functions.TableLength(TRB.Frames.resource2Frames)
					for x = 1, length do
						TRB.Frames.resource2Frames[x].containerFrame:SetBackdropColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.comboPoints.background, true))
					end
                end)
			end
		end)

		yCoord = yCoord - 40

		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Ability Threshold Lines", 0, yCoord)

		yCoord = yCoord - 25

		controls.colors.thresholdUnder = TRB.UiFunctions:BuildColorPicker(parent, "Under minimum required Energy threshold line", TRB.Data.settings.druid.feral.colors.threshold.under, 275, 25, xCoord2, yCoord)
		f = controls.colors.thresholdUnder
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.threshold.under, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.thresholdUnder.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.threshold.under = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.thresholdOver = TRB.UiFunctions:BuildColorPicker(parent, "Over minimum required Energy threshold line", TRB.Data.settings.druid.feral.colors.threshold.over, 275, 25, xCoord2, yCoord-30)
		f = controls.colors.thresholdOver
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.threshold.over, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.thresholdOver.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.threshold.over = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.thresholdUnusable = TRB.UiFunctions:BuildColorPicker(parent, "Ability is unusable threshold line", TRB.Data.settings.druid.feral.colors.threshold.unusable, 275, 25, xCoord2, yCoord-60)
		f = controls.colors.thresholdUnusable
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.threshold.unusable, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.thresholdUnusable.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.threshold.unusable = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.checkBoxes.thresholdOverlapBorder = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_thresholdOverlapBorder", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdOverlapBorder
		f:SetPoint("TOPLEFT", xCoord2, yCoord-90)
		getglobal(f:GetName() .. 'Text'):SetText("Threshold lines overlap bar border?")
		f.tooltip = "When checked, threshold lines will span the full height of the bar and overlap the bar border."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.overlapBorder)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.overlapBorder = self:GetChecked()
			TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.feral)
		end)

		controls.checkBoxes.thresholdBleedColors = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_thresholdBleedColors", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdBleedColors
		f:SetPoint("TOPLEFT", xCoord2, yCoord-120)
		getglobal(f:GetName() .. 'Text'):SetText("Use different colors for Bleed snapshots?")
		f.tooltip = "When checked, threshold lines for Rake, Rip, Thrash, and Moonfire (if Lunar Inspiration is talented) will have their threshold lines colored based on if the current buffs are better, worse, or the same damage (or the bleed is not on the target) instead of based on available Energy or Combo Points. The colors used are set in the 'Bleed Snapshotting' section under the 'Font & Text' tab."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.bleedColors)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.bleedColors = self:GetChecked()
			TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.feral)
		end)
		
		controls.labels.builders = TRB.UiFunctions:BuildLabel(parent, "Builders", 5, yCoord, 110, 20)
		yCoord = yCoord - 20

		controls.checkBoxes.brutalSlashThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_brutalSlash", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.brutalSlashThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Brutal Slash (if talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Brutal Slash. Only visible if talented in to Brutal Slash. If on cooldown, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.brutalSlash.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.brutalSlash.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.feralFrenzyThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_feralfrenzy", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.feralFrenzyThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Feral Frenzy (if talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Feral Frenzy. Only visible if talented in to Feral Frenzy. If on cooldown, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.feralFrenzy.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.feralFrenzy.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.moonfireThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_moonfire", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.moonfireThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Moonfire (if Lunar Inspiration talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Moonfire. Only visible if talented in to Lunar Inspiration."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.moonfire.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.moonfire.enabled = self:GetChecked()
		end)
		
		yCoord = yCoord - 25
		controls.checkBoxes.rakeThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_rake", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.rakeThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Rake")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Rake."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.rake.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.rake.enabled = self:GetChecked()
		end)
		
		yCoord = yCoord - 25
		controls.checkBoxes.shredThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_shred", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.shredThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Shred")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Shred."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.shred.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.shred.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.swipeThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_swipe", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.swipeThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Swipe (if Brutal Slash untalented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Swipe. Only visible if not talented in to Brutal Slash."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.swipe.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.swipe.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.thrashThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_thrash", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thrashThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Thrash")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Thrash."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.thrash.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.thrash.enabled = self:GetChecked()
		end)


		yCoord = yCoord - 25
		controls.labels.finishers = TRB.UiFunctions:BuildLabel(parent, "Finishers", 5, yCoord, 110, 20)
		yCoord = yCoord - 20

		controls.checkBoxes.ferociousBiteThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_ferociousBite", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ferociousBiteThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Ferocious Bite (moving/dynamic)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Ferocious Bite. If you do not have any combo points, will be colored as 'unusable'. Will move along the bar between the current minimum and maximum Energy cost amounts."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.ferociousBite.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.ferociousBite.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.ferociousBiteMinimumThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_ferociousBiteMinimum", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ferociousBiteMinimumThresholdShow
		f:SetPoint("TOPLEFT", xCoord+xPadding*2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Ferocious Bite (minimum)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Ferocious Bite at its minimum Energy cost. If you do not have any combo points, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.ferociousBiteMinimum.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.ferociousBiteMinimum.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.ferociousBiteMaximumThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_ferociousBiteMaximum", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ferociousBiteMaximumThresholdShow
		f:SetPoint("TOPLEFT", xCoord+xPadding*2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Ferocious Bite (maximum)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Ferocious Bite at its maximum Energy cost. If you do not have any combo points, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.ferociousBiteMaximum.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.ferociousBiteMaximum.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.maimThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_maim", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.maimThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Maim")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Maim. If on cooldown or you do not have any combo points, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.maim.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.maim.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.primalWrathThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_primalwrath", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.primalWrathThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Primal Wrath (if talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Primal Wrath. Only visible when talented in to Primal Wrath. If you do not have any combo points, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.primalWrath.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.primalWrath.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.ripThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_rip", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.ripThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Rip")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Rip. If you do not have any combo points, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.rip.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.rip.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.savageRoarThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_savageRoar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.savageRoarThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Savage Roar (if talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use Savage Roar. Only visible when talented in to Savage Roar. If you do not have any combo points, will be colored as 'unusable'."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.savageRoar.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.savageRoar.enabled = self:GetChecked()
		end)

		--[[
		yCoord = yCoord - 25		
		controls.labels.other = TRB.UiFunctions:BuildLabel(parent, "Other Thresholds", 5, yCoord, 110, 20)
		yCoord = yCoord - 20

		controls.checkBoxes.bloodtalonsThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_Threshold_Option_bloodtalons", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.bloodtalonsThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Bloodtalons (if talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Energy is required to use complete a successful Bloodtalons ability combo. Only visible when talented in to Bloodtalons."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.bloodtalons.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.bloodtalons.enabled = self:GetChecked()
		end)
		]]

		yCoord = yCoord - 30

        -- Create the dropdown, and configure its appearance
        controls.dropDown.thresholdIconRelativeTo = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_thresholdIconRelativeTo", parent, "UIDropDownMenuTemplate")
        controls.dropDown.thresholdIconRelativeTo.label = TRB.UiFunctions:BuildSectionHeader(parent, "Relative Position of Threshold Line Icons", xCoord, yCoord)
        controls.dropDown.thresholdIconRelativeTo.label.font:SetFontObject(GameFontNormal)
        controls.dropDown.thresholdIconRelativeTo:SetPoint("TOPLEFT", xCoord, yCoord-30)
        UIDropDownMenu_SetWidth(controls.dropDown.thresholdIconRelativeTo, dropdownWidth)
        UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, TRB.Data.settings.druid.feral.thresholds.icons.relativeToName)
        UIDropDownMenu_JustifyText(controls.dropDown.thresholdIconRelativeTo, "LEFT")

        -- Create and bind the initialization function to the dropdown menu
        UIDropDownMenu_Initialize(controls.dropDown.thresholdIconRelativeTo, function(self, level, menuList)
            local entries = 25
            local info = UIDropDownMenu_CreateInfo()
            local relativeTo = {}
            relativeTo["Above"] = "TOP"
            relativeTo["Middle"] = "CENTER"
            relativeTo["Below"] = "BOTTOM"
            local relativeToList = {
                "Above",
                "Middle",
                "Below"
            }

            for k, v in pairs(relativeToList) do
                info.text = v
                info.value = relativeTo[v]
                info.checked = relativeTo[v] == TRB.Data.settings.druid.feral.thresholds.icons.relativeTo
                info.func = self.SetValue
                info.arg1 = relativeTo[v]
                info.arg2 = v
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        function controls.dropDown.thresholdIconRelativeTo:SetValue(newValue, newName)
            TRB.Data.settings.druid.feral.thresholds.icons.relativeTo = newValue
            TRB.Data.settings.druid.feral.thresholds.icons.relativeToName = newName
			
			if GetSpecialization() == 2 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.feral)
			end

            UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, newName)
            CloseDropDownMenus()
        end

		controls.checkBoxes.thresholdIconEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_thresholdIconEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdIconEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Show ability icons for threshold lines?")
		f.tooltip = "When checked, icons for the threshold each line represents will be displayed. Configuration of size and location of these icons is below."
		f:SetChecked(TRB.Data.settings.druid.feral.thresholds.icons.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.thresholds.icons.enabled = self:GetChecked()
			
			if GetSpecialization() == 2 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.feral)
			end
		end)

		yCoord = yCoord - 80
		title = "Threshold Icon Width"
		controls.thresholdIconWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.druid.feral.thresholds.icons.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.thresholds.icons.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.feral.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.feral.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
		end)

		title = "Threshold Icon Height"
		controls.thresholdIconHeight = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.druid.feral.thresholds.icons.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconHeight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.thresholds.icons.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.druid.feral.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.druid.feral.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)				
		end)


		title = "Threshold Icon Horizontal Position (Relative)"
		yCoord = yCoord - 60
		controls.thresholdIconHorizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.druid.feral.thresholds.icons.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconHorizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.thresholds.icons.xPos = value

			if GetSpecialization() == 2 then
				TRB.Functions.RepositionBar(TRB.Data.settings.druid.feral, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Threshold Icon Vertical Position (Relative)"
		controls.thresholdIconVertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.druid.feral.thresholds.icons.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconVertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.thresholds.icons.yPos = value
		end)

		local maxIconBorderHeight = math.min(math.floor(TRB.Data.settings.druid.feral.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.druid.feral.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))

		title = "Threshold Icon Border Width"
		yCoord = yCoord - 60
		controls.thresholdIconBorderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxIconBorderHeight, TRB.Data.settings.druid.feral.thresholds.icons.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconBorderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.thresholds.icons.border = value

			local minsliderWidth = math.max(TRB.Data.settings.druid.feral.thresholds.icons.border*2, 1)
			local minsliderHeight = math.max(TRB.Data.settings.druid.feral.thresholds.icons.border*2, 1)

			controls.thresholdIconHeight:SetMinMaxValues(minsliderHeight, 128)
			controls.thresholdIconHeight.MinLabel:SetText(minsliderHeight)
			controls.thresholdIconWidth:SetMinMaxValues(minsliderWidth, 128)
			controls.thresholdIconWidth.MinLabel:SetText(minsliderWidth)

			if GetSpecialization() == 2 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.druid.feral)
			end
		end)


		yCoord = yCoord - 60

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Overcapping Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.overcapEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB1_8", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapEnabled
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change border color when overcapping")
		f.tooltip = "This will change the bar's border color when your current energy is above the overcapping maximum Energy as configured below."
		f:SetChecked(TRB.Data.settings.druid.feral.colors.bar.overcapEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.colors.bar.overcapEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 40

		title = "Show Overcap Notification Above"
		controls.overcapAt = TRB.UiFunctions:BuildSlider(parent, title, 0, 130, TRB.Data.settings.druid.feral.overcapThreshold, 1, 1,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.overcapAt:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 1)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.overcapThreshold = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.feral = controls
	end

	local function FeralConstructFontAndTextPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.feral
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		controls.buttons.exportButton_Druid_Feral_FontAndText = TRB.UiFunctions:BuildButton(parent, "Export Font & Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Feral_FontAndText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Feral Druid (Font & Text).", 11, 2, false, true, false, false, false)
		end)

		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Face", 0, yCoord)

		yCoord = yCoord - 30
		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontLeft = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_FontLeft", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontLeft.label = TRB.UiFunctions:BuildSectionHeader(parent, "Left Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontLeft.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontLeft:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontLeft, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontLeft, TRB.Data.settings.druid.feral.displayText.left.fontFaceName)
		UIDropDownMenu_JustifyText(controls.dropDown.fontLeft, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.fontLeft, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local fonts = TRB.Details.addonData.libs.SharedMedia:HashTable("font")
			local fontsList = TRB.Details.addonData.libs.SharedMedia:List("font")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(fonts) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Fonts " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(fontsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = fonts[v]
						info.checked = fonts[v] == TRB.Data.settings.druid.feral.displayText.left.fontFace
						info.func = self.SetValue
						info.arg1 = fonts[v]
						info.arg2 = v
						info.fontObject = CreateFont(v)
						info.fontObject:SetFont(fonts[v], 12, "OUTLINE")
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		function controls.dropDown.fontLeft:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.displayText.left.fontFace = newValue
			TRB.Data.settings.druid.feral.displayText.left.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
			if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
				TRB.Data.settings.druid.feral.displayText.middle.fontFace = newValue
				TRB.Data.settings.druid.feral.displayText.middle.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
				TRB.Data.settings.druid.feral.displayText.right.fontFace = newValue
				TRB.Data.settings.druid.feral.displayText.right.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end

			if GetSpecialization() == 2 then
				leftTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.left.fontFace, TRB.Data.settings.druid.feral.displayText.left.fontSize, "OUTLINE")
				if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
					middleTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.middle.fontFace, TRB.Data.settings.druid.feral.displayText.middle.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.right.fontFace, TRB.Data.settings.druid.feral.displayText.right.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontMiddle = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_FontMiddle", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontMiddle.label = TRB.UiFunctions:BuildSectionHeader(parent, "Middle Bar Font Face", xCoord2, yCoord)
		controls.dropDown.fontMiddle.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontMiddle:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontMiddle, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.druid.feral.displayText.middle.fontFaceName)
		UIDropDownMenu_JustifyText(controls.dropDown.fontMiddle, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.fontMiddle, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local fonts = TRB.Details.addonData.libs.SharedMedia:HashTable("font")
			local fontsList = TRB.Details.addonData.libs.SharedMedia:List("font")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(fonts) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Fonts " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(fontsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = fonts[v]
						info.checked = fonts[v] == TRB.Data.settings.druid.feral.displayText.middle.fontFace
						info.func = self.SetValue
						info.arg1 = fonts[v]
						info.arg2 = v
						info.fontObject = CreateFont(v)
						info.fontObject:SetFont(fonts[v], 12, "OUTLINE")
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		function controls.dropDown.fontMiddle:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.displayText.middle.fontFace = newValue
			TRB.Data.settings.druid.feral.displayText.middle.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
				TRB.Data.settings.druid.feral.displayText.left.fontFace = newValue
				TRB.Data.settings.druid.feral.displayText.left.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.druid.feral.displayText.right.fontFace = newValue
				TRB.Data.settings.druid.feral.displayText.right.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end

			if GetSpecialization() == 2 then
				middleTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.middle.fontFace, TRB.Data.settings.druid.feral.displayText.middle.fontSize, "OUTLINE")
				if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
					leftTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.left.fontFace, TRB.Data.settings.druid.feral.displayText.left.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.right.fontFace, TRB.Data.settings.druid.feral.displayText.right.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		yCoord = yCoord - 40 - 20

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontRight = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_FontRight", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontRight.label = TRB.UiFunctions:BuildSectionHeader(parent, "Right Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontRight.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontRight:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontRight, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.druid.feral.displayText.right.fontFaceName)
		UIDropDownMenu_JustifyText(controls.dropDown.fontRight, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.fontRight, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local fonts = TRB.Details.addonData.libs.SharedMedia:HashTable("font")
			local fontsList = TRB.Details.addonData.libs.SharedMedia:List("font")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(fonts) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Fonts " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(fontsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = fonts[v]
						info.checked = fonts[v] == TRB.Data.settings.druid.feral.displayText.right.fontFace
						info.func = self.SetValue
						info.arg1 = fonts[v]
						info.arg2 = v
						info.fontObject = CreateFont(v)
						info.fontObject:SetFont(fonts[v], 12, "OUTLINE")
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		function controls.dropDown.fontRight:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.displayText.right.fontFace = newValue
			TRB.Data.settings.druid.feral.displayText.right.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
				TRB.Data.settings.druid.feral.displayText.left.fontFace = newValue
				TRB.Data.settings.druid.feral.displayText.left.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.druid.feral.displayText.middle.fontFace = newValue
				TRB.Data.settings.druid.feral.displayText.middle.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			end

			if GetSpecialization() == 2 then
				rightTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.right.fontFace, TRB.Data.settings.druid.feral.displayText.right.fontSize, "OUTLINE")
				if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
					leftTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.left.fontFace, TRB.Data.settings.druid.feral.displayText.left.fontSize, "OUTLINE")
					middleTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.middle.fontFace, TRB.Data.settings.druid.feral.displayText.middle.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		controls.checkBoxes.fontFaceLock = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB1_FONTFACE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontFaceLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font face for all text")
		f.tooltip = "This will lock the font face for text for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.druid.feral.displayText.fontFaceLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.displayText.fontFaceLock = self:GetChecked()
			if TRB.Data.settings.druid.feral.displayText.fontFaceLock then
				TRB.Data.settings.druid.feral.displayText.middle.fontFace = TRB.Data.settings.druid.feral.displayText.left.fontFace
				TRB.Data.settings.druid.feral.displayText.middle.fontFaceName = TRB.Data.settings.druid.feral.displayText.left.fontFaceName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.druid.feral.displayText.middle.fontFaceName)
				TRB.Data.settings.druid.feral.displayText.right.fontFace = TRB.Data.settings.druid.feral.displayText.left.fontFace
				TRB.Data.settings.druid.feral.displayText.right.fontFaceName = TRB.Data.settings.druid.feral.displayText.left.fontFaceName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.druid.feral.displayText.right.fontFaceName)

				if GetSpecialization() == 2 then
					middleTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.middle.fontFace, TRB.Data.settings.druid.feral.displayText.middle.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.right.fontFace, TRB.Data.settings.druid.feral.displayText.right.fontSize, "OUTLINE")
				end
			end
		end)


		yCoord = yCoord - 70
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Size and Colors", 0, yCoord)

		title = "Left Bar Text Font Size"
		yCoord = yCoord - 50
		controls.fontSizeLeft = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.druid.feral.displayText.left.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeLeft:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.displayText.left.fontSize = value

			if GetSpecialization() == 2 then
				leftTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.left.fontFace, TRB.Data.settings.druid.feral.displayText.left.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.druid.feral.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		controls.checkBoxes.fontSizeLock = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB2_F1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontSizeLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font size for all text")
		f.tooltip = "This will lock the font sizes for each part of the bar to be the same size."
		f:SetChecked(TRB.Data.settings.druid.feral.displayText.fontSizeLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.displayText.fontSizeLock = self:GetChecked()
			if TRB.Data.settings.druid.feral.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(TRB.Data.settings.druid.feral.displayText.left.fontSize)
				controls.fontSizeRight:SetValue(TRB.Data.settings.druid.feral.displayText.left.fontSize)
			end
		end)

		controls.colors.leftText = TRB.UiFunctions:BuildColorPicker(parent, "Left Text", TRB.Data.settings.druid.feral.colors.text.left,
														250, 25, xCoord2, yCoord-30)
		f = controls.colors.leftText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.left, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    --Text doesn't care about Alpha, but the color picker does!
                    a = 0.0
        
                    controls.colors.leftText.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.left = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.middleText = TRB.UiFunctions:BuildColorPicker(parent, "Middle Text", TRB.Data.settings.druid.feral.colors.text.middle,
														225, 25, xCoord2, yCoord-70)
		f = controls.colors.middleText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.middle, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    --Text doesn't care about Alpha, but the color picker does!
                    a = 0.0
        
                    controls.colors.middleText.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.middle = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.rightText = TRB.UiFunctions:BuildColorPicker(parent, "Right Text", TRB.Data.settings.druid.feral.colors.text.right,
														225, 25, xCoord2, yCoord-110)
		f = controls.colors.rightText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.right, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    --Text doesn't care about Alpha, but the color picker does!
                    a = 0.0
        
                    controls.colors.rightText.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.right = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		title = "Middle Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeMiddle = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.druid.feral.displayText.middle.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeMiddle:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.displayText.middle.fontSize = value

			if GetSpecialization() == 2 then
				middleTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.middle.fontFace, TRB.Data.settings.druid.feral.displayText.middle.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.druid.feral.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		title = "Right Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeRight = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.druid.feral.displayText.right.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeRight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.displayText.right.fontSize = value

			if GetSpecialization() == 2 then
				rightTextFrame.font:SetFont(TRB.Data.settings.druid.feral.displayText.right.fontFace, TRB.Data.settings.druid.feral.displayText.right.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.druid.feral.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeMiddle:SetValue(value)
			end
		end)

		yCoord = yCoord - 40
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Energy Text Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.currentEnergyText = TRB.UiFunctions:BuildColorPicker(parent, "Current Energy", TRB.Data.settings.druid.feral.colors.text.current, 300, 25, xCoord, yCoord)
		f = controls.colors.currentEnergyText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.current, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
                    --Text doesn't care about Alpha, but the color picker does!
                    a = 0.0
        
                    controls.colors.currentEnergyText.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.current = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)
		
		controls.colors.passiveEnergyText = TRB.UiFunctions:BuildColorPicker(parent, "Passive Energy", TRB.Data.settings.druid.feral.colors.text.passive, 275, 25, xCoord2, yCoord)
		f = controls.colors.passiveEnergyText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.passive, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.passiveEnergyText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.feral.colors.text.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.thresholdenergyText = TRB.UiFunctions:BuildColorPicker(parent, "Have enough Energy to use any enabled threshold ability", TRB.Data.settings.druid.feral.colors.text.overThreshold, 300, 25, xCoord, yCoord)
		f = controls.colors.thresholdenergyText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.overThreshold, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.thresholdenergyText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.feral.colors.text.overThreshold = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.overcapenergyText = TRB.UiFunctions:BuildColorPicker(parent, "Current Energy is above overcap threshold", TRB.Data.settings.druid.feral.colors.text.overcap, 300, 25, xCoord2, yCoord)
		f = controls.colors.overcapenergyText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.overcap, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end
					--Text doesn't care about Alpha, but the color picker does!
					a = 0.0

					controls.colors.overcapenergyText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.druid.feral.colors.text.overcap = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30

		controls.checkBoxes.overThresholdEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_OverThresholdTextEnable", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overThresholdEnabled
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "This will change the Energy text color when you are able to use an ability whose threshold you have enabled under 'Bar Display'."
		f:SetChecked(TRB.Data.settings.druid.feral.colors.text.overThresholdEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.colors.text.overThresholdEnabled = self:GetChecked()
		end)

		controls.checkBoxes.overcapTextEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_OvercapTextEnable", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapTextEnabled
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "This will change the Energy text color when your current energy is above the overcapping maximum Energy value."
		f:SetChecked(TRB.Data.settings.druid.feral.colors.text.overcapEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.colors.text.overcapEnabled = self:GetChecked()
		end)
		

		yCoord = yCoord - 30
		controls.dotColorSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bleed Snapshotting", 0, yCoord)

		yCoord = yCoord - 25

		controls.checkBoxes.dotColor = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_dotColor", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.dotColor
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change total Bleed counters and Bleed timers based on shapshotted damage?")
		f.tooltip = "When checked, the color of total Bleeds (and Moonfire, if talented) up counters and Bleed timers will change based on whether or not the current snapshotted damage values are better, worse, or the same vs. your current damage buffs."
		f:SetChecked(TRB.Data.settings.druid.feral.colors.text.dots.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.colors.text.dots.enabled = self:GetChecked()
		end)

		controls.colors.dotSame = TRB.UiFunctions:BuildColorPicker(parent, "Bleed snapshot on current target is the same", TRB.Data.settings.druid.feral.colors.text.dots.same, 550, 25, xCoord, yCoord-30)
		f = controls.colors.dotSame
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.dots.same, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.dotSame.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.dots.same = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotWorse = TRB.UiFunctions:BuildColorPicker(parent, "Bleed snapshot on current target is worse and should be reapplied.", TRB.Data.settings.druid.feral.colors.text.dots.worse, 550, 25, xCoord, yCoord-60)
		f = controls.colors.dotWorse
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.dots.worse, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.dotWorse.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.dots.worse = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotBetter = TRB.UiFunctions:BuildColorPicker(parent, "Bleed snapshot on current target is better and should NOT be reapplied.", TRB.Data.settings.druid.feral.colors.text.dots.better, 550, 25, xCoord, yCoord-90)
		f = controls.colors.dotBetter
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.dots.better, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.dotBetter.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.dots.better = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotDown = TRB.UiFunctions:BuildColorPicker(parent, "Bleed is not active on current target", TRB.Data.settings.druid.feral.colors.text.dots.down, 550, 25, xCoord, yCoord-120)
		f = controls.colors.dotDown
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.druid.feral.colors.text.dots.down, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
                    local r, g, b, a
                    if color then
---@diagnostic disable-next-line: deprecated
                        r, g, b, a = unpack(color)
                    else
                        r, g, b = ColorPickerFrame:GetColorRGB()
                        a = OpacitySliderFrame:GetValue()
                    end
        
                    controls.colors.dotDown.Texture:SetColorTexture(r, g, b, 1-a)
                    TRB.Data.settings.druid.feral.colors.text.dots.down = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)


		yCoord = yCoord - 150
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Decimal Precision", 0, yCoord)

		yCoord = yCoord - 50
		title = "Haste / Crit / Mastery / Vers Decimal Precision"
		controls.hastePrecision = TRB.UiFunctions:BuildSlider(parent, title, 0, 10, TRB.Data.settings.druid.feral.hastePrecision, 1, 0,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.hastePrecision:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 0)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.hastePrecision = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.feral = controls
	end

	local function FeralConstructAudioAndTrackingPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.feral
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1

		local title = ""

		local dropdownWidth = 225
		local sliderWidth = 260
		local sliderHeight = 20

		controls.buttons.exportButton_Druid_Feral_AudioAndTracking = TRB.UiFunctions:BuildButton(parent, "Export Audio & Tracking", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Feral_AudioAndTracking:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Feral Druid (Audio & Tracking).", 11, 2, false, false, true, false, false)
		end)

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Audio Options", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.apcAudio = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_apc_Sound_Checkbox", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.apcAudio
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when an Apex Predator's Craving proc occurs")
		f.tooltip = "Play an audio cue when an Apex Predator's Craving (legendary) proc occurs, allowing a max damage Ferocious Bite to be cast without spending any Energy or Combo Points."
		f:SetChecked(TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.enabled = self:GetChecked()

			if TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.apcAudio = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_apexPredatorsCraving_Audio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.apcAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.apcAudio, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.apcAudio, TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.apcAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.apcAudio, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local sounds = TRB.Details.addonData.libs.SharedMedia:HashTable("sound")
			local soundsList = TRB.Details.addonData.libs.SharedMedia:List("sound")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(sounds) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Sounds " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(soundsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = sounds[v]
						info.checked = sounds[v] == TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.apcAudio:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.sound = newValue
			TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.apcAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.druid.feral.audio.apexPredatorsCraving.sound, TRB.Data.settings.core.audio.channel.channel)
		end

		yCoord = yCoord - 60
		controls.checkBoxes.overcapAudio = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_CB3_OC_Sound", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapAudio
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when you will overcap Energy")
		f.tooltip = "Play an audio cue when your hardcast spell will overcap Energy."
		f:SetChecked(TRB.Data.settings.druid.feral.audio.overcap.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.audio.overcap.enabled = self:GetChecked()

			if TRB.Data.settings.druid.feral.audio.overcap.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.druid.feral.audio.overcap.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.overcapAudio = CreateFrame("FRAME", "TwintopResourceBar_Druid_Feral_overcapAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.overcapAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.overcapAudio, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.overcapAudio, TRB.Data.settings.druid.feral.audio.overcap.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.overcapAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.overcapAudio, function(self, level, menuList)
			local entries = 25
			local info = UIDropDownMenu_CreateInfo()
			local sounds = TRB.Details.addonData.libs.SharedMedia:HashTable("sound")
			local soundsList = TRB.Details.addonData.libs.SharedMedia:List("sound")
			if (level or 1) == 1 or menuList == nil then
				local menus = math.ceil(TRB.Functions.TableLength(sounds) / entries)
				for i=0, menus-1 do
					info.hasArrow = true
					info.notCheckable = true
					info.text = "Sounds " .. i+1
					info.menuList = i
					UIDropDownMenu_AddButton(info)
				end
			else
				local start = entries * menuList

				for k, v in pairs(soundsList) do
					if k > start and k <= start + entries then
						info.text = v
						info.value = sounds[v]
						info.checked = sounds[v] == TRB.Data.settings.druid.feral.audio.overcap.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.overcapAudio:SetValue(newValue, newName)
			TRB.Data.settings.druid.feral.audio.overcap.sound = newValue
			TRB.Data.settings.druid.feral.audio.overcap.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.overcapAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.druid.feral.audio.overcap.sound, TRB.Data.settings.core.audio.channel.channel)
		end

		yCoord = yCoord - 60
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Passive Energy Regeneration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.trackEnergyRegen = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_trackEnergyRegen_Checkbox", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.trackEnergyRegen
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track energy regen")
		f.tooltip = "Include energy regen in the passive bar and passive variables. Unchecking this will cause the following Passive Energy Generation options to have no effect."
		f:SetChecked(TRB.Data.settings.druid.feral.generation.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.druid.feral.generation.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.energyGenerationModeGCDs = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_PFG_GCD", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.energyGenerationModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Energy generation over GCDs")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Energy generation over the next X GCDs, based on player's current GCD length."
		if TRB.Data.settings.druid.feral.generation.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.energyGenerationModeGCDs:SetChecked(true)
			controls.checkBoxes.energyGenerationModeTime:SetChecked(false)
			TRB.Data.settings.druid.feral.generation.mode = "gcd"
		end)

		title = "Energy GCDs - 0.75sec Floor"
		controls.energyGenerationGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0, 15, TRB.Data.settings.druid.feral.generation.gcds, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.energyGenerationGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.generation.gcds = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.energyGenerationModeTime = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_PFG_TIME", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.energyGenerationModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Energy generation over time")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Energy generation over the next X seconds."
		if TRB.Data.settings.druid.feral.generation.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.energyGenerationModeGCDs:SetChecked(false)
			controls.checkBoxes.energyGenerationModeTime:SetChecked(true)
			TRB.Data.settings.druid.feral.generation.mode = "time"
		end)

		title = "Energy Over Time (sec)"
		controls.energyGenerationTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 10, TRB.Data.settings.druid.feral.generation.time, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.energyGenerationTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.druid.feral.generation.time = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.feral = controls
	end
    
	local function FeralConstructBarTextDisplayPanel(parent, cache)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.feral
		local yCoord = 5
		local f = nil

		local maxOptionsWidth = 580

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1
		local namePrefix = "Druid_Feral"

		TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display Text Customization", 0, yCoord)
		controls.buttons.exportButton_Druid_Feral_BarText = TRB.UiFunctions:BuildButton(parent, "Export Bar Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Druid_Feral_BarText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Feral Druid (Bar Text).", 11, 2, false, false, false, true, false)
		end)

		yCoord = yCoord - 30
		TRB.UiFunctions:BuildLabel(parent, "Left Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.left = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Left", TRB.Data.settings.druid.feral.displayText.left.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.left
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.druid.feral.displayText.left.text = self:GetText()
			TRB.Data.barTextCache = {}
			TRB.Functions.IsTtdActive(TRB.Data.settings.druid.feral)
		end)


		yCoord = yCoord - 70
		TRB.UiFunctions:BuildLabel(parent, "Middle Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.middle = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Middle", TRB.Data.settings.druid.feral.displayText.middle.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.middle
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.druid.feral.displayText.middle.text = self:GetText()
			TRB.Data.barTextCache = {}
			TRB.Functions.IsTtdActive(TRB.Data.settings.druid.feral)
		end)


		yCoord = yCoord - 70
		TRB.UiFunctions:BuildLabel(parent, "Right Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.right = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Right", TRB.Data.settings.druid.feral.displayText.right.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.right
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.druid.feral.displayText.right.text = self:GetText()
			TRB.Data.barTextCache = {}
			TRB.Functions.IsTtdActive(TRB.Data.settings.druid.feral)
		end)

		yCoord = yCoord - 70
		local variablesPanel = TRB.UiFunctions:CreateVariablesSidePanel(parent, namePrefix)
		TRB.Options:CreateBarTextInstructions(parent, xCoord, yCoord)
		TRB.Options:CreateBarTextVariables(cache, variablesPanel, 5, -30)
	end

	local function FeralConstructOptionsPanel(cache)
		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local parent = interfaceSettingsFrame.panel
		local controls = interfaceSettingsFrame.controls.feral or {}
		local yCoord = 0
		local f = nil
		local xPadding = 10
		local xPadding2 = 30
		local xMax = 550
		local xCoord = 0
		local xCoord2 = 325
		local xOffset1 = 50
		local xOffset2 = 275

		controls.colors = {}
		controls.labels = {}
		controls.textbox = {}
		controls.checkBoxes = {}
		controls.dropDown = {}
		controls.buttons = controls.buttons or {}

		interfaceSettingsFrame.feralDisplayPanel = CreateFrame("Frame", "TwintopResourceBar_Options_Druid_Feral", UIParent)
		interfaceSettingsFrame.feralDisplayPanel.name = "Feral Druid"
---@diagnostic disable-next-line: undefined-field
		interfaceSettingsFrame.feralDisplayPanel.parent = parent.name
		InterfaceOptions_AddCategory(interfaceSettingsFrame.feralDisplayPanel)

		parent = interfaceSettingsFrame.feralDisplayPanel

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Feral Druid", xCoord+xPadding, yCoord-5)
	
		controls.checkBoxes.feralDruidEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Druid_Feral_feralDruidEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.feralDruidEnabled
		f:SetPoint("TOPLEFT", 250, yCoord-10)		
		getglobal(f:GetName() .. 'Text'):SetText("Enabled")
		f.tooltip = "Is Twintop's Resource Bar enabled for the Feral Druid specialization? If unchecked, the bar will not function (including the population of global variables!)."
		f:SetChecked(TRB.Data.settings.core.enabled.druid.feral)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.core.enabled.druid.feral = self:GetChecked()
			TRB.Functions.EventRegistration()
			TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.feralDruidEnabled, TRB.Data.settings.core.enabled.druid.feral, true)
		end)

		TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.feralDruidEnabled, TRB.Data.settings.core.enabled.druid.feral, true)

		controls.buttons.importButton = TRB.UiFunctions:BuildButton(parent, "Import", 345, yCoord-10, 90, 20)
		controls.buttons.importButton:SetFrameLevel(10000)
		controls.buttons.importButton:SetScript("OnClick", function(self, ...)        
			StaticPopup_Show("TwintopResourceBar_Import")
		end)

		controls.buttons.exportButton_Druid_Feral_All = TRB.UiFunctions:BuildButton(parent, "Export Specialization", 440, yCoord-10, 150, 20)
		controls.buttons.exportButton_Druid_Feral_All:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Feral Druid (All).", 11, 2, true, true, true, true, false)
		end)

		yCoord = yCoord - 42

		local tabs = {}
		local tabsheets = {}

		tabs[1] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Feral_Tab2", "Bar Display", 1, parent, 85)
		tabs[1]:SetPoint("TOPLEFT", 15, yCoord)
		tabs[2] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Feral_Tab3", "Font & Text", 2, parent, 85, tabs[1])
		tabs[3] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Feral_Tab4", "Audio & Tracking", 3, parent, 120, tabs[2])
		tabs[4] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Feral_Tab5", "Bar Text", 4, parent, 60, tabs[3])
		tabs[5] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Druid_Feral_Tab1", "Reset Defaults", 5, parent, 100, tabs[4])

		PanelTemplates_TabResize(tabs[1], 0)
		PanelTemplates_TabResize(tabs[2], 0)
		PanelTemplates_TabResize(tabs[3], 0)
		PanelTemplates_TabResize(tabs[4], 0)
		PanelTemplates_TabResize(tabs[5], 0)
		yCoord = yCoord - 15

		for i = 1, 5 do 
			tabsheets[i] = TRB.UiFunctions:CreateTabFrameContainer("TwintopResourceBar_Druid_Feral_LayoutPanel" .. i, parent)
			tabsheets[i]:Hide()
			tabsheets[i]:SetPoint("TOPLEFT", 10, yCoord)
		end

		tabsheets[1]:Show()
		tabsheets[1].selected = true
		tabs[1]:SetNormalFontObject(TRB.Options.fonts.options.tabHighlightSmall)
		parent.tabs = tabs
		parent.tabsheets = tabsheets
		parent.lastTab = tabsheets[1]
		parent.lastTabId = 1

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.feral = controls

		FeralConstructBarColorsAndBehaviorPanel(tabsheets[1].scrollFrame.scrollChild)
		FeralConstructFontAndTextPanel(tabsheets[2].scrollFrame.scrollChild)
		FeralConstructAudioAndTrackingPanel(tabsheets[3].scrollFrame.scrollChild)
		FeralConstructBarTextDisplayPanel(tabsheets[4].scrollFrame.scrollChild, cache)
		FeralConstructResetDefaultsPanel(tabsheets[5].scrollFrame.scrollChild)
	end


	local function ConstructOptionsPanel(specCache)
		TRB.Options:ConstructOptionsPanel()
		BalanceConstructOptionsPanel(specCache.balance)
		FeralConstructOptionsPanel(specCache.feral)
	end
	TRB.Options.Druid.ConstructOptionsPanel = ConstructOptionsPanel
end
