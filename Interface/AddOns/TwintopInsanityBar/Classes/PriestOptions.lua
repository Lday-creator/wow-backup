---@diagnostic disable: undefined-field
local _, TRB = ...
local _, _, classIndexId = UnitClass("player")
if classIndexId == 5 then --Only do this if we're on a Priest!
	local barContainerFrame = TRB.Frames.barContainerFrame
	local resourceFrame = TRB.Frames.resourceFrame
	local castingFrame = TRB.Frames.castingFrame
	local passiveFrame = TRB.Frames.passiveFrame
	local barBorderFrame = TRB.Frames.barBorderFrame

	local leftTextFrame = TRB.Frames.leftTextFrame
	local middleTextFrame = TRB.Frames.middleTextFrame
	local rightTextFrame = TRB.Frames.rightTextFrame

	local targetsTimerFrame = TRB.Frames.targetsTimerFrame

	TRB.Options.Priest = {}
	TRB.Options.Priest.Discipline = {}
	TRB.Options.Priest.Holy = {}
	TRB.Options.Priest.Shadow = {}


	local function HolyLoadDefaultBarTextSimpleSettings()
		local textSettings = {
			fontSizeLock=true,
			fontFaceLock=true,
			left={
				text="",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=16
			},
			middle={
				text="{$apotheosisTime}[$apotheosisTime]",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=16
			},
			right={
				text="{$casting}[#casting$casting + ]{$passive}[$passive + ]$mana/$manaMax $manaPercent%",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=16
			}
		}

		return textSettings
	end

	local function HolyLoadDefaultBarTextAdvancedSettings()
		local textSettings = {
			fontSizeLock = false,
			fontFaceLock = true,
			left = {
				text = "{$hwSanctifyTime}[#hwSanctify $hwSanctifyTime][          ]    {$potionCooldown}[#psc $potionCooldown]||n{$hwSerenityTime}[#hwSerenity $hwSerenityTime] ",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			middle = {
				text = "{$apotheosisTime}[#apotheosis $apotheosisTime #apotheosis]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			right = {
				text = "{$casting}[#casting$casting+]{$passive}[$passive+]$mana/$manaMax $manaPercent%",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 16
			}
		}

		return textSettings
	end

	local function HolyLoadDefaultSettings()
		local settings = {
			hastePrecision=2,
			thresholds = {
				width = 2,
				overlapBorder=true,
				icons = {
					border=2,
					relativeTo = "TOP",
					relativeToName = "Above",
					enabled=true,
					xPos=0,
					yPos=-12,
					width=24,
					height=24
				},
				potionOfSpiritualClarity = {
					enabled = true, -- 1
				},
				spiritualRejuvenationPotion = {
					enabled = false, -- 2
				},
				spiritualManaPotion = {
					enabled = true, -- 3
				},
				soulfulManaPotion = {
					enabled = false, -- 4
				},
				potionCooldown = {
					enabled=true,
					mode="time",
					gcdsMax=40,
					timeMax=60
				},
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
				showCasting=true,
				holyWordChastiseEnabled=false,
				holyWordSanctifyEnabled=true,
				holyWordSerenityEnabled=true
			},
			wrathfulFaerie={
				mode="time",
				procsMax=4,
				gcdsMax=2,
				timeMax=90.0,
				procDelay=0.15,
				enabled=true
			},
			endOfApotheosis = {
				enabled=true,
				mode="gcd",
				gcdsMax=2,
				timeMax=3.0
			},
			flashConcentration = {
				enabled=true,
				enabledUncapped=false,
				enabledOutOfCombat=true,
				enabledUncappedOutOfCombat=false,
				mode="gcd",
				gcdsMax=3.5,
				timeMax=5.0
			},
			passiveGeneration = {
				innervate = true,
				manaTideTotem = true,
				symbolOfHope = true
			},
			colors={
				text={
					current="FF4D4DFF",
					casting="FFFFFFFF",
					passive="FF8080FF",
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
				bar={
					border="FF000099",
					background="66000000",
					base="FF0000FF",
					innervate="FF00FF00",
					apotheosis="FFFADA5E",
					apotheosisEnd="FFFF0000",
					holyWordChastise="FFAAFFAA",
					holyWordSanctify="FF55FF55",
					holyWordSerenity="FF00FF00",
					surgeOfLight1="FFFCE58E",
					surgeOfLight2="FFAF9942",
					flashConcentration="FFFF0000",
					--casting="FF555555",
					spending="FFFFFFFF",
					passive="FF8080FF",
					surgeOfLightBorderChange1=true,
					surgeOfLightBorderChange2=true,
					innervateBorderChange=true,
					--flashAlpha=0.70,
					--flashPeriod=0.5,
					--flashEnabled=true,
				},
				threshold={
					unusable="FFFF0000",
					over="FF00FF00",
					mindbender="FF8080FF"
				}
			},
			displayText={},
			audio={
				innervate={
					name = "Innervate",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				surgeOfLight={
					name = "Innervate (1 stack)",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				surgeOfLight2={
					name = "Innervate (2 stacks)",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\AirHorn.ogg",
					soundName="TRB: Air Horn"
				},
				flashConcentration={
					name = "Flash Concentration",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\AirHorn.ogg",
					soundName="TRB: Air Horn"
				}
			},
			textures={
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

		settings.displayText = HolyLoadDefaultBarTextSimpleSettings()
		return settings
	end

	local function HolyResetSettings()
		local settings = HolyLoadDefaultSettings()
		return settings
	end



	local function ShadowLoadDefaultBarTextSimpleSettings()
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
				text="{$vfTime}[{$hvTime}[$hvTime sec. (+$vbCasts)][$vfTime]]",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			},
			right={
				text="{$casting}[$casting + ]{$passive}[$passive + ]$insanity%",
				fontFace="Fonts\\FRIZQT__.TTF",
				fontFaceName="Friz Quadrata TT",
				fontSize=18
			}
		}

		return textSettings
	end

	local function ShadowLoadDefaultBarTextAdvancedSettings()
		local textSettings = {
			fontSizeLock = false,
			fontFaceLock = true,
			left = {
				text="#swp $swpCount   #dp $dpCount   $haste% ($gcd)||n#vt $vtCount   {$cttvEquipped}[#loi $ecttvCount][       ]   {$ttd}[TTD: $ttd]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			middle = {
				text="{$mdTime}[#mDev $mdTime #mDev{$vfTime}[||n]]{$vfTime}[{$hvAvgTime}[$hvAvgTime (+$vbAvgCasts)][$vfTime]]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			right = {
				text="{$casting}[#casting$casting+]{$asCount}[#as$asInsanity+]{$mbInsanity}[#mindbender$mbInsanity+]{$wfInsanity}[#wf$wfInsanity+]{$loiInsanity}[#loi$loiInsanity+]{$damInsanity}[#dam$damInsanity+]$insanity",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 22
			}
		}

		return textSettings
	end

	local function ShadowLoadDefaultBarTextNarrowAdvancedSettings()
		local textSettings = {
			fontSizeLock = false,
			fontFaceLock = true,
			left = {
				text="#swp $swpCount   $haste% ($gcd)||n#vt $vtCount   {$ttd}[TTD: $ttd]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			middle = {
				text="{$mdTime}[#mDev $mdTime #mDev{$vfTime}[||n]]{$vfTime}[{$hvAvgTime}[$hvAvgTime (+$vbAvgCasts)][$vfTime]]",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 13
			},
			right = {
				text="{$casting}[#casting$casting+]{$passive}[$passive+]$insanity",
				fontFace = "Fonts\\FRIZQT__.TTF",
				fontFaceName = "Friz Quadrata TT",
				fontSize = 22
			}
		}

		return textSettings
	end

	local function ShadowLoadDefaultSettings()
		local settings = {
			hasteApproachingThreshold=135,
			hasteThreshold=140,
			s2mApproachingThreshold=15,
			s2mThreshold=20,
			hastePrecision=2,
			overcapThreshold=100,
			insanityPrecision=0,
			auspiciousSpiritsTracker=true,
			voidTendrilTracker=true,
			thresholds = {
				width = 2,
				overlapBorder=true,
				icons = {
					border=2,
					relativeTo = "TOP",
					relativeToName = "Above",
					enabled=true,
					xPos=0,
					yPos=-12,
					width=24,
					height=24
				},
				devouringPlague = { -- 1
					enabled = true,
				},
				searingNightmare = { -- 2
					enabled = true,
				}
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
			mindbender={
				mode="gcd",
				swingsMax=4,
				gcdsMax=2,
				timeMax=3.0,
				enabled=true,
				useNotification = {
					enabled=false,
					thresholdStacks=10
				}
			},
			wrathfulFaerie={
				mode="gcd",
				procsMax=4,
				gcdsMax=2,
				timeMax=3.0,
				procDelay=0.15,
				enabled=true
			},
			endOfVoidform = {
				enabled=true,
				hungeringVoidOnly=false,
				mode="gcd",
				gcdsMax=2,
				timeMax=3.0
			},
			colors={
				text={
					currentInsanity="FFC2A3E0",
					castingInsanity="FFFFFFFF",
					passiveInsanity="FFDF00FF",
					overcapInsanity="FFFF0000",
					overThreshold="FF00FF00",
					overThresholdEnabled=false,
					overcapEnabled=true,
					left="FFFFFFFF",
					middle="FFFFFFFF",
					right="FFFFFFFF",
					hasteBelow="FFFFFFFF",
					hasteApproaching="FFFFFF00",
					hasteAbove="FF00FF00",
					s2mBelow="FF00FF00",
					s2mApproaching="FFFFFF00",
					s2mAbove="FFFF0000",
					dots={
						enabled=true,
						up="FFFFFFFF",
						down="FFFF0000",
						pandemic="FFFFFF00"
					}
				},
				bar={
					border="FF431863",
					borderOvercap="FFFF0000",
					background="66000000",
					base="FF763BAF",
					devouringPlagueUsable="FF5C2F89",
					devouringPlagueUsableCasting="FFFFFFFF",
					inVoidform="FF431863",
					inVoidform1GCD="FFFF0000",
					casting="FFFFFFFF",
					passive="FFDF00FF",
					flashAlpha=0.70,
					flashPeriod=0.5,
					flashEnabled=true,
					overcapEnabled=true
				},
				threshold={
					under="FFFFFFFF",
					over="FF00FF00",
					mindbender="FFFF11FF"
				}
			},
			displayText={},
			audio={
				s2mDeath={
					name = "Surrender to Madness Death",
					enabled=true,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\wilhelm.ogg",
					soundName="TRB: Wilhelm Scream"
				},
				overcap={
					name = "Overcap",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\AirHorn.ogg",
					soundName="TRB: Air Horn"
				},
				mdProc={
					name = "Mind Devourer Proc",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				dpReady={
					name = "Devouring Plague Ready",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				},
				mindbender={
					name = "Mindbender Ready",
					enabled=false,
					sound="Interface\\Addons\\TwintopInsanityBar\\Sounds\\BoxingArenaSound.ogg",
					soundName="TRB: Boxing Arena Gong"
				}
			},
			textures={
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

		settings.displayText = ShadowLoadDefaultBarTextSimpleSettings()
		return settings
	end

	local function ShadowResetSettings()
		local settings = ShadowLoadDefaultSettings()
		return settings
	end



	local function LoadDefaultSettings()
		local settings = TRB.Options.LoadDefaultSettings()
		settings.priest.holy = HolyLoadDefaultSettings()
		settings.priest.shadow = ShadowLoadDefaultSettings()
		return settings
	end
	TRB.Options.Priest.LoadDefaultSettings = LoadDefaultSettings


	--[[

	Holy Option Menus

	]]

	local function HolyConstructResetDefaultsPanel(parent)
		if parent == nil then
			return
		end

		local controls = TRB.Frames.interfaceSettingsFrameContainer.controls.holy
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

		StaticPopupDialogs["TwintopResourceBar_Priest_Holy_Reset"] = {
			text = "Do you want to reset Twintop's Resource Bar back to its default configuration? Only the Holy Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.holy = HolyResetSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Priest_Holy_ResetBarTextSimple"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (simple) configuration? Only the Holy Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.holy.displayText = HolyLoadDefaultBarTextSimpleSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Priest_Holy_ResetBarTextAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (advanced) configuration? Only the Holy Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.holy.displayText = HolyLoadDefaultBarTextAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		--[[
		StaticPopupDialogs["TwintopResourceBar_Priest_Holy_ResetBarTextNarrowAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (narrow advanced) configuration? Only the Holy Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.holy.displayText = HolyLoadDefaultBarTextNarrowAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		]]

		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar to Defaults", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton = TRB.UiFunctions:BuildButton(parent, "Reset to Defaults", xCoord, yCoord, 150, 30)
		controls.resetButton:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Holy_Reset")
		end)

		yCoord = yCoord - 40
		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar Text", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton1 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Simple)", xCoord, yCoord, 250, 30)
		controls.resetButton1:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Holy_ResetBarTextSimple")
        end)
		yCoord = yCoord - 40

		--[[
		controls.resetButton2 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Narrow Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton2:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Holy_ResetBarTextNarrowAdvanced")
		end)
		]]

		controls.resetButton3 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Full Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton3:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Holy_ResetBarTextAdvanced")
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.holy = controls
	end

	local function HolyConstructBarColorsAndBehaviorPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.holy
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

		local maxBorderHeight = math.min(math.floor(TRB.Data.settings.priest.holy.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.holy.bar.width / TRB.Data.constants.borderWidthFactor))

		local sanityCheckValues = TRB.Functions.GetSanityCheckValues(TRB.Data.settings.priest.holy)

		controls.buttons.exportButton_Priest_Holy_BarDisplay = TRB.UiFunctions:BuildButton(parent, "Export Bar Display", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Holy_BarDisplay:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Holy Priest (Bar Display).", 5, 2, true, false, false, false, false)
		end)

		controls.barPositionSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Position and Size", 0, yCoord)

		yCoord = yCoord - 40
		title = "Bar Width"
		controls.width = TRB.UiFunctions:BuildSlider(parent, title, sanityCheckValues.barMinWidth, sanityCheckValues.barMaxWidth, TRB.Data.settings.priest.holy.bar.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.width:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.bar.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.holy.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.holy.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.holy.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 2 then
				TRB.Functions.UpdateBarWidth(TRB.Data.settings.priest.holy)
			end
		end)

		title = "Bar Height"
		controls.height = TRB.UiFunctions:BuildSlider(parent, title, sanityCheckValues.barMinHeight, sanityCheckValues.barMaxHeight, TRB.Data.settings.priest.holy.bar.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.height:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.bar.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.holy.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.holy.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.holy.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 2 then
				TRB.Functions.UpdateBarHeight(TRB.Data.settings.priest.holy)
			end
		end)

		title = "Bar Horizontal Position"
		yCoord = yCoord - 60
		controls.horizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.priest.holy.bar.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.horizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.bar.xPos = value
			
			if GetSpecialization() == 2 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.priest.holy.bar.xPos, TRB.Data.settings.priest.holy.bar.yPos)
			end
		end)

		title = "Bar Vertical Position"
		controls.vertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.priest.holy.bar.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.vertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.bar.yPos = value
			
			if GetSpecialization() == 2 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.priest.holy.bar.xPos, TRB.Data.settings.priest.holy.bar.yPos)
			end
		end)

		title = "Bar Border Width"
		yCoord = yCoord - 60
		controls.borderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxBorderHeight, TRB.Data.settings.priest.holy.bar.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.borderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.bar.border = value
			
			if GetSpecialization() == 2 then
				barContainerFrame:SetWidth(TRB.Data.settings.priest.holy.bar.width-(TRB.Data.settings.priest.holy.bar.border*2))
				barContainerFrame:SetHeight(TRB.Data.settings.priest.holy.bar.height-(TRB.Data.settings.priest.holy.bar.border*2))
				barBorderFrame:SetWidth(TRB.Data.settings.priest.holy.bar.width)
				barBorderFrame:SetHeight(TRB.Data.settings.priest.holy.bar.height)
				if TRB.Data.settings.priest.holy.bar.border < 1 then
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.priest.holy.textures.border,
						tile = true,
						tileSize = 4,
						edgeSize = 1,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Hide()
				else
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.priest.holy.textures.border,
						tile = true,
						tileSize=4,
						edgeSize=TRB.Data.settings.priest.holy.bar.border,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Show()
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.border, true))

				TRB.Functions.SetBarMinMaxValues(TRB.Data.settings.priest.holy)
			end

			local minsliderWidth = math.max(TRB.Data.settings.priest.holy.bar.border*2, 120)
			local minsliderHeight = math.max(TRB.Data.settings.priest.holy.bar.border*2, 1)
			controls.height:SetMinMaxValues(minsliderHeight, sanityCheckValues.barMaxHeight)
			controls.height.MinLabel:SetText(minsliderHeight)
			controls.width:SetMinMaxValues(minsliderWidth, sanityCheckValues.barMaxWidth)
			controls.width.MinLabel:SetText(minsliderWidth)
		end)

		title = "Threshold Line Width"
		controls.thresholdWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.holy.thresholds.width, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.width = value
			
			if GetSpecialization() == 2 then
				resourceFrame.thresholds[1]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				resourceFrame.thresholds[2]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				resourceFrame.thresholds[3]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				resourceFrame.thresholds[4]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				passiveFrame.thresholds[1]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				passiveFrame.thresholds[2]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				passiveFrame.thresholds[3]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				passiveFrame.thresholds[4]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
				passiveFrame.thresholds[5]:SetWidth(TRB.Data.settings.priest.holy.thresholds.width)
			end
		end)

		yCoord = yCoord - 40

		--NOTE: the order of these checkboxes is reversed!

		controls.checkBoxes.lockPosition = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_dragAndDrop", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.lockPosition
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Drag & Drop Movement Enabled")
		f.tooltip = "Disable Drag & Drop functionality of the bar to keep it from accidentally being moved.\n\nWhen 'Pin to Personal Resource Display' is checked, this value is ignored and cannot be changed."
		f:SetChecked(TRB.Data.settings.priest.holy.bar.dragAndDrop)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.dragAndDrop = self:GetChecked()
			barContainerFrame:SetMovable((not TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.holy.bar.dragAndDrop)
			barContainerFrame:EnableMouse((not TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.holy.bar.dragAndDrop)
		end)

		TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay)

		controls.checkBoxes.pinToPRD = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_pinToPRD", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.pinToPRD
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Pin to Personal Resource Display")
		f.tooltip = "Pins the bar to the Blizzard Personal Resource Display. Adjust the Horizontal and Vertical positions above to offset it from PRD. When enabled, Drag & Drop positioning is not allowed. If PRD is not enabled, will behave as if you didn't have this enabled.\n\nNOTE: This will also be the position (relative to the center of the screen, NOT the PRD) that it shows when out of combat/the PRD is not displayed! It is recommended you set 'Bar Display' to 'Only show bar in combat' if you plan to pin it to your PRD."
		f:SetChecked(TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay = self:GetChecked()

			TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay)

			barContainerFrame:SetMovable((not TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.holy.bar.dragAndDrop)
			barContainerFrame:EnableMouse((not TRB.Data.settings.priest.holy.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.holy.bar.dragAndDrop)
			TRB.Functions.RepositionBar(TRB.Data.settings.priest.holy, TRB.Frames.barContainerFrame)
		end)


		yCoord = yCoord - 30
		controls.textBarTexturesSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Textures", 0, yCoord)
		yCoord = yCoord - 30

		-- Create the dropdown, and configure its appearance
		controls.dropDown.resourceBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_ManaBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.resourceBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Main Bar Texture", xCoord, yCoord)
		controls.dropDown.resourceBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.resourceBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.resourceBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.priest.holy.textures.resourceBarName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.holy.textures.resourceBar
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
			TRB.Data.settings.priest.holy.textures.resourceBar = newValue
			TRB.Data.settings.priest.holy.textures.resourceBarName = newName
			resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.resourceBar)
			UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
			if TRB.Data.settings.priest.holy.textures.textureLock then
				TRB.Data.settings.priest.holy.textures.castingBar = newValue
				TRB.Data.settings.priest.holy.textures.castingBarName = newName
				castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.castingBar)
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
				TRB.Data.settings.priest.holy.textures.passiveBar = newValue
				TRB.Data.settings.priest.holy.textures.passiveBarName = newName
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.passiveBar)
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			end
			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.castingBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_CastBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.castingBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Casting Bar Texture", xCoord2, yCoord)
		controls.dropDown.castingBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.castingBarTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.castingBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.priest.holy.textures.castingBarName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.holy.textures.castingBar
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
			TRB.Data.settings.priest.holy.textures.castingBar = newValue
			TRB.Data.settings.priest.holy.textures.castingBarName = newName
			castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.castingBar)
			UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			if TRB.Data.settings.priest.holy.textures.textureLock then
				TRB.Data.settings.priest.holy.textures.resourceBar = newValue
				TRB.Data.settings.priest.holy.textures.resourceBarName = newName
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.resourceBar)
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.priest.holy.textures.passiveBar = newValue
				TRB.Data.settings.priest.holy.textures.passiveBarName = newName
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.passiveBar)
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			end
			CloseDropDownMenus()
		end

		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.passiveBarTexture = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_PassiveBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.passiveBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Passive Bar Texture", xCoord, yCoord)
		controls.dropDown.passiveBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.passiveBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.passiveBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, TRB.Data.settings.priest.holy.textures.passiveBarName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.holy.textures.passiveBar
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
			TRB.Data.settings.priest.holy.textures.passiveBar = newValue
			TRB.Data.settings.priest.holy.textures.passiveBarName = newName
			passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.passiveBar)
			UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			if TRB.Data.settings.priest.holy.textures.textureLock then
				TRB.Data.settings.priest.holy.textures.resourceBar = newValue
				TRB.Data.settings.priest.holy.textures.resourceBarName = newName
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.resourceBar)
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.priest.holy.textures.castingBar = newValue
				TRB.Data.settings.priest.holy.textures.castingBarName = newName
				castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.castingBar)
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			end
			CloseDropDownMenus()
		end

		controls.checkBoxes.textureLock = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_CB1_TEXTURE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.textureLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same texture for all bars")
		f.tooltip = "This will lock the texture for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.priest.holy.textures.textureLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.textures.textureLock = self:GetChecked()
			if TRB.Data.settings.priest.holy.textures.textureLock then
				TRB.Data.settings.priest.holy.textures.passiveBar = TRB.Data.settings.priest.holy.textures.resourceBar
				TRB.Data.settings.priest.holy.textures.passiveBarName = TRB.Data.settings.priest.holy.textures.resourceBarName
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.passiveBar)
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.priest.holy.textures.passiveBarName)
				TRB.Data.settings.priest.holy.textures.castingBar = TRB.Data.settings.priest.holy.textures.resourceBar
				TRB.Data.settings.priest.holy.textures.castingBarName = TRB.Data.settings.priest.holy.textures.resourceBarName
				castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.holy.textures.castingBar)
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.priest.holy.textures.castingBarName)
			end
		end)


		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.borderTexture = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_BorderTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.borderTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Border Texture", xCoord, yCoord)
		controls.dropDown.borderTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.borderTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.borderTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.borderTexture, TRB.Data.settings.priest.holy.textures.borderName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.holy.textures.border
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
			TRB.Data.settings.priest.holy.textures.border = newValue
			TRB.Data.settings.priest.holy.textures.borderName = newName
			if TRB.Data.settings.priest.holy.bar.border < 1 then
				barBorderFrame:SetBackdrop({ })
			else
				barBorderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.priest.holy.textures.border,
											tile = true,
											tileSize=4,
											edgeSize=TRB.Data.settings.priest.holy.bar.border,
											insets = {0, 0, 0, 0}
											})
			end
			barBorderFrame:SetBackdropColor(0, 0, 0, 0)
			barBorderFrame:SetBackdropBorderColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.border, true))
			UIDropDownMenu_SetText(controls.dropDown.borderTexture, newName)
			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.backgroundTexture = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_BackgroundTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.backgroundTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Background (Empty Bar) Texture", xCoord2, yCoord)
		controls.dropDown.backgroundTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.backgroundTexture:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.backgroundTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, TRB.Data.settings.priest.holy.textures.backgroundName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.holy.textures.background
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
			TRB.Data.settings.priest.holy.textures.background = newValue
			TRB.Data.settings.priest.holy.textures.backgroundName = newName
			barContainerFrame:SetBackdrop({
				bgFile = TRB.Data.settings.priest.holy.textures.background,
				tile = true,
				tileSize = TRB.Data.settings.priest.holy.bar.width,
				edgeSize = 1,
				insets = {0, 0, 0, 0}
			})
			barContainerFrame:SetBackdropColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.background, true))
			UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, newName)
			CloseDropDownMenus()
		end


		yCoord = yCoord - 70
		controls.barDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display", 0, yCoord)

		--[[
		yCoord = yCoord - 50
		title = "Devouring Plague Flash Alpha"
		controls.flashAlpha = TRB.UiFunctions:BuildSlider(parent, title, 0, 1, TRB.Data.settings.priest.holy.colors.bar.flashAlpha, 0.01, 2,
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
			TRB.Data.settings.priest.holy.colors.bar.flashAlpha = value
		end)

		title = "Devouring Plague Flash Period (sec)"
		controls.flashPeriod = TRB.UiFunctions:BuildSlider(parent, title, 0, 2, TRB.Data.settings.priest.holy.colors.bar.flashPeriod, 0.05, 2,
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
			TRB.Data.settings.priest.holy.colors.bar.flashPeriod = value
		end)
		]]

		yCoord = yCoord - 30
		controls.checkBoxes.alwaysShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_RB1_2", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.alwaysShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Always show bar")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar always visible on your UI, even when out of combat."
		f:SetChecked(TRB.Data.settings.priest.holy.displayBar.alwaysShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(true)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.priest.holy.displayBar.alwaysShow = true
			TRB.Data.settings.priest.holy.displayBar.notZeroShow = false
			TRB.Data.settings.priest.holy.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.notZeroShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_RB1_3", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.notZeroShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-15)
		getglobal(f:GetName() .. 'Text'):SetText("Show bar when Mana is not full")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar show out of combat only if Mana is not full, hidden otherwise when out of combat."
		f:SetChecked(TRB.Data.settings.priest.holy.displayBar.notZeroShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(true)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.priest.holy.displayBar.alwaysShow = false
			TRB.Data.settings.priest.holy.displayBar.notZeroShow = true
			TRB.Data.settings.priest.holy.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.combatShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_RB1_4", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.combatShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Only show bar in combat")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar only be visible on your UI when in combat."
		f:SetChecked((not TRB.Data.settings.priest.holy.displayBar.alwaysShow) and (not TRB.Data.settings.priest.holy.displayBar.notZeroShow) and (not TRB.Data.settings.priest.holy.displayBar.neverShow))
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(true)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.priest.holy.displayBar.alwaysShow = false
			TRB.Data.settings.priest.holy.displayBar.notZeroShow = false
			TRB.Data.settings.priest.holy.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.neverShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_RB1_5", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.neverShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-45)
		getglobal(f:GetName() .. 'Text'):SetText("Never show bar (run in background)")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar never display but still run in the background to update the global variable."
		f:SetChecked(TRB.Data.settings.priest.holy.displayBar.neverShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(true)
			TRB.Data.settings.priest.holy.displayBar.alwaysShow = false
			TRB.Data.settings.priest.holy.displayBar.notZeroShow = false
			TRB.Data.settings.priest.holy.displayBar.neverShow = true
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.showCastingBar = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_showCastingBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showCastingBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show casting bar")
		f.tooltip = "This will show the casting bar when hardcasting a spell. Uncheck to hide this bar."
		f:SetChecked(TRB.Data.settings.priest.holy.bar.showCasting)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.showCasting = self:GetChecked()
		end)

		controls.checkBoxes.showPassiveBar = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_showPassiveBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showPassiveBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord-20)
		getglobal(f:GetName() .. 'Text'):SetText("Show passive bar")
		f.tooltip = "This will show the passive bar. Uncheck to hide this bar. This setting supercedes any other passive tracking options!"
		f:SetChecked(TRB.Data.settings.priest.holy.bar.showPassive)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.showPassive = self:GetChecked()
		end)

		--[[
		controls.checkBoxes.flashEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_CB1_5", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-40)
		getglobal(f:GetName() .. 'Text'):SetText("Flash bar when DP is usable")
		f.tooltip = "This will flash the bar when Devouring Plague can be cast."
		f:SetChecked(TRB.Data.settings.priest.holy.colors.bar.flashEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.colors.bar.flashEnabled = self:GetChecked()
		end)]]

		yCoord = yCoord - 70
		controls.checkBoxes.holyWordChastiseEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_holyWordChastiseEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.holyWordChastiseEnabled
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change mana bar color for Holy Word: Chastise cooldown")
		f.tooltip = "This will change the mana bar color when your current cast will complete the cooldown of Holy Word: Chastise."
		f:SetChecked(TRB.Data.settings.priest.holy.bar.holyWordChastiseEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.holyWordChastiseEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 20
		controls.checkBoxes.holyWordSanctifyEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_holyWordSanctifyEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.holyWordSanctifyEnabled
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change mana bar color for Holy Word: Sanctify cooldown")
		f.tooltip = "This will change the mana bar color when your current cast will complete the cooldown of Holy Word: Sanctify."
		f:SetChecked(TRB.Data.settings.priest.holy.bar.holyWordSanctifyEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.holyWordSanctifyEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 20
		controls.checkBoxes.holyWordSerenityEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_holyWordSerenityEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.holyWordSerenityEnabled
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change mana bar color for Holy Word: Serenity cooldown")
		f.tooltip = "This will change the mana bar color when your current cast will complete the cooldown of Holy Word: Serenity."
		f:SetChecked(TRB.Data.settings.priest.holy.bar.holyWordSerenityEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.bar.holyWordSerenityEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 30
		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.base = TRB.UiFunctions:BuildColorPicker(parent, "Mana", TRB.Data.settings.priest.holy.colors.bar.base, 300, 25, xCoord, yCoord)
		f = controls.colors.base
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.base, true)
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
					TRB.Data.settings.priest.holy.colors.bar.base = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)
		
		controls.colors.holyWordChastise = TRB.UiFunctions:BuildColorPicker(parent, "Mana when your cast will complete the cooldown of Holy Word: Chastise", TRB.Data.settings.priest.holy.colors.bar.holyWordChastise, 275, 25, xCoord2, yCoord)
		f = controls.colors.holyWordChastise
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.holyWordChastise, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.holyWordChastise.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.holyWordChastise = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.spending = TRB.UiFunctions:BuildColorPicker(parent, "Mana cost of current hardcast spell", TRB.Data.settings.priest.holy.colors.bar.spending, 300, 25, xCoord, yCoord)
		f = controls.colors.spending
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.spending, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.spending.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.spending = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					castingFrame:SetStatusBarColor(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.holyWordSanctify = TRB.UiFunctions:BuildColorPicker(parent, "Mana when your cast will complete the cooldown of Holy Word: Sanctify", TRB.Data.settings.priest.holy.colors.bar.holyWordSanctify, 275, 25, xCoord2, yCoord)
		f = controls.colors.holyWordSanctify
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.holyWordSanctify, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.holyWordSanctify.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.holyWordSanctify = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.inApotheosis = TRB.UiFunctions:BuildColorPicker(parent, "Mana while Apotheosis is active", TRB.Data.settings.priest.holy.colors.bar.apotheosis, 300, 25, xCoord, yCoord)
		f = controls.colors.inApotheosis
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.apotheosis, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.inApotheosis.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.apotheosis = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.holyWordSerenity = TRB.UiFunctions:BuildColorPicker(parent, "Mana when your cast will complete the cooldown of Holy Word: Serenity", TRB.Data.settings.priest.holy.colors.bar.holyWordSerenity, 275, 25, xCoord2, yCoord)
		f = controls.colors.holyWordSerenity
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.holyWordSerenity, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.holyWordSerenity.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.holyWordSerenity = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.inApotheosisEnd = TRB.UiFunctions:BuildColorPicker(parent, "Mana when Apotheosis is close to ending (configurable/if enabled)", TRB.Data.settings.priest.holy.colors.bar.apotheosisEnd, 300, 25, xCoord, yCoord)
		f = controls.colors.inApotheosisEnd
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.apotheosisEnd, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.inApotheosisEnd.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.apotheosisEnd = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.background = TRB.UiFunctions:BuildColorPicker(parent, "Unfilled bar background", TRB.Data.settings.priest.holy.colors.bar.background, 275, 25, xCoord2, yCoord)
		f = controls.colors.background
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.background, true)
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
					TRB.Data.settings.priest.holy.colors.bar.background = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					barContainerFrame:SetBackdropColor(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.passive = TRB.UiFunctions:BuildColorPicker(parent, "Mana from Passive Sources (Potions, Mana Tide Totem bonus regen, Wrathful Faerie procs, etc)", TRB.Data.settings.priest.holy.colors.bar.passive, 550, 25, xCoord, yCoord)
		f = controls.colors.passive
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.passive, true)
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
					TRB.Data.settings.priest.holy.colors.bar.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)


		yCoord = yCoord - 40
		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Border Color + Changing", 0, yCoord)

		yCoord = yCoord - 25
		controls.colors.border = TRB.UiFunctions:BuildColorPicker(parent, "Bar's normal/base border", TRB.Data.settings.priest.holy.colors.bar.border, 275, 25, xCoord2, yCoord-0)
		f = controls.colors.border
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.border, true)
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
					TRB.Data.settings.priest.holy.colors.bar.border = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					barBorderFrame:SetBackdropBorderColor(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.innervate = TRB.UiFunctions:BuildColorPicker(parent, "Border when you have Innervate", TRB.Data.settings.priest.holy.colors.bar.innervate, 275, 25, xCoord2, yCoord-30)
		f = controls.colors.innervate
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.innervate, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.innervate.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.innervate = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.surgeOfLight1 = TRB.UiFunctions:BuildColorPicker(parent, "Border when you have 1 stack of Surge of Light", TRB.Data.settings.priest.holy.colors.bar.surgeOfLight1, 275, 25, xCoord2, yCoord-60)
		f = controls.colors.surgeOfLight1
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.surgeOfLight1, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.surgeOfLight1.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.surgeOfLight1 = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)
						
		controls.colors.surgeOfLight2 = TRB.UiFunctions:BuildColorPicker(parent, "Border when you have 2 stacks of Surge of Light", TRB.Data.settings.priest.holy.colors.bar.surgeOfLight2, 275, 25, xCoord2, yCoord-90)
		f = controls.colors.surgeOfLight2
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.surgeOfLight2, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.surgeOfLight2.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.surgeOfLight2 = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.flashConcentration = TRB.UiFunctions:BuildColorPicker(parent, "Border when Flash Concentration is expiring or not up (per settings)", TRB.Data.settings.priest.holy.colors.bar.flashConcentration, 275, 25, xCoord2, yCoord-120)
		f = controls.colors.flashConcentration
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.bar.flashConcentration, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.flashConcentration.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.bar.flashConcentration = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)


		yCoord = yCoord - 30
		controls.checkBoxes.innervateBorderChange = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_innervateBorderChange", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.innervateBorderChange
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Innervate")
		f.tooltip = "This will change the bar border color when you have Innervate."
		f:SetChecked(TRB.Data.settings.priest.holy.colors.bar.innervateBorderChange)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.colors.bar.innervateBorderChange = self:GetChecked()
		end)
		
		yCoord = yCoord - 30
		controls.checkBoxes.surgeOfLight1BorderChange = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_surgeOfLight1BorderChange", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.surgeOfLight1BorderChange
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Surge of Light (1 stack)")
		f.tooltip = "This will change the bar border color when you have 1 stack of Surge of Light."
		f:SetChecked(TRB.Data.settings.priest.holy.colors.bar.surgeOfLightBorderChange1)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.colors.bar.surgeOfLightBorderChange1 = self:GetChecked()
		end)
		
		yCoord = yCoord - 30
		controls.checkBoxes.surgeOfLight2BorderChange = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_surgeOfLight2BorderChange", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.surgeOfLight2BorderChange
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Surge of Light (2 stacks)")
		f.tooltip = "This will change the bar border color when you have 2 stacks of Surge of Light."
		f:SetChecked(TRB.Data.settings.priest.holy.colors.bar.surgeOfLightBorderChange2)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.colors.bar.surgeOfLightBorderChange2 = self:GetChecked()
		end)


		yCoord = yCoord - 30

		yCoord = yCoord - 40
		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Threshold Lines", 0, yCoord)

		yCoord = yCoord - 25
		controls.colors.thresholdOver = TRB.UiFunctions:BuildColorPicker(parent, "Mana gain from potions (when usable)", TRB.Data.settings.priest.holy.colors.threshold.over, 275, 25, xCoord2, yCoord-0)
		f = controls.colors.thresholdOver
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.threshold.over, true)
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
                    TRB.Data.settings.priest.holy.colors.threshold.over = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.thresholdUnusable = TRB.UiFunctions:BuildColorPicker(parent, "Mana potion on cooldown", TRB.Data.settings.priest.holy.colors.threshold.unusable, 275, 25, xCoord2, yCoord-30)
		f = controls.colors.thresholdUnusable
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.threshold.unusable, true)
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
                    TRB.Data.settings.priest.holy.colors.threshold.unusable = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.passiveThreshold = TRB.UiFunctions:BuildColorPicker(parent, "Passive mana gain per source", TRB.Data.settings.priest.holy.colors.threshold.mindbender, 275, 25, xCoord2, yCoord-60)
		f = controls.colors.passiveThreshold
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.threshold.mindbender, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.passiveThreshold.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.threshold.mindbender = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					if GetSpecialization() == 2 then
						passiveFrame.thresholds[1].texture:SetColorTexture(r, g, b, 1-a)
						passiveFrame.thresholds[2].texture:SetColorTexture(r, g, b, 1-a)
						passiveFrame.thresholds[3].texture:SetColorTexture(r, g, b, 1-a)
						passiveFrame.thresholds[4].texture:SetColorTexture(r, g, b, 1-a)
						passiveFrame.thresholds[5].texture:SetColorTexture(r, g, b, 1-a)
					end
				end)
			end
		end)

		controls.checkBoxes.thresholdOverlapBorder = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_thresholdOverlapBorder", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdOverlapBorder
		f:SetPoint("TOPLEFT", xCoord2, yCoord-90)
		getglobal(f:GetName() .. 'Text'):SetText("Threshold lines overlap bar border?")
		f.tooltip = "When checked, threshold lines will span the full height of the bar and overlap the bar border."
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.overlapBorder)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.overlapBorder = self:GetChecked()
			TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.holy)
		end)

		controls.checkBoxes.potionOfSpiritualClarityThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_potionOfSpiritualClarity", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.potionOfSpiritualClarityThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Potion of Spiritual Clarity (10,000 + regen)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Mana you will gain if you use a Potion of Spirital Clarity (10,000 + 10 seconds of passive mana regen)"
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.potionOfSpiritualClarity.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.potionOfSpiritualClarity.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.soulfulManaPotionThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_soulfulManaPotion", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.soulfulManaPotionThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Soulful Mana Potion (4,000)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Mana you will gain if you use a Soulful Mana Potion (4,000)"
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.soulfulManaPotion.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.soulfulManaPotion.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.spiritualManaPotionThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_spiritualManaPotion", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.spiritualManaPotionThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Spiritual Mana Potion (6,000)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Mana you will gain if you use a Spiritual Mana Potion (6,000)"
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.spiritualManaPotion.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.spiritualManaPotion.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.spiritualRejuvenationPotionThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Threshold_Option_spiritualRejuvenationPotion", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.spiritualRejuvenationPotionThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Spiritual Rejuvenation Potion (2,500)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Mana you will gain if you use a Spiritual Rejuvenation Potion (2,500)"
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.spiritualRejuvenationPotion.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.spiritualRejuvenationPotion.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		yCoord = yCoord - 25

        -- Create the dropdown, and configure its appearance
        controls.dropDown.thresholdIconRelativeTo = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_thresholdIconRelativeTo", parent, "UIDropDownMenuTemplate")
        controls.dropDown.thresholdIconRelativeTo.label = TRB.UiFunctions:BuildSectionHeader(parent, "Relative Position of Threshold Line Icons", xCoord, yCoord)
        controls.dropDown.thresholdIconRelativeTo.label.font:SetFontObject(GameFontNormal)
        controls.dropDown.thresholdIconRelativeTo:SetPoint("TOPLEFT", xCoord, yCoord-30)
        UIDropDownMenu_SetWidth(controls.dropDown.thresholdIconRelativeTo, dropdownWidth)
        UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, TRB.Data.settings.priest.holy.thresholds.icons.relativeToName)
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
                info.checked = relativeTo[v] == TRB.Data.settings.priest.holy.thresholds.icons.relativeTo
                info.func = self.SetValue
                info.arg1 = relativeTo[v]
                info.arg2 = v
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        function controls.dropDown.thresholdIconRelativeTo:SetValue(newValue, newName)
            TRB.Data.settings.priest.holy.thresholds.icons.relativeTo = newValue
            TRB.Data.settings.priest.holy.thresholds.icons.relativeToName = newName
			
			if GetSpecialization() == 2 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.holy)
			end

            UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, newName)
            CloseDropDownMenus()
        end

		controls.checkBoxes.thresholdIconEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_thresholdIconEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdIconEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Show ability icons for threshold lines?")
		f.tooltip = "When checked, icons for the threshold each line represents will be displayed. Configuration of size and location of these icons is below."
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.icons.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.icons.enabled = self:GetChecked()
			
			if GetSpecialization() == 2 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.holy)

				if TRB.Data.settings.priest.holy.thresholds.icons.enabled then
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
		controls.thresholdIconWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.priest.holy.thresholds.icons.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.icons.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.holy.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.holy.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.holy.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
						
			if GetSpecialization() == 2 then
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[1], "potionOfSpiritualClarity", TRB.Data.settings.priest.holy)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[2], "spiritualRejuvenationPotion", TRB.Data.settings.priest.holy)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[3], "spiritualManaPotion", TRB.Data.settings.priest.holy)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[4], "soulfulManaPotion", TRB.Data.settings.priest.holy)
			end
		end)

		title = "Threshold Icon Height"
		controls.thresholdIconHeight = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.priest.holy.thresholds.icons.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconHeight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.icons.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.holy.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.holy.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.holy.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
						
			if GetSpecialization() == 2 then
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[1], "potionOfSpiritualClarity", TRB.Data.settings.priest.holy)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[2], "spiritualRejuvenationPotion", TRB.Data.settings.priest.holy)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[3], "spiritualManaPotion", TRB.Data.settings.priest.holy)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[4], "soulfulManaPotion", TRB.Data.settings.priest.holy)
			end
		end)


		title = "Threshold Icon Horizontal Position (Relative)"
		yCoord = yCoord - 60
		controls.thresholdIconHorizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.priest.holy.thresholds.icons.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconHorizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.icons.xPos = value

			if GetSpecialization() == 1 then
				TRB.Functions.RepositionBar(TRB.Data.settings.priest.holy, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Threshold Icon Vertical Position (Relative)"
		controls.thresholdIconVertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.priest.holy.thresholds.icons.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconVertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.icons.yPos = value
		end)

		local maxIconBorderHeight = math.min(math.floor(TRB.Data.settings.priest.holy.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.holy.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))

		title = "Threshold Icon Border Width"
		yCoord = yCoord - 60
		controls.thresholdIconBorderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxIconBorderHeight, TRB.Data.settings.priest.holy.thresholds.icons.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconBorderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.icons.border = value

			local minsliderWidth = math.max(TRB.Data.settings.priest.holy.thresholds.icons.border*2, 1)
			local minsliderHeight = math.max(TRB.Data.settings.priest.holy.thresholds.icons.border*2, 1)

			controls.thresholdIconHeight:SetMinMaxValues(minsliderHeight, 128)
			controls.thresholdIconHeight.MinLabel:SetText(minsliderHeight)
			controls.thresholdIconWidth:SetMinMaxValues(minsliderWidth, 128)
			controls.thresholdIconWidth.MinLabel:SetText(minsliderWidth)

			if GetSpecialization() == 2 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.holy)
			end
		end)


		yCoord = yCoord - 60
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Potion on Cooldown Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.potionCooldown = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_potionCooldown_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.potionCooldown
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show potion threshold lines when potion is on cooldown")
		f.tooltip = "Shows the potion threshold lines while potion use is still on cooldown. Configure below how far in advance to have the lines be visible, between 0 - 300 seconds (300 being effectively 'always visible')."
		f:SetChecked(TRB.Data.settings.priest.holy.thresholds.potionCooldown.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.thresholds.potionCooldown.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.potionCooldownModeGCDs = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_potionCooldown_M_GCD", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.potionCooldownModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("GCDs left on Potion cooldown")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Show potion threshold lines based on how many GCDs remain on potion cooldown."
		if TRB.Data.settings.priest.holy.thresholds.potionCooldown.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.potionCooldownModeGCDs:SetChecked(true)
			controls.checkBoxes.potionCooldownModeTime:SetChecked(false)
			TRB.Data.settings.priest.holy.thresholds.potionCooldown.mode = "gcd"
		end)

		title = "Potion Cooldown GCDs - 0.75sec Floor"
		controls.potionCooldownGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0, 400, TRB.Data.settings.priest.holy.thresholds.potionCooldown.gcdsMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.potionCooldownGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.potionCooldown.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.potionCooldownModeTime = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_potionCooldown_M_TIME", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.potionCooldownModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Time left on Potion cooldown")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many seconds remain until Apotheosis will end."
		if TRB.Data.settings.priest.holy.thresholds.potionCooldown.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.potionCooldownModeGCDs:SetChecked(false)
			controls.checkBoxes.potionCooldownModeTime:SetChecked(true)
			TRB.Data.settings.priest.holy.thresholds.potionCooldown.mode = "time"
		end)

		title = "Potion Cooldown Time Remaining"
		controls.potionCooldownTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 300, TRB.Data.settings.priest.holy.thresholds.potionCooldown.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.potionCooldownTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.thresholds.potionCooldown.timeMax = value
		end)


		yCoord = yCoord - 30
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "End of Apotheosis Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.endOfApotheosis = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_EOA_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.endOfApotheosis
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change bar color at the end of Apotheosis")
		f.tooltip = "Changes the bar color when Apotheosis is ending in the next X GCDs or fixed length of time. Select which to use from the options below."
		f:SetChecked(TRB.Data.settings.priest.holy.endOfApotheosis.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.endOfApotheosis.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.endOfApotheosisModeGCDs = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_EOA_M_GCD", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.endOfApotheosisModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("GCDs until Apotheosis ends")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many GCDs remain until Apotheosis ends."
		if TRB.Data.settings.priest.holy.endOfApotheosis.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.endOfApotheosisModeGCDs:SetChecked(true)
			controls.checkBoxes.endOfApotheosisModeTime:SetChecked(false)
			TRB.Data.settings.priest.holy.endOfApotheosis.mode = "gcd"
		end)

		title = "Apotheosis GCDs - 0.75sec Floor"
		controls.endOfApotheosisGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0.5, 10, TRB.Data.settings.priest.holy.endOfApotheosis.gcdsMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.endOfApotheosisGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.endOfApotheosis.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.endOfApotheosisModeTime = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_EOA_M_TIME", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.endOfApotheosisModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Time until Apotheosis ends")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many seconds remain until Apotheosis will end."
		if TRB.Data.settings.priest.holy.endOfApotheosis.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.endOfApotheosisModeGCDs:SetChecked(false)
			controls.checkBoxes.endOfApotheosisModeTime:SetChecked(true)
			TRB.Data.settings.priest.holy.endOfApotheosis.mode = "time"
		end)

		title = "Apotheosis Time Remaining"
		controls.endOfApotheosisTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 15, TRB.Data.settings.priest.holy.endOfApotheosis.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.endOfApotheosisTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.endOfApotheosis.timeMax = value
		end)


		yCoord = yCoord - 30
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Flash Concentration Expiration Configuration", 0, yCoord)


		--NOTE: the order of these checkboxes is reversed!
		yCoord = yCoord - 30
		controls.checkBoxes.flashConcentrationOOC = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_flashConcentrationOOC_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashConcentrationOOC
		f:SetPoint("TOPLEFT", xCoord+xPadding*2, yCoord-20)
		getglobal(f:GetName() .. 'Text'):SetText("Also change bar border color for expiration when out of combat?")
		f.tooltip = "Changes the bar's border color for Flash Concentration when your buff will expire when both in and out of combat."
		f:SetChecked(TRB.Data.settings.priest.holy.flashConcentration.enabledOutOfCombat)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.flashConcentration.enabledOutOfCombat = self:GetChecked()
		end)

		controls.checkBoxes.flashConcentration = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_flashConcentration_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashConcentration
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change bar border when your Flash Concentration buff is close to expiring (if equipped)")
		f.tooltip = "Changes the bar border color when your Flash Concentration buff is expiring in the next X GCDs or fixed length of time. Select which to use from the options below."
		f:SetChecked(TRB.Data.settings.priest.holy.flashConcentration.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.flashConcentration.enabled = self:GetChecked()

			TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.flashConcentrationOOC, TRB.Data.settings.priest.holy.flashConcentration.enabled)
		end)

		TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.flashConcentrationOOC, TRB.Data.settings.priest.holy.flashConcentration.enableOutOfCombat)


		--NOTE: the order of these checkboxes is reversed!
		yCoord = yCoord - 40
		controls.checkBoxes.flashConcentrationUncappedOOC = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_flashConcentrationUncappedOOC_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashConcentrationUncappedOOC
		f:SetPoint("TOPLEFT", xCoord+xPadding*2, yCoord-20)
		getglobal(f:GetName() .. 'Text'):SetText("Also change bar border color for < 5 stacks when out of combat?")
		f.tooltip = "Changes the bar's border color for Flash Concentration when you do not have max stacks when both in and out of combat."
		f:SetChecked(TRB.Data.settings.priest.holy.flashConcentration.enabledUncappedOutOfCombat)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.flashConcentration.enabledUncappedOutOfCombat = self:GetChecked()
		end)

		controls.checkBoxes.flashConcentrationUncapped = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_flashConcentrationUncapped_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashConcentrationUncapped
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change bar border when your Flash Concentration buff has < 5 stacks (if equipped)")
		f.tooltip = "Changes the bar border color when your Flash Concentration buff has fewer than 5 (max) stacks."
		f:SetChecked(TRB.Data.settings.priest.holy.flashConcentration.enabledUncapped)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.flashConcentration.enabledUncapped = self:GetChecked()

			TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.flashConcentrationUncappedOOC, TRB.Data.settings.priest.holy.flashConcentration.enabledUncapped)
		end)

		TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.flashConcentrationUncappedOOC, TRB.Data.settings.priest.holy.flashConcentration.enabledUncapped)

		yCoord = yCoord - 60
		controls.checkBoxes.flashConcentrationModeGCDs = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_flashConcentration_M_GCD", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.flashConcentrationModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("GCDs left on Flash Concentration buff")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar border color based on how many GCDs remain until Flash Concentration will end."
		if TRB.Data.settings.priest.holy.flashConcentration.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.flashConcentrationModeGCDs:SetChecked(true)
			controls.checkBoxes.flashConcentrationModeTime:SetChecked(false)
			TRB.Data.settings.priest.holy.flashConcentration.mode = "gcd"
		end)

		title = "Flash Concentration GCDs - 0.75sec Floor"
		controls.flashConcentrationGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0, 30, TRB.Data.settings.priest.holy.flashConcentration.gcdsMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.flashConcentrationGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.flashConcentration.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.flashConcentrationModeTime = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_flashConcentration_M_TIME", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.flashConcentrationModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Time left on Flash Concentration buff")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar border color based on how many seconds remain until Flash Concentration will end."
		if TRB.Data.settings.priest.holy.flashConcentration.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.flashConcentrationModeGCDs:SetChecked(false)
			controls.checkBoxes.flashConcentrationModeTime:SetChecked(true)
			TRB.Data.settings.priest.holy.flashConcentration.mode = "time"
		end)

		title = "Flash Concentration Time Remaining"
		controls.flashConcentrationTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 20, TRB.Data.settings.priest.holy.flashConcentration.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.flashConcentrationTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.flashConcentration.timeMax = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.holy = controls
	end

	local function HolyConstructFontAndTextPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.holy
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

		controls.buttons.exportButton_Priest_Holy_FontAndText = TRB.UiFunctions:BuildButton(parent, "Export Font & Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Holy_FontAndText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Holy Priest (Font & Text).", 5, 2, false, true, false, false, false)
		end)

		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Face", 0, yCoord)

		yCoord = yCoord - 30

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontLeft = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_FontLeft", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontLeft.label = TRB.UiFunctions:BuildSectionHeader(parent, "Left Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontLeft.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontLeft:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontLeft, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontLeft, TRB.Data.settings.priest.holy.displayText.left.fontFaceName)
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
						info.checked = fonts[v] == TRB.Data.settings.priest.holy.displayText.left.fontFace
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
			TRB.Data.settings.priest.holy.displayText.left.fontFace = newValue
			TRB.Data.settings.priest.holy.displayText.left.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
			if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
				TRB.Data.settings.priest.holy.displayText.middle.fontFace = newValue
				TRB.Data.settings.priest.holy.displayText.middle.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
				TRB.Data.settings.priest.holy.displayText.right.fontFace = newValue
				TRB.Data.settings.priest.holy.displayText.right.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end

			if GetSpecialization() == 2 then
				leftTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.left.fontFace, TRB.Data.settings.priest.holy.displayText.left.fontSize, "OUTLINE")
				if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
					middleTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.middle.fontFace, TRB.Data.settings.priest.holy.displayText.middle.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.right.fontFace, TRB.Data.settings.priest.holy.displayText.right.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontMiddle = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_FontMiddle", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontMiddle.label = TRB.UiFunctions:BuildSectionHeader(parent, "Middle Bar Font Face", xCoord2, yCoord)
		controls.dropDown.fontMiddle.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontMiddle:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontMiddle, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.priest.holy.displayText.middle.fontFaceName)
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
						info.checked = fonts[v] == TRB.Data.settings.priest.holy.displayText.middle.fontFace
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
			TRB.Data.settings.priest.holy.displayText.middle.fontFace = newValue
			TRB.Data.settings.priest.holy.displayText.middle.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
				TRB.Data.settings.priest.holy.displayText.left.fontFace = newValue
				TRB.Data.settings.priest.holy.displayText.left.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.priest.holy.displayText.right.fontFace = newValue
				TRB.Data.settings.priest.holy.displayText.right.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end

			if GetSpecialization() == 2 then
				middleTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.middle.fontFace, TRB.Data.settings.priest.holy.displayText.middle.fontSize, "OUTLINE")
				if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
					leftTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.left.fontFace, TRB.Data.settings.priest.holy.displayText.left.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.right.fontFace, TRB.Data.settings.priest.holy.displayText.right.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		yCoord = yCoord - 40 - 20

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontRight = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_FontRight", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontRight.label = TRB.UiFunctions:BuildSectionHeader(parent, "Right Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontRight.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontRight:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontRight, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.priest.holy.displayText.right.fontFaceName)
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
						info.checked = fonts[v] == TRB.Data.settings.priest.holy.displayText.right.fontFace
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
			TRB.Data.settings.priest.holy.displayText.right.fontFace = newValue
			TRB.Data.settings.priest.holy.displayText.right.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
				TRB.Data.settings.priest.holy.displayText.left.fontFace = newValue
				TRB.Data.settings.priest.holy.displayText.left.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.priest.holy.displayText.middle.fontFace = newValue
				TRB.Data.settings.priest.holy.displayText.middle.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			end

			if GetSpecialization() == 2 then
				rightTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.right.fontFace, TRB.Data.settings.priest.holy.displayText.right.fontSize, "OUTLINE")
				if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
					leftTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.left.fontFace, TRB.Data.settings.priest.holy.displayText.left.fontSize, "OUTLINE")
					middleTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.middle.fontFace, TRB.Data.settings.priest.holy.displayText.middle.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		controls.checkBoxes.fontFaceLock = CreateFrame("CheckButton", "TwintopResourceBar_Priest_HolyCB1_FONTFACE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontFaceLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font face for all text")
		f.tooltip = "This will lock the font face for text for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.priest.holy.displayText.fontFaceLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.displayText.fontFaceLock = self:GetChecked()
			if TRB.Data.settings.priest.holy.displayText.fontFaceLock then
				TRB.Data.settings.priest.holy.displayText.middle.fontFace = TRB.Data.settings.priest.holy.displayText.left.fontFace
				TRB.Data.settings.priest.holy.displayText.middle.fontFaceName = TRB.Data.settings.priest.holy.displayText.left.fontFaceName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.priest.holy.displayText.middle.fontFaceName)
				TRB.Data.settings.priest.holy.displayText.right.fontFace = TRB.Data.settings.priest.holy.displayText.left.fontFace
				TRB.Data.settings.priest.holy.displayText.right.fontFaceName = TRB.Data.settings.priest.holy.displayText.left.fontFaceName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.priest.holy.displayText.right.fontFaceName)

				if GetSpecialization() == 2 then
					middleTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.middle.fontFace, TRB.Data.settings.priest.holy.displayText.middle.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.right.fontFace, TRB.Data.settings.priest.holy.displayText.right.fontSize, "OUTLINE")
				end
			end
		end)


		yCoord = yCoord - 70
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Size and Colors", 0, yCoord)

		title = "Left Bar Text Font Size"
		yCoord = yCoord - 50
		controls.fontSizeLeft = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.priest.holy.displayText.left.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeLeft:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.displayText.left.fontSize = value

			if GetSpecialization() == 2 then
				leftTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.left.fontFace, TRB.Data.settings.priest.holy.displayText.left.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.priest.holy.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		controls.checkBoxes.fontSizeLock = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_CB2_F1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontSizeLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font size for all text")
		f.tooltip = "This will lock the font sizes for each part of the bar to be the same size."
		f:SetChecked(TRB.Data.settings.priest.holy.displayText.fontSizeLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.displayText.fontSizeLock = self:GetChecked()
			if TRB.Data.settings.priest.holy.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(TRB.Data.settings.priest.holy.displayText.left.fontSize)
				controls.fontSizeRight:SetValue(TRB.Data.settings.priest.holy.displayText.left.fontSize)
			end
		end)

		controls.colors.leftText = TRB.UiFunctions:BuildColorPicker(parent, "Left Text", TRB.Data.settings.priest.holy.colors.text.left,
														250, 25, xCoord2, yCoord-30)
		f = controls.colors.leftText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.left, true)
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
					TRB.Data.settings.priest.holy.colors.text.left = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.middleText = TRB.UiFunctions:BuildColorPicker(parent, "Middle Text", TRB.Data.settings.priest.holy.colors.text.middle,
														225, 25, xCoord2, yCoord-70)
		f = controls.colors.middleText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.middle, true)
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
					TRB.Data.settings.priest.holy.colors.text.middle = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.rightText = TRB.UiFunctions:BuildColorPicker(parent, "Right Text", TRB.Data.settings.priest.holy.colors.text.right,
														225, 25, xCoord2, yCoord-110)
		f = controls.colors.rightText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.right, true)
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
					TRB.Data.settings.priest.holy.colors.text.right = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		title = "Middle Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeMiddle = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.priest.holy.displayText.middle.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeMiddle:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.displayText.middle.fontSize = value

			if GetSpecialization() == 2 then
				middleTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.middle.fontFace, TRB.Data.settings.priest.holy.displayText.middle.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.priest.holy.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		title = "Right Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeRight = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.priest.holy.displayText.right.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeRight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.displayText.right.fontSize = value

			if GetSpecialization() == 2 then
				rightTextFrame.font:SetFont(TRB.Data.settings.priest.holy.displayText.right.fontFace, TRB.Data.settings.priest.holy.displayText.right.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.priest.holy.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeMiddle:SetValue(value)
			end
		end)

		yCoord = yCoord - 40
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Mana Text Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.currentManaText = TRB.UiFunctions:BuildColorPicker(parent, "Current Mana", TRB.Data.settings.priest.holy.colors.text.current, 300, 25, xCoord, yCoord)
		f = controls.colors.currentManaText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.current, true)
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

					controls.colors.currentManaText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.text.current = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.castingManaText = TRB.UiFunctions:BuildColorPicker(parent, "Mana from hardcasting spells", TRB.Data.settings.priest.holy.colors.text.casting, 275, 25, xCoord2, yCoord)
		f = controls.colors.castingManaText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.casting, true)
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

					controls.colors.castingManaText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.text.casting = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.passiveManaText = TRB.UiFunctions:BuildColorPicker(parent, "Passive Mana", TRB.Data.settings.priest.holy.colors.text.passive, 300, 25, xCoord, yCoord)
		f = controls.colors.passiveManaText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.passive, true)
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

					controls.colors.passiveManaText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.holy.colors.text.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)
	

		yCoord = yCoord - 30
		controls.dotColorSection = TRB.UiFunctions:BuildSectionHeader(parent, "DoT Count and Time Remaining Tracking", 0, yCoord)

		yCoord = yCoord - 25

		controls.checkBoxes.dotColor = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_dotColor", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.dotColor
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change total DoT counter and DoT timer color based on DoT status?")
		f.tooltip = "When checked, the color of total DoTs up counters and DoT timers ($swpCount, $vtCount) will change based on whether or not the DoT is on the current target."
		f:SetChecked(TRB.Data.settings.priest.holy.colors.text.dots.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.colors.text.dots.enabled = self:GetChecked()
		end)

		controls.colors.dotUp = TRB.UiFunctions:BuildColorPicker(parent, "DoT is active on current target", TRB.Data.settings.priest.holy.colors.text.dots.up, 550, 25, xCoord, yCoord-30)
		f = controls.colors.dotUp
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.dots.up, true)
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
                    TRB.Data.settings.priest.holy.colors.text.dots.up = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotPandemic = TRB.UiFunctions:BuildColorPicker(parent, "DoT is active on current target but within Pandemic refresh range", TRB.Data.settings.priest.holy.colors.text.dots.pandemic, 550, 25, xCoord, yCoord-60)
		f = controls.colors.dotPandemic
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.dots.pandemic, true)
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
                    TRB.Data.settings.priest.holy.colors.text.dots.pandemic = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotDown = TRB.UiFunctions:BuildColorPicker(parent, "DoT is not active on current target", TRB.Data.settings.priest.holy.colors.text.dots.down, 550, 25, xCoord, yCoord-90)
		f = controls.colors.dotDown
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.holy.colors.text.dots.down, true)
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
                    TRB.Data.settings.priest.holy.colors.text.dots.down = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		yCoord = yCoord - 130
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Decimal Precision", 0, yCoord)

		yCoord = yCoord - 50
		title = "Haste / Crit / Mastery / Vers Decimal Precision"
		controls.hastePrecision = TRB.UiFunctions:BuildSlider(parent, title, 0, 10, TRB.Data.settings.priest.holy.hastePrecision, 1, 0,
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
			TRB.Data.settings.priest.holy.hastePrecision = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.holy = controls
	end

	local function HolyConstructAudioAndTrackingPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.holy
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

		controls.buttons.exportButton_Priest_Holy_AudioAndTracking = TRB.UiFunctions:BuildButton(parent, "Export Audio & Tracking", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Holy_AudioAndTracking:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Holy Priest (Audio & Tracking).", 5, 2, false, false, true, false, false)
		end)

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Audio Options", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.innervate = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_Innervate_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.innervate
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio when you gain Innervate")
		f.tooltip = "This sound will play when you gain Innervate from a helpful Druid."
		f:SetChecked(TRB.Data.settings.priest.holy.audio.innervate.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.audio.innervate.enabled = self:GetChecked()

			if TRB.Data.settings.priest.holy.audio.innervate.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.holy.audio.innervate.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.innervateAudio = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_Innervate_Audio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.innervateAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.innervateAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.innervateAudio, TRB.Data.settings.priest.holy.audio.innervate.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.innervateAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.innervateAudio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.holy.audio.innervate.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.innervateAudio:SetValue(newValue, newName)
			TRB.Data.settings.priest.holy.audio.innervate.sound = newValue
			TRB.Data.settings.priest.holy.audio.innervate.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.innervateAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.holy.audio.innervate.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.surgeOfLight = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_SurgeOfLightCB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.surgeOfLight
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when a Surge of Light proc occurs")
		f.tooltip = "Play an audio cue when a Surge of Light proc occurs. This will only play for the first proc."
		f:SetChecked(TRB.Data.settings.priest.holy.audio.surgeOfLight.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.audio.surgeOfLight.enabled = self:GetChecked()

			if TRB.Data.settings.priest.holy.audio.surgeOfLight.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.holy.audio.surgeOfLight.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.surgeOfLightAudio = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_SurgeOfLightAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.surgeOfLightAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.surgeOfLightAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.surgeOfLightAudio, TRB.Data.settings.priest.holy.audio.surgeOfLight.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.surgeOfLightAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.surgeOfLightAudio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.holy.audio.surgeOfLight.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.surgeOfLightAudio:SetValue(newValue, newName)
			TRB.Data.settings.priest.holy.audio.surgeOfLight.sound = newValue
			TRB.Data.settings.priest.holy.audio.surgeOfLight.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.surgeOfLightAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.holy.audio.surgeOfLight.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.surgeOfLight2 = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_SurgeOfLight2CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.surgeOfLight2
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when you have two (max) Surge of Light procs")
		f.tooltip = "Play audio cue when you get a second (and maximum) Surge of Light proc. If both are checked, only this sound will play."
		f:SetChecked(TRB.Data.settings.priest.holy.audio.surgeOfLight2.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.audio.surgeOfLight2.enabled = self:GetChecked()

			if TRB.Data.settings.priest.holy.audio.surgeOfLight2.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.holy.audio.surgeOfLight2.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.surgeOfLight2Audio = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_SurgeOfLightAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.surgeOfLight2Audio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.surgeOfLight2Audio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.surgeOfLight2Audio, TRB.Data.settings.priest.holy.audio.surgeOfLight2.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.surgeOfLight2Audio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.surgeOfLight2Audio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.holy.audio.surgeOfLight2.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.surgeOfLight2Audio:SetValue(newValue, newName)
			TRB.Data.settings.priest.holy.audio.surgeOfLight2.sound = newValue
			TRB.Data.settings.priest.holy.audio.surgeOfLight2.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.surgeOfLight2Audio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.holy.audio.surgeOfLight2.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.flashConcentrationAudioCB = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_FlashConcentration", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashConcentrationAudioCB
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when Flash Concentration is going to expire, based on settings")
		f.tooltip = "Play audio cue when your Flash Concentration buff is close to expiring. This uses the configuration from the Bar Settings menu for border color change even if that feature is disabled."
		f:SetChecked(TRB.Data.settings.priest.holy.audio.flashConcentration.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.audio.flashConcentration.enabled = self:GetChecked()

			if TRB.Data.settings.priest.holy.audio.flashConcentration.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.holy.audio.flashConcentration.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.flashConcentrationAudio = CreateFrame("FRAME", "TwintopResourceBar_Priest_Holy_flashConcentrationAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.flashConcentrationAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.flashConcentrationAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.flashConcentrationAudio, TRB.Data.settings.priest.holy.audio.flashConcentration.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.flashConcentrationAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.flashConcentrationAudio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.holy.audio.flashConcentration.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.flashConcentrationAudio:SetValue(newValue, newName)
			TRB.Data.settings.priest.holy.audio.flashConcentration.sound = newValue
			TRB.Data.settings.priest.holy.audio.flashConcentration.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.flashConcentrationAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.holy.audio.flashConcentration.sound, TRB.Data.settings.core.audio.channel.channel)
		end

		
		yCoord = yCoord - 60
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Passive External Mana Generation Tracking", 0, yCoord)
		
		yCoord = yCoord - 30
		controls.checkBoxes.innervateRegen = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_InnervatePassiveMana_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.innervateRegen
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track passive mana regen while Innervate is active")
		f.tooltip = "Show the passive regeneration of mana over the remaining duration of Innervate."
		f:SetChecked(TRB.Data.settings.priest.holy.passiveGeneration.innervate)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.passiveGeneration.innervate = self:GetChecked()
		end)
		
		yCoord = yCoord - 30
		controls.checkBoxes.manaTideTotemRegen = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_ManaTideTotemPassiveMana_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.manaTideTotemRegen
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track bonus passive mana regen while Mana Tide Totem is active")
		f.tooltip = "Show the bonus passive regeneration of mana over the remaining duration of Mana Tide Totem."
		f:SetChecked(TRB.Data.settings.priest.holy.passiveGeneration.manaTideTotem)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.passiveGeneration.manaTideTotem = self:GetChecked()
		end)
		
		yCoord = yCoord - 30
		controls.checkBoxes.symbolOfHopeRegen = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_SymbolOfHopePassiveMana_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.symbolOfHopeRegen
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track mana regen from another Priest's Symbol of Hope")
		f.tooltip = "Show the regeneration of mana from another Priest's Symbol of Hope channel. This does not hide the mana regeneration from your own channeling of Symbol of Hope."
		f:SetChecked(TRB.Data.settings.priest.holy.passiveGeneration.symbolOfHope)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.passiveGeneration.symbolOfHope = self:GetChecked()
		end)

		yCoord = yCoord - 30
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Wrathful Faerie Tracking", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.wrathfulFaerie = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_WrathfulFaerieTracking_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerie
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track Wrathful Faerie and Fae Fermata Mana Gain")
		f.tooltip = "Show the gain of mana over the next serveral procs, GCDs, or fixed length of time. Select which to track from the options below."
		f:SetChecked(TRB.Data.settings.priest.holy.wrathfulFaerie.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.holy.wrathfulFaerie.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 40
		title = "Proc Delay after ICD Reset"
		controls.wrathfulFaerieGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0, 0.75, TRB.Data.settings.priest.holy.wrathfulFaerie.procDelay, 0.05, 2,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.wrathfulFaerieGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.wrathfulFaerie.procDelay = value
		end)

		yCoord = yCoord - 60
		controls.checkBoxes.wrathfulFaerieModeGCDs = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_WrathfulFaerieTracking_1", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerieModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Mana from GCDs remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Mana incoming over the up to next X GCDs, based on player's current GCD."
		if TRB.Data.settings.priest.holy.wrathfulFaerie.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.wrathfulFaerieModeGCDs:SetChecked(true)
			controls.checkBoxes.wrathfulFaerieModeProcs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeTime:SetChecked(false)
			TRB.Data.settings.priest.holy.wrathfulFaerie.mode = "gcd"
		end)

		title = "GCDs - 0.75sec Floor"
		controls.wrathfulFaerieGCDs = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.holy.wrathfulFaerie.gcdsMax, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.wrathfulFaerieGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.wrathfulFaerie.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.wrathfulFaerieModeProcs = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_WrathfulFaerieTracking_2", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerieModeProcs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Mana from Procs remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Mana incoming over the up to next X procs from Wrathful Faerie/Fae Fermata."
		if TRB.Data.settings.priest.holy.wrathfulFaerie.mode == "procs" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.wrathfulFaerieModeGCDs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeProcs:SetChecked(true)
			controls.checkBoxes.wrathfulFaerieModeTime:SetChecked(false)
			TRB.Data.settings.priest.holy.wrathfulFaerie.mode = "procs"
		end)

		title = "Wrathful Faerie Procs - No Floor"
		controls.wrathfulFaerieProcs = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.holy.wrathfulFaerie.procsMax, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.wrathfulFaerieProcs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.wrathfulFaerie.procsMax = value
		end)

		yCoord = yCoord - 60
		controls.checkBoxes.wrathfulFaerieModeTime = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_WrathfulFaerieTracking_3", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerieModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Mana from Time remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Mana incoming over the up to next X seconds."
		if TRB.Data.settings.priest.holy.wrathfulFaerie.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.wrathfulFaerieModeGCDs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeProcs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeTime:SetChecked(true)
			TRB.Data.settings.priest.holy.wrathfulFaerie.mode = "time"
		end)

		title = "Wrathful Faerie Time Remaining (sec)"
		controls.wrathfulFaerieTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 90, TRB.Data.settings.priest.holy.wrathfulFaerie.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.wrathfulFaerieTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.holy.wrathfulFaerie.timeMax = value
		end)


		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.holy = controls
	end

	local function HolyConstructBarTextDisplayPanel(parent, cache)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.holy
		local yCoord = 5
		local f = nil

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1
		local namePrefix = "Priest_Holy"

		TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display Text Customization", 0, yCoord)
		
		controls.buttons.exportButton_Priest_Holy_BarText = TRB.UiFunctions:BuildButton(parent, "Export Bar Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Holy_BarText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Holy Priest (Bar Text).", 5, 2, false, false, false, true, false)
		end)

		yCoord = yCoord - 30
		TRB.UiFunctions:BuildLabel(parent, "Left Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.left = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Left", TRB.Data.settings.priest.holy.displayText.left.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.left
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.priest.holy.displayText.left.text = self:GetText()
			TRB.Data.barTextCache = {}
			if GetSpecialization() == 2 then
				TRB.Functions.IsTtdActive(TRB.Data.settings.priest.holy)
			end
		end)

		yCoord = yCoord - 70
		controls.labels.middleText = TRB.UiFunctions:BuildLabel(parent, "Middle Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.middle = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Middle", TRB.Data.settings.priest.holy.displayText.middle.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.middle
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.priest.holy.displayText.middle.text = self:GetText()
			TRB.Data.barTextCache = {}
			if GetSpecialization() == 2 then
				TRB.Functions.IsTtdActive(TRB.Data.settings.priest.holy)
			end
		end)

		yCoord = yCoord - 70
		TRB.UiFunctions:BuildLabel(parent, "Right Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.right = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Right", TRB.Data.settings.priest.holy.displayText.right.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.right
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.priest.holy.displayText.right.text = self:GetText()
			TRB.Data.barTextCache = {}
			if GetSpecialization() == 2 then
				TRB.Functions.IsTtdActive(TRB.Data.settings.priest.holy)
			end
		end)

		yCoord = yCoord - 70
		local variablesPanel = TRB.UiFunctions:CreateVariablesSidePanel(parent, namePrefix)
		TRB.Options:CreateBarTextInstructions(parent, xCoord, yCoord)
		TRB.Options:CreateBarTextVariables(cache, variablesPanel, 5, -30)
	end

	local function HolyConstructOptionsPanel(cache)
		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local parent = interfaceSettingsFrame.panel
		local controls = interfaceSettingsFrame.controls.holy or {}
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

		interfaceSettingsFrame.holyDisplayPanel = CreateFrame("Frame", "TwintopResourceBar_Options_Priest_Holy", UIParent)
		interfaceSettingsFrame.holyDisplayPanel.name = "Holy Priest"
