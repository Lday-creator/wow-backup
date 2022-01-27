AuctionatorAHFrameMixin = {}

local function InitializeIncrementalScanFrame()
  local frame
  if Auctionator.State.IncrementalScanFrameRef == nil then
    frame = CreateFrame(
      "FRAME",
      "AuctionatorIncrementalScanFrame",
      AuctionHouseFrame,
      "AuctionatorIncrementalScanFrameTemplate"
    )

    Auctionator.State.IncrementalScanFrameRef = frame
  else
    frame = Auctionator.State.IncrementalScanFrameRef
  end

  if not Auctionator.Config.Get(Auctionator.Config.Options.REPLICATE_SCAN) and
     Auctionator.Config.Get(Auctionator.Config.Options.AUTOSCAN) and
     frame:IsAutoscanReady() then
    frame:InitiateScan()
  end
end

local function InitializeFullScanFrame()
  local frame
  if Auctionator.State.FullScanFrameRef == nil then
    frame = CreateFrame(
      "FRAME",
      "AuctionatorFullScanFrame",
      AuctionHouseFrame,
      "AuctionatorFullScanFrameTemplate"
    )

    Auctionator.State.FullScanFrameRef = frame
  else
    frame = Auctionator.State.FullScanFrameRef
  end

  if Auctionator.Config.Get(Auctionator.Config.Options.REPLICATE_SCAN) and
     Auctionator.Config.Get(Auctionator.Config.Options.AUTOSCAN) and
     frame:IsAutoscanReady() then
    frame:InitiateScan()
  end
end

local function InitializeAuctionHouseTabs()
  if Auctionator.State.TabFrameRef == nil then
    Auctionator.State.TabFrameRef = CreateFrame(
      "Frame",
      "AuctionatorAHTabsContainer",
      AuctionHouseFrame,
      "AuctionatorAHTabsContainerTemplate"
    )
  end
end

local function InitializeSplashScreen()
  if Auctionator.State.SplashScreenRef == nil then
    Auctionator.State.SplashScreenRef = CreateFrame(
      "Frame",
      "AuctionatorSplashScreen",
      UIParent,
      "AuctionatorSplashScreenTemplate"
    )
  end
end

local setTooltipHooks = false
local function InitializeLateTooltipHooks()
  if setTooltipHooks then
    return
  end

  Auctionator.Tooltip.MainlineLateHooks()

  setTooltipHooks = true
end

local function ShowDefaultTab()
  local tabs = AuctionatorAHTabsContainer.Tabs

  local chosenTab = tabs[Auctionator.Config.Get(Auctionator.Config.Options.DEFAULT_TAB)]

  if chosenTab then
    chosenTab:Click()
  end
end

function AuctionatorAHFrameMixin:OnShow()
  Auctionator.Debug.Message("AuctionatorAHFrameMixin:OnShow()")

  InitializeIncrementalScanFrame()
  InitializeFullScanFrame()
  InitializeLateTooltipHooks()

  InitializeAuctionHouseTabs()
  InitializeSplashScreen()

  ShowDefaultTab()
end

function AuctionatorAHFrameMixin:OnEvent(eventName, ...)
  if eventName == "AUCTION_HOUSE_SHOW" then
    self:Show()
  elseif eventName == "AUCTION_HOUSE_CLOSED" then
    self:Hide()
  end
end
