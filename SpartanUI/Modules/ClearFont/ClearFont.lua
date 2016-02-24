-- =============================================================================
--  CLEARFONT BY KIRKBURN
--  Official website:  http://www.clearfont.co.uk/
-- =============================================================================


-- =============================================================================
--  CLEARFONT FRAME & FONT LOCALS FOR BREVITY LATER
--  You can add your own font locals, following the example
-- =============================================================================
ClearFont = CreateFrame("Frame", "ClearFont");

-- Tell it where to look for the fonts
local CLEAR_FONT_BASE = "Interface\\AddOns\\SpartanUI\\Modules\\ClearFont\\Fonts\\";

-- Tell it what fonts to use in which situations
local CLEAR_FONT = CLEAR_FONT_BASE .. "Sui_Font_Condensed_ExtraBold.ttf"; --ClearFont.ttf";
local CLEAR_FONT_BOLD = CLEAR_FONT_BASE .. "Sui_Font_Condensed_ExtraBold.ttf"; --ClearFontBold.ttf";
local CLEAR_FONT_ITALIC = CLEAR_FONT_BASE .. "ClearFontItalic.ttf";
local CLEAR_FONT_BOLDITALIC = CLEAR_FONT_BASE .. "ClearFontBoldItalic.ttf";
local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "Sui_Font_Condensed_ExtraBold.ttf"; --ClearFontNumber.ttf";

-- You can add your own fonts/font styles (example)
local SUI_FONT_STYLE = CLEAR_FONT_BASE .. "Sui_Font_Condensed_ExtraBold.ttf";
local SUI_FONT_HEAVY = CLEAR_FONT_BASE .. "Sui_Font_Bold.ttf";
local SUI_FONT_HEAVYBOLD = CLEAR_FONT_BASE .. "Sui_Font_Bold.ttf";
local SUI_FONT_FANCY = CLEAR_FONT_BASE .. "Centaur_Bold_Italic.ttf";
local SUI_FONT_SCRIPT_ITALIC = CLEAR_FONT_BASE .. "Centaur_Bold_Italic.ttf";

-- Font scale - e.g. if you want all fonts at 80% scale, change '1.0' to '0.8'
local CF_SCALE = 1.0


-- Check existence of overridable fonts & change them
local function CanSetFont(object)
   return (type(object)=="table"
	   and object.SetFont and object.IsObjectType
	      and not object:IsObjectType("SimpleHTML"));
end


-- =============================================================================
-- STANDARD WOW UI SECTION
-- =============================================================================
-- This is the most important section to edit!
-- Main font styles are listed first, the rest follows alphabetically
-- Overrides come within an if statement in case of patch changes
-- -----------------------------------------------------------------------------
-- For the example GameFontNormal:SetFont(CLEAR_FONT, 13 * CF_SCALE);
-- The first part in the brackets is the font style, followed by the font size
-- This is multiplied by the CF_SCALE as defined above
-- Change to suit your needs!
-- =============================================================================