---@diagnostic disable-next-line: undefined-field
		interfaceSettingsFrame.holyDisplayPanel.parent = parent.name
		InterfaceOptions_AddCategory(interfaceSettingsFrame.holyDisplayPanel)

		parent = interfaceSettingsFrame.holyDisplayPanel

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Holy Priest", xCoord+xPadding, yCoord-5)	
		
		controls.checkBoxes.holyPriestEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Holy_holyPriestEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.holyPriestEnabled
		f:SetPoint("TOPLEFT", 250, yCoord-10)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "Is Twintop's Resource Bar enabled for the Holy Priest specialization? If unchecked, the bar will not function (including the population of global variables!)."
		f:SetChecked(TRB.Data.settings.core.enabled.priest.holy)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.core.enabled.priest.holy = self:GetChecked()
			TRB.Functions.EventRegistration()
			TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.holyPriestEnabled, TRB.Data.settings.core.enabled.priest.holy, true)
		end)
		
		TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.holyPriestEnabled, TRB.Data.settings.core.enabled.priest.holy, true)

		controls.buttons.importButton = TRB.UiFunctions:BuildButton(parent, "Import", 345, yCoord-10, 90, 20)
		controls.buttons.importButton:SetFrameLevel(10000)
		controls.buttons.importButton:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Import")
		end)

		controls.buttons.exportButton_Priest_Holy_All = TRB.UiFunctions:BuildButton(parent, "Export Specialization", 440, yCoord-10, 150, 20)
		controls.buttons.exportButton_Priest_Holy_All:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Holy Priest (All).", 5, 2, true, true, true, true, false)
		end)

		yCoord = yCoord - 42

		local tabs = {}
		local tabsheets = {}

		tabs[1] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Holy_Tab1", "Bar Display", 1, parent, 85)
		tabs[1]:SetPoint("TOPLEFT", 15, yCoord)
		tabs[2] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Holy_Tab2", "Font & Text", 2, parent, 85, tabs[1])
		tabs[3] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Holy_Tab3", "Audio & Tracking", 3, parent, 120, tabs[2])
		tabs[4] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Holy_Tab4", "Bar Text", 4, parent, 60, tabs[3])
		tabs[5] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Holy_Tab5", "Reset Defaults", 5, parent, 100, tabs[4])

		PanelTemplates_TabResize(tabs[1], 0)
		PanelTemplates_TabResize(tabs[2], 0)
		PanelTemplates_TabResize(tabs[3], 0)
		PanelTemplates_TabResize(tabs[4], 0)
		PanelTemplates_TabResize(tabs[5], 0)
		yCoord = yCoord - 15

		for i = 1, 5 do
			tabsheets[i] = TRB.UiFunctions:CreateTabFrameContainer("TwintopResourceBar_Priest_Holy_LayoutPanel" .. i, parent)
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
		TRB.Frames.interfaceSettingsFrameContainer.controls.holy = controls

		HolyConstructBarColorsAndBehaviorPanel(tabsheets[1].scrollFrame.scrollChild)
		HolyConstructFontAndTextPanel(tabsheets[2].scrollFrame.scrollChild)
		HolyConstructAudioAndTrackingPanel(tabsheets[3].scrollFrame.scrollChild)
		HolyConstructBarTextDisplayPanel(tabsheets[4].scrollFrame.scrollChild, cache)
		HolyConstructResetDefaultsPanel(tabsheets[5].scrollFrame.scrollChild)
	end



	--[[

	Shadow Option Menus

	]]

	local function ShadowConstructResetDefaultsPanel(parent)
		if parent == nil then
			return
		end

		local controls = TRB.Frames.interfaceSettingsFrameContainer.controls.shadow
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

		StaticPopupDialogs["TwintopResourceBar_Priest_Shadow_Reset"] = {
			text = "Do you want to reset Twintop's Resource Bar back to its default configuration? Only the Shadow Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.shadow = ShadowResetSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Priest_Shadow_ResetBarTextSimple"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (simple) configuration? Only the Shadow Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.shadow.displayText = ShadowLoadDefaultBarTextSimpleSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Priest_Shadow_ResetBarTextAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (advanced) configuration? Only the Shadow Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.shadow.displayText = ShadowLoadDefaultBarTextAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}
		StaticPopupDialogs["TwintopResourceBar_Priest_Shadow_ResetBarTextNarrowAdvanced"] = {
			text = "Do you want to reset Twintop's Resource Bar's text (including font size, font style, and text information) back to its default (narrow advanced) configuration? Only the Shadow Priest settings will be changed. This will cause your UI to be reloaded!",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				TRB.Data.settings.priest.shadow.displayText = ShadowLoadDefaultBarTextNarrowAdvancedSettings()
				ReloadUI()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3
		}

		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar to Defaults", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton = TRB.UiFunctions:BuildButton(parent, "Reset to Defaults", xCoord, yCoord, 150, 30)
		controls.resetButton:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Shadow_Reset")
		end)

		yCoord = yCoord - 40
		controls.textCustomSection = TRB.UiFunctions:BuildSectionHeader(parent, "Reset Resource Bar Text", 0, yCoord)

		yCoord = yCoord - 30
		controls.resetButton1 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Simple)", xCoord, yCoord, 250, 30)
		controls.resetButton1:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Shadow_ResetBarTextSimple")
        end)

		yCoord = yCoord - 40
		controls.resetButton2 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Narrow Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton2:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Shadow_ResetBarTextNarrowAdvanced")
		end)

		yCoord = yCoord - 40
		controls.resetButton3 = TRB.UiFunctions:BuildButton(parent, "Reset Bar Text (Full Advanced)", xCoord, yCoord, 250, 30)
		controls.resetButton3:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Priest_Shadow_ResetBarTextAdvanced")
		end)

		TRB.Frames.interfaceSettingsFrameContainer.controls.shadow = controls
	end

	local function ShadowConstructBarColorsAndBehaviorPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.shadow
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

		local maxBorderHeight = math.min(math.floor(TRB.Data.settings.priest.shadow.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.shadow.bar.width / TRB.Data.constants.borderWidthFactor))

		local sanityCheckValues = TRB.Functions.GetSanityCheckValues(TRB.Data.settings.priest.shadow)

		controls.buttons.exportButton_Priest_Shadow_BarDisplay = TRB.UiFunctions:BuildButton(parent, "Export Bar Display", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Shadow_BarDisplay:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Shadow Priest (Bar Display).", 5, 3, true, false, false, false, false)
		end)

		controls.barPositionSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Position and Size", 0, yCoord)

		yCoord = yCoord - 40
		title = "Bar Width"
		controls.width = TRB.UiFunctions:BuildSlider(parent, title, sanityCheckValues.barMinWidth, sanityCheckValues.barMaxWidth, TRB.Data.settings.priest.shadow.bar.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.width:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.bar.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.shadow.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.shadow.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.shadow.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 3 then
				TRB.Functions.UpdateBarWidth(TRB.Data.settings.priest.shadow)

				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[1], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.devouringPlagueThreshold, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[2], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.searingNightmareThreshold, TRB.Data.character.maxResource)
			end
		end)

		title = "Bar Height"
		controls.height = TRB.UiFunctions:BuildSlider(parent, title, sanityCheckValues.barMinHeight, sanityCheckValues.barMaxHeight, TRB.Data.settings.priest.shadow.bar.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.height:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.bar.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.shadow.bar.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.shadow.bar.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.shadow.bar.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.borderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.borderWidth.MaxLabel:SetText(maxBorderSize)
			controls.borderWidth.EditBox:SetText(borderSize)

			if GetSpecialization() == 3 then
				TRB.Functions.UpdateBarHeight(TRB.Data.settings.priest.shadow)
			end
		end)

		title = "Bar Horizontal Position"
		yCoord = yCoord - 60
		controls.horizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.priest.shadow.bar.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.horizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.bar.xPos = value
			
			if GetSpecialization() == 3 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.priest.shadow.bar.xPos, TRB.Data.settings.priest.shadow.bar.yPos)
			end
		end)

		title = "Bar Vertical Position"
		controls.vertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.priest.shadow.bar.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.vertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.bar.yPos = value
			
			if GetSpecialization() == 3 then
				barContainerFrame:ClearAllPoints()
				barContainerFrame:SetPoint("CENTER", UIParent)
				barContainerFrame:SetPoint("CENTER", TRB.Data.settings.priest.shadow.bar.xPos, TRB.Data.settings.priest.shadow.bar.yPos)
			end
		end)

		title = "Bar Border Width"
		yCoord = yCoord - 60
		controls.borderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxBorderHeight, TRB.Data.settings.priest.shadow.bar.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.borderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.bar.border = value
			
			if GetSpecialization() == 3 then
				barContainerFrame:SetWidth(TRB.Data.settings.priest.shadow.bar.width-(TRB.Data.settings.priest.shadow.bar.border*2))
				barContainerFrame:SetHeight(TRB.Data.settings.priest.shadow.bar.height-(TRB.Data.settings.priest.shadow.bar.border*2))
				barBorderFrame:SetWidth(TRB.Data.settings.priest.shadow.bar.width)
				barBorderFrame:SetHeight(TRB.Data.settings.priest.shadow.bar.height)
				if TRB.Data.settings.priest.shadow.bar.border < 1 then
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.priest.shadow.textures.border,
						tile = true,
						tileSize = 4,
						edgeSize = 1,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Hide()
				else
					barBorderFrame:SetBackdrop({
						edgeFile = TRB.Data.settings.priest.shadow.textures.border,
						tile = true,
						tileSize=4,
						edgeSize=TRB.Data.settings.priest.shadow.bar.border,
						insets = {0, 0, 0, 0}
					})
					barBorderFrame:Show()
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor(TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.border, true))

				TRB.Functions.SetBarMinMaxValues(TRB.Data.settings.priest.shadow)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[1], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.devouringPlagueThreshold, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[2], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.searingNightmareThreshold, TRB.Data.character.maxResource)
			end

			local minsliderWidth = math.max(TRB.Data.settings.priest.shadow.bar.border*2, 120)
			local minsliderHeight = math.max(TRB.Data.settings.priest.shadow.bar.border*2, 1)
			controls.height:SetMinMaxValues(minsliderHeight, sanityCheckValues.barMaxHeight)
			controls.height.MinLabel:SetText(minsliderHeight)
			controls.width:SetMinMaxValues(minsliderWidth, sanityCheckValues.barMaxWidth)
			controls.width.MinLabel:SetText(minsliderWidth)
		end)

		title = "Threshold Line Width"
		controls.thresholdWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.shadow.thresholds.width, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.thresholds.width = value
			
			if GetSpecialization() == 3 then
				resourceFrame.thresholds[1]:SetWidth(TRB.Data.settings.priest.shadow.thresholds.width)
				resourceFrame.thresholds[2]:SetWidth(TRB.Data.settings.priest.shadow.thresholds.width)
				passiveFrame.thresholds[1]:SetWidth(TRB.Data.settings.priest.shadow.thresholds.width)
				passiveFrame.thresholds[2]:SetWidth(TRB.Data.settings.priest.shadow.thresholds.width)
			end
		end)

		yCoord = yCoord - 40

		--NOTE: the order of these checkboxes is reversed!

		controls.checkBoxes.lockPosition = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_dragAndDrop", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.lockPosition
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Drag & Drop Movement Enabled")
		f.tooltip = "Disable Drag & Drop functionality of the bar to keep it from accidentally being moved.\n\nWhen 'Pin to Personal Resource Display' is checked, this value is ignored and cannot be changed."
		f:SetChecked(TRB.Data.settings.priest.shadow.bar.dragAndDrop)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.bar.dragAndDrop = self:GetChecked()
			barContainerFrame:SetMovable((not TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.shadow.bar.dragAndDrop)
			barContainerFrame:EnableMouse((not TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.shadow.bar.dragAndDrop)
		end)

		TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay)

		controls.checkBoxes.pinToPRD = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_pinToPRD", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.pinToPRD
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Pin to Personal Resource Display")
		f.tooltip = "Pins the bar to the Blizzard Personal Resource Display. Adjust the Horizontal and Vertical positions above to offset it from PRD. When enabled, Drag & Drop positioning is not allowed. If PRD is not enabled, will behave as if you didn't have this enabled.\n\nNOTE: This will also be the position (relative to the center of the screen, NOT the PRD) that it shows when out of combat/the PRD is not displayed! It is recommended you set 'Bar Display' to 'Only show bar in combat' if you plan to pin it to your PRD."
		f:SetChecked(TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay = self:GetChecked()

			TRB.UiFunctions:ToggleCheckboxEnabled(controls.checkBoxes.lockPosition, not TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay)

			barContainerFrame:SetMovable((not TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.shadow.bar.dragAndDrop)
			barContainerFrame:EnableMouse((not TRB.Data.settings.priest.shadow.bar.pinToPersonalResourceDisplay) and TRB.Data.settings.priest.shadow.bar.dragAndDrop)
			TRB.Functions.RepositionBar(TRB.Data.settings.priest.shadow, TRB.Frames.barContainerFrame)
		end)


		yCoord = yCoord - 30
		controls.textBarTexturesSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Textures", 0, yCoord)
		yCoord = yCoord - 30

		-- Create the dropdown, and configure its appearance
		controls.dropDown.resourceBarTexture = CreateFrame("FRAME", "TwintopResourceBar_InsanityBarTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.resourceBarTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Main Bar Texture", xCoord, yCoord)
		controls.dropDown.resourceBarTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.resourceBarTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.resourceBarTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.priest.shadow.textures.resourceBarName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.shadow.textures.resourceBar
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
			TRB.Data.settings.priest.shadow.textures.resourceBar = newValue
			TRB.Data.settings.priest.shadow.textures.resourceBarName = newName
			UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
			if TRB.Data.settings.priest.shadow.textures.textureLock then
				TRB.Data.settings.priest.shadow.textures.castingBar = newValue
				TRB.Data.settings.priest.shadow.textures.castingBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
				TRB.Data.settings.priest.shadow.textures.passiveBar = newValue
				TRB.Data.settings.priest.shadow.textures.passiveBarName = newName
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			end

			if GetSpecialization() == 3 then
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.resourceBar)
				if TRB.Data.settings.priest.shadow.textures.textureLock then
					castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.castingBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.passiveBar)
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
		UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.priest.shadow.textures.castingBarName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.shadow.textures.castingBar
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
			TRB.Data.settings.priest.shadow.textures.castingBar = newValue
			TRB.Data.settings.priest.shadow.textures.castingBarName = newName
			castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.castingBar)
			UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			if TRB.Data.settings.priest.shadow.textures.textureLock then
				TRB.Data.settings.priest.shadow.textures.resourceBar = newValue
				TRB.Data.settings.priest.shadow.textures.resourceBarName = newName
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.resourceBar)
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.priest.shadow.textures.passiveBar = newValue
				TRB.Data.settings.priest.shadow.textures.passiveBarName = newName
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.passiveBar)
				UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			end

			if GetSpecialization() == 3 then
				castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.castingBar)
				if TRB.Data.settings.priest.shadow.textures.textureLock then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.resourceBar)
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.passiveBar)
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
		UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, TRB.Data.settings.priest.shadow.textures.passiveBarName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.shadow.textures.passiveBar
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
			TRB.Data.settings.priest.shadow.textures.passiveBar = newValue
			TRB.Data.settings.priest.shadow.textures.passiveBarName = newName
			passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.passiveBar)
			UIDropDownMenu_SetText(controls.dropDown.passiveBarTexture, newName)
			if TRB.Data.settings.priest.shadow.textures.textureLock then
				TRB.Data.settings.priest.shadow.textures.resourceBar = newValue
				TRB.Data.settings.priest.shadow.textures.resourceBarName = newName
				resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.resourceBar)
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, newName)
				TRB.Data.settings.priest.shadow.textures.castingBar = newValue
				TRB.Data.settings.priest.shadow.textures.castingBarName = newName
				castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.castingBar)
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, newName)
			end

			if GetSpecialization() == 3 then
				passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.passiveBar)
				if TRB.Data.settings.priest.shadow.textures.textureLock then
					resourceFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.resourceBar)
					castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.castingBar)
				end
			end

			CloseDropDownMenus()
		end

		controls.checkBoxes.textureLock = CreateFrame("CheckButton", "TwintopResourceBar_CB1_TEXTURE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.textureLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same texture for all bars")
		f.tooltip = "This will lock the texture for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.priest.shadow.textures.textureLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.textures.textureLock = self:GetChecked()
			if TRB.Data.settings.priest.shadow.textures.textureLock then
				TRB.Data.settings.priest.shadow.textures.passiveBar = TRB.Data.settings.priest.shadow.textures.resourceBar
				TRB.Data.settings.priest.shadow.textures.passiveBarName = TRB.Data.settings.priest.shadow.textures.resourceBarName
				UIDropDownMenu_SetText(controls.dropDown.resourceBarTexture, TRB.Data.settings.priest.shadow.textures.passiveBarName)
				TRB.Data.settings.priest.shadow.textures.castingBar = TRB.Data.settings.priest.shadow.textures.resourceBar
				TRB.Data.settings.priest.shadow.textures.castingBarName = TRB.Data.settings.priest.shadow.textures.resourceBarName
				UIDropDownMenu_SetText(controls.dropDown.castingBarTexture, TRB.Data.settings.priest.shadow.textures.castingBarName)

				if GetSpecialization() == 3 then
					passiveFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.passiveBar)
					castingFrame:SetStatusBarTexture(TRB.Data.settings.priest.shadow.textures.castingBar)
				end
			end
		end)


		yCoord = yCoord - 60

		-- Create the dropdown, and configure its appearance
		controls.dropDown.borderTexture = CreateFrame("FRAME", "TwintopResourceBar_BorderTexture", parent, "UIDropDownMenuTemplate")
		controls.dropDown.borderTexture.label = TRB.UiFunctions:BuildSectionHeader(parent, "Border Texture", xCoord, yCoord)
		controls.dropDown.borderTexture.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.borderTexture:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.borderTexture, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.borderTexture, TRB.Data.settings.priest.shadow.textures.borderName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.shadow.textures.border
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
			TRB.Data.settings.priest.shadow.textures.border = newValue
			TRB.Data.settings.priest.shadow.textures.borderName = newName

			if GetSpecialization() == 3 then
				if TRB.Data.settings.priest.shadow.bar.border < 1 then
					barBorderFrame:SetBackdrop({ })
				else
					barBorderFrame:SetBackdrop({ edgeFile = TRB.Data.settings.priest.shadow.textures.border,
												tile = true,
												tileSize=4,
												edgeSize=TRB.Data.settings.priest.shadow.bar.border,
												insets = {0, 0, 0, 0}
												})
				end
				barBorderFrame:SetBackdropColor(0, 0, 0, 0)
				barBorderFrame:SetBackdropBorderColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.border, true))
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
		UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, TRB.Data.settings.priest.shadow.textures.backgroundName)
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
						info.checked = textures[v] == TRB.Data.settings.priest.shadow.textures.background
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
			TRB.Data.settings.priest.shadow.textures.background = newValue
			TRB.Data.settings.priest.shadow.textures.backgroundName = newName

			if GetSpecialization() == 3 then
				barContainerFrame:SetBackdrop({ 
					bgFile = TRB.Data.settings.priest.shadow.textures.background,
					tile = true,
					tileSize = TRB.Data.settings.priest.shadow.bar.width,
					edgeSize = 1,
					insets = {0, 0, 0, 0}
				})
				barContainerFrame:SetBackdropColor (TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.background, true))
			end

			UIDropDownMenu_SetText(controls.dropDown.backgroundTexture, newName)
			CloseDropDownMenus()
		end


		yCoord = yCoord - 70
		controls.barDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display", 0, yCoord)

		yCoord = yCoord - 50

		title = "Devouring Plague Flash Alpha"
		controls.flashAlpha = TRB.UiFunctions:BuildSlider(parent, title, 0, 1, TRB.Data.settings.priest.shadow.colors.bar.flashAlpha, 0.01, 2,
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
			TRB.Data.settings.priest.shadow.colors.bar.flashAlpha = value
		end)

		title = "Devouring Plague Flash Period (sec)"
		controls.flashPeriod = TRB.UiFunctions:BuildSlider(parent, title, 0, 2, TRB.Data.settings.priest.shadow.colors.bar.flashPeriod, 0.05, 2,
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
			TRB.Data.settings.priest.shadow.colors.bar.flashPeriod = value
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.alwaysShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_2", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.alwaysShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Always show bar")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar always visible on your UI, even when out of combat."
		f:SetChecked(TRB.Data.settings.priest.shadow.displayBar.alwaysShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(true)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.priest.shadow.displayBar.alwaysShow = true
			TRB.Data.settings.priest.shadow.displayBar.notZeroShow = false
			TRB.Data.settings.priest.shadow.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.notZeroShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_3", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.notZeroShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-15)
		getglobal(f:GetName() .. 'Text'):SetText("Show bar when Insanity > 0")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar show out of combat only if Insanity > 0, hidden otherwise when out of combat."
		f:SetChecked(TRB.Data.settings.priest.shadow.displayBar.notZeroShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(true)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.priest.shadow.displayBar.alwaysShow = false
			TRB.Data.settings.priest.shadow.displayBar.notZeroShow = true
			TRB.Data.settings.priest.shadow.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.combatShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_4", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.combatShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Only show bar in combat")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar only be visible on your UI when in combat."
		f:SetChecked((not TRB.Data.settings.priest.shadow.displayBar.alwaysShow) and (not TRB.Data.settings.priest.shadow.displayBar.notZeroShow) and (not TRB.Data.settings.priest.shadow.displayBar.neverShow))
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(true)
			controls.checkBoxes.neverShow:SetChecked(false)
			TRB.Data.settings.priest.shadow.displayBar.alwaysShow = false
			TRB.Data.settings.priest.shadow.displayBar.notZeroShow = false
			TRB.Data.settings.priest.shadow.displayBar.neverShow = false
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.neverShow = CreateFrame("CheckButton", "TwintopResourceBar_RB1_5", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.neverShow
		f:SetPoint("TOPLEFT", xCoord, yCoord-45)
		getglobal(f:GetName() .. 'Text'):SetText("Never show bar (run in background)")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "This will make the Resource Bar never display but still run in the background to update the global variable."
		f:SetChecked(TRB.Data.settings.priest.shadow.displayBar.neverShow)
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.alwaysShow:SetChecked(false)
			controls.checkBoxes.notZeroShow:SetChecked(false)
			controls.checkBoxes.combatShow:SetChecked(false)
			controls.checkBoxes.neverShow:SetChecked(true)
			TRB.Data.settings.priest.shadow.displayBar.alwaysShow = false
			TRB.Data.settings.priest.shadow.displayBar.notZeroShow = false
			TRB.Data.settings.priest.shadow.displayBar.neverShow = true
			TRB.Functions.HideResourceBar()
		end)

		controls.checkBoxes.showCastingBar = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_showCastingBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showCastingBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Show casting bar")
		f.tooltip = "This will show the casting bar when hardcasting a spell. Uncheck to hide this bar."
		f:SetChecked(TRB.Data.settings.priest.shadow.bar.showCasting)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.bar.showCasting = self:GetChecked()
		end)

		controls.checkBoxes.showPassiveBar = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_showPassiveBar", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.showPassiveBar
		f:SetPoint("TOPLEFT", xCoord2, yCoord-20)
		getglobal(f:GetName() .. 'Text'):SetText("Show passive bar")
		f.tooltip = "This will show the passive bar. Uncheck to hide this bar. This setting supercedes any other passive tracking options!"
		f:SetChecked(TRB.Data.settings.priest.shadow.bar.showPassive)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.bar.showPassive = self:GetChecked()
		end)

		controls.checkBoxes.flashEnabled = CreateFrame("CheckButton", "TwintopResourceBar_CB1_5", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.flashEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-40)
		getglobal(f:GetName() .. 'Text'):SetText("Flash bar when DP is usable")
		f.tooltip = "This will flash the bar when Devouring Plague can be cast."
		f:SetChecked(TRB.Data.settings.priest.shadow.colors.bar.flashEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.colors.bar.flashEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 70

		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Bar Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.base = TRB.UiFunctions:BuildColorPicker(parent, "Insanity while not in Voidform", TRB.Data.settings.priest.shadow.colors.bar.base, 300, 25, xCoord, yCoord)
		f = controls.colors.base
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.base, true)
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
					TRB.Data.settings.priest.shadow.colors.bar.base = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.inVoidform = TRB.UiFunctions:BuildColorPicker(parent, "Insanity while in Voidform", TRB.Data.settings.priest.shadow.colors.bar.inVoidform, 275, 25, xCoord2, yCoord)
		f = controls.colors.inVoidform
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.inVoidform, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.inVoidform.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.bar.inVoidform = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.devouringPlagueUsable = TRB.UiFunctions:BuildColorPicker(parent, "Insanity when you can cast Devouring Plague", TRB.Data.settings.priest.shadow.colors.bar.devouringPlagueUsable, 300, 25, xCoord, yCoord)
		f = controls.colors.devouringPlagueUsable
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.devouringPlagueUsable, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.devouringPlagueUsable.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.bar.devouringPlagueUsable = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.inVoidform1GCD = TRB.UiFunctions:BuildColorPicker(parent, "Insanity while you have less than 1 GCD left in Voidform (if enabled)", TRB.Data.settings.priest.shadow.colors.bar.inVoidform1GCD, 275, 25, xCoord2, yCoord)
		f = controls.colors.inVoidform1GCD
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.inVoidform1GCD, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.inVoidform1GCD.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.bar.inVoidform1GCD = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.casting = TRB.UiFunctions:BuildColorPicker(parent, "Insanity from hardcasting spells", TRB.Data.settings.priest.shadow.colors.bar.casting, 300, 25, xCoord, yCoord)
		f = controls.colors.casting
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.casting, true)
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
					TRB.Data.settings.priest.shadow.colors.bar.casting = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					castingFrame:SetStatusBarColor(r, g, b, 1-a)
				end)
			end
		end)
		
		controls.colors.devouringPlagueUsableCasting = TRB.UiFunctions:BuildColorPicker(parent, "Insanity from hardcasting spells when can cast DP", TRB.Data.settings.priest.shadow.colors.bar.devouringPlagueUsableCasting, 275, 25, xCoord2, yCoord)
		f = controls.colors.devouringPlagueUsableCasting
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.devouringPlagueUsableCasting, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.devouringPlagueUsableCasting.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.bar.devouringPlagueUsableCasting = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.border = TRB.UiFunctions:BuildColorPicker(parent, "Resource Bar's border", TRB.Data.settings.priest.shadow.colors.bar.border, 300, 25, xCoord, yCoord)
		f = controls.colors.border
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.border, true)
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
					TRB.Data.settings.priest.shadow.colors.bar.border = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					barBorderFrame:SetBackdropBorderColor(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.borderOvercap = TRB.UiFunctions:BuildColorPicker(parent, "Bar border color when your current hardcast will overcap Insanity", TRB.Data.settings.priest.shadow.colors.bar.borderOvercap, 275, 25, xCoord2, yCoord)
		f = controls.colors.borderOvercap
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.borderOvercap, true)
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
					TRB.Data.settings.priest.shadow.colors.bar.borderOvercap = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.background = TRB.UiFunctions:BuildColorPicker(parent, "Unfilled bar background", TRB.Data.settings.priest.shadow.colors.bar.background, 300, 25, xCoord, yCoord)
		f = controls.colors.background
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.background, true)
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
					TRB.Data.settings.priest.shadow.colors.bar.background = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
					barContainerFrame:SetBackdropColor(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.passive = TRB.UiFunctions:BuildColorPicker(parent, "Insanity from Auspicious Spirits, Shadowfiend swings, Death and Madness ticks, Lash of Insanity ticks, and Wrathful Faerie procs.", TRB.Data.settings.priest.shadow.colors.bar.passive, 550, 25, xCoord, yCoord)
		f = controls.colors.passive
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.bar.passive, true)
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
					TRB.Data.settings.priest.shadow.colors.bar.passive = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)


		yCoord = yCoord - 40
		controls.barColorsSection = TRB.UiFunctions:BuildSectionHeader(parent, "Ability Threshold Lines", 0, yCoord)

		yCoord = yCoord - 25

		controls.colors.thresholdUnder = TRB.UiFunctions:BuildColorPicker(parent, "Under minimum required Insanity", TRB.Data.settings.priest.shadow.colors.threshold.under, 275, 25, xCoord2, yCoord)
		f = controls.colors.thresholdUnder
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.threshold.under, true)
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
                    TRB.Data.settings.priest.shadow.colors.threshold.under = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.thresholdOver = TRB.UiFunctions:BuildColorPicker(parent, "Over minimum required Insanity", TRB.Data.settings.priest.shadow.colors.threshold.over, 275, 25, xCoord2, yCoord-30)
		f = controls.colors.thresholdOver
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.threshold.over, true)
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
                    TRB.Data.settings.priest.shadow.colors.threshold.over = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.mindbenderThreshold = TRB.UiFunctions:BuildColorPicker(parent, "Shadowfiend / Wrathful Faerie Insanity Gain", TRB.Data.settings.priest.shadow.colors.threshold.mindbender, 275, 25, xCoord2, yCoord-60)
		f = controls.colors.mindbenderThreshold
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.threshold.mindbender, true)
				TRB.UiFunctions:ShowColorPicker(r, g, b, 1-a, function(color)
					local r, g, b, a
					if color then
---@diagnostic disable-next-line: deprecated
						r, g, b, a = unpack(color)
					else
						r, g, b = ColorPickerFrame:GetColorRGB()
						a = OpacitySliderFrame:GetValue()
					end

					controls.colors.mindbenderThreshold.Texture:SetColorTexture(r, g, b, 1-a)
					passiveFrame.thresholds[1].texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.threshold.mindbender = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.checkBoxes.thresholdOverlapBorder = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_thresholdOverlapBorder", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdOverlapBorder
		f:SetPoint("TOPLEFT", xCoord2, yCoord-90)
		getglobal(f:GetName() .. 'Text'):SetText("Threshold lines overlap bar border?")
		f.tooltip = "When checked, threshold lines will span the full height of the bar and overlap the bar border."
		f:SetChecked(TRB.Data.settings.priest.shadow.thresholds.overlapBorder)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.thresholds.overlapBorder = self:GetChecked()
			TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.shadow)
		end)

		controls.checkBoxes.dpThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_Threshold_Option_devouringPlague", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.dpThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Devouring Plague")
		f.tooltip = "This will show the vertical line on the bar denoting how much Insanity is required to cast Devouring Plague."
		f:SetChecked(TRB.Data.settings.priest.shadow.thresholds.devouringPlague.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.thresholds.devouringPlague.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		controls.checkBoxes.snThresholdShow = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_Threshold_Option_searingNightmare", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.snThresholdShow
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Searing Nightmare (if talented)")
		f.tooltip = "This will show the vertical line on the bar denoting how much Insanity is required to cast Searing Nightmare. Only visibile if talented in to Searing Nightmare and channeling Mind Sear."
		f:SetChecked(TRB.Data.settings.priest.shadow.thresholds.searingNightmare.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.thresholds.searingNightmare.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 25
		yCoord = yCoord - 25
		yCoord = yCoord - 25
		yCoord = yCoord - 25

        -- Create the dropdown, and configure its appearance
        controls.dropDown.thresholdIconRelativeTo = CreateFrame("FRAME", "TwintopResourceBar_Priest_Shadow_thresholdIconRelativeTo", parent, "UIDropDownMenuTemplate")
        controls.dropDown.thresholdIconRelativeTo.label = TRB.UiFunctions:BuildSectionHeader(parent, "Relative Position of Threshold Line Icons", xCoord, yCoord)
        controls.dropDown.thresholdIconRelativeTo.label.font:SetFontObject(GameFontNormal)
        controls.dropDown.thresholdIconRelativeTo:SetPoint("TOPLEFT", xCoord, yCoord-30)
        UIDropDownMenu_SetWidth(controls.dropDown.thresholdIconRelativeTo, dropdownWidth)
        UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, TRB.Data.settings.priest.shadow.thresholds.icons.relativeToName)
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
                info.checked = relativeTo[v] == TRB.Data.settings.priest.shadow.thresholds.icons.relativeTo
                info.func = self.SetValue
                info.arg1 = relativeTo[v]
                info.arg2 = v
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        function controls.dropDown.thresholdIconRelativeTo:SetValue(newValue, newName)
            TRB.Data.settings.priest.shadow.thresholds.icons.relativeTo = newValue
            TRB.Data.settings.priest.shadow.thresholds.icons.relativeToName = newName
			
			if GetSpecialization() == 3 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.shadow)

				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[1], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.devouringPlagueThreshold, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[2], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.searingNightmareThreshold, TRB.Data.character.maxResource)
			end

            UIDropDownMenu_SetText(controls.dropDown.thresholdIconRelativeTo, newName)
            CloseDropDownMenus()
        end

		controls.checkBoxes.thresholdIconEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_thresholdIconEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.thresholdIconEnabled
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Show ability icons for threshold lines?")
		f.tooltip = "When checked, icons for the threshold each line represents will be displayed. Configuration of size and location of these icons is below."
		f:SetChecked(TRB.Data.settings.priest.shadow.thresholds.icons.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.thresholds.icons.enabled = self:GetChecked()
			
			if GetSpecialization() == 3 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.shadow)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[1], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.devouringPlagueThreshold, TRB.Data.character.maxResource)
				TRB.Functions.RepositionThreshold(TRB.Data.settings.priest.shadow, resourceFrame.thresholds[2], resourceFrame, TRB.Data.settings.priest.shadow.thresholds.width, TRB.Data.character.searingNightmareThreshold, TRB.Data.character.maxResource)

				if TRB.Data.settings.priest.shadow.thresholds.icons.enabled then
					resourceFrame.thresholds[1].icon:Show()
					resourceFrame.thresholds[2].icon:Show()
				else
					resourceFrame.thresholds[1].icon:Hide()
					resourceFrame.thresholds[2].icon:Hide()
				end
			end
		end)

		yCoord = yCoord - 80
		title = "Threshold Icon Width"
		controls.thresholdIconWidth = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.priest.shadow.thresholds.icons.width, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.thresholds.icons.width = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.shadow.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.shadow.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.shadow.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
						
			if GetSpecialization() == 3 then
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[1], "devouringPlague", TRB.Data.settings.priest.shadow)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[2], "searingNightmare", TRB.Data.settings.priest.shadow)
			end
		end)

		title = "Threshold Icon Height"
		controls.thresholdIconHeight = TRB.UiFunctions:BuildSlider(parent, title, 1, 128, TRB.Data.settings.priest.shadow.thresholds.icons.height, 1, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconHeight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.thresholds.icons.height = value

			local maxBorderSize = math.min(math.floor(TRB.Data.settings.priest.shadow.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.shadow.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))
			local borderSize = TRB.Data.settings.priest.shadow.thresholds.icons.border
		
			if maxBorderSize < borderSize then
				maxBorderSize = borderSize
			end

			controls.thresholdIconBorderWidth:SetMinMaxValues(0, maxBorderSize)
			controls.thresholdIconBorderWidth.MaxLabel:SetText(maxBorderSize)
			controls.thresholdIconBorderWidth.EditBox:SetText(borderSize)
						
			if GetSpecialization() == 3 then
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[1], "devouringPlague", TRB.Data.settings.priest.shadow)
				TRB.Functions.SetThresholdIcon(resourceFrame.thresholds[2], "searingNightmare", TRB.Data.settings.priest.shadow)
			end
		end)


		title = "Threshold Icon Horizontal Position (Relative)"
		yCoord = yCoord - 60
		controls.thresholdIconHorizontal = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxWidth/2), math.floor(sanityCheckValues.barMaxWidth/2), TRB.Data.settings.priest.shadow.thresholds.icons.xPos, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconHorizontal:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.thresholds.icons.xPos = value

			if GetSpecialization() == 1 then
				TRB.Functions.RepositionBar(TRB.Data.settings.priest.shadow, TRB.Frames.barContainerFrame)
			end
		end)

		title = "Threshold Icon Vertical Position (Relative)"
		controls.thresholdIconVertical = TRB.UiFunctions:BuildSlider(parent, title, math.ceil(-sanityCheckValues.barMaxHeight/2), math.floor(sanityCheckValues.barMaxHeight/2), TRB.Data.settings.priest.shadow.thresholds.icons.yPos, 1, 2,
									sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.thresholdIconVertical:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.thresholds.icons.yPos = value
		end)

		local maxIconBorderHeight = math.min(math.floor(TRB.Data.settings.priest.shadow.thresholds.icons.height / TRB.Data.constants.borderWidthFactor), math.floor(TRB.Data.settings.priest.shadow.thresholds.icons.width / TRB.Data.constants.borderWidthFactor))

		title = "Threshold Icon Border Width"
		yCoord = yCoord - 60
		controls.thresholdIconBorderWidth = TRB.UiFunctions:BuildSlider(parent, title, 0, maxIconBorderHeight, TRB.Data.settings.priest.shadow.thresholds.icons.border, 1, 2,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.thresholdIconBorderWidth:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.thresholds.icons.border = value

			local minsliderWidth = math.max(TRB.Data.settings.priest.shadow.thresholds.icons.border*2, 1)
			local minsliderHeight = math.max(TRB.Data.settings.priest.shadow.thresholds.icons.border*2, 1)

			controls.thresholdIconHeight:SetMinMaxValues(minsliderHeight, 128)
			controls.thresholdIconHeight.MinLabel:SetText(minsliderHeight)
			controls.thresholdIconWidth:SetMinMaxValues(minsliderWidth, 128)
			controls.thresholdIconWidth.MinLabel:SetText(minsliderWidth)

			if GetSpecialization() == 3 then
				TRB.Functions.RedrawThresholdLines(TRB.Data.settings.priest.shadow)
			end
		end)


		yCoord = yCoord - 60
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "End of Voidform Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.endOfVoidform = CreateFrame("CheckButton", "TRB_EOVF_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.endOfVoidform
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change bar color at the end of Voidform")
		f.tooltip = "Changes the bar color when Voidform is ending in the next X GCDs or fixed length of time. Select which to use from the options below."
		f:SetChecked(TRB.Data.settings.priest.shadow.endOfVoidform.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.endOfVoidform.enabled = self:GetChecked()
		end)
		yCoord = yCoord - 20
		controls.checkBoxes.endOfVoidformHungeringVoidOnly = CreateFrame("CheckButton", "TRB_EOVF_CB_HVO", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.endOfVoidformHungeringVoidOnly
		f:SetPoint("TOPLEFT", xCoord+xPadding*2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Only change the bar color when using Hungering Void")
		f.tooltip = "Only changes the bar color when you are talented in to Hungering Void."
		f:SetChecked(TRB.Data.settings.priest.shadow.endOfVoidform.hungeringVoidOnly)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.endOfVoidform.hungeringVoidOnly = self:GetChecked()
		end)

		yCoord = yCoord - 40
		controls.checkBoxes.endOfVoidformModeGCDs = CreateFrame("CheckButton", "TRB_EOFV_M_GCD", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.endOfVoidformModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("GCDs until Voidform ends")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many GCDs remain until Voidform ends."
		if TRB.Data.settings.priest.shadow.endOfVoidform.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.endOfVoidformModeGCDs:SetChecked(true)
			controls.checkBoxes.endOfVoidformModeTime:SetChecked(false)
			TRB.Data.settings.priest.shadow.endOfVoidform.mode = "gcd"
		end)

		title = "Voidform GCDs - 0.75sec Floor"
		controls.endOfVoidformGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0.5, 10, TRB.Data.settings.priest.shadow.endOfVoidform.gcdsMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.endOfVoidformGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.endOfVoidform.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.endOfVoidformModeTime = CreateFrame("CheckButton", "TRB_EOFV_M_TIME", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.endOfVoidformModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Time until Voidform ends")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Change the bar color based on how many seconds remain until Voidform will end."
		if TRB.Data.settings.priest.shadow.endOfVoidform.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.endOfVoidformModeGCDs:SetChecked(false)
			controls.checkBoxes.endOfVoidformModeTime:SetChecked(true)
			TRB.Data.settings.priest.shadow.endOfVoidform.mode = "time"
		end)

		title = "Voidform Time Remaining"
		controls.endOfVoidformTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 15, TRB.Data.settings.priest.shadow.endOfVoidform.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.endOfVoidformTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.endOfVoidform.timeMax = value
		end)

		yCoord = yCoord - 40
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Overcapping Configuration", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.overcapEnabled = CreateFrame("CheckButton", "TwintopResourceBar_CB1_8", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapEnabled
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change border color when overcapping")
		f.tooltip = "This will change the bar's border color when your current hardcast spell will result in overcapping maximum Insanity."
		f:SetChecked(TRB.Data.settings.priest.shadow.colors.bar.overcapEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.colors.bar.overcapEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 40

		title = "Show Overcap Notification Above"
		controls.overcapAt = TRB.UiFunctions:BuildSlider(parent, title, 0, 100, TRB.Data.settings.priest.shadow.overcapThreshold, 0.5, 1,
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
			TRB.Data.settings.priest.shadow.overcapThreshold = value
		end)


		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.shadow = controls
	end

	local function ShadowConstructFontAndTextPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.shadow
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

		controls.buttons.exportButton_Priest_Shadow_FontAndText = TRB.UiFunctions:BuildButton(parent, "Export Font & Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Shadow_FontAndText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Shadow Priest (Font & Text).", 5, 3, false, true, false, false, false)
		end)

		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Face", 0, yCoord)

		yCoord = yCoord - 30

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontLeft = CreateFrame("FRAME", "TwintopResourceBar_Priest_Shadow_FontLeft", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontLeft.label = TRB.UiFunctions:BuildSectionHeader(parent, "Left Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontLeft.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontLeft:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontLeft, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontLeft, TRB.Data.settings.priest.shadow.displayText.left.fontFaceName)
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
						info.checked = fonts[v] == TRB.Data.settings.priest.shadow.displayText.left.fontFace
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
			TRB.Data.settings.priest.shadow.displayText.left.fontFace = newValue
			TRB.Data.settings.priest.shadow.displayText.left.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
			if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
				TRB.Data.settings.priest.shadow.displayText.middle.fontFace = newValue
				TRB.Data.settings.priest.shadow.displayText.middle.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
				TRB.Data.settings.priest.shadow.displayText.right.fontFace = newValue
				TRB.Data.settings.priest.shadow.displayText.right.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end

			if GetSpecialization() == 3 then
				leftTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.left.fontFace, TRB.Data.settings.priest.shadow.displayText.left.fontSize, "OUTLINE")
				if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
					middleTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.middle.fontFace, TRB.Data.settings.priest.shadow.displayText.middle.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.right.fontFace, TRB.Data.settings.priest.shadow.displayText.right.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontMiddle = CreateFrame("FRAME", "TwintopResourceBar_Priest_Shadow_FontMiddle", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontMiddle.label = TRB.UiFunctions:BuildSectionHeader(parent, "Middle Bar Font Face", xCoord2, yCoord)
		controls.dropDown.fontMiddle.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontMiddle:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontMiddle, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.priest.shadow.displayText.middle.fontFaceName)
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
						info.checked = fonts[v] == TRB.Data.settings.priest.shadow.displayText.middle.fontFace
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
			TRB.Data.settings.priest.shadow.displayText.middle.fontFace = newValue
			TRB.Data.settings.priest.shadow.displayText.middle.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
				TRB.Data.settings.priest.shadow.displayText.left.fontFace = newValue
				TRB.Data.settings.priest.shadow.displayText.left.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.priest.shadow.displayText.right.fontFace = newValue
				TRB.Data.settings.priest.shadow.displayText.right.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			end

			if GetSpecialization() == 3 then
				middleTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.middle.fontFace, TRB.Data.settings.priest.shadow.displayText.middle.fontSize, "OUTLINE")
				if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
					leftTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.left.fontFace, TRB.Data.settings.priest.shadow.displayText.left.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.right.fontFace, TRB.Data.settings.priest.shadow.displayText.right.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		yCoord = yCoord - 40 - 20

		-- Create the dropdown, and configure its appearance
		controls.dropDown.fontRight = CreateFrame("FRAME", "TwintopResourceBar_Priest_Shadow_FontRight", parent, "UIDropDownMenuTemplate")
		controls.dropDown.fontRight.label = TRB.UiFunctions:BuildSectionHeader(parent, "Right Bar Font Face", xCoord, yCoord)
		controls.dropDown.fontRight.label.font:SetFontObject(GameFontNormal)
		controls.dropDown.fontRight:SetPoint("TOPLEFT", xCoord, yCoord-30)
		UIDropDownMenu_SetWidth(controls.dropDown.fontRight, dropdownWidth)
		UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.priest.shadow.displayText.right.fontFaceName)
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
						info.checked = fonts[v] == TRB.Data.settings.priest.shadow.displayText.right.fontFace
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
			TRB.Data.settings.priest.shadow.displayText.right.fontFace = newValue
			TRB.Data.settings.priest.shadow.displayText.right.fontFaceName = newName
			UIDropDownMenu_SetText(controls.dropDown.fontRight, newName)
			if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
				TRB.Data.settings.priest.shadow.displayText.left.fontFace = newValue
				TRB.Data.settings.priest.shadow.displayText.left.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontLeft, newName)
				TRB.Data.settings.priest.shadow.displayText.middle.fontFace = newValue
				TRB.Data.settings.priest.shadow.displayText.middle.fontFaceName = newName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, newName)
			end

			if GetSpecialization() == 3 then
				rightTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.right.fontFace, TRB.Data.settings.priest.shadow.displayText.right.fontSize, "OUTLINE")
				if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
					leftTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.left.fontFace, TRB.Data.settings.priest.shadow.displayText.left.fontSize, "OUTLINE")
					middleTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.middle.fontFace, TRB.Data.settings.priest.shadow.displayText.middle.fontSize, "OUTLINE")
				end
			end

			CloseDropDownMenus()
		end

		controls.checkBoxes.fontFaceLock = CreateFrame("CheckButton", "TwintopResourceBar_Priest_ShadowCB1_FONTFACE1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontFaceLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord-30)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font face for all text")
		f.tooltip = "This will lock the font face for text for each part of the bar to be the same."
		f:SetChecked(TRB.Data.settings.priest.shadow.displayText.fontFaceLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.displayText.fontFaceLock = self:GetChecked()
			if TRB.Data.settings.priest.shadow.displayText.fontFaceLock then
				TRB.Data.settings.priest.shadow.displayText.middle.fontFace = TRB.Data.settings.priest.shadow.displayText.left.fontFace
				TRB.Data.settings.priest.shadow.displayText.middle.fontFaceName = TRB.Data.settings.priest.shadow.displayText.left.fontFaceName
				UIDropDownMenu_SetText(controls.dropDown.fontMiddle, TRB.Data.settings.priest.shadow.displayText.middle.fontFaceName)
				TRB.Data.settings.priest.shadow.displayText.right.fontFace = TRB.Data.settings.priest.shadow.displayText.left.fontFace
				TRB.Data.settings.priest.shadow.displayText.right.fontFaceName = TRB.Data.settings.priest.shadow.displayText.left.fontFaceName
				UIDropDownMenu_SetText(controls.dropDown.fontRight, TRB.Data.settings.priest.shadow.displayText.right.fontFaceName)

				if GetSpecialization() == 3 then
					middleTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.middle.fontFace, TRB.Data.settings.priest.shadow.displayText.middle.fontSize, "OUTLINE")
					rightTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.right.fontFace, TRB.Data.settings.priest.shadow.displayText.right.fontSize, "OUTLINE")
				end
			end
		end)


		yCoord = yCoord - 70
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Font Size and Colors", 0, yCoord)

		title = "Left Bar Text Font Size"
		yCoord = yCoord - 50
		controls.fontSizeLeft = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.priest.shadow.displayText.left.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeLeft:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.displayText.left.fontSize = value

			if GetSpecialization() == 3 then
				leftTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.left.fontFace, TRB.Data.settings.priest.shadow.displayText.left.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.priest.shadow.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		controls.checkBoxes.fontSizeLock = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_CB2_F1", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.fontSizeLock
		f:SetPoint("TOPLEFT", xCoord2, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Use the same font size for all text")
		f.tooltip = "This will lock the font sizes for each part of the bar to be the same size."
		f:SetChecked(TRB.Data.settings.priest.shadow.displayText.fontSizeLock)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.displayText.fontSizeLock = self:GetChecked()
			if TRB.Data.settings.priest.shadow.displayText.fontSizeLock then
				controls.fontSizeMiddle:SetValue(TRB.Data.settings.priest.shadow.displayText.left.fontSize)
				controls.fontSizeRight:SetValue(TRB.Data.settings.priest.shadow.displayText.left.fontSize)
			end
		end)

		controls.colors.leftText = TRB.UiFunctions:BuildColorPicker(parent, "Left Text", TRB.Data.settings.priest.shadow.colors.text.left,
														250, 25, xCoord2, yCoord-30)
		f = controls.colors.leftText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.left, true)
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
					TRB.Data.settings.priest.shadow.colors.text.left = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.middleText = TRB.UiFunctions:BuildColorPicker(parent, "Middle Text", TRB.Data.settings.priest.shadow.colors.text.middle,
														225, 25, xCoord2, yCoord-70)
		f = controls.colors.middleText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.middle, true)
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
					TRB.Data.settings.priest.shadow.colors.text.middle = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.rightText = TRB.UiFunctions:BuildColorPicker(parent, "Right Text", TRB.Data.settings.priest.shadow.colors.text.right,
														225, 25, xCoord2, yCoord-110)
		f = controls.colors.rightText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.right, true)
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
					TRB.Data.settings.priest.shadow.colors.text.right = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		title = "Middle Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeMiddle = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.priest.shadow.displayText.middle.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeMiddle:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.displayText.middle.fontSize = value

			if GetSpecialization() == 3 then
				middleTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.middle.fontFace, TRB.Data.settings.priest.shadow.displayText.middle.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.priest.shadow.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeRight:SetValue(value)
			end
		end)

		title = "Right Bar Text Font Size"
		yCoord = yCoord - 60
		controls.fontSizeRight = TRB.UiFunctions:BuildSlider(parent, title, 6, 72, TRB.Data.settings.priest.shadow.displayText.right.fontSize, 1, 0,
									sliderWidth, sliderHeight, xCoord, yCoord)
		controls.fontSizeRight:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.displayText.right.fontSize = value

			if GetSpecialization() == 3 then
				rightTextFrame.font:SetFont(TRB.Data.settings.priest.shadow.displayText.right.fontFace, TRB.Data.settings.priest.shadow.displayText.right.fontSize, "OUTLINE")
			end

			if TRB.Data.settings.priest.shadow.displayText.fontSizeLock then
				controls.fontSizeLeft:SetValue(value)
				controls.fontSizeMiddle:SetValue(value)
			end
		end)

		yCoord = yCoord - 40
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Insanity Text Colors", 0, yCoord)

		yCoord = yCoord - 30
		controls.colors.currentInsanityText = TRB.UiFunctions:BuildColorPicker(parent, "Current Insanity", TRB.Data.settings.priest.shadow.colors.text.currentInsanity, 300, 25, xCoord, yCoord)
		f = controls.colors.currentInsanityText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.currentInsanity, true)
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

					controls.colors.currentInsanityText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.currentInsanity = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.castingInsanityText = TRB.UiFunctions:BuildColorPicker(parent, "Insanity from hardcasting spells", TRB.Data.settings.priest.shadow.colors.text.castingInsanity, 275, 25, xCoord2, yCoord)
		f = controls.colors.castingInsanityText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.castingInsanity, true)
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

					controls.colors.castingInsanityText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.castingInsanity = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.passiveInsanityText = TRB.UiFunctions:BuildColorPicker(parent, "Passive Insanity", TRB.Data.settings.priest.shadow.colors.text.passiveInsanity, 300, 25, xCoord, yCoord)
		f = controls.colors.passiveInsanityText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.passiveInsanity, true)
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

					controls.colors.passiveInsanityText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.passiveInsanity = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30
		controls.colors.thresholdInsanityText = TRB.UiFunctions:BuildColorPicker(parent, "Have enough Insanity to cast Devouring Plague or Searing Nightmare", TRB.Data.settings.priest.shadow.colors.text.overThreshold, 300, 25, xCoord, yCoord)
		f = controls.colors.thresholdInsanityText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.overThreshold, true)
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

					controls.colors.thresholdInsanityText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.overThreshold = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.overcapInsanityText = TRB.UiFunctions:BuildColorPicker(parent, "Cast will overcap Insanity", TRB.Data.settings.priest.shadow.colors.text.overcapInsanity, 300, 25, xCoord2, yCoord)
		f = controls.colors.overcapInsanityText
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.overcapInsanity, true)
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

					controls.colors.overcapInsanityText.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.overcapInsanity = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 30

		controls.checkBoxes.overThresholdEnabled = CreateFrame("CheckButton", "TRB_OverThresholdTextEnable", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overThresholdEnabled
		f:SetPoint("TOPLEFT", xCoord+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "This will change the Insanity text color when you are able to cast Devouring Plague or Searing Nightmare"
		f:SetChecked(TRB.Data.settings.priest.shadow.colors.text.overThresholdEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.colors.text.overThresholdEnabled = self:GetChecked()
		end)

		controls.checkBoxes.overcapTextEnabled = CreateFrame("CheckButton", "TRB_OvercapTextEnable", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapTextEnabled
		f:SetPoint("TOPLEFT", xCoord2+xPadding, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled?")
		f.tooltip = "This will change the Insanity text color when your current hardcast spell will result in overcapping maximum Insanity."
		f:SetChecked(TRB.Data.settings.priest.shadow.colors.text.overcapEnabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.colors.text.overcapEnabled = self:GetChecked()
		end)

		yCoord = yCoord - 30
		controls.dotColorSection = TRB.UiFunctions:BuildSectionHeader(parent, "DoT Count and Time Remaining Tracking", 0, yCoord)

		yCoord = yCoord - 25

		controls.checkBoxes.dotColor = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_dotColor", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.dotColor
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Change total DoT counter and DoT timer color based on DoT status?")
		f.tooltip = "When checked, the color of total DoTs up counters and DoT timers ($swpCount, $vtCount) will change based on whether or not the DoT is on the current target."
		f:SetChecked(TRB.Data.settings.priest.shadow.colors.text.dots.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.colors.text.dots.enabled = self:GetChecked()
		end)

		controls.colors.dotUp = TRB.UiFunctions:BuildColorPicker(parent, "DoT is active on current target", TRB.Data.settings.priest.shadow.colors.text.dots.up, 550, 25, xCoord, yCoord-30)
		f = controls.colors.dotUp
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.dots.up, true)
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
                    TRB.Data.settings.priest.shadow.colors.text.dots.up = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotPandemic = TRB.UiFunctions:BuildColorPicker(parent, "DoT is active on current target but within Pandemic refresh range", TRB.Data.settings.priest.shadow.colors.text.dots.pandemic, 550, 25, xCoord, yCoord-60)
		f = controls.colors.dotPandemic
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.dots.pandemic, true)
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
                    TRB.Data.settings.priest.shadow.colors.text.dots.pandemic = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)

		controls.colors.dotDown = TRB.UiFunctions:BuildColorPicker(parent, "DoT is not active on current target", TRB.Data.settings.priest.shadow.colors.text.dots.down, 550, 25, xCoord, yCoord-90)
		f = controls.colors.dotDown
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.dots.down, true)
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
                    TRB.Data.settings.priest.shadow.colors.text.dots.down = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
                end)
			end
		end)


		yCoord = yCoord - 130
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Haste Threshold Colors in Voidform", 0, yCoord)

		yCoord = yCoord - 50
		title = "Low to Med. Haste% Threshold in Voidform"
		controls.hasteApproachingThreshold = TRB.UiFunctions:BuildSlider(parent, title, 0, 500, TRB.Data.settings.priest.shadow.hasteApproachingThreshold, 0.25, 2,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.hasteApproachingThreshold:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			elseif value > TRB.Data.settings.priest.shadow.hasteThreshold then
				value = TRB.Data.settings.priest.shadow.hasteThreshold
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.hasteApproachingThreshold = value
		end)

		controls.colors.hasteBelow = TRB.UiFunctions:BuildColorPicker(parent, "Low Haste% in Voidform", TRB.Data.settings.priest.shadow.colors.text.hasteBelow,
													250, 25, xCoord2, yCoord+10)
		f = controls.colors.hasteBelow
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.hasteBelow, true)
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

					controls.colors.hasteBelow.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.hasteBelow = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.hasteApproaching = TRB.UiFunctions:BuildColorPicker(parent, "Medium Haste% in Voidform", TRB.Data.settings.priest.shadow.colors.text.hasteApproaching,
													250, 25, xCoord2, yCoord-30)
		f = controls.colors.hasteApproaching
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.hasteApproaching, true)
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

					controls.colors.hasteApproaching.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.hasteApproaching = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.hasteAbove = TRB.UiFunctions:BuildColorPicker(parent, "High Haste% in Voidform", TRB.Data.settings.priest.shadow.colors.text.hasteAbove,
													250, 25, xCoord2, yCoord-70)
		f = controls.colors.hasteAbove
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.hasteAbove, true)
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

					controls.colors.hasteAbove.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.hasteAbove = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 60
		title = "Med. to High Haste% Threshold in Voidform"
		controls.hasteThreshold = TRB.UiFunctions:BuildSlider(parent, title, 0, 500, TRB.Data.settings.priest.shadow.hasteThreshold, 0.25, 2,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.hasteThreshold:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			elseif value < TRB.Data.settings.priest.shadow.hasteApproachingThreshold then
				value = TRB.Data.settings.priest.shadow.hasteApproachingThreshold
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.hasteThreshold = value
		end)

		yCoord = yCoord - 40
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Surrender to Madness Target Time to Die Thresholds", 0, yCoord)

		yCoord = yCoord - 50
		title = "Low to Medium S2M TTD Threshold (sec)"
		controls.s2mApproachingThreshold = TRB.UiFunctions:BuildSlider(parent, title, 0, 30, TRB.Data.settings.priest.shadow.s2mApproachingThreshold, 0.25, 2,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.s2mApproachingThreshold:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			elseif value > TRB.Data.settings.priest.shadow.s2mThreshold then
				value = TRB.Data.settings.priest.shadow.s2mThreshold
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.s2mApproachingThreshold = value
		end)

		controls.colors.s2mBelow = TRB.UiFunctions:BuildColorPicker(parent, "Low S2M Time to Die", TRB.Data.settings.priest.shadow.colors.text.s2mBelow,
													250, 25, xCoord2, yCoord+10)
		f = controls.colors.s2mBelow
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.s2mBelow, true)
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

					controls.colors.s2mBelow.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.s2mBelow = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.s2mApproaching = TRB.UiFunctions:BuildColorPicker(parent, "Medium S2M Time to Die", TRB.Data.settings.priest.shadow.colors.text.s2mApproaching,
													250, 25, xCoord2, yCoord-30)
		f = controls.colors.s2mApproaching
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.s2mApproaching, true)
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

					controls.colors.s2mApproaching.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.s2mApproaching = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		controls.colors.s2mAbove = TRB.UiFunctions:BuildColorPicker(parent, "High S2M Time to Die", TRB.Data.settings.priest.shadow.colors.text.s2mAbove,
													250, 25, xCoord2, yCoord-70)
		f = controls.colors.s2mAbove
		f:SetScript("OnMouseDown", function(self, button, ...)
			if button == "LeftButton" then
				local r, g, b, a = TRB.Functions.GetRGBAFromString(TRB.Data.settings.priest.shadow.colors.text.s2mAbove, true)
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

					controls.colors.s2mAbove.Texture:SetColorTexture(r, g, b, 1-a)
					TRB.Data.settings.priest.shadow.colors.text.s2mAbove = TRB.Functions.ConvertColorDecimalToHex(r, g, b, 1-a)
				end)
			end
		end)

		yCoord = yCoord - 60
		title = "Medium to High S2M TTD Threshold (sec)"
		controls.s2mThreshold = TRB.UiFunctions:BuildSlider(parent, title, 0, 30, TRB.Data.settings.priest.shadow.s2mThreshold, 0.25, 2,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.s2mThreshold:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			elseif value < TRB.Data.settings.priest.shadow.s2mApproachingThreshold then
				value = TRB.Data.settings.priest.shadow.s2mApproachingThreshold
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.s2mThreshold = value
		end)

		yCoord = yCoord - 40
		controls.textDisplaySection = TRB.UiFunctions:BuildSectionHeader(parent, "Decimal Precision", 0, yCoord)

		yCoord = yCoord - 50
		title = "Haste / Crit / Mastery / Vers Decimal Precision"
		controls.hastePrecision = TRB.UiFunctions:BuildSlider(parent, title, 0, 10, TRB.Data.settings.priest.shadow.hastePrecision, 1, 0,
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
			TRB.Data.settings.priest.shadow.hastePrecision = value
		end)

		title = "Insanity Decimal Precision"
		controls.insanityPrecision = TRB.UiFunctions:BuildSlider(parent, title, 0, 2, TRB.Data.settings.priest.shadow.insanityPrecision, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.insanityPrecision:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 0)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.insanityPrecision = value
		end)

		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.shadow = controls
	end

	local function ShadowConstructAudioAndTrackingPanel(parent)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.shadow
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

		controls.buttons.exportButton_Priest_Shadow_AudioAndTracking = TRB.UiFunctions:BuildButton(parent, "Export Audio & Tracking", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Shadow_AudioAndTracking:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Shadow Priest (Audio & Tracking).", 5, 3, false, false, true, false, false)
		end)

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Audio Options", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.s2mDeath = CreateFrame("CheckButton", "TwintopResourceBar_CB3_2", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.s2mDeath
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio when you die, horribly, from Surrender to Madness")
		f.tooltip = "When you die, horribly, after Surrender to Madness ends, play the infamous Wilhelm Scream (or another sound) to make you feel a bit better."
		f:SetChecked(TRB.Data.settings.priest.shadow.audio.s2mDeath.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.audio.s2mDeath.enabled = self:GetChecked()

			if TRB.Data.settings.priest.shadow.audio.s2mDeath.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.shadow.audio.s2mDeath.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.s2mAudio = CreateFrame("FRAME", "TwintopResourceBar_S2MDeathAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.s2mAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.s2mAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.s2mAudio, TRB.Data.settings.priest.shadow.audio.s2mDeath.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.s2mAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.s2mAudio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.shadow.audio.s2mDeath.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.s2mAudio:SetValue(newValue, newName)
			TRB.Data.settings.priest.shadow.audio.s2mDeath.sound = newValue
			TRB.Data.settings.priest.shadow.audio.s2mDeath.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.s2mAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.shadow.audio.s2mDeath.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.dpReady = CreateFrame("CheckButton", "TwintopResourceBar_CB3_3", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.dpReady
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when Devouring Plague is usable")
		f.tooltip = "Play an audio cue when Devouring Plague can be cast."
		f:SetChecked(TRB.Data.settings.priest.shadow.audio.dpReady.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.audio.dpReady.enabled = self:GetChecked()

			if TRB.Data.settings.priest.shadow.audio.dpReady.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.shadow.audio.dpReady.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.dpReadyAudio = CreateFrame("FRAME", "TwintopResourceBar_dpReadyAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.dpReadyAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.dpReadyAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.dpReadyAudio, TRB.Data.settings.priest.shadow.audio.dpReady.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.dpReadyAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.dpReadyAudio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.shadow.audio.dpReady.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.dpReadyAudio:SetValue(newValue, newName)
			TRB.Data.settings.priest.shadow.audio.dpReady.sound = newValue
			TRB.Data.settings.priest.shadow.audio.dpReady.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.dpReadyAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.shadow.audio.dpReady.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.checkBoxes.mdProc = CreateFrame("CheckButton", "TwintopResourceBar_CB3_MD_Sound", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.mdProc
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when Mind Devourer proc occurs")
		f.tooltip = "Play an audio cue when a Mind Devourer proc occurs. This supercedes the regular Devouring Plague audio sound."
		f:SetChecked(TRB.Data.settings.priest.shadow.audio.mdProc.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.audio.mdProc.enabled = self:GetChecked()

			if TRB.Data.settings.priest.shadow.audio.mdProc.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.shadow.audio.mdProc.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.mdProcAudio = CreateFrame("FRAME", "TwintopResourceBar_mdProcAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.mdProcAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.mdProcAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.mdProcAudio, TRB.Data.settings.priest.shadow.audio.mdProc.soundName)
		UIDropDownMenu_JustifyText(controls.dropDown.mdProcAudio, "LEFT")

		-- Create and bind the initialization function to the dropdown menu
		UIDropDownMenu_Initialize(controls.dropDown.mdProcAudio, function(self, level, menuList)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.shadow.audio.mdProc.sound
						info.func = self.SetValue
						info.arg1 = sounds[v]
						info.arg2 = v
						UIDropDownMenu_AddButton(info, level)
					end
				end
			end
		end)

		-- Implement the function to change the audio
		function controls.dropDown.mdProcAudio:SetValue(newValue, newName)
			TRB.Data.settings.priest.shadow.audio.mdProc.sound = newValue
			TRB.Data.settings.priest.shadow.audio.mdProc.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.mdProcAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.shadow.audio.mdProc.sound, TRB.Data.settings.core.audio.channel.channel)
		end



		yCoord = yCoord - 60
		controls.checkBoxes.overcapAudio = CreateFrame("CheckButton", "TwintopResourceBar_CB3_OC_Sound", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.overcapAudio
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Play audio cue when you will overcap Insanity")
		f.tooltip = "Play an audio cue when your hardcast spell will overcap Insanity."
		f:SetChecked(TRB.Data.settings.priest.shadow.audio.overcap.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.audio.overcap.enabled = self:GetChecked()

			if TRB.Data.settings.priest.shadow.audio.overcap.enabled then
---@diagnostic disable-next-line: redundant-parameter
				PlaySoundFile(TRB.Data.settings.priest.shadow.audio.overcap.sound, TRB.Data.settings.core.audio.channel.channel)
			end
		end)

		-- Create the dropdown, and configure its appearance
		controls.dropDown.overcapAudio = CreateFrame("FRAME", "TwintopResourceBar_overcapAudio", parent, "UIDropDownMenuTemplate")
		controls.dropDown.overcapAudio:SetPoint("TOPLEFT", xCoord, yCoord-20)
		UIDropDownMenu_SetWidth(controls.dropDown.overcapAudio, sliderWidth)
		UIDropDownMenu_SetText(controls.dropDown.overcapAudio, TRB.Data.settings.priest.shadow.audio.overcap.soundName)
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
						info.checked = sounds[v] == TRB.Data.settings.priest.shadow.audio.overcap.sound
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
			TRB.Data.settings.priest.shadow.audio.overcap.sound = newValue
			TRB.Data.settings.priest.shadow.audio.overcap.soundName = newName
			UIDropDownMenu_SetText(controls.dropDown.overcapAudio, newName)
			CloseDropDownMenus()
---@diagnostic disable-next-line: redundant-parameter
			PlaySoundFile(TRB.Data.settings.priest.shadow.audio.overcap.sound, TRB.Data.settings.core.audio.channel.channel)
		end


		yCoord = yCoord - 60
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Auspicious Spirits Tracking", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.as = CreateFrame("CheckButton", "TwintopResourceBar_CB3_6", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.as
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track Auspicious Spirits")
		f.tooltip = "Track Shadowy Apparitions in flight that will generate Insanity upon reaching their target with the Auspicious Spirits talent."
		f:SetChecked(TRB.Data.settings.priest.shadow.auspiciousSpiritsTracker)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.auspiciousSpiritsTracker = self:GetChecked()

			if ((TRB.Data.settings.priest.shadow.auspiciousSpiritsTracker and TRB.Data.character.talents.as.isSelected) or TRB.Functions.IsTtdActive(TRB.Data.settings.priest.shadow)) and GetSpecialization() == 3 then
				targetsTimerFrame:SetScript("OnUpdate", function(self, sinceLastUpdate) targetsTimerFrame:onUpdate(sinceLastUpdate) end)
			else
				targetsTimerFrame:SetScript("OnUpdate", nil)
			end
			TRB.Data.snapshotData.targetData.auspiciousSpirits = 0
		end)

		yCoord = yCoord - 30
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Eternal Call to the Void / Void Tendril + Void Lasher Tracking", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.voidTendril = CreateFrame("CheckButton", "TwintopResourceBar_CB3_6a", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.voidTendril
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track Eternal Call to the Void")
		f.tooltip = "Track Insanity generated from Lash of Insanity via Void Tendril + Void Lasher spawns / Eternal Call of the Void procs."
		f:SetChecked(TRB.Data.settings.priest.shadow.voidTendrilTracker)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.voidTendrilTracker = self:GetChecked()
			TRB.Data.snapshotData.eternalCallToTheVoid.numberActive = 0
			TRB.Data.snapshotData.eternalCallToTheVoid.resourceRaw = 0
			TRB.Data.snapshotData.eternalCallToTheVoid.resourceFinal = 0
			TRB.Data.snapshotData.eternalCallToTheVoid.maxTicksRemaining = 0
			TRB.Data.snapshotData.eternalCallToTheVoid.voidTendrils = {}
		end)

		yCoord = yCoord - 30
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Shadowfiend/Mindbender Tracking", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.mindbender = CreateFrame("CheckButton", "TwintopResourceBar_CB3_7", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.mindbender
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track Shadowfiend Insanity Gain")
		f.tooltip = "Show the gain of Insanity over the next serveral swings, GCDs, or fixed length of time. Select which to track from the options below."
		f:SetChecked(TRB.Data.settings.priest.shadow.mindbender.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.mindbender.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 30
		controls.checkBoxes.mindbenderModeGCDs = CreateFrame("CheckButton", "TwintopResourceBar_RB3_8", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.mindbenderModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Insanity from GCDs remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Insanity incoming over the up to next X GCDs, based on player's current GCD."
		if TRB.Data.settings.priest.shadow.mindbender.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.mindbenderModeGCDs:SetChecked(true)
			controls.checkBoxes.mindbenderModeSwings:SetChecked(false)
			controls.checkBoxes.mindbenderModeTime:SetChecked(false)
			TRB.Data.settings.priest.shadow.mindbender.mode = "gcd"
		end)

		title = "Shadowfiend GCDs - 0.75sec Floor"
		controls.mindbenderGCDs = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.shadow.mindbender.gcdsMax, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.mindbenderGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.mindbender.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.mindbenderModeSwings = CreateFrame("CheckButton", "TwintopResourceBar_RB3_9", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.mindbenderModeSwings
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Insanity from Swings remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Insanity incoming over the up to next X melee swings from Shadowfiend/Mindbender. This is only different from the GCD option if you are above 200% haste (GCD cap)."
		if TRB.Data.settings.priest.shadow.mindbender.mode == "swing" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.mindbenderModeGCDs:SetChecked(false)
			controls.checkBoxes.mindbenderModeSwings:SetChecked(true)
			controls.checkBoxes.mindbenderModeTime:SetChecked(false)
			TRB.Data.settings.priest.shadow.mindbender.mode = "swing"
		end)

		title = "Shadowfiend Swings - No Floor"
		controls.mindbenderSwings = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.shadow.mindbender.swingsMax, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.mindbenderSwings:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.mindbender.swingsMax = value
		end)

		yCoord = yCoord - 60
		controls.checkBoxes.mindbenderModeTime = CreateFrame("CheckButton", "TwintopResourceBar_RB3_10", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.mindbenderModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Insanity from Time remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Insanity incoming over the up to next X seconds."
		if TRB.Data.settings.priest.shadow.mindbender.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.mindbenderModeGCDs:SetChecked(false)
			controls.checkBoxes.mindbenderModeSwings:SetChecked(false)
			controls.checkBoxes.mindbenderModeTime:SetChecked(true)
			TRB.Data.settings.priest.shadow.mindbender.mode = "time"
		end)

		title = "Shadowfiend Remaining (sec)"
		controls.mindbenderTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 15, TRB.Data.settings.priest.shadow.mindbender.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.mindbenderTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.mindbender.timeMax = value
		end)


		yCoord = yCoord - 30
		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Wrathful Faerie Tracking", 0, yCoord)

		yCoord = yCoord - 30
		controls.checkBoxes.wrathfulFaerie = CreateFrame("CheckButton", "TRB_WrathfulFaerieTracking_CB", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerie
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Track Wrathful Faerie and Fae Fermata Insanity Gain")
		f.tooltip = "Show the gain of Insanity over the next serveral procs, GCDs, or fixed length of time. Select which to track from the options below."
		f:SetChecked(TRB.Data.settings.priest.shadow.wrathfulFaerie.enabled)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.enabled = self:GetChecked()
		end)

		yCoord = yCoord - 40
		title = "Proc Delay after ICD Reset"
		controls.wrathfulFaerieGCDs = TRB.UiFunctions:BuildSlider(parent, title, 0, 0.75, TRB.Data.settings.priest.shadow.wrathfulFaerie.procDelay, 0.05, 2,
										sliderWidth, sliderHeight, xCoord, yCoord)
		controls.wrathfulFaerieGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.procDelay = value
		end)

		yCoord = yCoord - 60
		controls.checkBoxes.wrathfulFaerieModeGCDs = CreateFrame("CheckButton", "TRB_WrathfulFaerieTracking_1", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerieModeGCDs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Insanity from GCDs remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Insanity incoming over the up to next X GCDs, based on player's current GCD."
		if TRB.Data.settings.priest.shadow.wrathfulFaerie.mode == "gcd" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.wrathfulFaerieModeGCDs:SetChecked(true)
			controls.checkBoxes.wrathfulFaerieModeProcs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeTime:SetChecked(false)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.mode = "gcd"
		end)

		title = "GCDs - 0.75sec Floor"
		controls.wrathfulFaerieGCDs = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.shadow.wrathfulFaerie.gcdsMax, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.wrathfulFaerieGCDs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.gcdsMax = value
		end)


		yCoord = yCoord - 60
		controls.checkBoxes.wrathfulFaerieModeProcs = CreateFrame("CheckButton", "TRB_WrathfulFaerieTracking_2", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerieModeProcs
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Insanity from Procs remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Insanity incoming over the up to next X procs from Wrathful Faerie/Fae Fermata."
		if TRB.Data.settings.priest.shadow.wrathfulFaerie.mode == "procs" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.wrathfulFaerieModeGCDs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeProcs:SetChecked(true)
			controls.checkBoxes.wrathfulFaerieModeTime:SetChecked(false)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.mode = "procs"
		end)

		title = "Wrathful Faerie Procs - No Floor"
		controls.wrathfulFaerieProcs = TRB.UiFunctions:BuildSlider(parent, title, 1, 10, TRB.Data.settings.priest.shadow.wrathfulFaerie.procsMax, 1, 0,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.wrathfulFaerieProcs:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.procsMax = value
		end)

		yCoord = yCoord - 60
		controls.checkBoxes.wrathfulFaerieModeTime = CreateFrame("CheckButton", "TRB_WrathfulFaerieTracking_3", parent, "UIRadioButtonTemplate")
		f = controls.checkBoxes.wrathfulFaerieModeTime
		f:SetPoint("TOPLEFT", xCoord, yCoord)
		getglobal(f:GetName() .. 'Text'):SetText("Insanity from Time remaining")
		getglobal(f:GetName() .. 'Text'):SetFontObject(GameFontHighlight)
		f.tooltip = "Shows the amount of Insanity incoming over the up to next X seconds."
		if TRB.Data.settings.priest.shadow.wrathfulFaerie.mode == "time" then
			f:SetChecked(true)
		end
		f:SetScript("OnClick", function(self, ...)
			controls.checkBoxes.wrathfulFaerieModeGCDs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeProcs:SetChecked(false)
			controls.checkBoxes.wrathfulFaerieModeTime:SetChecked(true)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.mode = "time"
		end)

		title = "Wrathful Faerie Time Remaining (sec)"
		controls.wrathfulFaerieTime = TRB.UiFunctions:BuildSlider(parent, title, 0, 20, TRB.Data.settings.priest.shadow.wrathfulFaerie.timeMax, 0.25, 2,
										sliderWidth, sliderHeight, xCoord2, yCoord)
		controls.wrathfulFaerieTime:SetScript("OnValueChanged", function(self, value)
			local min, max = self:GetMinMaxValues()
			if value > max then
				value = max
			elseif value < min then
				value = min
			end

			value = TRB.Functions.RoundTo(value, 2)
			self.EditBox:SetText(value)
			TRB.Data.settings.priest.shadow.wrathfulFaerie.timeMax = value
		end)


		TRB.Frames.interfaceSettingsFrameContainer = interfaceSettingsFrame
		TRB.Frames.interfaceSettingsFrameContainer.controls.shadow = controls
	end

	local function ShadowConstructBarTextDisplayPanel(parent, cache)
		if parent == nil then
			return
		end

		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local controls = interfaceSettingsFrame.controls.shadow
		local yCoord = 5
		local f = nil

		local xPadding = 10
		local xPadding2 = 30
		local xCoord = 5
		local xCoord2 = 290
		local xOffset1 = 50
		local xOffset2 = xCoord2 + xOffset1
		local namePrefix = "Priest_Shadow"

		TRB.UiFunctions:BuildSectionHeader(parent, "Bar Display Text Customization", 0, yCoord)

		controls.buttons.exportButton_Priest_Shadow_BarText = TRB.UiFunctions:BuildButton(parent, "Export Bar Text", 325, yCoord-5, 225, 20)
		controls.buttons.exportButton_Priest_Shadow_BarText:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Shadow Priest (Bar Text).", 5, 3, false, false, false, true, false)
		end)

		yCoord = yCoord - 30
		TRB.UiFunctions:BuildLabel(parent, "Left Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.left = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Left", TRB.Data.settings.priest.shadow.displayText.left.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.left
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.priest.shadow.displayText.left.text = self:GetText()
			TRB.Data.barTextCache = {}
			if GetSpecialization() == 3 then
				TRB.Functions.IsTtdActive(TRB.Data.settings.priest.shadow)
			end
		end)
		f:SetCursorPosition(0)

		yCoord = yCoord - 70
		controls.labels.middleText = TRB.UiFunctions:BuildLabel(parent, "Middle Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.middle = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Middle", TRB.Data.settings.priest.shadow.displayText.middle.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.middle
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.priest.shadow.displayText.middle.text = self:GetText()
			TRB.Data.barTextCache = {}
			if GetSpecialization() == 3 then
				TRB.Functions.IsTtdActive(TRB.Data.settings.priest.shadow)
			end
		end)
		f:SetCursorPosition(0)

		yCoord = yCoord - 70
		TRB.UiFunctions:BuildLabel(parent, "Right Text", xCoord, yCoord, 90, 20, nil, "RIGHT")

		controls.textbox.right = TRB.UiFunctions:CreateBarTextInputPanel(parent, namePrefix .. "_Right", TRB.Data.settings.priest.shadow.displayText.right.text,
														430, 60, xCoord+95, yCoord)
		f = controls.textbox.right
		f:SetScript("OnTextChanged", function(self, input)
			TRB.Data.settings.priest.shadow.displayText.right.text = self:GetText()
			TRB.Data.barTextCache = {}
			if GetSpecialization() == 3 then
				TRB.Functions.IsTtdActive(TRB.Data.settings.priest.shadow)
			end
		end)
		f:SetCursorPosition(0)

		yCoord = yCoord - 70
		local variablesPanel = TRB.UiFunctions:CreateVariablesSidePanel(parent, namePrefix)
		TRB.Options:CreateBarTextInstructions(parent, xCoord, yCoord)
		TRB.Options:CreateBarTextVariables(cache, variablesPanel, 5, -30)
	end

	local function ShadowConstructOptionsPanel(cache)
		local interfaceSettingsFrame = TRB.Frames.interfaceSettingsFrameContainer
		local parent = interfaceSettingsFrame.panel
		local controls = interfaceSettingsFrame.controls.shadow or {}
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

		interfaceSettingsFrame.shadowDisplayPanel = CreateFrame("Frame", "TwintopResourceBar_Options_Priest_Shadow", UIParent)
		interfaceSettingsFrame.shadowDisplayPanel.name = "Shadow Priest"
---@diagnostic disable-next-line: undefined-field
		interfaceSettingsFrame.shadowDisplayPanel.parent = parent.name
		InterfaceOptions_AddCategory(interfaceSettingsFrame.shadowDisplayPanel)

		parent = interfaceSettingsFrame.shadowDisplayPanel

		controls.textSection = TRB.UiFunctions:BuildSectionHeader(parent, "Shadow Priest", xCoord+xPadding, yCoord-5)
	
		controls.checkBoxes.shadowPriestEnabled = CreateFrame("CheckButton", "TwintopResourceBar_Priest_Shadow_shadowPriestEnabled", parent, "ChatConfigCheckButtonTemplate")
		f = controls.checkBoxes.shadowPriestEnabled
		f:SetPoint("TOPLEFT", 250, yCoord-10)
		getglobal(f:GetName() .. 'Text'):SetText("Enabled")
		f.tooltip = "Is Twintop's Resource Bar enabled for the Shadow Priest specialization? If unchecked, the bar will not function (including the population of global variables!)."
		f:SetChecked(TRB.Data.settings.core.enabled.priest.shadow)
		f:SetScript("OnClick", function(self, ...)
			TRB.Data.settings.core.enabled.priest.shadow = self:GetChecked()
			TRB.Functions.EventRegistration()
			TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.shadowPriestEnabled, TRB.Data.settings.core.enabled.priest.shadow, true)
		end)

		TRB.UiFunctions:ToggleCheckboxOnOff(controls.checkBoxes.shadowPriestEnabled, TRB.Data.settings.core.enabled.priest.shadow, true)

		controls.buttons.importButton = TRB.UiFunctions:BuildButton(parent, "Import", 345, yCoord-10, 90, 20)
		controls.buttons.importButton:SetFrameLevel(10000)
		controls.buttons.importButton:SetScript("OnClick", function(self, ...)
			StaticPopup_Show("TwintopResourceBar_Import")
		end)

		controls.buttons.exportButton_Priest_Shadow_All = TRB.UiFunctions:BuildButton(parent, "Export Specialization", 440, yCoord-10, 150, 20)
		controls.buttons.exportButton_Priest_Shadow_All:SetScript("OnClick", function(self, ...)
			TRB.Functions.ExportPopup("Copy the string below to share your Twintop's Resource Bar configuration for Shadow Priest (All).", 5, 3, true, true, true, true, false)
		end)

		yCoord = yCoord - 42

		local tabs = {}
		local tabsheets = {}

		tabs[1] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Shadow_Tab1", "Bar Display", 1, parent, 85)
		tabs[1]:SetPoint("TOPLEFT", 15, yCoord)
		tabs[2] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Shadow_Tab2", "Font & Text", 2, parent, 85, tabs[1])
		tabs[3] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Shadow_Tab3", "Audio & Tracking", 3, parent, 120, tabs[2])
		tabs[4] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Shadow_Tab4", "Bar Text", 4, parent, 60, tabs[3])
		tabs[5] = TRB.UiFunctions:CreateTab("TwintopResourceBar_Options_Priest_Shadow_Tab5", "Reset Defaults", 5, parent, 100, tabs[4])

		PanelTemplates_TabResize(tabs[1], 0)
		PanelTemplates_TabResize(tabs[2], 0)
		PanelTemplates_TabResize(tabs[3], 0)
		PanelTemplates_TabResize(tabs[4], 0)
		PanelTemplates_TabResize(tabs[5], 0)
		yCoord = yCoord - 15

		for i = 1, 5 do
			tabsheets[i] = TRB.UiFunctions:CreateTabFrameContainer("TwintopResourceBar_Priest_Shadow_LayoutPanel" .. i, parent)
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
		TRB.Frames.interfaceSettingsFrameContainer.controls.shadow = controls

		ShadowConstructBarColorsAndBehaviorPanel(tabsheets[1].scrollFrame.scrollChild)
		ShadowConstructFontAndTextPanel(tabsheets[2].scrollFrame.scrollChild)
		ShadowConstructAudioAndTrackingPanel(tabsheets[3].scrollFrame.scrollChild)
		ShadowConstructBarTextDisplayPanel(tabsheets[4].scrollFrame.scrollChild, cache)
		ShadowConstructResetDefaultsPanel(tabsheets[5].scrollFrame.scrollChild)
	end

	local function ConstructOptionsPanel(specCache)
		TRB.Options:ConstructOptionsPanel()
		HolyConstructOptionsPanel(specCache.holy)
		ShadowConstructOptionsPanel(specCache.shadow)
	end
	TRB.Options.Priest.ConstructOptionsPanel = ConstructOptionsPanel
end