function ClearFont:ApplySystemFonts()

	-- Names above people's heads
	UNIT_NAME_FONT = CLEAR_FONT;
	NAMEPLATE_FONT = CLEAR_FONT;

	-- The damage pop-up over your target's head (*not* SCT/SDT style)
	DAMAGE_TEXT_FONT = CLEAR_FONT_NUMBER;

	-- DISABLED FUNCTIONS (they appear to cause AddOn Blocked errors when dismissing pets):

	-- Chat bubbles
	STANDARD_TEXT_FONT = CLEAR_FONT;

	-- Drop-down menu font
	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12 * CF_SCALE;

	-- System Font
	if (CanSetFont(SystemFont)) then SystemFont:SetFont(CLEAR_FONT, 17 * CF_SCALE); end

	-- Primary Game Fonts: the main font you see everywhere
	if (CanSetFont(GameFontNormal)) then GameFontNormal:SetFont(CLEAR_FONT, 12 * CF_SCALE); end
	if (CanSetFont(GameFontHighlight)) then GameFontHighlight:SetFont(CLEAR_FONT, 12 * CF_SCALE); end

	if (CanSetFont(GameFontDisable)) then GameFontDisable:SetFont(CLEAR_FONT, 12 * CF_SCALE); end
	if (CanSetFont(GameFontDisable)) then GameFontDisable:SetTextColor(0.6, 0.6, 0.6); end

	if (CanSetFont(GameFontGreen)) then GameFontGreen:SetFont(CLEAR_FONT, 12 * CF_SCALE); end
	if (CanSetFont(GameFontRed)) then GameFontRed:SetFont(CLEAR_FONT, 12 * CF_SCALE); end
	if (CanSetFont(GameFontBlack)) then GameFontBlack:SetFont(CLEAR_FONT, 12 * CF_SCALE); end
	if (CanSetFont(GameFontWhite)) then GameFontWhite:SetFont(CLEAR_FONT, 12 * CF_SCALE); end

	-- Small Game Fonts: the small font frequently used, also used in Titan Panel
	if (CanSetFont(GameFontNormalSmall)) then GameFontNormalSmall:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE); end
	if (CanSetFont(GameFontHighlightSmall)) then GameFontHighlightSmall:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE); end
	if (CanSetFont(GameFontHighlightSmallOutline)) then GameFontHighlightSmallOutline:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE, "OUTLINE"); end

	if (CanSetFont(GameFontDisableSmall)) then GameFontDisableSmall:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE); end
	if (CanSetFont(GameFontDisableSmall)) then GameFontDisableSmall:SetTextColor(0.6, 0.6, 0.6); end

	if (CanSetFont(GameFontDarkGraySmall)) then GameFontDarkGraySmall:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE); end
	if (CanSetFont(GameFontDarkGraySmall)) then GameFontDarkGraySmall:SetTextColor(0.4, 0.4, 0.4); end

	if (CanSetFont(GameFontGreenSmall)) then GameFontGreenSmall:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE); end
	if (CanSetFont(GameFontRedSmall)) then GameFontRedSmall:SetFont(CLEAR_FONT_BOLD, 10 * CF_SCALE); end

	-- Large Game Fonts: titles
	if (CanSetFont(GameFontNormalLarge)) then GameFontNormalLarge:SetFont(CLEAR_FONT_BOLD, 17 * CF_SCALE); end
	if (CanSetFont(GameFontHighlightLarge)) then GameFontHighlightLarge:SetFont(CLEAR_FONT, 17 * CF_SCALE); end

	if (CanSetFont(GameFontDisableLarge)) then GameFontDisableLarge:SetFont(CLEAR_FONT, 17 * CF_SCALE); end
	if (CanSetFont(GameFontDisableLarge)) then GameFontDisableLarge:SetTextColor(0.6, 0.6, 0.6); end

	if (CanSetFont(GameFontGreenLarge)) then GameFontGreenLarge:SetFont(CLEAR_FONT, 17 * CF_SCALE); end
	if (CanSetFont(GameFontRedLarge)) then 	GameFontRedLarge:SetFont(CLEAR_FONT, 17 * CF_SCALE); end

	-- Huge Game Fonts: raid warnings
	if (CanSetFont(GameFontNormalHuge)) then GameFontNormalHuge:SetFont(CLEAR_FONT_BOLD, 21 * CF_SCALE); end

	-- CombatTextFont: in-built SCT-style info
	if (CanSetFont(CombatTextFont)) then CombatTextFont:SetFont(CLEAR_FONT,18 * CF_SCALE); end

	-- Number Fonts: used in Auction House, money, keybinding, & quantity overlays
	if (CanSetFont(NumberFontNormal)) then NumberFontNormal:SetFont(CLEAR_FONT_NUMBER, 14 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(NumberFontNormalYellow)) then NumberFontNormalYellow:SetFont(CLEAR_FONT_NUMBER, 14 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(NumberFontNormalSmall)) then NumberFontNormalSmall:SetFont(CLEAR_FONT_NUMBER, 14 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(NumberFontNormalSmallGray)) then NumberFontNormalSmallGray:SetFont(CLEAR_FONT_NUMBER, 14 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(NumberFontNormalLarge)) then NumberFontNormalLarge:SetFont(CLEAR_FONT_NUMBER, 17 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(NumberFontNormalHuge)) then NumberFontNormalHuge:SetFont(CLEAR_FONT_NUMBER, 30 * CF_SCALE, "THICKOUTLINE"); end
	if (CanSetFont(NumberFontNormalHuge)) then NumberFontNormalHuge:SetAlpha(30); end

	-- Chat window input font & increased size options available for the chat window font
	if (CanSetFont(ChatFontNormal)) then ChatFontNormal:SetFont(CLEAR_FONT_BOLD, 13 * CF_SCALE, "OUTLINE"); end

	CHAT_FONT_HEIGHTS = {
		[1] = 7,
		[2] = 8,
		[3] = 9,
		[4] = 10,
		[5] = 11,
		[6] = 12,
		[7] = 13,
		[8] = 14,
		[9] = 15,
		[10] = 16,
		[11] = 17,
		[12] = 18,
		[13] = 19,
		[14] = 20,
		[15] = 21,
		[16] = 22,
		[17] = 23,
		[18] = 24
	};

	-- QUEST TITLES
	if (CanSetFont(QuestTitleFont)) then QuestTitleFont:SetFont(CLEAR_FONT_BOLD, 20 * CF_SCALE); end
	if (CanSetFont(QuestTitleFont)) then QuestTitleFont:SetShadowColor(0.54, 0.4, 0.1); end

	-- QUEST DESCRIPTIONS
	if (CanSetFont(QuestFont)) then QuestFont:SetFont(CLEAR_FONT_BOLD, 14 * CF_SCALE); end
	if (CanSetFont(QuestFont)) then QuestFont:SetTextColor(0.22, 0.12, 0.06); end

	-- QUEST OBJECTIVES
	if (CanSetFont(QuestFontNormalSmall)) then QuestFontNormalSmall:SetFont(CLEAR_FONT_BOLD, 14 * CF_SCALE); end
	if (CanSetFont(QuestFontNormalSmall)) then QuestFontNormalSmall:SetShadowColor(0.54, 0.4, 0.1); end

	if (CanSetFont(QuestFontHighlight)) then QuestFontHighlight:SetFont(CLEAR_FONT_BOLD, 15 * CF_SCALE); end
	if (CanSetFont(QuestFontHighlight)) then QuestFontHighlight:SetTextColor(0.3, 0.18, 0.08); end

	-- Dialog Buttons: "Accept", etc.
	if (CanSetFont(DialogButtonNormalText)) then DialogButtonNormalText:SetFont(CLEAR_FONT, 17 * CF_SCALE); end
	if (CanSetFont(DialogButtonHighlightText)) then DialogButtonHighlightText:SetFont(CLEAR_FONT, 17 * CF_SCALE); end

	-- Error Log: "Another Action is in Progress", etc.
	if (CanSetFont(ErrorFont)) then ErrorFont:SetFont(CLEAR_FONT_ITALIC, 18 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(ErrorFont)) then ErrorFont:SetAlpha(60); end

	-- Item Info: general usage in frames
	if (CanSetFont(ItemTextFontNormal)) then ItemTextFontNormal:SetFont(CLEAR_FONT, 16 * CF_SCALE); end

	-- Mail & Invoice Text: in-game mails & Auction House invoices
	if (CanSetFont(MailTextFontNormal)) then MailTextFontNormal:SetFont(CLEAR_FONT_ITALIC, 18 * CF_SCALE); end
	if (CanSetFont(MailTextFontNormal)) then MailTextFontNormal:SetTextColor(0.15, 0.09, 0.04); end
	if (CanSetFont(MailTextFontNormal)) then MailTextFontNormal:SetShadowColor(0.54, 0.4, 0.1); end
	if (CanSetFont(MailTextFontNormal)) then MailTextFontNormal:SetShadowOffset(1, -1); end

	if (CanSetFont(InvoiceTextFontNormal)) then InvoiceTextFontNormal:SetFont(CLEAR_FONT_ITALIC, 14 * CF_SCALE); end
	if (CanSetFont(InvoiceTextFontNormal)) then InvoiceTextFontNormal:SetTextColor(0.15, 0.09, 0.04); end

	if (CanSetFont(InvoiceTextFontSmall)) then InvoiceTextFontSmall:SetFont(CLEAR_FONT_ITALIC, 12 * CF_SCALE); end
	if (CanSetFont(InvoiceTextFontSmall)) then InvoiceTextFontSmall:SetTextColor(0.15, 0.09, 0.04); end

	-- Spell Book: ability subtitles
	if (CanSetFont(SubSpellFont)) then SubSpellFont:SetFont(CLEAR_FONT_BOLD, 11 * CF_SCALE); end
	if (CanSetFont(SubSpellFont)) then SubSpellFont:SetTextColor(0.3, 0.18, 0.08); end

	-- Status Bars: Numbers on the unit frames, Damage Meters

	if (CanSetFont(TextStatusBarText)) then TextStatusBarText:SetFont(CLEAR_FONT_NUMBER, 12 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(TextStatusBarTextSmall)) then TextStatusBarTextSmall:SetFont(CLEAR_FONT, 12); end

	-- Tooltips
	if (CanSetFont(GameTooltipText)) then GameTooltipText:SetFont(CLEAR_FONT_BOLD, 12 * CF_SCALE, "OUTLINE"); end
	if (CanSetFont(GameTooltipTextSmall)) then GameTooltipTextSmall:SetFont(CLEAR_FONT_BOLD, 12 * CF_SCALE); end
	if (CanSetFont(GameTooltipHeaderText)) then GameTooltipHeaderText:SetFont(CLEAR_FONT_BOLD, 12 * CF_SCALE, "OUTLINE"); end

	-- World Map: location titles
	if (CanSetFont(WorldMapTextFont)) then WorldMapTextFont:SetFont(CLEAR_FONT_BOLDITALIC, 48 * CF_SCALE, "THICKOUTLINE"); end
	if (CanSetFont(WorldMapTextFont)) then WorldMapTextFont:SetShadowColor(0, 0, 0); end
	if (CanSetFont(WorldMapTextFont)) then WorldMapTextFont:SetShadowOffset(1, -1); end
	if (CanSetFont(WorldMapTextFont)) then WorldMapTextFont:SetAlpha(40); end

	-- Zone Changes: on-screen notifications
	if (CanSetFont(ZoneTextFont)) then ZoneTextFont:SetFont(CLEAR_FONT_BOLDITALIC, 36 * CF_SCALE, "THICKOUTLINE"); end
	if (CanSetFont(ZoneTextFont)) then ZoneTextFont:SetShadowColor(0, 0, 0); end
	if (CanSetFont(ZoneTextFont)) then ZoneTextFont:SetShadowOffset(1, -1); end
	if (CanSetFont(SubZoneTextFont)) then SubZoneTextFont:SetFont(CLEAR_FONT_BOLDITALIC, 24 * CF_SCALE, "THICKOUTLINE"); end

	-- Appears to no longer be used?
	if (CanSetFont(CombatLogFont)) then CombatLogFont:SetFont(CLEAR_FONT, 11 * CF_SCALE); end

	-- Patch 2.0.1 updates
	if (CanSetFont(PVPInfoTextFont)) then CombatLogFont:SetFont(CLEAR_FONT, 22 * CF_SCALE, "THICKOUTLINE"); end
end

-- =============================================================================
-- FUNCTION TO RELOAD EVERY TIME AN ADDON LOADS
-- They do like to mess up my addon!
-- =============================================================================
ClearFont:SetScript("OnEvent",
	    function()
	       if (event == "ADDON_LOADED") then
		  ClearFont:ApplySystemFonts()
	       end
	    end);

ClearFont:RegisterEvent("ADDON_LOADED");

-- =============================================================================
-- APPLY ALL THE ABOVE ON FIRST RUN
-- To start the ball rolling
-- =============================================================================
ClearFont:ApplySystemFonts()
