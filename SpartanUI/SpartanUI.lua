-----------------------------------------------------------------------------------------------
--| Purpose: SpartanUI logic								    |--
--| Authors: Ansu (a.k.a. Atriace), Beladona						    |--
--| Website: www.SpartanUI.com								    |--
-----------------------------------------------------------------------------------------------
local _G = getfenv(0)
function Sui_OnLoad()
	SlashCmdList["SUI"] = Sui_SlashCommand
	SLASH_SUI1 = "/sui"
	SLASH_SUI2 = "/spartanui"
	SUI_currentVersion = 0.9
	SUI_devmode = true
	Sui_RegisterEvents()
end

function Sui_InitializeVariables(protectVars)
	godmode=0
	-- Saved vars that need to be saved.
	local i, curVar, varKind = 1
	local protectedVars = {
		[1] = { "buffToggle" },
		[2] = { "partyToggle" },
		[3] = { "scale" },
		[4] = { "popUps" },
		[5] = { "raidIcons" },
		[6] = { "PartyInRaid" },
		[7] = { "broadcastToggle" },
		[8] = { "rightbackdrop" },
		[9] = { "autoresToggle" },
		[10] = { "leftbackdrop" },
	}
	if protectVars then
		while protectedVars[i] and protectedVars[i][1] do
			curVar = protectedVars[i][1]
			varKind = type(suiData[curVar])
			if suiData and suiData[curVar] then
				varKind = type(suiData[curVar])
				protectedVars[i][2] = suiData[curVar]
			else
				protectedVars[i][2] = nil
			end
			i = i + 1
		end
	end
-----------------------------------------------------------------------------------------------
--| This is an example of data that can be stored in suiData while the game is running.     |--
--| It's wiped upon logout/login NOT /reloadui. These are several of the numerous Global   |--
--| Vars that get assigned on the fly which are pulled from this "cached" data.		    |--
--|											    |--
--| suiData = {										    |--
--|   ["currentTime"] = 290297,								    |--
--|   ["sessionMarker"] = 152439.75,							    |--
--|   ["scale"] = 0.78,									    |--
--|   ["lastTarget"] = "%last player/target name%",					    |--
--|   ["unit"] = {									    |--
--|     [1] = {										    |--
--|       ["healthbar_width"] = 148,							    |--
--|       ["weaponLimit"] = 2,								    |--
--|         ["Buff"] = {								    |--
--|           [1] = {									    |--
--|             ["type"] = "HELPFUL",							    |--
--|             ["index"] = 1,								    |--
--|             ["buffTime"] = 6.266,							    |--
--|             ["applications"] = 1,							    |--
--|             ["buffTimeMarker"] = 152655.546,					    |--
--|             ["buffTexture"] = "Interface\\Icons\\Spell_Holy_PowerWordShield",	    |--
-----------------------------------------------------------------------------------------------
	suiData = {
		dbVersion = SUI_currentVersion,
		isSpinning = 0,
		FrameAdvance = 0,
		UpdateInterval = 1,
		GeneralInterval = 0,
		AnimationInterval = 0,
		FastInterval = 0,
		FrequentInterval = 0,
		delayedCalls = {},
		sessionMarker = GetTime(),
		sessionXP = UnitXP("player"),
		scale = .87,
		popUps = "on",
		buffToggle = "on",
		partyToggle = "on",
		broadcastToggle = "on",
		autoresToggle = "on",
		rightbackdrop = "on",
		leftbackdrop = "on",
		PartyInRaid = "off",
		layout = "Standard",
		raidIcons = "Default",
		unit = {
			[1] = {	----------------------------------| suiData.unit[i]		<-- toon ["string"]
				["frame"] = "SUI_Self",	----------| suiData.unit[i].unit.frame	<-- frame "string"
				["unit"] = "player", -------------| suiData.unit[i].unit	<-- toonID(#)
				["direction"] = "left",
				["runDirection"] = "left",
				["castbar_width"] = 146,
				["castbar_height"] = 16,
				["healthbar_width"] = 148,
				["healthbar_height"] = 16,
				["powerbar_width"] = 155,
				["powerbar_height"] = 15,
				["buffSize"] = 20,
				["buffPadding"] = 1,
				["buffLimit"] = 12,
				["debuffLimit"] = 12,
				["weaponLimit"] = 2,
			},
			[2] = {
				["frame"] = "SUI_Target",
				["unit"] = "target",
				["direction"] = "right",
				["runDirection"] = "right",
				["castbar_width"] = 146,
				["castbar_height"] = 16,
				["healthbar_width"] = 148,
				["healthbar_height"] = 16,
				["powerbar_width"] = 155,
				["powerbar_height"] = 15,
				["buffSize"] = 20,
				["buffPadding"] = 1,
				["buffLimit"] = 12,
				["debuffLimit"] = 12,
			},
			[3] = {
				["frame"] = "SUI_Party1",
				["unit"] = "party1",
				["direction"] = "left",
				["runDirection"] = "right",
				["castbar_width"] = 120,
				["castbar_height"] = 15,
				["healthbar_width"] = 120,
				["healthbar_height"] = 15,
				["powerbar_width"] = 136,
				["powerbar_height"] = 14,
				["buffSize"] = 14,
				["buffPadding"] = 2,
				["buffLimit"] = 3,
				["debuffLimit"] = 3,
			},
			[4] = {
				["frame"] = "SUI_Party2",
				["unit"] = "party2",
				["direction"] = "left",
				["runDirection"] = "right",
				["castbar_width"] = 120,
				["castbar_height"] = 15,
				["healthbar_width"] = 120,
				["healthbar_height"] = 15,
				["powerbar_width"] = 136,
				["powerbar_height"] = 14,
				["buffSize"] = 14,
				["buffPadding"] = 2,
				["buffLimit"] = 3,
				["debuffLimit"] = 3,
			},
			[5] = {
				["frame"] = "SUI_Party3",
				["unit"] = "party3",
				["direction"] = "left",
				["runDirection"] = "right",
				["castbar_width"] = 120,
				["castbar_height"] = 15,
				["healthbar_width"] = 120,
				["healthbar_height"] = 15,
				["powerbar_width"] = 136,
				["powerbar_height"] = 14,
				["buffSize"] = 14,
				["buffPadding"] = 2,
				["buffLimit"] = 3,
				["debuffLimit"] = 3,
			},
			[6] = {
				["frame"] = "SUI_Party4",
				["unit"] = "party4",
				["direction"] = "left",
				["runDirection"] = "right",
				["castbar_width"] = 120,
				["castbar_height"] = 15,
				["healthbar_width"] = 120,
				["healthbar_height"] = 15,
				["powerbar_width"] = 136,
				["powerbar_height"] = 14,
				["buffSize"] = 14,
				["buffPadding"] = 2,
				["buffLimit"] = 3,
				["debuffLimit"] = 3,
			},
			[7] = {
				["frame"] = "SUI_TOT",
				["unit"] = "targettarget",
				["direction"] = "right",
				["runDirection"] = "left",
				["castbar_width"] = 120,
				["castbar_height"] = 15,
				["healthbar_width"] = 120,
				["healthbar_height"] = 15,
				["powerbar_width"] = 136,
				["powerbar_height"] = 14,
				["buffSize"] = 14,
				["buffPadding"] = 2,
				["buffLimit"] = 3,
				["debuffLimit"] = 3,
			},
			[8] = {
				["frame"] = "SUI_Pet",
				["unit"] = "pet",
				["direction"] = "left",
				["runDirection"] = "right",
				["castbar_width"] = 100,
				["castbar_height"] = 10,
				["healthbar_width"] = 130,
				["healthbar_height"] = 13,
				["powerbar_width"] = 130,
				["powerbar_height"] = 13,
				["buffSize"] = 14,
				["buffPadding"] = 2,
				["buffLimit"] = 3,
				["debuffLimit"] = 3,
			},
			[9] = {
				["frame"] = "SUI_PartyPet1",
				["unit"] = "partypet1",
				["direction"] = "left",
				["healthbar_width"] = 130,
				["healthbar_height"] = 13,
				["buffLimit"] = 0,
				["debuffLimit"] = 0,
			},
			[10] = {
				["frame"] = "SUI_PartyPet2",
				["unit"] = "partypet2",
				["direction"] = "left",
				["healthbar_width"] = 130,
				["healthbar_height"] = 13,
				["buffLimit"] = 0,
				["debuffLimit"] = 0,
			},
			[11] = {
				["frame"] = "SUI_PartyPet3",
				["unit"] = "partypet3",
				["direction"] = "left",
				["healthbar_width"] = 130,
				["healthbar_height"] = 13,
				["buffLimit"] = 0,
				["debuffLimit"] = 0,
			},
			[12] = {
				["frame"] = "SUI_PartyPet4",
				["unit"] = "partypet4",
				["direction"] = "left",
				["healthbar_width"] = 130,
				["healthbar_height"] = 13,
				["buffLimit"] = 0,
				["debuffLimit"] = 0,
			},
		},
	}
	if protectVars then
		i = 1
		while protectedVars[i] and protectedVars[i][1] do
			curVar = protectedVars[i][1]
			--DEFAULT_CHAT_FRAME:AddMessage(curVar.." = "..(tostring(protectedVars[i][2])), 0.5, 0.5, 1)
			suiData[curVar] = protectedVars[i][2]
			i = i + 1
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:  Registers for events.							    |--
-----------------------------------------------------------------------------------------------
function Sui_RegisterEvents()
	local events = {
		"ADDON_LOADED",
		"PLAYER_ENTERING_WORLD",
		"BAG_UPDATE",
		"BAG_UPDATE_COOLDOWN",
		"ITEM_LOCK_CHANGED",
		"CHAT_MSG_ADDON",
		"CHAT_MSG_COMBAT_FACTION_CHANGE",
		"CHAT_MSG_COMBAT_XP_GAIN",
		"CHAT_MSG_SYSTEM",
		"PARTY_LEADER_CHANGED",
		"PARTY_LOOT_METHOD_CHANGED",
		"PARTY_MEMBERS_CHANGED",
		"PLAYER_DEAD",
		"PLAYER_ALIVE",
		"PLAYER_ENTER_COMBAT",
		"PLAYER_AURAS_CHANGED",
		"PLAYER_COMBO_POINTS",
		"PLAYER_FLAGS_CHANGED",
		"PLAYER_FOCUS_CHANGED",
		"PLAYER_LEAVE_COMBAT",
		"PLAYER_LEAVING_WORLD",
		"PLAYER_REGEN_DISABLED",
		"PLAYER_REGEN_ENABLED",
		"PLAYER_TARGET_CHANGED",
		"PLAYER_UPDATE_RESTING",
		"PLAYER_XP_UPDATE",
		"QUEST_LOG_UPDATE",
		"RAID_ROSTER_UPDATE",
		"RAID_TARGET_UPDATE",
		"READY_CHECK",
		"READY_CHECK_CONFIRM",
		"READY_CHECK_FINISHED",
		"TIME_PLAYED_MSG",
		"UNIT_AURA",
		"UNIT_COMBAT",
		"UNIT_ENERGY",
		"UNIT_FACTION",
		"UNIT_FOCUS",
		"UNIT_HAPPINESS",
		"UNIT_HEALTH",
		"UNIT_INVENTORY_CHANGED",
		"UNIT_LEVEL",
		"UNIT_MANA",
		"UNIT_PET",
		"UNIT_PORTRAIT_UPDATE",
		"UNIT_RAGE",
		"SPELLCAST_CHANNEL_START",
		"SPELLCAST_CHANNEL_STOP",
		"SPELLCAST_CHANNEL_UPDATE",
		"SPELLCAST_DELAYED",
		"SPELLCAST_FAILED",
		"SPELLCAST_INTERRUPTED",
		"SPELLCAST_START",
		"SPELLCAST_STOP",
		"UPDATE_FACTION",
		"UPDATE_INVENTORY_ALERTS",
		"UPDATE_SHAPESHIFT_FORMS",
		"VARIABLES_LOADED",
		"VOICE_START",
		"VOICE_STOP",
		"VOICE_PUSH_TO_TALK_START",
		"VOICE_PUSH_TO_TALK_STOP",
		"ZONE_CHANGED"
	}
	for __,v in pairs(events) do SpartanUI:RegisterEvent(v) end
end
-----------------------------------------------------------------------------------------------
--|	Purpose: Initial cleanup and setup for SpartanUI				    |--
-----------------------------------------------------------------------------------------------
function Sui_Setup()
	if suiData.buffToggle == "on" then
		Sui_BuffCreateFrames()
		BuffFrame:Hide()
		BuffFrame:SetAlpha(0)
		if TemporaryEnchantFrame then
			TemporaryEnchantFrame:Hide()
			TemporaryEnchantFrame:SetAlpha(0)
		end
	end
	SUI_HUD:SetFrameLevel(1)
	SetCVar("cameraDistanceMax","50")							-- Set the max cam distance to max
	SetCVar("cameraYawMoveSpeed","230")							-- Reset SpinCam in case of poor reload
	ChatFrame1:UnregisterEvent("TIME_PLAYED_MSG")
	RequestTimePlayed()
	QuestWatchFrame:ClearAllPoints()
	QuestWatchFrame:SetPoint("TOPRIGHT", "SpartanUI", "TOPRIGHT", -20, -20);
	QuestTimerFrame:ClearAllPoints()
	QuestTimerFrame:SetPoint("TOPRIGHT", "QuestWatchFrame", "BOTTOMRIGHT", -20, 20);
	DurabilityFrame:ClearAllPoints()
	DurabilityFrame:SetPoint("TOPRIGHT", "QuestWatchFrame", "BOTTOMRIGHT", -20, 20);
	--Hide Unit frames and add redundancy for if SUI doesn't catch it fast enough
	PlayerFrame:UnregisterAllEvents()
	PlayerFrame:Hide()
	TargetFrame:UnregisterAllEvents()
	TargetFrame:Hide()
	PartyMemberFrame1:UnregisterAllEvents()
	PartyMemberFrame1:Hide()
	PartyMemberFrame2:UnregisterAllEvents()
	PartyMemberFrame2:Hide()
	PartyMemberFrame3:UnregisterAllEvents()
	PartyMemberFrame3:Hide()
	PartyMemberFrame4:UnregisterAllEvents()
	PartyMemberFrame4:Hide()
	MainMenuBar:Hide()
	Sui_Bags(updateContainerFrameAnchors)
	Sui_CaptureBar_Update(CaptureBar_Update)
	Sui_ManageFrames(UIParent_ManageFramePositions)
	if ( BattlefieldMinimapTab and not BattlefieldMinimapTab:IsUserPlaced() ) then
		BattlefieldMinimapTab:ClearAllPoints()
		BattlefieldMinimapTab:SetPoint("TOP", "UIParent", "TOP", 0, 0)
	end
	Sui_ChatFrame("setup")
	Sui_LoadModules()
	Sui_MinimapFix()
	if suiData.autoresToggle == "on" then
		Sui_ResDetect()
	end
	if suiData.popUps == "off" then
		SUI_PopLeft_Hit:Hide()
		SUI_PopRight_Hit:Hide()
    end
    if suiData.rightbackdrop == "off" then
    	SUI_Bar6_BG:Hide()
    end
    if suiData.leftbackdrop == "off" then
		SUI_Bar5_BG:Hide()
		Bartender:ToggleBar("Bar5")
    end
    if not ClickCastFrames then ClickCastFrames = {} end
	ClickCastFrames[SUI_Self_Button] = true
	ClickCastFrames[SUI_Target_Button] = true
	ClickCastFrames[SUI_Party1_Button] = true
	ClickCastFrames[SUI_Party2_Button] = true
	ClickCastFrames[SUI_Party3_Button] = true
	ClickCastFrames[SUI_Party4_Button] = true
	ClickCastFrames[SUI_Pet_Button] = true
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Command List								    |--
-----------------------------------------------------------------------------------------------
function Sui_SlashCommand(msg)
	local cmd = gsub(msg,"^%s*(%a*)%s*(.*)%s*$","%1")
	local arg1 = gsub(msg,"^%s*(%a*)%s*([%w %p]*)%s*$","%2")
	local msg = string.lower(cmd)
	local arg1 = string.lower(arg1)
	if msg == "" then
		Sui_HelpMenu()
	end
	if msg==SUIL.ENGLISH.UI.GODMODE or msg==SUI_Lang.UI.GODMODE then
		DEFAULT_CHAT_FRAME:AddMessage("Entering God Mode.", 1.0, 0, 0.0)
		DEFAULT_CHAT_FRAME:AddMessage("Now go beat up some Horde, "..UnitName("player")..".  :)", .5, .5, .5)
		godmode=1
	elseif msg=="fixres" then
		Sui_ResDetect()
	elseif msg == "autores" then								-- on by default
		if arg1=="on" then
			suiData.autoresToggle = "on"        
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: AutoUI Resize on - Please reload your UI.", 0.5, 0.5, 0.5)
		elseif arg1=="off" then
			suiData.autoresToggle = "off"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: AutoUI Resize off - Please reload your UI.", 0.5, 0.5, 0.5)
		end
	elseif msg==SUIL.ENGLISH.UI.VERSION or msg==SUI_Lang.UI.VERSION or msg=="version" then
		if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
			SendAddonMessage("SUI", "find "..UnitName("player").." version ".."current", "PARTY", arg1 or UnitName("target"))
		end
		if not (UnitInParty("party1")) then
			DEFAULT_CHAT_FRAME:AddMessage("You are using SpartanUI Version: "..SUI_currentVersion, 1, 0.75, 0)
		end
	elseif msg=="lang" then
		if arg1 == "" then
			Sui_HelpMenu("lang")
			return
		end
		if arg1=="english" or arg1==SUIL.ENGLISH.LANGUAGE then
			SUI_Lang = SUIL.ENGLISH
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="french" or arg1==SUIL.FRENCH.LANGUAGE then
			SUI_Lang = SUIL.FRENCH
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="greek" or arg1==SUIL.GREEK.LANGUAGE then
			SUI_Lang = SUIL.GREEK
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="italian" or arg1==SUIL.ITALIAN.LANGUAGE then
			SUI_Lang = SUIL.ITALIAN
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="swedish" or arg1==SUIL.SWEDISH.LANGUAGE then
			SUI_Lang = SUIL.SWEDISH
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="danish" or arg1==SUIL.DANISH.LANGUAGE then
			SUI_Lang = SUIL.DANISH
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="russian" or arg1==SUIL.RUSSIAN.LANGUAGE then
			SUI_Lang = SUIL.RUSSIAN
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="spanish" or arg1==SUIL.SPANISH.LANGUAGE then
			SUI_Lang = SUIL.SPANISH
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="korean" or arg1==SUIL.KOREAN.LANGUAGE then
			SUI_Lang = SUIL.KOREAN
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="norwegian" or arg1==SUIL.NORWEGIAN.LANGUAGE then
			SUI_Lang = SUIL.NORWEGIAN
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="german" or arg1==SUIL.GERMAN.LANGUAGE then
			SUI_Lang = SUIL.GERMAN
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		elseif arg1=="chinese" or arg1==SUIL.CHINESE.LANGUAGE then
			SUI_Lang = SUIL.TRADITIONAL_CHINESE
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI v"..suiData.dbVersion.." "..SUI_Lang.UI.LANGUAGE.." loaded.", 0.65, 0.65, 0.65)
		else
			DEFAULT_CHAT_FRAME:AddMessage(arg1.." language is not available.", 0.65, 0.65, 0.65)
			Sui_HelpMenu(lang)
		end
	elseif msg=="stats" then
		local fps, timestamp = math.floor(GetFramerate()), suiData.AFKTimestamp
		local down, up, lag = GetNetStats()
			if suiData.AFKTimestampStart < suiData.AFKTimestampStop then
				atime = suiData.AFKTimestampStop - suiData.AFKTimestampStart
				timestamp = date("%M:%S", atime)
				value = lag.."||"..fps.."||"..timestamp
				if (UnitExists("party1") == nil) then
					DEFAULT_CHAT_FRAME:AddMessage("Here are your system stats: Lag: "..lag.."ms | FPS:"..fps.." | Your last AFK lasted: "..timestamp.." Min:Sec", 1, 0.75, 0)
				end
			elseif suiData.AFKTimestampStart > suiData.AFKTimestampStop then
				btime = GetTime() - suiData.AFKTimestampStart
				timestamp = date("%M:%S", btime)
				suiData.AFKTimestamp = timestamp
				value = lag.."||"..fps.."||"..timestamp
				if (UnitExists("party1") == nil) then
					DEFAULT_CHAT_FRAME:AddMessage("Here are your system stats: Lag: "..lag.."ms | FPS:"..fps.." | You have been AFK for: "..timestamp.." Min:Sec", 1, 0.75, 0)
				end
			elseif not timestamp then
				timestamp = "AFK for Zero"
				suiData.AFKTimestamp = timestamp
				value = lag.."||"..fps.."||"..timestamp
				if (UnitExists("party1") == nil) then
					DEFAULT_CHAT_FRAME:AddMessage("Here are your system stats: Lag: "..lag.."ms | FPS:"..fps.." | You haven't been AFK this session: Want a cookie?", 1, 0.75, 0)
				end
			end
			if (UnitExists("party1") == 1) and (suiData.broadcastToggle == "on") then
				SendAddonMessage("SUI", "find "..UnitName("player").." performance "..value.." ", "PARTY", arg1)
			end
	elseif msg=="popup" then
		if arg1=="on" then								-- on by default
			suiData.popUps = "on"
			SUI_PopLeft_Hit:Show()
			SUI_PopRight_Hit:Show()
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Popups on.", 0.5, 0.5, 0.5)
		elseif arg1=="off" then
			suiData.popUps = "off"
			SUI_PopLeft_Hit:Hide()
			SUI_PopRight_Hit:Hide()
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Popups off.", 0.5, 0.5, 0.5)
		end
	elseif msg=="buff" or msg=="buffs" then							-- on by default
		if arg1=="off" then
			suiData.buffToggle = "off"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Buffs off - Please reload your UI.", 0.5, 0.5, 0.5)
			ReloadUI()
		elseif arg1=="on" then
			suiData.buffToggle = "on"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Buffs on - Please reload your UI.", 0.5, 0.5, 0.5)
			ReloadUI()
		end
	elseif msg == "broadcast" then								-- on by default
		if arg1=="on" then
			suiData.broadcastToggle = "on"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Broadcast on.", 0.5, 0.5, 0.5)
		elseif arg1=="off" then
			suiData.broadcastToggle = "off"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Broadcast off.", 0.5, 0.5, 0.5)
		end
	elseif msg=="party" then								-- on by default
		if arg1=="off" then
			suiData.partyToggle = "off"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Party Frames off.", 0.5, 0.5, 0.5)
		elseif arg1=="on" then
			suiData.partyToggle = "on"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Party Frames on.", 0.5, 0.5, 0.5)
		end
		Sui_UpdatePartyVisibility()
	elseif msg=="partyinraid" then								-- off by default
		if arg1=="on" then
			suiData.PartyInRaid = "on"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Party Frames while in RAID on.", 0.5, 0.5, 0.5)
		elseif arg1=="off" then
			suiData.PartyInRaid = "off"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Party Frames while in RAID off.", 0.5, 0.5, 0.5)
		end
		Sui_UpdatePartyVisibility()
	elseif msg=="help" then
		Sui_HelpMenu()
	elseif msg=="effect" then
		if arg1=="vignette" then
			FG_OnEvent("vignette")
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Effect Vignette *Toggled*.", 0.5, 0.5, 0.5)
		elseif arg1=="blur" then
			FG_OnEvent("film", "blur")
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Effect Film / Blur *Toggled*.", 0.5, 0.5, 0.5)
		elseif arg1=="crisp" then
			FG_OnEvent("film", "crisp")
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Effect Film / Crisp *Toggled*.", 0.5, 0.5, 0.5)
		end
	elseif msg=="icons" then
		if arg1=="color" then
			suiData.raidIcons = "Clean_Color"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Raid Icons set to Clean Color", 1, 0.75, 0)
			Sui_RaidIcon()
		elseif arg1=="grey" then
			suiData.raidIcons = "Clean_Grey"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Raid Icons set to Clean Grey", 1, 0.75, 0)
			Sui_RaidIcon()
		elseif arg1=="default" then
			suiData.raidIcons = "Default"
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Raid Icons set to default", 1, 0.75, 0)
			Sui_RaidIcon()
		end
	-- Originally SpartanUI used Bartender 3 but it's incompatible. I decided to use
	-- this texture as a back drop for a damage meter to make it look like it belongs
	-- there and not just hanging out over the back ground of the UI.
	elseif msg=="rightbackdrop" then							-- on by default
		if arg1=="off" then
			suiData.rightbackdrop = "off"
			SUI_Bar6_BG:Hide()
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Right back drop off.", 0.5, 0.5, 0.5)
		elseif arg1=="on" then
			suiData.rightbackdrop = "on"
			SUI_Bar6_BG:Show()
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Right back drop on.", 0.5, 0.5, 0.5)
		end
	elseif msg=="leftbackdrop" then							-- on by default
		if arg1=="off" then
			suiData.leftbackdrop = "off"
			SUI_Bar5_BG:Hide()
			Bartender:ToggleBar("Bar5")
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Left back drop off.", 0.5, 0.5, 0.5)
		elseif arg1=="on" then
			suiData.leftbackdrop = "on"
			SUI_Bar5_BG:Show()
			Bartender:ToggleBar("Bar5")
			DEFAULT_CHAT_FRAME:AddMessage("SpartanUI: Left back drop on.", 0.5, 0.5, 0.5)
			ReloadUI()
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Help menu/command list reference					    |--
-----------------------------------------------------------------------------------------------
function Sui_HelpMenu(msg)
	if not msg then
		DEFAULT_CHAT_FRAME:AddMessage("SpartanUI Help Menu:", 1, 0.75, 0)
		DEFAULT_CHAT_FRAME:AddMessage("Type /sui or /spartanui and then any of the following:", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("*Denotes default setting", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("--------------------------------------------------", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffversion|r (Checks version of SUI)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffstats|r (Checks your game performance", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0fffixres|r (Runs screen res check manually)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffautores|r (Turns off autoui resize)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("--------------------------------------------------", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffbroadcast|r |c0000ffc0on/off*|r (Sends SUI Addon messages)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0fficons|r |c0000ffc0color|r, |c0000ffc0grey|r, |c0000ffc0default*|r (Raid target icon markers)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffeffect|r |c0000ffc0vignette|r, |c0000ffc0blur|r, or |c0000ffc0crisp|r (Film effects for flare)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffpopup|r |c0000ffc0on*/off|r (Popup covers stance/pet and menu/bag bars)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffrightbackdrop|r |c0000ffc0on*/off|r (Right empty back ground)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffleftbackdrop|r |c0000ffc0on*/off|r (Left back ground and Bar5 will be shown/hidden)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffparty|r |c0000ffc0on*/off|r (Party frames)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffpartyinraid|r |c0000ffc0on/off*|r (Party frames while in raid)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffbuff|r (or buffs) |c0000ffc0on*/off|r (SUI buffs)", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("--------------------------------------------------", 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffAvailable languages:|r " .. (SUIL.AVAILABLE_LANGUAGES[1]), 0.75, 0.75, 0.75)
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0fflang|r |c0000ffc0X|r (Switch language to...)", 0.75, 0.75, 0.75)
	elseif msg == "lang" then
		DEFAULT_CHAT_FRAME:AddMessage("|c0000c0ffAvailable languages:|r " .. (SUIL.AVAILABLE_LANGUAGES[1]), 0.75, 0.75, 0.75)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Adapt, Flare and MobInfo2  |--
-----------------------------------------------------------------------------------------------
function Sui_LoadModules()
	if (Adapt) then
		Adapt_Settings.Shape = "CIRCLE"
		Adapt.Reshape()
		Adapt_Settings.Backdrop = Adapt_Settings.Backdrop=="ON"
		Adapt.Reback()
		Sui_PFix()
	end
	if FEDB then
		if FEDB.animateGrainCrispy then
			FG_OnEvent("film", "crisp")
		end
		if FEDB.animateGrainFuzzy then
			FG_OnEvent("film", "blur")
		end
		if FEDB.vignette then
			FG_OnEvent("vignette")
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Adds additional info if MobInfo2 is present.				    |--
-----------------------------------------------------------------------------------------------
function Sui_MobInfo()
	if IsAddOnLoaded("MobInfo2") == 1 then
		local mobData = MI2_GetMobData(UnitName("target"), UnitLevel("target"), "target")
		if mobData ~= nil then
			local typeMob
			if UnitCreatureType("target") then
				if mobData.mobType == 3 then
					typeMob = " Boss "..UnitCreatureType("target")
				elseif mobData.mobType == 2 then
					typeMob = " Elite "..UnitCreatureType("target")
				else
					typeMob = " Mob "..UnitCreatureType("target")
				end
			end
			local rtn = "\r"
			local text = "|cffffc100"..UnitName("target").."|r\r"..UnitLevel("target")..typeMob..rtn..rtn.."Health: "..(mobData.healthMax or "_")..rtn.."Mana: "..(UnitManaMax("target") or "_")..rtn.."Damage: "..(mobData.minDamage or "_").." - "..(mobData.maxDamage or "_")..rtn.."XP: "..(mobData.xp or "_")
			SUI_MouseTooltip_Text:SetText(text)
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Adapt needs to be rebuilt.  This is a temporary fix for a bug.				|--
-----------------------------------------------------------------------------------------------
function Sui_PFix()
	--[[if IsAddOnLoaded("Adapt")==1 then
    	SUI_TOT_PortraitModelModel:SetFrameLevel(3)
    end]]--
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Repositions bags for HUD offset.					    |--
-----------------------------------------------------------------------------------------------
function Sui_Bags()
    if not IsAddOnLoaded("BlizzMo") then
        -- Global Settings
        VISIBLE_CONTAINER_SPACING = 3
        CONTAINER_OFFSET_Y = 170
        CONTAINER_OFFSET_X = 20
        CONTAINER_SCALE = 0.90
        -- Adjust the start anchor for bags
        local shrinkFrames, frame;
        local xOffset = CONTAINER_OFFSET_X;
        local yOffset = CONTAINER_OFFSET_Y;
        local screenHeight = GetScreenHeight();
        local containerScale = CONTAINER_SCALE;
        local freeScreenHeight = screenHeight - yOffset;
        local index = 1;
        local column = 0;
        local uiScale = 1;
        if ( GetCVar("useUiScale") == "1" ) then
            uiScale = GetCVar("uiscale") + 0;
            if ( uiScale > containerScale ) then
                containerScale = uiScale * containerScale;
            end
        end
        while ContainerFrame1.bags[index] do
            frame = getglobal(ContainerFrame1.bags[index]);
            ContainerFrame1:ClearAllPoints()
            frame:SetScale(1);
            -- freeScreenHeight determines when to start a new column of bags
            if ( index == 1 ) then
                -- First bag
                frame:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOMRIGHT", -xOffset, yOffset );
            elseif ( freeScreenHeight < frame:GetHeight() ) then
                -- Start a new column
                column = column + 1;
                freeScreenHeight = screenHeight - yOffset;
                frame:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOMRIGHT", -(column * CONTAINER_WIDTH) - xOffset, yOffset );
            else
                -- Anchor to the previous bag
                frame:SetPoint("BOTTOMRIGHT", ContainerFrame1.bags[index - 1], "TOPRIGHT", 0, CONTAINER_SPACING);
            end
            if ( frame:GetLeft() < ( BankFrame:GetRight() - 45 ) ) then
                if ( frame:GetTop() > ( BankFrame:GetBottom() + 50 ) ) then
                    shrinkFrames = 1;
                    break;
                end
            end
            freeScreenHeight = freeScreenHeight - frame:GetHeight() - VISIBLE_CONTAINER_SPACING;
            index = index + 1;
        end
        if ( shrinkFrames ) then
            screenHeight = screenHeight / containerScale;
            xOffset = xOffset / containerScale;
            yOffset = yOffset / containerScale;
            freeScreenHeight = screenHeight - yOffset;
            index = 1;
            column = 0;
            while ContainerFrame1.bags[index] do
                frame = getglobal(ContainerFrame1.bags[index]);
                ContainerFrame1:ClearAllPoints()
                frame:SetScale(containerScale);
                if ( index == 1 ) then
                    -- First bag
                    frame:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOMRIGHT", -xOffset, yOffset );
                elseif ( freeScreenHeight < frame:GetHeight() ) then
                    -- Start a new column
                    column = column + 1;
                    freeScreenHeight = screenHeight - yOffset;
                    frame:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOMRIGHT", -(column * CONTAINER_WIDTH) - xOffset, yOffset );
                else
                    -- Anchor to the previous bag
                    frame:SetPoint("BOTTOMRIGHT", ContainerFrame1.bags[index - 1], "TOPRIGHT", 0, CONTAINER_SPACING);
                end
                freeScreenHeight = freeScreenHeight - frame:GetHeight() - VISIBLE_CONTAINER_SPACING;
                index = index + 1;
            end
        end
    end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Hooked Blizz code. Moves items like the quest frame to fit the new layout   |--
-----------------------------------------------------------------------------------------------
function Sui_ManageFrames()
	-- Global Settings
	local CONTAINER_OFFSET_X = 8
	local anchorY = 20
	-- Quest timers
	QuestTimerFrame:ClearAllPoints()
	QuestTimerFrame:SetPoint("TOPRIGHT", "QuestWatchFrame", "BOTTOMRIGHT", -CONTAINER_OFFSET_X, anchorY);
	if ( QuestTimerFrame:IsShown() ) then
		anchorY = anchorY - QuestTimerFrame:GetHeight();
	end
	-- Durability frame
	DurabilityFrame:ClearAllPoints()
	if ( DurabilityFrame ) then
		local durabilityOffset = 0;
		if ( DurabilityShield:IsShown() or DurabilityOffWeapon:IsShown() or DurabilityRanged:IsShown() ) then
			durabilityOffset = 20;
		end
		DurabilityFrame:SetPoint("TOPRIGHT", "QuestWatchFrame", "BOTTOMRIGHT", -CONTAINER_OFFSET_X-durabilityOffset, anchorY);
		if ( DurabilityFrame:IsShown() ) then
			anchorY = anchorY - DurabilityFrame:GetHeight();
		end
	end
	QuestWatchFrame:ClearAllPoints()
	QuestWatchFrame:SetPoint("TOPRIGHT", "SpartanUI", "TOPRIGHT", -CONTAINER_OFFSET_X, -anchorY);
	-- Hide PetBar Grid when a Pet isn't active
	local _, englishClass = UnitClass("player")
	if englishClass == "HUNTER" or englishClass == "WARLOCK" then
		PetActionBar_ShowGrid()
	end
	-- This hooks into Blizzards "Always Show ActionBars" setting. If you don't want the Grid on your Actionbars
	-- then turn off this setting in your Interface Options.
	MultiActionBar_UpdateGridVisibility()
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Should fix the PvP capture bar and setup BattlefieldMinimap		    |--
-----------------------------------------------------------------------------------------------
function Sui_CaptureBar_Update()
	if ( NUM_EXTENDED_UI_FRAMES ) then
		local capbar
		local numCaptureBars = 0
		for i = 1, NUM_EXTENDED_UI_FRAMES do
			local capbar = getglobal("WorldStateCaptureBar"..i)
			if ( capbar and capbar:IsShown() ) then
			capbar:SetPoint("BOTTOMRIGHT", "QuestWatchFrame", "TOPRIGHT", -CONTAINER_OFFSET_X, anchorY)
				anchorY = anchorY - captureBar:GetHeight()
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Sets up the minimap for use with SUI layout.				    |--
-----------------------------------------------------------------------------------------------
function Sui_MinimapFix()
	MinimapBorderTop:Hide()
	MinimapToggleButton:Hide()
	MinimapBorder:Hide()
	Minimap:SetHeight(146)
	Minimap:SetWidth(146)
	Minimap:ClearAllPoints()
	Minimap:SetPoint("CENTER", "SUI_MapOverlay", "CENTER", 0, 0)
	MinimapCluster:ClearAllPoints()
	MinimapCluster:SetMovable(true)
	MinimapCluster:SetUserPlaced(true)
	MinimapCluster:ClearAllPoints()
	MinimapCluster:SetPoint("CENTER", "SUI_MapOverlay", "CENTER", -10, -4)
	MinimapZoneText:ClearAllPoints()
	MinimapZoneText:SetParent(Minimap)
	MinimapZoneText:SetPoint("BOTTOM", "SUI_MapOverlay", "BOTTOM", 0, 24)
	MinimapZoneTextButton:ClearAllPoints()
	MinimapZoneTextButton:SetPoint("BOTTOM", "MinimapZoneText", "BOTTOM", 0, 0)
	-- Fix for evil UiScale vs SuiScale (/sui maxres)
	local point, relativeTo, relativePoint, xOfs, yOfs = MinimapZoomIn:GetPoint()
	MinimapZoomIn:SetParent(Minimap)
	MinimapZoomIn:SetFrameLevel(5)
	MinimapZoomIn:SetPoint(point, "Minimap", relativePoint, 73, -33)
	local point, relativeTo, relativePoint, xOfs, yOfs = MinimapZoomOut:GetPoint()
	MinimapZoomOut:SetParent(Minimap)
	MinimapZoomOut:SetFrameLevel(5)
	MinimapZoomOut:SetPoint(point, "Minimap", relativePoint, 38, -68)
	local point, relativeTo, relativePoint, xOfs, yOfs = MiniMapTrackingFrame:GetPoint()
	MiniMapTrackingFrame:SetParent(Minimap)
	MiniMapTrackingFrame:SetFrameLevel(5)
	MiniMapTrackingFrame:SetPoint(point, "Minimap", relativePoint, -8, 4)
	GameTimeFrame:SetScale(0.85)
	local point, relativeTo, relativePoint, xOfs, yOfs = GameTimeFrame:GetPoint()
	GameTimeFrame:SetParent(Minimap)
	GameTimeFrame:SetFrameLevel(5)
	GameTimeFrame:SetPoint(point, "Minimap", relativePoint, 8, 8)
	SUI_MinimapCoords:SetWidth(100)
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Chat frame configuration. Shifts chat entry to top of window & moves	    |--
--|		scroll/emote buttons to the right and handles toggling of it on/off	    |--
--|  Arguments:	task = "setup", "hide", "show"						    |--
-----------------------------------------------------------------------------------------------
function Sui_ChatFrame(task)
	local i
	if task == "setup" then
		for i = 1, 7, 1 do
			getglobal("ChatFrame"..i):SetFrameStrata("LOW")
			getglobal("ChatFrame"..i.."BottomButton"):SetPoint("BOTTOMLEFT", ("ChatFrame"..i), "BOTTOMRIGHT", -32, -4)
		end
		ChatFrameEditBox:ClearAllPoints()
		ChatFrameEditBox:SetPoint("BOTTOMLEFT", "ChatFrame1", "TOPLEFT", 0, 2)
		ChatFrameEditBox:SetPoint("BOTTOMRIGHT", "ChatFrame1", "TOPRIGHT", 0, 2)
		ChatFrameMenuButton:SetFrameStrata("DIALOG")
		for i = 1, 7, 1 do
			getglobal("ChatFrame"..i.."BottomButton"):SetScale(0.8)
			getglobal("ChatFrame"..i.."DownButton"):SetScale(0.8)
			getglobal("ChatFrame"..i.."UpButton"):SetScale(0.8)
		end
		ChatFrameMenuButton:SetScale(0.8)
	elseif task == "hide" then
		for i = 1, 7, 1 do
			getglobal("ChatFrame"..i.."UpButton"):SetAlpha(0)
			getglobal("ChatFrame"..i.."DownButton"):SetAlpha(0)
			getglobal("ChatFrame"..i.."BottomButton"):SetAlpha(0)
		end
		ChatFrameMenuButton:SetAlpha(0)
	elseif task == "show" then
		for i = 1, 7, 1 do
			getglobal("ChatFrame"..i.."UpButton"):SetAlpha(1)
			getglobal("ChatFrame"..i.."DownButton"):SetAlpha(1)
			getglobal("ChatFrame"..i.."BottomButton"):SetAlpha(1)
		end
		ChatFrameMenuButton:SetAlpha(1)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Bartender Setup.							    |--
--|  Arguments:	task = "source", "dest"							    |--
-----------------------------------------------------------------------------------------------
local function tblMerge(source, dest)
	if type(source) ~= "table" then return end
	if type(dest) ~= "table" then dest = {} end
	for k,v in pairs(source) do
		if type(v) ~= "table" then
			dest[k] = v
		else
			dest[k] = tblMerge(v, dest[k])
		end
	end
	return dest
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Stored layout for SpartanUI.  Runs after load screen every time.	    |--
-----------------------------------------------------------------------------------------------
function Sui_Bartender()
	if (suiData.leftbackdrop == "on") then
		Bartender:SetProfile("SpartanUI_"..SUI_currentVersion)
		local CustomConfig = {
			Extra = {
				EnableAllBars = true,
				Clamp = false,
				HideBorder = true,
				BonusNoSwap = false,
				StickyFrames = false,
				HideTooltip = false,
			},
			Bar1 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar2 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar3 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar4 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar5 = {
				Scale = .8,
				Padding = 4,
				Rows = 3,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar6 = {
				Scale = .9,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar7 = {
				Scale = .9,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar8 = {
				Scale = .7,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar9 = {
				Scale = .8,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
		}
		local db = Bartender.db.profile
		if not db.CustomUI then
			db.CustomUI = true
			tblMerge(CustomConfig, db)
		end
		Bartender:OnProfileEnable()
		-- Added fix for zone/instance loading issue
		Bartender:EnableAllBars()
	end
	if (suiData.leftbackdrop == "off") then
		Bartender:SetProfile("SpartanUI_"..SUI_currentVersion)
		local CustomConfig = {
			Extra = {
				EnableAllBars = true,
				Clamp = false,
				HideBorder = true,
				BonusNoSwap = false,
				StickyFrames = false,
				HideTooltip = false,
			},
			Bar1 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar2 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar3 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar4 = {
				Scale = .8,
				Padding = 6,
				Rows = 1,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar5 = {
				Scale = .8,
				Padding = 4,
				Rows = 3,
				Swap = false,
				Alpha = 1,
				Hide = true,
			},
			Bar6 = {
				Scale = .9,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar7 = {
				Scale = .9,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar8 = {
				Scale = .7,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
			Bar9 = {
				Scale = .8,
				Padding = 0,
				Swap = false,
				Alpha = 1,
				Hide = false,
			},
		}
		local db = Bartender.db.profile
		if not db.CustomUI then
			db.CustomUI = true
			tblMerge(CustomConfig, db)
		end
		Bartender:OnProfileEnable()
		-- Added fix for zone/instance loading issue
		Bartender:EnableAllBars()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Bartender re-anchors its frames after each setup.  This detaches them and   |--
--|		places them in their correct positions (if they exist).			    |--
-----------------------------------------------------------------------------------------------
function Sui_BarFix()
	if not Bartender_Plate then
		local f = CreateFrame("Frame","Bartender_Plate", SpartanUI)
		f:SetFrameStrata("LOW")
		f:SetWidth(512)
		f:SetHeight(512)
		f:SetPoint("BOTTOM",0,0)
		f:Show()
		Minimap:SetParent(SpartanUI)
	end
	-- Top Left Action Bar
	if Bar1 then
		Bar1:ClearAllPoints()
		Bar1:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOM", -122, 84)

		SUI_Bar1_BG:ClearAllPoints()
		SUI_Bar1_BG:Show()
		SUI_Bar1_BG:SetPoint("CENTER", "Bar1", "CENTER", 0, 0)
		Bar1:SetParent(Bartender_Plate)
	else
		SUI_Bar1_BG:Hide()
	end
	-- Bottom Left Action Bar
	if Bar2 then
		Bar2:ClearAllPoints()
		Bar2:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOM", -122, 34)

		SUI_Bar2_BG:ClearAllPoints()
		SUI_Bar2_BG:Show()
		SUI_Bar2_BG:SetPoint("CENTER", "Bar2", "CENTER", 0, 0)
		Bar2:SetParent(Bartender_Plate)
	else
		SUI_Bar2_BG:Hide()
	end
	-- Top Right Action Bar
	if Bar3 then
		Bar3:ClearAllPoints()
		Bar3:SetPoint("BOTTOMLEFT", "SpartanUI", "BOTTOM", 122, 84)

		SUI_Bar3_BG:ClearAllPoints()
		SUI_Bar3_BG:Show()
		SUI_Bar3_BG:SetPoint("CENTER", "Bar3", "CENTER", 0, 0)
		Bar3:SetParent(Bartender_Plate)
	else
		SUI_Bar3_BG:Hide()
	end
	-- Bottom right Action Bar
	if Bar4 then
		Bar4:ClearAllPoints()
		Bar4:SetPoint("BOTTOMLEFT", "SpartanUI", "BOTTOM", 122, 34)

		SUI_Bar4_BG:ClearAllPoints()
		SUI_Bar4_BG:Show()
		SUI_Bar4_BG:SetPoint("CENTER", "Bar4", "CENTER", 0, 0)
		Bar4:SetParent(Bartender_Plate)
	else
		SUI_Bar4_BG:Hide()
	end
	-- Left Square Action Bar
	if Bar5 then
		if (suiData.leftbackdrop == "on") then
			Bar5:ClearAllPoints()
			Bar5:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOM", -636, 7)

			SUI_Bar5_BG:ClearAllPoints()
			SUI_Bar5_BG:Show()
			SUI_Bar5_BG:SetPoint("CENTER", "Bar5", "CENTER", 0, 0)
			Bar5:SetParent(Bartender_Plate)
		elseif (suiData.leftbackdrop == "off") then
			SUI_Bar5_BG:Hide()
		end
	end
-----------------------------------------------------------------------------------------------
--| In WoW 2.0+ Bartender3 had 6 available action bars. Bags, Stance, Pet, and Menu have    |--
--| their own bars completely separate and from the BonusAction pages that are for those    |--
--| classes. The large blank square on the right can be a back drop for a Threat or Damage  |--
--| Meter or some other Addon.  							    |--
-----------------------------------------------------------------------------------------------
	-- Bag Bar
	if Bar8 then
		Bar8:Show()
		Bar8:ClearAllPoints()
		Bar8:SetPoint("BOTTOMLEFT", "SpartanUI", "BOTTOM", 464, 152)
		Bar8:SetParent(Bartender_Plate)
	end
	-- Menu Bar
	if Bar9 then
		Bar9:Show()
		Bar9:ClearAllPoints()
		Bar9:SetPoint("BOTTOMLEFT", "SpartanUI", "BOTTOM", 134, 132)
		Bar9:SetParent(Bartender_Plate)
	end
	-- Pet Bar
	if Bar7 then
		Bar7:Show()
		Bar7:ClearAllPoints()
		Bar7:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOM", -120, 117)
		Bar7:SetParent(Bartender_Plate)
	end
	-- Stance Bar
	if Bar6 then
		Bar6:Show()
		Bar6:ClearAllPoints()
		Bar6:SetPoint("BOTTOMRIGHT", "SpartanUI", "BOTTOM", -204, 117)
		Bar6:SetParent(Bartender_Plate)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Dropdown Menus & Click-targeting.					    |--
-----------------------------------------------------------------------------------------------
	--Self Frame--
	function Sui_SelfFrame_OnClick()
		if ( SpellIsTargeting() and arg1 == "RightButton" ) then
			SpellStopTargeting()
			return
		end
		if ( arg1 == "LeftButton" ) then
			if ( SpellIsTargeting() ) then
				SpellTargetUnit("player")
			elseif ( CursorHasItem() ) then
				AutoEquipCursorItem()
			else
				TargetUnit("player")
			end
		else
			ToggleDropDownMenu(1, nil, PlayerFrameDropDown, "cursor", 0, 0)
			return
		end
	end
	------------------
	function Sui_SelfFrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(PlayerFrameDropDown, Sui_SelfFrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_SelfFrameDropDown_Initialize()
		UnitPopup_ShowMenu(PlayerFrameDropDown, "SELF", "player")
	end
	------------------
	function Sui_Self_OnReceiveDrag()
		if ( CursorHasItem() ) then
			AutoEquipCursorItem()
		end
	end
	--Pet Frame--
	function Sui_PetFrame_OnClick()
		if ( SpellIsTargeting() and arg1 == "RightButton" ) then
			SpellStopTargeting()
			return
		end
		if ( arg1 == "LeftButton" ) then
			if ( SpellIsTargeting() ) then
				SpellTargetUnit("pet")
			elseif ( CursorHasItem() ) then
				DropItemOnUnit("pet")
			else
				TargetUnit("pet")
			end
		else
			ToggleDropDownMenu(1, nil, PetFrameDropDown, "cursor", 0, 0)
		end
	end
	------------------
	function Sui_PetFrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(PetFrameDropDown, Sui_PetFrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_PetFrameDropDown_Initialize()
		if ( UnitExists("pet") ) then
			UnitPopup_ShowMenu(PetFrameDropDown, "PET", "pet")
		end
	end
	--Target Frame--
	function Sui_TargetFrame_OnClick()
		if ( SpellIsTargeting() and arg1 == "RightButton" ) then
			SpellStopTargeting()
			return
		end
		if ( arg1 == "LeftButton" ) then
			if ( SpellIsTargeting() ) then
				SpellTargetUnit("target")
			elseif ( CursorHasItem() ) then
				DropItemOnUnit("target")
			end
		else
			ToggleDropDownMenu(1, nil, TargetFrameDropDown, "cursor", 0, 0)
		end
	end
	------------------
	function Sui_TargetFrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(TargetFrameDropDown, Sui_TargetFrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_TargetFrameDropDown_Initialize()
		local menu
		local name
		if ( UnitIsUnit("target", "player") ) then
			menu = "SELF"
		elseif ( UnitIsUnit("target", "pet") ) then
			menu = "PET"
		elseif ( UnitIsPlayer("target") ) then
			if ( UnitInParty("target") ) then
				menu = "PARTY"
			else
				menu = "PLAYER"
			end
		else
			menu = "RAID_TARGET_ICON"
			name = RAID_TARGET_ICON
		end
		if ( menu ) then
			UnitPopup_ShowMenu(TargetFrameDropDown, menu, "target", name)
		end
	end
	--Target of Target Frame--
	function Sui_ToT_OnClick()
		if ( SpellIsTargeting() and arg1 == "RightButton" ) then
			SpellStopTargeting()
			return
		end
		if ( arg1 == "LeftButton" ) then
			if ( SpellIsTargeting() ) then
				SpellTargetUnit("targettarget")
			elseif ( CursorHasItem() ) then
				DropItemOnUnit("targettarget")
			else
				TargetUnit("targettarget")
			end
		else
			ToggleDropDownMenu(1, nil, TargetFrameDropDown, "cursor", 0, 0)
		end
	end
	-- Party1 Frame --
	function Sui_Party1Frame_OnClick()
	if ( SpellIsTargeting() and arg1 == "RightButton" ) then
		SpellStopTargeting()
		return
	end
	local unit = "party1"
	if ( arg1 == "LeftButton" ) then
		if ( SpellIsTargeting() ) then
			SpellTargetUnit(unit)
		elseif ( CursorHasItem() ) then
			DropItemOnUnit(unit)
		else
			TargetUnit(unit)
		end
	else
			ToggleDropDownMenu(1, nil, SUI_Party1_DropDown, "cursor", 0, 0)
		end
	end
	------------------
	function Sui_Party1FrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(this, Sui_Party1FrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_Party1FrameDropDown_Initialize()
		local dropdown
		if ( UIDROPDOWNMENU_OPEN_MENU ) then
			dropdown = getglobal(UIDROPDOWNMENU_OPEN_MENU)
		else
			dropdown = this
		end
		UnitPopup_ShowMenu(dropdown, "PARTY", "party1")
	end
	-- Party2 Frame --
	function Sui_Party2Frame_OnClick()
	if ( SpellIsTargeting() and arg1 == "RightButton" ) then
		SpellStopTargeting()
		return
	end
	local unit = "party2"
	if ( arg1 == "LeftButton" ) then
		if ( SpellIsTargeting() ) then
			SpellTargetUnit(unit)
		elseif ( CursorHasItem() ) then
			DropItemOnUnit(unit)
		else
			TargetUnit(unit)
		end
	else
			ToggleDropDownMenu(1, nil, SUI_Party2_DropDown, "cursor", 0, 0)
		end
	end
	------------------
	function Sui_Party2FrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(this, Sui_Party2FrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_Party2FrameDropDown_Initialize()
		local dropdown
		if ( UIDROPDOWNMENU_OPEN_MENU ) then
			dropdown = getglobal(UIDROPDOWNMENU_OPEN_MENU)
		else
			dropdown = this
		end
		UnitPopup_ShowMenu(dropdown, "PARTY", "party2")
	end
	-- Party3 Frame --
	function Sui_Party3Frame_OnClick()
	if ( SpellIsTargeting() and arg1 == "RightButton" ) then
		SpellStopTargeting()
		return
	end
	local unit = "party3"
	if ( arg1 == "LeftButton" ) then
		if ( SpellIsTargeting() ) then
			SpellTargetUnit(unit)
		elseif ( CursorHasItem() ) then
			DropItemOnUnit(unit)
		else
			TargetUnit(unit)
		end
	else
			ToggleDropDownMenu(1, nil, SUI_Party3_DropDown, "cursor", 0, 0)
		end
	end
	------------------
	function Sui_Party3FrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(this, Sui_Party3FrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_Party3FrameDropDown_Initialize()
		local dropdown
		if ( UIDROPDOWNMENU_OPEN_MENU ) then
			dropdown = getglobal(UIDROPDOWNMENU_OPEN_MENU)
		else
			dropdown = this
		end
		UnitPopup_ShowMenu(dropdown, "PARTY", "party3")
	end
	-- Party4 Frame --
	function Sui_Party4Frame_OnClick()
	if ( SpellIsTargeting() and arg1 == "RightButton" ) then
		SpellStopTargeting()
		return
	end
	local unit = "party4"
	if ( arg1 == "LeftButton" ) then
		if ( SpellIsTargeting() ) then
			SpellTargetUnit(unit)
		elseif ( CursorHasItem() ) then
			DropItemOnUnit(unit)
		else
			TargetUnit(unit)
		end
	else
			ToggleDropDownMenu(1, nil, SUI_Party4_DropDown, "cursor", 0, 0)
		end
	end
	------------------
	function Sui_Party4FrameDropDown_OnLoad()
		UIDropDownMenu_Initialize(this, Sui_Party4FrameDropDown_Initialize, "MENU")
	end
	------------------
	function Sui_Party4FrameDropDown_Initialize()
		local dropdown
		if ( UIDROPDOWNMENU_OPEN_MENU ) then
			dropdown = getglobal(UIDROPDOWNMENU_OPEN_MENU)
		else
			dropdown = this
		end
		UnitPopup_ShowMenu(dropdown, "PARTY", "party4")
	end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Displays unit frame tooltips.						    |--
--|  Arguments:	job = enter or exit							    |--
--|		toon = the unit to display tooltip info for				    |--
-----------------------------------------------------------------------------------------------
function Sui_UnitTooltip(job, toon)
	if job == "enter" then
		if ( SpellIsTargeting() ) then
			if ( SpellCanTargetUnit(toon) ) then
				SetCursor("CAST_CURSOR")
			else
				SetCursor("CAST_ERROR_CURSOR")
			end
		end
		GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
		GameTooltip:SetUnit(toon)
		GameTooltip:Show()
	elseif job == "exit" then
		if ( SpellIsTargeting() ) then
			SetCursor("CAST_ERROR_CURSOR")
		end
		GameTooltip:Hide()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Generic function for determining and setting the class icon for a unit.	    |--
--|  Arguments:	toon = "player", "party1", etc...					    |--
--|		texture = name of the healthbar texture object				    |--
--|		scale = size of the icon in pixels you want it to be displayed at.	    |--
-----------------------------------------------------------------------------------------------
local classIcons = {}
	classIcons["WARRIOR"] = {1,1}
	classIcons["MAGE"] = {1,2}
	classIcons["ROGUE"] = {1,3}
	classIcons["DRUID"] = {1,4}
	classIcons["HUNTER"] = {2,1}
	classIcons["SHAMAN"] = {2,2}
	classIcons["PRIEST"] = {2,3}
	classIcons["WARLOCK"] = {2,4}
	classIcons["PALADIN"] = {3,1}
	classIcons["DEATHKNIGHT"] = {3,2}							-- not in patch 1.12.0 but it's not hurting anything
	classIcons["DEFAULT"] = {4,4}								-- transparent so hidden by default

function Sui_ClassIcon(toon, texture, scale)							-- scale is now a legacy value
	if (not texture) then
		return
	end
	local _,class = UnitClass(toon)
	if (not class) then
		class = "DEFAULT"
	end
	local row,col = classIcons[class][1],classIcons[class][2]
	local left,top = (col-1)*0.25,(row-1)*0.25
	texture:SetTexCoord(left,left+0.25,top,top+0.25)
	texture:Show()
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Determines and sets the raid target icons on units. Since there are	    |--
--|		no args from RAID_TARGET_UPDATE, we cycle through the units.		    |--
-----------------------------------------------------------------------------------------------
function Sui_RaidIcon()
	if UnitInParty("player") then
		local iconFile, top = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", 0
		if (suiData.raidIcons ~= "Default") then
			iconFile = "Interface\\AddOns\\SpartanUI\\Textures\\Icon_RaidTargets"
		end
		if (suiData.raidIcons == "Clean_Grey") then
			top = 0.5
		end
		for i = 1, 8 do									-- cycle through our 8 relevant unit frames
			local iconNum = GetRaidTargetIndex(suiData.unit[i].unit)
			local icon = getglobal(suiData.unit[i].frame.."_RaidIcon")
			if (iconFile and iconNum and icon) then
				local iconLeft = 0
				if (iconNum > 4) then
					iconLeft, top = 4, top + 0.25
				end
				local right = (iconNum - iconLeft) / 4
				if (icon.kind ~= suiData.raidIcons) then
					icon:SetTexture(iconFile)
					icon.kind = suiData.raidIcons
				end
				icon:SetTexCoord(right-0.25,right,top,top+0.25)
				icon:Show()
			elseif (icon and icon:IsVisible()) then
				icon:Hide()
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Generic function for determining and setting the health for unit frames.    |--
--|  Arguments:	toon = "player", "party1", etc...					    |--
--|		barwidth = width of healthbar						    |--
--|		percent = name of percentage fontstring					    |--
--|		count = name of healthcount fontstring					    |--
--|		deficit = name of deficit fontstring					    |--
--|		texture = name of the healthbar texture object				    |--
-----------------------------------------------------------------------------------------------
function Sui_HealthMath(toon, barwidth, barheight, father)
	-- Name your objects
	local texture = getglobal(father.."_HealthBar")
	local percent = getglobal(father.."_HealthPercentage")
	local count = getglobal(father.."_HealthCount")
	local deficit = getglobal(father.."_HealthDeficit")
	-- Divide the current player health by the max, ergo percentage.
	-- Round the percentage to 0 decimals.
	local toon_Health = (UnitHealth(toon) / UnitHealthMax(toon)) * 100
	local healthPercent = math.floor(toon_Health+0.5)
	-- Populate strings
	if not percent then return end
	percent:SetText(healthPercent.."%")
	count:SetText(UnitHealth(toon))
	deficit:SetText(UnitHealthMax(toon) - UnitHealth(toon))
	-- Hide count if target health is unretrievable
	if UnitHealthMax(toon) == 100 then
	count:Hide()
	deficit:Hide()
	else
	count:Show()
	deficit:Show()
	end
	-- Populate with MobInfo2 if available
	if toon == "target" and IsAddOnLoaded("MobInfo2") == 1 then
	local mobData = MI2_GetMobData( UnitName("target"), UnitLevel("target"), "target" )
	if mobData ~= nil then
		count:Show()
		count:SetText(mobData.healthCur)
		deficit:SetText(mobData.healthMax - mobData.healthCur)
		end
	end
	-- Hide deficit if there is none
	if (UnitHealthMax(toon) == UnitHealth(toon)) then
	deficit:Hide()
	else
	deficit:Show()
	end
	if not texture.barheight then
		texture.barheight = (barheight * 16)
		texture.barwidth = (barwidth * 3.2)
	end
	if texture then
		texture:Show()
	end
	-- Pass off global info
	local toonID = Sui_DeriveUnit(toon, "number", 8)
	if not toonID then return end
	suiData.unit[toonID].HealthPercent = healthPercent
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Generic function for determining and setting the power for unit frames	    |--
--|  Arguments: same as Sui_HealthMath except this time with power			    |--
-----------------------------------------------------------------------------------------------
function Sui_PowerMath(toon, barwidth, barheight, father)
	-- Test for power type and configure texture accordingly
	local power, texture2, texture3, texture4
	if UnitPowerType(toon) == 0 then
		power = "Mana"
		texture2 = getglobal(father.."_RageBar")
		texture3 = getglobal(father.."_EnergyBar")
		texture4 = getglobal(father.."_FocusBar")
	elseif UnitPowerType(toon) == 1 then
		power = "Rage"
		texture2 = getglobal(father.."_ManaBar")
		texture3 = getglobal(father.."_EnergyBar")
		texture4 = getglobal(father.."_FocusBar")
	elseif UnitPowerType(toon) == 2 then
		power = "Focus"
		texture2 = getglobal(father.."_RageBar")
		texture3 = getglobal(father.."_EnergyBar")
		texture4 = getglobal(father.."_ManaBar")
	elseif UnitPowerType(toon) == 3 then
		power = "Energy"
		texture2 = getglobal(father.."_RageBar")
		texture3 = getglobal(father.."_ManaBar")
		texture4 = getglobal(father.."_FocusBar")
	end
	-- Name your objects
	local texture = getglobal(father.."_"..power.."Bar")
	local percent = getglobal(father.."_ManaPercentage")
	local count = getglobal(father.."_ManaCount")
	local deficit = getglobal(father.."_ManaDeficit")

	-- Divide the current player power by the max, ergo percentage.
	-- Round the percentage to 0 decimals.
	local power = (UnitMana(toon) / UnitManaMax(toon)) * 100
	local powerPercent = math.floor(power+0.5) + 0
	if UnitMana(toon) == 0 then
		powerPercent=0
	end
	if not percent then return end
		percent:SetText(powerPercent.."%")
		count:SetText(UnitMana(toon))
		deficit:SetText(UnitManaMax(toon) - UnitMana(toon))
	-- Only show the deficit if there is one
	if (UnitManaMax(toon) == UnitMana(toon)) then
		deficit:Hide()
	else
		deficit:Show()
	end
	if texture and not texture.barheight then
		texture.barheight = (barheight * 16)
		texture.barwidth = (barwidth * 3.2)
	end
	if not texture:IsVisible() then
		if texture then
			texture:Show()
		end
		if texture2 then
			texture2:Hide()
		end
		if texture3 then
			texture3:Hide()
		end
		if texture4 then
			texture4:Hide()
		end
	end
	-- Pass off global info
	local toonID = Sui_DeriveUnit(toon, "number", 8)
	if not toonID then return end
	suiData.unit[toonID].PowerPercent = powerPercent
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Generic function for animating cast bars.				    |--
--|  Arguments:	toon = "player", "party1", etc...					    |--
--|		spell = name of the spell being cast					    |--
--|		rank = name of the rank (literally i.e.., "Rank 7")			    |--
--|	Logic:	Takes the cast-time of the current spell, and based on the time it started  |--
--|		will determine what percent of the cast has transpired based on the current |--
--|		time.									    |--
-----------------------------------------------------------------------------------------------
function Sui_InitCastMath(toon, sName, sDuration, wildcard, value, sDelay)
	local toonID = Sui_DeriveUnit(toon, "number", 8)
	if not toonID then
		return
	end
	if (toonID <= 6) and (suiData.unit[toonID][wildcard] == 1 and value == 0) or value == 1 then
		suiData.unit[toonID][wildcard] = value
		Sui_CastMath(toon, sName, sDuration, suiData.unit[toonID].castbar_width, suiData.unit[toonID].castbar_height, getglobal(suiData.unit[toonID].frame.."_CastBar"), sDelay)

	end
end
function Sui_CastMath(toon, sName, sDuration, barwidth, barheight, texture, sDelay)
	_, _, SUI_lag = GetNetStats()
	local toonID = Sui_DeriveUnit(toon, "number", 8)
	if not toonID then
		return
	end
	if suiData.unit[toonID].isCasting==1 then
		startTime = GetTime()
		GameTime(startTime)
		sDuration = tonumber(sDuration)
		if not sDuration then return end
		endTime = startTime + (sDuration/1000)
		if sDelay then return end
		if not endTime then
			suiData.unit[toonID].isCasting=0
		else
			suiData.unit[toonID].spellDuration = (endTime-startTime)
			suiData.unit[toonID].spellEnd = endTime
		end
	end
	if suiData.unit[toonID].isChanneling==1 then
		startTime = GetTime()
		GameTime(startTime)
		sDuration = tonumber(sDuration)
		if not sDuration then return end
		endTime = startTime + (sDuration/1000)
		if sDelay then return end
		if not endTime then
			suiData.unit[toonID].isChanneling=0
		else
			suiData.unit[toonID].spellDuration = (endTime-startTime)
			suiData.unit[toonID].spellEnd = endTime
		end
	end
	if not texture then return end
	if not texture:IsVisible() then
	--if not texture:IsShown() then
		texture:Show()
	end
	if not texture.barheight then
		texture.barheight = (barheight * 16)
		texture.barwidth = (barwidth * 3.2)
	end
	if type(sName) == "string" then
		getglobal(suiData.unit[toonID].frame .. "_CastText"):SetText(sName)
		getglobal(suiData.unit[toonID].frame .. "_CastText"):Show()
		getglobal(suiData.unit[toonID].frame .. "_CastTime"):SetText(suiData.unit[toonID].spellDuration)
		getglobal(suiData.unit[toonID].frame .. "_CastTime"):Show()
	end
	if toonID == 1 then
		getglobal(suiData.unit[toonID].frame .. "_CastLatency"):SetText(SUI_lag)
		getglobal(suiData.unit[toonID].frame .. "_CastLatency"):Show()
	end
	getglobal(suiData.unit[toonID].frame .. "_CastBar_Latency"):SetAlpha(.5)
	if not suiData.unit[toonID].isCasting then
		suiData.unit[toonID].isCasting = 0
	end
	if not suiData.unit[toonID].isChanneling then
		suiData.unit[toonID].isChanneling = 0
	end
	if suiData.unit[toonID].isCasting == 0 and suiData.unit[toonID].isChanneling == 0 then
		Sui_Animation(suiData.unit[toonID].unit, "Cast", suiData.unit[toonID].frame .. "_CastBar", suiData.unit[toonID].castbar_width, suiData.unit[toonID].castbar_height, suiData.unit[toonID].direction, 1, toonID)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Determines actual game time in milliseconds(Blizzard doesn't provide this).  |--
--|  Arguments:	toon = "player", "party1", etc...					    |--
--|  Returns:	game time in milliseconds upshifted to seconds decimal (i.e.., 12345.678)	    |--
--|  Logic:	If you called GetTime(), it gives you system time. So if you		    |--
--|	 	wanted to find how much time till X spell was finished, you'd have to know   |--
--|	 	the difference between GetTime() and spellEnd				    |--
-----------------------------------------------------------------------------------------------
function GameTime(startTime)
	if not suiData.timeDisparity then
		if not startTime then return end
		suiData.timeDisparity = startTime - GetTime()
	end
	if not suiData.timeDisparity then return end
	local GameTime = suiData.timeDisparity + GetTime()
	return GameTime
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Generic function for animating bars.					    |--
--|  Arguments: toon = player, partyN, target, etc.					    |--
--|		kind = "Health" or "Power" or "Cast"					    |--
--|		texture = target texture name						    |--
--|		barwidth = width of the bar to be animated				    |--
--|		barheight = height of the bar to be animated				    |--
--|		direction = "left" or "right"						    |--
--|		smoothdegree = degree to which the smooth slide effect occurs (default 3)   |--
--|		toonID = corresponds to the suiData.unit[N] (fewer calls if simply passed)  |--
-----------------------------------------------------------------------------------------------
function Sui_Animation(toon, kind, texture, barwidth, barheight, direction, smoothdegree, toonID)
	if toonID>8 then return end
	if kind == "Power" then
		local power
		if UnitPowerType(toon) == 0 then
			power = "Mana"
		elseif UnitPowerType(toon) == 1 then
			power = "Rage"
		elseif UnitPowerType(toon) == 2 then
			power = "Focus"
		elseif UnitPowerType(toon) == 3 then
			power = "Energy"
		end
		texture = getglobal(texture.."_"..power.."Bar")
	elseif kind == "Cast" then
		local gameTime = GameTime()
		if not gameTime then
			return
		end
		if not suiData.unit[toonID].spellEnd then
			return
		end
		local castPercent = 100 - ((suiData.unit[toonID].spellEnd-gameTime)/suiData.unit[toonID].spellDuration) * 100
		if (castPercent > 100) then
			castPercent = 100
			suiData.unit[toonID].isCasting=0
			suiData.unit[toonID].isChanneling=0
		end
		suiData.unit[toonID].CastPercent = castPercent
		local castPoint = suiData.unit[toonID].spellEnd - gameTime			-- Time since cast started
		--local castPrint = (math.floor((castPoint*10)+0.5))/10				-- the less detailed location for onscreen print
		local castPrint = (math.floor((castPoint*1000)+0.5))/1000			-- the highly detailed location of the cast
		local relativeLag = (SUI_lag*1000)/(suiData.unit[toonID].spellDuration)
		if not suiData.unit[toonID].frame then return end
		getglobal(suiData.unit[toonID].frame.."_CastTime"):SetText(string.format("%.1f", castPrint))
		texture = getglobal(texture)

		if suiData.unit[toonID].isCasting == 0 and suiData.unit[toonID].isChanneling == 0 then
			suiData.unit[toonID][kind.."progress"] = 0
			suiData.unit[toonID][kind.."Percent"] = 0
			getglobal(suiData.unit[toonID].frame.."_CastText"):Hide()
			getglobal(suiData.unit[toonID].frame.."_CastTime"):Hide()
			getglobal(suiData.unit[toonID].frame.."_CastLatency"):Hide()
			getglobal(suiData.unit[toonID].frame.."_CastBar_Latency"):Hide()
			texture:Hide()
		end
	else
		texture = getglobal(texture)
	end
	local fc1 = texture.frameCount or 1
	local fc2 = 40 + 1
	local frameCount = fc1 - (math.floor(fc1/fc2))
	local fr1 = frameCount - 1
	local fr2 = 16
	local frameRow = fr1 - (math.floor(fr1/fr2)) + 1
	texture.frameCount = frameCount
	if frameCount == 1 then
		texture.ColumnCount = 1
	elseif frameCount == 17 then
		texture.ColumnCount = 2
	elseif frameCount == 33 then
		texture.ColumnCount = 3
	end
	if texture.barheight and not texture.dimensionsLoaded then
		texture:SetHeight(texture.barheight)
		texture:SetWidth(texture.barwidth)
		texture.dimensionsLoaded = true
	end
	if not suiData.unit[toonID][kind.."progress"] then					-- This variable is the stored value percent of a bars progress (1 - 100)
		suiData.unit[toonID][kind.."progress"] = 0
	elseif not string.find(suiData.unit[toonID][kind.."progress"], "%d+") then
		suiData.unit[toonID][kind.."progress"] = 0
	end
	local barProgress = suiData.unit[toonID][kind.."progress"]
	local barPercent = suiData.unit[toonID][kind.."Percent"]
	local FrameWidth = 0.3125 								-- Which is (1/512) * 160
	local FrameHeight = 0.0625								-- Which is (1/512) * 32
	local deficit = 0
	-- Fault protection
	if not barPercent then
		barPercent=0
	end
	-- Deghosting health/power bars on dead victims
	if barPercent == 0 and barProgress>barPercent and kind ~= "Cast" then
		barProgress = 0
	end
	if suiData.lastTarget ~= UnitName(toon) and suiData.lastTarget_checked == 0 then
		barProgress = barPercent
		suiData.lastTarget_checked = 1
	end
	-- Target tapping/tagging
	if (UnitIsTapped("target")) and (not UnitIsTappedByPlayer("target")) then
		local shaderSupported = SUI_Target_HealthBar:SetDesaturated(1)
		if ( not shaderSupported ) then
			SUI_Target_HealthBar:SetVertexColor(0.5, 0.5, 0.5)
		end
	elseif not (UnitIsTapped("target")) then
		SUI_Target_HealthBar:SetDesaturated(nil)
		SUI_Target_HealthBar:SetVertexColor(1, 1, 1)
	end
	-- Based on kind (power or health) takes the percentage and adds to deficit
	-- a fraction of the current until it is close enough.  This basically animates
	-- the bar making it slide smoothly as changes occur.
	if barProgress + 0.01 > barPercent and barProgress - 0.01 < barPercent then
		barProgress = barPercent
	else
		barProgress = barProgress + ((barPercent - barProgress)/smoothdegree)
	end
	deficit = FrameWidth * (barProgress * .01)
	if direction == "left" then
		local ULx = (FrameWidth * texture.ColumnCount) - FrameWidth
		local ULy = (FrameHeight * frameRow) - FrameHeight
		local LLx = (FrameWidth * texture.ColumnCount) - FrameWidth
		local LLy = (FrameHeight * frameRow)
		local URx = (FrameWidth * texture.ColumnCount) - (FrameWidth - deficit)
		local URy = (FrameHeight * frameRow) - FrameHeight
		local LRx = (FrameWidth * texture.ColumnCount) - (FrameWidth - deficit)
		local LRy = (FrameHeight * frameRow)
		texture:SetTexCoordModifiesRect(true)
		texture:SetTexCoord(ULx,ULy,LLx,LLy,URx,URy,LRx,LRy)
	elseif direction == "right"  then
		local ULx = (FrameWidth * texture.ColumnCount) - (FrameWidth - deficit)
		local ULy = (FrameHeight * frameRow) - FrameHeight
		local LLx = (FrameWidth * texture.ColumnCount) - (FrameWidth - deficit)
		local LLy = (FrameHeight * frameRow)
		local URx = (FrameWidth * texture.ColumnCount - FrameWidth)
		local URy = (FrameHeight * frameRow) - FrameHeight
		local LRx = (FrameWidth * texture.ColumnCount - FrameWidth)
		local LRy = (FrameHeight * frameRow)
		texture:SetTexCoordModifiesRect(true)
		texture:SetTexCoord(ULx,ULy,LLx,LLy,URx,URy,LRx,LRy)
	end
	--  Translate the xOffset to compensate for bottomleft origin
	local point, relativeTo, relativePoint, xOfs, yOfs = texture:GetPoint()
	if direction == "right" then
		direction = (barwidth/160 * 512) -496
	else
		direction = (barwidth - (barwidth/160 * 512) * deficit)
	end
	texture:SetPoint(point, relativeTo, relativePoint, direction, yOfs)

	-- Pass off globals
	suiData.unit[toonID][kind.."progress"] = barProgress
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Improves over the default crop function.  Normally called from the XML	    |--
--|  Arguments:	texture = texture to crop						    |--
--|  		top = top side of texture						    |--
--|		right = right side of texture						    |--
--|		bottom = bottom side of texture						    |--
--|		left = left side of texture						    |--
--|		modify = whether the crop transforms the texture dimensions or not	    |--
--|		offset = compensates for cropping (since origin is bottomleft)		    |--
-----------------------------------------------------------------------------------------------
function Sui_Crop(texture, top, right, bottom, left, modify, offset)
	local ULx = left
	local ULy = top
	local LLx = left
	local LLy = bottom
	local URx = right
	local URy = top
	local LRx = right
	local LRy = bottom
	texture:SetTexCoordModifiesRect(modify)
	texture:SetTexCoord(ULx,ULy,LLx,LLy,URx,URy,LRx,LRy)
	texture:SetHeight(texture:GetHeight() / (bottom-top)) -- fix cropping bug
	if offset then
		local point, relativeTo, relativePoint, xOfs, yOfs = texture:GetPoint()
		texture:SetPoint(point, relativeTo, relativePoint, xOfs+(texture:GetWidth()-(texture:GetWidth()*(right-left))), yOfs)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Hides or shows the expanded experience info window			    |--
--|  Arguments:	toggle = "show", "hide"							    |--
-----------------------------------------------------------------------------------------------
function Sui_XP_TooltipVisibility(toggle)
	if toggle == "show" then
		SetPortraitTexture(SUI_XP_Portrait, "player")
		SUI_XP_Portrait:Show()
		SUI_XP_Tooltip:Show()
	elseif toggle == "hide" then
		SUI_XP_Tooltip:Hide()
		SUI_XP_Portrait:Hide()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Updates the XP Bar.							    |--
-----------------------------------------------------------------------------------------------
function Sui_XPBar()
	local currentTime, totalTime
	if suiData.currentTime then
		currentTime = suiData.currentTime
		totalTime = suiData.totalTime
	end
	local currentXP, maxXP, restedXP = UnitXP("player"), UnitXPMax("player"), GetXPExhaustion()
	if restedXP == nil then
		restedXP = 0
	elseif (restedXP + currentXP) > maxXP then
		restedXP = maxXP - currentXP
	end
	if currentXP == 0 then
		currentXP = 0.1
	end
	UIFrameFlash(SUI_XPBarRestedHigh, 0.75, 1.25, -1, true, 0, 0)
	SUI_XPBar:SetWidth((currentXP/maxXP) * 402)
	SUI_XPBarRestedLow:SetWidth(((restedXP+currentXP)/maxXP) * 409)
	SUI_XPBarRestedHigh:SetWidth(((restedXP+currentXP)/maxXP) * 409)
	SUI_XP_CurrentXP:SetText("Experience(XP): "..currentXP.."/"..maxXP.."("..math.floor(((currentXP/maxXP)*100)+0.5).."%)")
	SUI_XP_CurrentRested:SetText("Rested XP: "..restedXP.."("..math.floor(((restedXP/maxXP)*100)+0.5).."%)")
	if type(currentTime) == "number" then
		local sessionTime = GetTime() - suiData.sessionMarker
		local timeSession = (maxXP-currentXP)/(suiData.sessionXP/sessionTime)
		local timeLevel = (maxXP-currentXP)/(currentXP/currentTime)
		if timeSession < timeLevel then
			estimateTime = timeSession
		else
			estimateTime = timeLevel
		end
		local estimateTime = SecondsToTime(estimateTime)
		SUI_XP_EstimatedTime:SetText("Time to level: "..estimateTime)
	end
	if SUI_mobXP then
		SUI_XP_EstimatedMobs:SetText("Mobs to level: "..math.floor(((maxXP-currentXP)/SUI_mobXP) + 0.5).." "..(SUI_mobLast or "Quests"))
	end
	suiData.FrameAdvance = 0
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Early animation method (needs to be replaced).  Flashes the frontend of the |--
--| 		XP bar so its more visually interesting and noticeable.			    |--
-----------------------------------------------------------------------------------------------
function Sui_XPIncrease()
	if suiData.FrameAdvance == 1 then
		SUI_XP_Increase:SetTexCoord( 0, .10, 0, 1)
	elseif suiData.FrameAdvance ==  2 then
		SUI_XP_Increase:SetTexCoord( .10, .20, 0, 1)
	elseif suiData.FrameAdvance ==  3 then
		SUI_XP_Increase:SetTexCoord( .20, .30, 0, 1)
	elseif suiData.FrameAdvance ==  4 then
		SUI_XP_Increase:SetTexCoord( .30, .40, 0, 1)
	elseif suiData.FrameAdvance ==  5 then
		SUI_XP_Increase:SetTexCoord( .40, .50, 0, 1)
	elseif suiData.FrameAdvance ==  6 then
		SUI_XP_Increase:SetTexCoord( .50, .60, 0, 1)
	elseif suiData.FrameAdvance ==  7 then
		SUI_XP_Increase:SetTexCoord( .60, .70, 0, 1)
	elseif suiData.FrameAdvance ==  8 then
		SUI_XP_Increase:SetTexCoord( .70, .80, 0, 1)
	elseif suiData.FrameAdvance ==  9 then
		SUI_XP_Increase:SetTexCoord( .80, .90, 0, 1)
	elseif suiData.FrameAdvance ==  10 then
		SUI_XP_Increase:SetTexCoord( .90, 1, 0, 1)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Hides or shows the expanded Reputation info window			    |--
--|  Arguments:	toggle = "show", "hide"							    |--
-----------------------------------------------------------------------------------------------
function Sui_Rep_TooltipVisibility(toggle)
	if toggle == "show" then
		local description
		suiData.factionIndex, description = Sui_FindFactionIndex()
		if description then
			SUI_Rep_Tooltip_Description:SetText(description or " ")
			SUI_Rep_Tooltip:Show()
		else
			SUI_Rep_Tooltip:Hide()
		end
	elseif toggle == "hide" then
		SUI_Rep_Tooltip:Hide()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	This function might be the cause of some crashes (needs testing)	    |--
--|  		Searches for which faction is currently being watched.			    |--
-----------------------------------------------------------------------------------------------
function Sui_FindFactionIndex()
	if GetWatchedFactionInfo() then
		local factionIndex = 1
		while factionIndex do
			local name, description, standingId, bottomValue, topValue, earnedValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, isWatched = GetFactionInfo(factionIndex)
			if name then
				if not isWatched then
					factionIndex = factionIndex + 1
				else
					factionIndex = nil
					return factionIndex, description
				end
			elseif factionIndex > 500 then -- Failsafe
				factionIndex=nil
			else
				factionIndex=nil
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Updates the reputation bar (might be the cause of crashes)		    |--
-----------------------------------------------------------------------------------------------
function Sui_RepBar()
	local RepName, RepReaction, minRep, maxRep, currentRep = GetWatchedFactionInfo()
	if RepName then
		SUI_RepBar:Show()
		SUI_RepBarLow:Show()
		SUI_RepBarLow2:Show()
		SUI_RepBar_Lead:Show()
		SUI_RepBar_LeadLow:Show()
		SUI_RepBar_LeadLow2:Show()
		if minRep < 0 then
			maxRep = maxRep * (-1)
			minRep = minRep * (-1)
			currentRep = currentRep * (-1)
		end
		if maxRep < minRep or maxRep == 0 then
			local tempvar = maxRep
			maxRep = minRep
			minRep = tempvar
		end
		local Reputation = (currentRep - minRep)/(maxRep - minRep) * 402
		if Reputation == 0 then
			Reputation = 0.1
		end
		if Reputation < 0 then
			Reputation = Reputation * (-1)
		end
		if not string.find(Reputation, "%d+") then
			Reputation = 1
		end
		if Reputation > 402 then
			Reputation = 402
		end
		SUI_RepBar:SetWidth(Reputation)
		SUI_RepBarLow:SetWidth(Reputation)
		SUI_RepBarLow2:SetWidth(Reputation)
		SUI_RepBar:SetVertexColor(0, 1, 0)
		SUI_RepBarLow:SetVertexColor(0, 1, 0)
		SUI_RepBarLow2:SetVertexColor(0, 1, 0)
		SUI_RepBarLow2:SetAlpha(0.5)
		SUI_RepBar_Lead:SetVertexColor(0, 1, 0)
		SUI_RepBar_LeadLow:SetVertexColor(0, 1, 0)
		SUI_RepBar_LeadLow2:SetVertexColor(0, 1, 0)
		local repTitle = "unknown"
		local unknown = "|c00808080 |r"
		local hated = "|c008c0000Hated|r"
		local hostile = "|c00ff0000Hostile|r"
		local unfriendly = "|c00ff8c00Unfriendly|r"
		local nuetral = "|c00bfbfbfNeutral|r"
		local friendly = "|c00ffffffFriendly|r"
		local honored = "|c0000ff00Honored|r"
		local revered = "|c004066e5Revered|r"
		local exalted = "|c009933ccExalted|r"
		if RepReaction == 0 then
			repTitle=unknown
		elseif RepReaction == 1 then
			repTitle=hated
		elseif RepReaction == 2 then
			repTitle=hostile
		elseif RepReaction == 3 then
			repTitle=unfriendly
		elseif RepReaction == 4 then
			repTitle=nuetral
		elseif RepReaction == 5 then
			repTitle=friendly
		elseif RepReaction == 6 then
			repTitle=honored
		elseif RepReaction == 7 then
			repTitle=revered
		elseif RepReaction == 8 then
			repTitle=exalted
		end
		local relCur = currentRep-minRep
		local relMax = maxRep-minRep
		local relPer = math.floor((relCur/relMax)*100)
		if relCur == 0 and relMax == 0 then
			relPer = 0
		end
		SUI_Rep_Tooltip_Faction:SetText(RepName or "No Faction")
		SUI_Rep_Tooltip_Standing:SetText(repTitle)
		SUI_Rep_Tooltip_Count:SetText(relCur.."/"..relMax.." ("..relPer.."\%)")
	else
		SUI_RepBar:Hide()
		SUI_RepBarLow:Hide()
		SUI_RepBarLow2:Hide()
		SUI_RepBar_Lead:Hide()
		SUI_RepBar_LeadLow:Hide()
		SUI_RepBar_LeadLow2:Hide()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Handles unit frames.  Two modes: setup or update.			    |--
--|		Under "setup", will fetch/show all unit info for the first load of unit.    |--
--|		Under "update", will update the current health/power levels.		    |--
--|  Arguments:	toon (string) = UnitID of the frame to work with.			    |--
--|				task = "setup", "update"				    |--
-----------------------------------------------------------------------------------------------
function Sui_SetupMembers(toon, task)
	local toonID, frame, color
	if toon == "all" then
		for v = 1, 8, 1 do
			toonID = Sui_DeriveUnit(v, "string")
			if not toonID then
				return
			end
			frame = suiData.unit[v].frame
			color = GetDifficultyColor(UnitLevel(toonID))
			Sui_SetupMembers_Subtask(toonID, task, v, frame)
		end
	else
		local toonID = Sui_DeriveUnit(toon, "number", 8)
		if not toonID then
			return
		end
		frame = suiData.unit[toonID].frame
		color = GetDifficultyColor(UnitLevel(toon))
		Sui_SetupMembers_Subtask(toon, task, toonID, frame)
	end
end
function Sui_SetupMembers_Subtask(toon, task, toonID, frame, englishClass)
	if task == "setup" then
		if UnitExists(toon) and toonID <= 8 then
			if toon == "target" then
				getglobal(frame.."Frame"):Show()
				getglobal(frame):Show()
				if UnitClassification("target") == "normal" then
					SUI_Target_EliteIcon:Hide()
				elseif UnitClassification("target") == "rare" or UnitClassification("target") == "rareelite" then
					SUI_Target_EliteIcon:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Icon_Elite.blp")
					SUI_Target_EliteIcon:Show()
				elseif UnitClassification("target") == "worldboss" or UnitClassification("target") == "elite" then
					SUI_Target_EliteIcon:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Icon_Elite.blp")
					SUI_Target_EliteIcon:Show()
				end
				Sui_GetSpec("target")
			elseif toon == "targettarget" then
				getglobal(frame.."Frame"):Show()
				getglobal(frame):Show()
			elseif toon == "pet" then
				getglobal(frame.."Frame"):Show()
				getglobal(frame):Show()
				_, englishClass = UnitClass("player")
				if englishClass == "HUNTER" then
					SUI_Pet_Happiness:Show()
				end
				if suiData.buffToggle == "on" then
					SUI_Self_Buffs:SetPoint("BOTTOMRIGHT", SUI_Self_Button, "TOPRIGHT", 40, 70)
				end
			else
				if toonID>=3 and toonID<=6 then -- party members
					if (UnitInRaid("player") and suiData.PartyInRaid=="off") or suiData.partyToggle=="off" then
						getglobal(frame):Hide()
					else
						getglobal(frame):Show()
					end
				else
					getglobal(frame):Show()
				end
			end
			getglobal(frame.."_Name"):SetText(UnitName(toon))
			getglobal(frame.."_Level"):SetText(UnitLevel(toon))
			getglobal(frame.."_Level"):SetTextColor(color.r, color.g, color.b)
			SetPortraitTexture(getglobal(frame.."_Portrait"), toon)
			Sui_RaidIcon()
			Sui_ClassIcon(toon, getglobal(frame.."_ClassIcon"))
			Sui_HealthMath(toon, suiData.unit[toonID].healthbar_width, suiData.unit[toonID].healthbar_height, frame)
			Sui_PowerMath(toon, suiData.unit[toonID].powerbar_width, suiData.unit[toonID].powerbar_height, frame)
			Sui_Unit_UpdateAFK_Subtask(suiData.unit[toonID].unit, toonID)
			if suiData.buffToggle == "on" then
				Sui_BuffScan(toon)
			end
		elseif toon ~= "player" and toon ~= "target" then
			getglobal(frame.."Frame"):Hide()
			getglobal(frame):Hide()
			-- Reset location of buffs
			if toon == "pet" and suiData.buffToggle == "on" then
				SUI_Self_Buffs:SetPoint("BOTTOMRIGHT", SUI_Self_Button, "TOPRIGHT", 15, 20)
			end
		elseif toon == "target" then
			getglobal(frame.."Frame"):Hide()
			getglobal(frame):Hide()
		elseif toon == "targettarget" then
			getglobal(frame.."Frame"):Hide()
			getglobal(frame):Hide()
		end
	elseif task == "update" and toonID <= 8 then
		Sui_HealthMath(toon, suiData.unit[toonID].healthbar_width, suiData.unit[toonID].healthbar_height, frame)
		Sui_PowerMath(toon, suiData.unit[toonID].powerbar_width, suiData.unit[toonID].powerbar_height, frame)
		if suiData.buffToggle == "on" then
			Sui_BuffScan(toon)
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Hides/Shows party as designated by preferences.				    |--
-----------------------------------------------------------------------------------------------
function Sui_UpdatePartyVisibility()
	local enable
	if UnitInRaid("player") then
		enable = suiData.PartyInRaid
	else
		enable = suiData.partyToggle
	end
	for i = 1,4 do
		if (enable == "on") and ( UnitExists("party"..i) ) then
			getglobal("SUI_Party"..i.."Frame"):Show()
			getglobal("SUI_Party"..i):Show()
		else
			getglobal("SUI_Party"..i.."Frame"):Hide()
			getglobal("SUI_Party"..i):Hide()
		end
	end
	if suiData.buffToggle == "on" then
		Sui_BuffScan(arg1)
	end
	PartyMemberFrame1:UnregisterAllEvents()
	PartyMemberFrame1:Hide()
	PartyMemberFrame2:UnregisterAllEvents()
	PartyMemberFrame2:Hide()
	PartyMemberFrame3:UnregisterAllEvents()
	PartyMemberFrame3:Hide()
	PartyMemberFrame4:UnregisterAllEvents()
	PartyMemberFrame4:Hide()
	PartyMemberBackground:SetAlpha(0)
	PartyMemberBackground:Hide()
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Control function for remote inspection.					    |--
--|  Returns:	Returns packed 'value' string after successful Sui_FindSpecInfo() string    |--
--|		if the unit is 'inspected' then runs Sui_DeliverSpecInfo.		    |--
-----------------------------------------------------------------------------------------------
function Sui_GetSpec(toon)
	if UnitInParty("target") and (not UnitIsUnit("target", "player")) and (suiData.broadcastToggle == "on") then
		SUI_MouseTooltip_Text:SetText("Not available.")
		if (CheckInteractDistance("target", 1) == 1) then
			-- Parsed as: SUI, task  caller  subject  value  ttspec, "CHANNEL"
			SendAddonMessage("SUI", "find "..UnitName("player").." spec none "..UnitName("target").." ", "PARTY")
		end
	-- this is only for the local player if they target themselves - no sense in spamming the AddOn Channel
	elseif UnitIsUnit("player", "target") then
		Sui_DeliverSpecInfo(Sui_FindSpecInfo("player"))
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Fetches unit spec for remote inspection and using caller/ttspec vars	    |--
--|		should keep the wrong info from appearing on the players target		    |--
--|  Input:	toon: only "player"							    |--
--|		caller: player making request						    |--
--|		ttspec: intended spec from target					    |--
--|  Returns:	Returns packed 'content' string.					    |--
-----------------------------------------------------------------------------------------------
function Sui_FindSpecInfo(toon, caller, ttspec)
	local t1Name, t1IconTexture, t1 = GetTalentTabInfo(1)
	local t2Name, t2IconTexture, t2 = GetTalentTabInfo(2)
	local t3Name, t3IconTexture, t3 = GetTalentTabInfo(3)
	local localizedClass, englishClass = UnitClass("player")
	local content
	if not t3Name then
		content = "Not available"
	-- this only packs the spec info into the 'content' var which is directly delivered to Sui_DeliverSpecInfo via Sui_GetSpec bypassing the Addon channel
	elseif UnitIsUnit("player", "target") then
		content = (t1.."||"..t2.."||"..t3.."||"..(englishClass or "Unknown").."||"..t1Name.."||"..t2Name.."||"..t3Name.." ")
	end
	if caller and (UnitName("player") == ttspec) and (suiData.broadcastToggle == "on") then
		content = (t1.."||"..t2.."||"..t3.."||"..(englishClass or "Unknown").."||"..t1Name.."||"..t2Name.."||"..t3Name.." ")
		-- Parsed as: SUI, task  caller  subject  value  ttspec, "CHANNEL"
		SendAddonMessage("SUI", "deliver "..caller.." spec "..content.." "..ttspec, "PARTY")
	else
		return content
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Fetches unit info for remote inspection.				    |--
--|  Returns:	Determines spec type by comparing the number of talent points spent.	    |--
--|		In other words, the talent tab with the highest number identifies the spec #.|--
-----------------------------------------------------------------------------------------------
function Sui_DeliverSpecInfo(value)
	local _, _, t1, t2, t3, englishClass, t1Name, t2Name, t3Name = string.find(value, "(%d+)||(%d+)||(%d+)||(.+)||(.+)||(.+)||(.+)")
	t1 = tonumber(t1)
	t2 = tonumber(t2)
	t3 = tonumber(t3)
	t1 = t1 or 0
	t2 = t2 or 0
	t3 = t3 or 0

	if ((t1 > t2) and (t1 > t3)) then
		spec = 2
	elseif (t2 > t3) then
		spec = 3
	else
		spec = 4
	end
	local text = "Not Available."
	if SUI_Lang[englishClass] then
		text = "|cffffc100"..(SUI_Lang[englishClass][spec] or "error").." "
		text = text..(SUI_Lang[englishClass][1] or "error").."|r\r\n\r\n"

		text = text.."|c0000c0ff"..(t1Name or "error").."|r: "
		text = text..(t1 or "error").."\r\n"

		text = text.."|c0000c0ff"..(t2Name or "error").."|r: "
		text = text..(t2 or "error").."\r\n"

		text = text.."|c0000c0ff"..(t3Name or "error").."|r: "
		text = text..(t3 or "error")
	end
	SUI_MouseTooltip_Text:SetText(text)
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Refreshes Unit Status							    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_Update()
	if (UnitExists("player")) then
		Sui_Unit_UpdateLootMethod()
		Sui_Unit_UpdatePvPStatus()
	end
	Sui_Unit_UpdatePartyLeader()
	Sui_Unit_UpdateStatus()
	if  UnitExists("target") then
		SUI_Target:Show()
	else
		SUI_Target:Hide()
	end
	if (Adapt) then
		Adapt_Settings.Shape = "CIRCLE"
		Adapt.Reshape()
		Adapt_Settings.Backdrop = Adapt_Settings.Backdrop=="ON"
		Adapt.Reback()
	end
end
------------------------------------------------------------------------------------------------
--|  Purpose:	Derives the unit string based on number, or unit number based on string      |--
--|  Arguments:	toon = string or number of unit to reverse				     |--
--|		desiredType (string) = whether the results should be a string or number.     |--
--|		limit (number) = max number of units to compare.			     |--
------------------------------------------------------------------------------------------------
function Sui_DeriveUnit(toon, desiredType, limit)
	local i, toonID = 1
	local varType = type(toon)
	if varType == "string" then
		local start, finish = string.find(toon, "raid", 1, true)
		if start then
			for v = 1, 40, 1 do
				while i and i <= (limit or 8) do
					if UnitIsUnit(toon, suiData.unit[i].unit) then
						toonID, varType = i, "number"
						i = nil
					else
						i = i + 1
					end
				end
			end
		else
		while suiData.unit[i] and i <= (limit or table.getn(suiData.unit)) do
			if toon == suiData.unit[i].unit then
				toonID, varType = i, "number"
				i = nil
			else
				i = i + 1
			end
		end
	end
	elseif varType == "number" then
		while suiData.unit[i] and i <= (limit or table.getn(suiData.unit)) do
			if toon == i then
				toonID, varType = suiData.unit[i].unit, type(suiData.unit[i].unit)
				i = nil
			else
				i = i + 1
			end
		end
	else
		toonID = "invalid"
	end
	if toonID and varType == desiredType then
		if desiredType == "number" and suiData.unit[toonID] and suiData.unit[toonID].frame then
			return toonID
		elseif desiredType == "string" and toonID ~= "invalid" then
			return toonID
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Updates the number of charges shown					    |--
-----------------------------------------------------------------------------------------------
function Sui_UpdateComboPoints()
	local points = GetComboPoints()
	local _, englishClass = UnitClass("player")
	if englishClass ~= "WARRIOR" then
		ComboFrame:SetAlpha(0)
		ComboFrame:Hide()
		if points == 0 then
			SUI_Target_Combo1:Hide()
			SUI_Target_Combo2:Hide()
			SUI_Target_Combo3:Hide()
			SUI_Target_Combo4:Hide()
			SUI_Target_Combo5:Hide()
		elseif points == 1 then
			SUI_Target_Combo1:Show()
			SUI_Target_Combo2:Hide()
			SUI_Target_Combo3:Hide()
			SUI_Target_Combo4:Hide()
			SUI_Target_Combo5:Hide()
		elseif points == 2 then
			SUI_Target_Combo1:Show()
			SUI_Target_Combo2:Show()
			SUI_Target_Combo3:Hide()
			SUI_Target_Combo4:Hide()
			SUI_Target_Combo5:Hide()
		elseif points == 3 then
			SUI_Target_Combo1:Show()
			SUI_Target_Combo2:Show()
			SUI_Target_Combo3:Show()
			SUI_Target_Combo4:Hide()
			SUI_Target_Combo5:Hide()
		elseif points == 4 then
			SUI_Target_Combo1:Show()
			SUI_Target_Combo2:Show()
			SUI_Target_Combo3:Show()
			SUI_Target_Combo4:Show()
			SUI_Target_Combo5:Hide()
		elseif points == 5 then
			SUI_Target_Combo1:Show()
			SUI_Target_Combo2:Show()
			SUI_Target_Combo3:Show()
			SUI_Target_Combo4:Show()
			SUI_Target_Combo5:Show()
		end
	end
end
------------------------------------------------------------------------------------------------
--|  Purpose:   Creates all buff frames for population based on suiData.unit[i].frame        |--
--|  Variables: subject = "Buff", "Debuff" or "Weapon"					     |--
--|		i = current unit (1-8)							     |--
--|		ii = current buff (as many as there are)				     |--
--|		frame = from suiData.unit[i].frame, the name of the unit frame.		     |--
------------------------------------------------------------------------------------------------
function Sui_BuffCreateFrames()
	local i = 1
	while suiData.unit[i] and i <= 8 do
		local state = "HELPFUL"
		local ii = 1
		while ii do
			-- Initialize variables
			local subject
			if state == "HELPFUL" then
				subject = "Buff"
			elseif state == "HARMFUL" then
				subject = "Debuff"
			elseif state == "WEAPON" then
				subject = "Weapon"
			end
			local direction = suiData.unit[i].direction
			local runDirection = suiData.unit[i].runDirection
			local father_string = suiData.unit[i].frame .. "_" .. subject .. "_" .. ii
			local master_string = suiData.unit[i].frame .. "_" .. subject .. "s"
			local icon, count, master, bar, timer
			local buffSize = suiData.unit[i].buffSize
			local scaleFactor = 1
			local buffPadding = suiData.unit[i].buffPadding
			-- Create parent frame
			if not getglobal(master_string) then
				-- Buff Placement
				local selfAnchor, parentAnchor, parentAnchorDebuff, xOffset, yOffset
				if direction == "left" then
					if suiData.unit[i].unit ~= "player" then
						-- Party Buffs
						selfAnchor = "TOPLEFT"
						parentAnchor = "TOPLEFT"
						parentAnchorDebuff = "TOPRIGHT"
						xOffset = 32
						yOffset = -11
					else
						-- Self Buffs
						selfAnchor = "BOTTOMRIGHT"
						parentAnchor = "TOPRIGHT"
						xOffset = 10
						yOffset = 20
					end
				elseif direction == "right" then
					if suiData.unit[i].unit ~= "target" then
						-- Target of Targets Buffs
						selfAnchor = "TOPRIGHT"
						parentAnchor = "TOPRIGHT"
						parentAnchorDebuff = "TOPLEFT"
						xOffset = -30
						yOffset = 2
					else
						-- Target Buffs
						selfAnchor = "BOTTOMLEFT"
						parentAnchor = "TOPLEFT"
						xOffset = -10
						yOffset = 20
					end
				end
				master = CreateFrame("Frame", master_string, getglobal(suiData.unit[i].frame.."Frame_Info"))
				master:SetWidth(buffSize)
				master:SetHeight(buffSize)
				master.bgTexture = master:CreateTexture(master_string.."_BuffBG")
				master.bgTexture:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Object_Buff_BG.blp")
				master.direction = suiData.unit[i].direction
				master.bgTexture:SetParent(master)
				master.bgTexture:SetAlpha(.55)
				master:SetPoint(selfAnchor, getglobal(suiData.unit[i].frame.."_Button"), parentAnchor, xOffset, yOffset)
				if subject == "Debuff" then
					local debuffParent, multiplier = getglobal(suiData.unit[i].frame.."_".."Buffs"), 1
					xOffset, yOffset = 0, (6 + buffPadding)
					if direction ~= runDirection then
						parentAnchor = parentAnchorDebuff
						debuffParent = getglobal(suiData.unit[i].frame.."_".."Buff_"..suiData.unit[i].buffLimit)
						if runDirection == "left" then
							multiplier = -1
						end
						xOffset, yOffset = (1 * multiplier), 7
					end
					master:SetPoint(selfAnchor, debuffParent, parentAnchor, xOffset, yOffset)
				elseif subject == "Weapon" then
					master:SetPoint(selfAnchor, getglobal(suiData.unit[i].frame.."_".."Debuffs"), parentAnchor, 0, (6 + buffPadding))
				end
				master:SetParent(getglobal(suiData.unit[i].frame.."Frame_Info"))
			else
				master = getglobal(master_string)
			end
			-- Create buff button
			local father = CreateFrame("Button", father_string, master)
			-- Anchor and position child buffs to parent frame
			-- If prior buff-button exists, anchor to it instead
			if getglobal(suiData.unit[i].frame .. "_Buff_" .. (ii-1)) then
				if runDirection == "left" then
					father:SetPoint("BOTTOMRIGHT", getglobal(suiData.unit[i].frame.."_"..subject.."_"..(ii-1)), "BOTTOMLEFT", -2, 0)
				elseif runDirection == "right" then
					father:SetPoint("BOTTOMLEFT", getglobal(suiData.unit[i].frame.."_"..subject.."_"..(ii-1)), "BOTTOMRIGHT", 2, 0)
				end
			else
				if runDirection == "left" then
					father:SetPoint("BOTTOMRIGHT", master, "BOTTOMRIGHT", -1, -7)
				elseif runDirection == "right" then
					father:SetPoint("BOTTOMLEFT", master, "BOTTOMLEFT", 1, -7)
				end
			end
			father:SetWidth(buffSize)
			father:SetHeight(buffSize)
			father:SetScript("OnEnter", Sui_BuffTooltip_Enter)
			father:SetScript("OnLeave", Sui_BuffTooltip_Leave)
			father:SetScript("OnClick", Sui_BuffTooltip_Click)
			father:RegisterForClicks('LeftButtonUp')
			father:EnableMouse(true)
			icon = father:CreateTexture((father_string .. "_Icon"),"HIGH")
			icon:SetTexCoord(0.078125,0.921875,0.078125,0.921875)
			icon:SetAllPoints(father)
			icon.buffSize = buffSize
			count = father:CreateFontString(father_string .. "_Count","OVERLAY")
			count:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 0)
			count:SetFontObject(SUI_FontMicro)
			count:SetJustifyH("CENTER")
			count:SetParent(father)
			father:SetScale(scaleFactor)
			ii = ii + 1
			if state == "HELPFUL" and ii > suiData.unit[i].buffLimit then
				state = "HARMFUL"
				ii = 1
			elseif state == "HARMFUL" and ii > suiData.unit[i].debuffLimit and suiData.unit[i].unit == "player" then
				state = "WEAPON"
				ii = 1
			elseif state == "HARMFUL" and ii > suiData.unit[i].debuffLimit then
				ii = nil
			elseif state == "WEAPON" and ii > suiData.unit[i].weaponLimit then
				ii = nil
			end
		end
		i = i + 1
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Scans the unit for buffs and debuffs, then adds it to a database	    |--
--|  Arguments:	toon = "player", "party1", etc...					    |--
-----------------------------------------------------------------------------------------------
function Sui_BuffScan(toon)
	-- Scan for buffs/debuffs
	if toon == "player" then
		-- initialize variables
		local helpful = {}
		local harmful = {}
		local i = 1
		local state, indexNum, untilCancelled, applications, buffName, buffTexture, buffTime, buffTimeMarker, tempDB = "PASSIVE"
		while i do
			-- restart values
			indexNum, untilCancelled, applications, buffName, buffTexture, buffTime, buffTimeMarker, tempDB = nil, nil, nil, nil, nil, nil, nil, nil
			-- Scan for buff at location i
			indexNum, untilCancelled = GetPlayerBuff(i-1, state)
			applications = GetPlayerBuffApplications(indexNum)
			buffTexture = GetPlayerBuffTexture(indexNum)
			buffTime = GetPlayerBuffTimeLeft(indexNum)
			buffTimeMarker = GetTime()
			-- Tests for valid buff.  If it fails, it moves to the next state or kills the cycle.
			-- Alternatively, if found, records the buff and iterates to the next buff.
			if not buffTexture then
				if state == "PASSIVE" then
					state = "HELPFUL"
					i = 1
				elseif state == "HELPFUL" then
					state = "HARMFUL"
					i = 1
				elseif state == "HARMFUL" then
					i = nil
				end
			else
				-- Record the results
				tempDB = {
					["type"] = state,
					["index"] = indexNum,
					["buffTime"] = buffTime,
					["applications"] = applications,
					["buffTexture"] = buffTexture,
					["buffTimeMarker"] = buffTimeMarker,
				}
				-- Record results to parent table
				if state == "HELPFUL" or state == "PASSIVE" then
					if not helpful[i] then	-- If a buff was passive, will retain that type
						helpful[i] = tempDB
					end
				elseif state == "HARMFUL" then
					harmful[i] = tempDB
				end
				-- iterate
				i = i + 1
			end
		end
		-- Weapon enchantments
		local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo()
		local offHandTexture, mainHandTexture
		local weapons = {}
		if hasMainHandEnchant then
			mainHandTexture = GetInventoryItemTexture("player", 16)
			weapons[1] = {
				["type"] = "Weapon",
				["buffName"] = "Enchant 1",
				["index"] = 16,
				["buffTime"] = mainHandExpiration,
				["applications"] = mainHandCharges,
				["buffTexture"] = mainHandTexture,
				["buffTimeMarker"] = GetTime(),
			}
		end
		if hasOffHandEnchant then
			offHandTexture = GetInventoryItemTexture("player", 17)
			weapons[2] = {
				["type"] = "Weapon",
				["buffName"] = "Enchant 2",
				["index"] = 17,
				["buffTime"] = offHandExpiration,
				["applications"] = offHandCharges,
				["buffTexture"] = offHandTexture,
				["buffTimeMarker"] = GetTime(),
			}
		end
		-- Dissemination
		suiData.unit[1].Buff, suiData.unit[1].Debuff, suiData.unit[1].Weapon = nil, nil, nil
		suiData.unit[1].Buff = helpful
		suiData.unit[1].Debuff = harmful
		suiData.unit[1].Weapon = weapons
	else
		-- initialize variables
		local toonID = Sui_DeriveUnit(toon, "number", 8)
		if not toonID then return end
		local helpful = {}
		local harmful = {}
		local i = 1
		local state, buffTexture, applications, debuffType, buffTime, buffTimeMarker, tempDB = "HELPFUL"
		while i and i <= 40 and toonID <= 8 do
			-- restart values
			buffTexture, applications, debuffType, buffTime, buffTimeMarker, tempDB = nil, nil, nil, nil, nil, nil
			-- Scan for buff at location i
			if state == "HELPFUL" then
				buffTexture, applications = UnitBuff(toon, i)
				buffTime = GetPlayerBuffTimeLeft(GetPlayerBuff(i-1,"HELPFUL"))
				buffTimeMarker = GetTime()
			elseif state == "HARMFUL" then
				buffTexture, applications, debuffType = UnitDebuff(toon, i)
				buffTime = GetPlayerBuffTimeLeft(GetPlayerBuff(i-1,"HARMFUL"))
				buffTimeMarker = GetTime()
			end
			-- Tests for valid buff.  If it fails, it moves to the next state or kills the cycle.
			-- Alternatively, if found, records the buff and iterates to the next buff.
			if not buffTexture then
				if state == "HELPFUL" then
					state = "HARMFUL"
					i = 1
				elseif state == "HARMFUL" then
					i = nil
				end
			else
				-- Record the results
				tempDB = {
					["type"] = state,
					["index"] = i,
					["buffTime"] = buffTime,
					["applications"] = applications,
					["buffTexture"] = buffTexture,
					["buffTimeMarker"] = buffTimeMarker,
				}
				-- Record results to parent table
				if state == "HELPFUL" then
					helpful[i] = tempDB
				elseif state == "HARMFUL" then
					harmful[i] = tempDB
				end
				-- iterate
				i = i + 1
			end
		end
		suiData.unit[toonID].Buff, suiData.unit[toonID].Debuff  = nil, nil
		suiData.unit[toonID].Buff = helpful
		suiData.unit[toonID].Debuff = harmful
	end
	Sui_BuffPopulate(toon)
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Populates a units buff frames with the appropriate text/icon/count from DB |--
--|  Arguments:	toon = "player", "party1", etc...					    |--
--|  Variables: i = current unit (a.k.a. toon) found in suiData.unit[x].unit		    |--
--|		ii = current buff/debuff being operated on				    |--
--|		subject = "Buff" or "Debuff"						    |--
--|		state = "HARMFUL", "HELPFUL", "WEAPON"					    |--
-----------------------------------------------------------------------------------------------
function Sui_BuffPopulate(toon)
	if suiData.buffToggle == "on" then
		local i = Sui_DeriveUnit(toon, "number", 8)
		if not i then return end
		if i <= 8 then
			local ii = 1
			local state
			local subject
			while ii do
				if ii == 1 and not state then
					subject = "Buff"
					state = "HELPFUL"
				elseif ii == 1 and state == "HELPFUL" then
					subject = "Debuff"
					state = "HARMFUL"
				elseif ii == 1 and state == "HARMFUL" and toon == "player" then
					subject = "Weapon"
					state = "WEAPON"
				end
				local father = getglobal(suiData.unit[i].frame.."_"..subject.."_"..ii)
				local icon = getglobal(suiData.unit[i].frame.."_"..subject.."_"..ii.."_Icon")
				local count = getglobal(suiData.unit[i].frame.."_"..subject.."_"..ii.."_Count")
				local currentBuff
				if suiData.unit[i][subject] then
					if suiData.unit[i][subject][ii] then
						father:Show()
						icon:SetTexture(suiData.unit[i][subject][ii].buffTexture)

						-- Fix for zeros and ones
						local counter
						if suiData.unit[i][subject][ii].applications == 0 or suiData.unit[i][subject][ii].applications == 1 then
							counter = nil
						else
							counter = suiData.unit[i][subject][ii].applications
						end
						count:SetText(counter)
						father.state = subject
						father.index = suiData.unit[i][subject][ii].index
						father.castable = suiData.unit[i][subject].castable
						father.direction = suiData.unit[i].direction
						father.toon = suiData.unit[i].unit
						currentBuff = true
					else
						currentBuff = false
					end
				end
				local nextBuff
				if suiData.unit[i][subject] then
					if suiData.unit[i][subject][ii + 1] then
						nextBuff = true
					else
						nextBuff = false
					end
				end
				-- iterate
				ii = ii + 1
				-- restart or kill cycle
				if toon == "player" then
					if state == "HELPFUL" and (nextBuff == false or ii > suiData.unit[i].buffLimit) then
						Sui_BuffCleanup(suiData.unit[i].frame .. "_" .. subject, ii, nextBuff, currentBuff, i)
						ii = 1
					elseif state == "HARMFUL" and (nextBuff == false or ii > suiData.unit[i].debuffLimit) then
						Sui_BuffCleanup(suiData.unit[i].frame .. "_" .. subject, ii, nextBuff, currentBuff, i)
						ii = 1
					elseif state == "WEAPON" and (nextBuff == false or ii > suiData.unit[i].weaponLimit) then
						Sui_BuffCleanup(suiData.unit[i].frame .. "_" .. subject, ii, nextBuff, currentBuff, i)
						ii = nil
					end
				else
					if state == "HELPFUL" and (nextBuff == false or ii > suiData.unit[i].buffLimit) then
						Sui_BuffCleanup(suiData.unit[i].frame .. "_" .. subject, ii, nextBuff, currentBuff, i)
						ii = 1
					elseif state == "HARMFUL" and (nextBuff == false or ii > suiData.unit[i].debuffLimit) then
						Sui_BuffCleanup(suiData.unit[i].frame .. "_" .. subject, ii, nextBuff, currentBuff, i)
						ii = nil
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Pushes updates to bar, timer, and gametooltips (all which rely on time)	    |--
--|  Note:	Updates occur at 12.5 updates per second, sufficient for bar animation but  |--
--|		too fast for text updates.  Use of a global marker is implemented too slow   |--
-----------------------------------------------------------------------------------------------
function Sui_BuffUpdate()
	local subject = "Buff"
	local x = 1
	while x do
		-- recursive DB test for presence. Fault-protection
		if suiData.unit[1][subject] then
			if suiData.unit[1][subject][x] then
				if suiData.unit[1][subject][x].buffTime then
				-- end DB test
					local start = suiData.unit[1][subject][x].buffTime
					local current = (GetTime() - suiData.unit[1][subject][x].buffTimeMarker)
					local max = start - GetTime()
					local time = date("*t", (start - current))
					local timePrint
					--SUI_TestString2:SetText(time.hour.. " | "..time.min.. " | "..time.sec)
					local bar = getglobal(suiData.unit[1].frame .. "_" .. subject .. "_" .. x .. "_Bar")
					local timer = getglobal(suiData.unit[1].frame .. "_" .. subject .. "_" .. x .. "_Timer")
					local buffSize = (getglobal(suiData.unit[1].frame .. "_" .. subject .. "_" .. x .. "_Icon")).buffSize
					if current > start then
						current = start
					end
					if (time) then
						if (time.min > 0) then timePrint = time.min
						else timePrint = time.sec end
					end
					x = x + 1
				elseif subject=="Buff" then
					subject = "Debuff"
					x = 1
				elseif subject=="Debuff" then
					subject = "Weapon"
					x = 1
				elseif subject=="Weapon" then
					x = nil
				end
			else
				x = nil
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Hides further buffs from showing and sets the size of the BG to fit buffs   |--
--|  Arguments:	frame (string) = e.g., "SUI_Self_Buff_"					    |--
--|  		ii = current buff/debuff being operated on				    |--
--|		next (boolean) = whether theres another buff after the current		    |--
--|		current (boolean) = whether the current buff exists			    |--
--|		i = current unit (a.k.a. toon) found in suiData.unit.x			    |--
-----------------------------------------------------------------------------------------------
function Sui_BuffCleanup(frame, ii, next, current, i)
	if current == false then
		ii = ii - 1
	elseif next == false then
		ii = ii
	end
	if getglobal(frame.."s") then
		if getglobal(frame.."s").bgTexture then
			local texture = getglobal(frame.."s").bgTexture
			local direction = getglobal(frame.."s").direction
			local firstBuff = getglobal(frame.."_"..1)
			local lastBuff = getglobal(frame.."_"..ii-1)
			local padding = suiData.unit[i].buffPadding
			-- if there are no buffs/debuffs, hide the background
			if (ii-1) == 0 then
				texture:Hide()
			else
				texture:Show()
			end
			-- set the size of the background according to the first and last buffs with padding
			if direction == "left" then
				texture:SetPoint("BOTTOMRIGHT", firstBuff, "BOTTOMRIGHT", padding, -(padding))
				texture:SetPoint("TOPLEFT", lastBuff, "TOPLEFT", -padding, (padding))
			elseif direction == "right" then
				texture:SetPoint("BOTTOMLEFT", firstBuff, "BOTTOMLEFT", -padding, -(padding))
				texture:SetPoint("TOPRIGHT", lastBuff, "TOPRIGHT", padding, (padding))
			end
		end
	end
	while ii do
		local nextFrame = getglobal(frame.."_"..ii)
		if nextFrame then
			nextFrame:Hide()
			ii = ii + 1
		else
			ii = nil
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Searches under mouse for which buff frame you're over and shows the	    |--
--|		appropriate buff info accordingly.					    |--
-----------------------------------------------------------------------------------------------
function Sui_BuffTooltip_Enter()
	-- Produces the list of frames
	local frame = EnumerateFrames()
	-- if it finds a frame that's visible and under the mouse...
	while frame do
		if frame:IsVisible() and MouseIsOver(frame) then
			local frame_string = frame:GetName()
			local start, finish
			-- ...then scan it for our keyphrases
			if type(frame_string)=="string" then
				start, finish = string.find(frame_string, "_Buff_", 1, true)
				if not start then
					start, finish = string.find(frame_string, "_Debuff_", 1, true)
					if not start then
						start, finish = string.find(frame_string, "_Weapon_", 1, true)
					end
				end
			end
			-- if a match is found, setup tooltip and show
			if start then
				local father = getglobal(frame_string)
				local castable = father.castable
				local index = father.index
				local state = father.state
				local direction = father.direction
				local toon = father.toon
				GameTooltip:SetOwner(father, direction)
				if toon=="player" then
					if state=="Weapon" then
						GameTooltip:SetInventoryItem("player", index)
					else
						GameTooltip:SetPlayerBuff(index)
					end
				else
					if state=="Buff" then
						GameTooltip:SetUnitBuff(toon, index)
					elseif state=="Debuff" then
						GameTooltip:SetUnitDebuff(toon, index)
					end
				end
				GameTooltip:Show()
				-- and toggle for repeat updates of tooltips
				suiData.tooltipUpdate = true
			end
		end
		-- returns frame which follows current frame
		frame = EnumerateFrames(frame)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Hides the tooltip.							    |--
-----------------------------------------------------------------------------------------------
function Sui_BuffTooltip_Leave()
		GameTooltip:Hide()
		suiData.tooltipUpdate = false
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Handles canceling the buff in question.					    |--
-----------------------------------------------------------------------------------------------
function Sui_BuffTooltip_Click()
	local frame = EnumerateFrames()
	while frame do
		if frame:IsVisible() and MouseIsOver(frame) then
			local frame_string = frame:GetName()
			local start, finish = string.find(frame_string, "_Buff_", 1, true)
			if start then
				local father = getglobal(frame_string)
				if father.toon == "player" then
					CancelPlayerBuff(father.index)
				end
			else
			start, finish = string.find(frame_string, "_Weapon_", 1, true)
				if start then
				local father = getglobal(frame_string)
					if father.index == 16 then
						--CancelItemTempEnchantment(1)
					elseif father.index == 17 then
						--CancelItemTempEnchantment(1)
					end
				end
			end
		end
	frame = EnumerateFrames(frame)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Notifies unit frames when a party member disconnects but remains in party.  |--
--|		A little incomplete, ATM.						    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdateOnline(toon)
	local shaderSupported = SUI_Target_HealthBar:SetDesaturated(1)
	if UnitExists(toon) and UnitInParty(toon) then
		Sui_Unit_UpdateOnline(toon, 8)

	elseif not shaderSupported then
		getglobal(suiData.HealthBar):SetVertexColor(0.5, 0.5, 0.5)
		SUI_Target_HealthBar:SetVertexColor(0.5, 0.5, 0.5)

	elseif not (UnitIsTapped("target")) then
		SUI_Target_HealthBar:SetDesaturated(nil)
		SUI_Target_HealthBar:SetVertexColor(1, 1, 1)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Show/Hides the party leader icon on unit frames.			    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdatePartyLeader()
	SUI_Self_LeaderIcon:Hide()
	SUI_Party1_LeaderIcon:Hide()
	SUI_Party2_LeaderIcon:Hide()
	SUI_Party3_LeaderIcon:Hide()
	SUI_Party4_LeaderIcon:Hide()
	SUI_Target_LeaderIcon:Hide()
	if UnitIsPartyLeader("player") then
		SUI_Self_LeaderIcon:Show()
	elseif UnitIsPartyLeader("party1") then
		SUI_Party1_LeaderIcon:Show()
	elseif UnitIsPartyLeader("party2") then
		SUI_Party2_LeaderIcon:Show()
	elseif UnitIsPartyLeader("party3") then
		SUI_Party3_LeaderIcon:Show()
	elseif UnitIsPartyLeader("party4") then
		SUI_Party4_LeaderIcon:Show()
	end
	if UnitIsPartyLeader("target") then
		SUI_Target_LeaderIcon:Show()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Show/Hides master looter icon on unit frames.				    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdateLootMethod()
	local lootMethod, lootMaster = GetLootMethod()
	if ( lootMaster == 0 and ((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) ) then
		SUI_Self_MasterIcon:Show()
	else
		SUI_Self_MasterIcon:Hide()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Show/Hides PvP status icons on unit frames.				    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdatePvPStatus()
	Sui_Unit_UpdatePVPSubtask("player", SUI_Self_PVPIcon)
	Sui_Unit_UpdatePVPSubtask("party1", SUI_Party1_PVPIcon)
	Sui_Unit_UpdatePVPSubtask("party2", SUI_Party2_PVPIcon)
	Sui_Unit_UpdatePVPSubtask("party3", SUI_Party3_PVPIcon)
	Sui_Unit_UpdatePVPSubtask("party4", SUI_Party4_PVPIcon)
	Sui_Unit_UpdatePVPSubtask("target", SUI_Target_PVPIcon)
end
function Sui_Unit_UpdatePVPSubtask(toon, texture)
	local factionGroup, factionName = UnitFactionGroup(toon)
	if ( UnitIsPVPFreeForAll(toon) ) then
		texture:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA")
		texture:Show()
	elseif ( factionGroup and UnitIsPVP(toon) ) then
		texture:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup)
		texture:Show()
	else
		texture:Hide()
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Show/Hides attack/resting icons on unit frames.				    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdateStatus_Subtask(toon, attackicon, resticon)
	if UnitExists(toon) then
		if IsResting() and toon == "player" then
			attackicon:Hide()
			resticon:Show()
		elseif (UnitAffectingCombat(toon)) then
			attackicon:Show()
			resticon:Hide()
		else
			attackicon:Hide()
			resticon:Hide()
		end
	end
end
function Sui_Unit_UpdateStatus()
	Sui_Unit_UpdateStatus_Subtask("player", SUI_Self_AttackIcon, SUI_Self_RestIcon)
	Sui_Unit_UpdateStatus_Subtask("party1", SUI_Party1_AttackIcon, SUI_Party1_RestIcon)
	Sui_Unit_UpdateStatus_Subtask("party2", SUI_Party2_AttackIcon, SUI_Party2_RestIcon)
	Sui_Unit_UpdateStatus_Subtask("party3", SUI_Party3_AttackIcon, SUI_Party3_RestIcon)
	Sui_Unit_UpdateStatus_Subtask("party4", SUI_Party4_AttackIcon, SUI_Party4_RestIcon)
	Sui_Unit_UpdateStatus_Subtask("target", SUI_Target_AttackIcon, SUI_Target_RestIcon)
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Show/Hides AFK status icon on unit frames.				    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdateAFK_Subtask(toon, toonID, afkflag)
	local kind = type(toonID)
	if kind == "string" then
		toonID = tonumber(toonID)
	end
	if toonID <=6 then
		local icon = getglobal(suiData.unit[toonID].frame .. "_ReadyMaybe")
		if afkflag=="true" then
			icon:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Icon_AFK.blp")
			icon:SetHeight(32)
			icon:Show()
		elseif afkflag=="false" then
			icon:Hide()
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Show/Hides ReadyCheck status icon on unit frames.			    |--
-----------------------------------------------------------------------------------------------
function Sui_Unit_UpdateReadyCheck_Subtask(toon, toonID, rcflag)
	local kind = type(toonID)
	if kind == "string" then
		toonID = tonumber(toonID)
	end
	if toonID <=6 then
		local icon = getglobal(suiData.unit[toonID].frame .. "_ReadyMaybe")
		if rcflag=="maybe" then
			icon:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Icon_Readycheck_Maybe.blp")
			icon:SetHeight(70)
			icon:Show()
		elseif rcflag=="yes" then
			icon:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Icon_Readycheck_Yes.blp")
			icon:SetHeight(70)
			icon:Show()
		elseif rcflag=="no" then
			icon:SetTexture("Interface\\AddOns\\SpartanUI\\Textures\\Icon_Readycheck_No.blp")
			icon:SetHeight(70)
			icon:Show()
		elseif rcflag=="reset" then
			icon:Hide()
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Determines the level of pet happiness.					    |--
-----------------------------------------------------------------------------------------------
function Sui_Pet_UpdateHappiness()
	local happiness, damagePercentage, loyaltyRate = GetPetHappiness()
	local hasPetUI, isHunterPet = HasPetUI()
	if ( not happiness or not isHunterPet ) then
		SUI_Pet_Happiness:Show()
		return
	end
	SUI_Pet_Happiness:Show()
	if ( happiness == 1 ) then
		SUI_Pet_HappinessIcon:SetTexCoord(0.375, 0.5625, 0, 0.359375)
	elseif ( happiness == 2 ) then
		SUI_Pet_HappinessIcon:SetTexCoord(0.1875, 0.375, 0, 0.359375)
	elseif ( happiness == 3 ) then
		SUI_Pet_HappinessIcon:SetTexCoord(0, 0.1875, 0, 0.359375)
	end
	SUI_Pet_Happiness.tooltip = getglobal("PET_HAPPINESS"..happiness)
	SUI_Pet_Happiness.tooltipDamage = format(PET_DAMAGE_PERCENTAGE, damagePercentage)
	if ( loyaltyRate < 0 ) then
		SUI_Pet_Happiness.tooltipLoyalty = getglobal("LOSING_LOYALTY")
	elseif ( loyaltyRate > 0 ) then
		SUI_Pet_Happiness.tooltipLoyalty = getglobal("GAINING_LOYALTY")
	else
		SUI_Pet_Happiness.tooltipLoyalty = nil
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	SpinCam control.  Woohoo! :D						    |--
-----------------------------------------------------------------------------------------------
function Sui_SpinCam(toggle)
	if toggle=="on" then
		SetCVar("cameraYawMoveSpeed","7.33")
		MoveViewRightStart()
		SetView(5)

	elseif toggle=="off" then
		MoveViewRightStop()
		SetCVar("cameraYawMoveSpeed","230")
		SetView(5)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Based on user screen ratio, sets the scale automatically.		    |--
-----------------------------------------------------------------------------------------------
function Sui_ResDetect()
	local resolution = ({GetScreenResolutions()})[GetCurrentResolution()]
	local _, _, x, y = string.find(resolution, "(%d+)x(%d+)")
	local ratio = tonumber(x) / tonumber(y)
-- For Standard 16:9 Screens (1920 x 1080 etc.)
	if ratio < 1.8 and GetCVar("useUiScale") == "1" then
		SetCVar("uiScale", "0.74")
		suiData.scale = .80
	elseif ratio < 1.8 and GetCVar("useUiScale") == "0" then
		suiData.scale = .70
-- for Ultrawide 21:9 Screens (2560 x 1080 etc.)
	elseif ratio < 2.38 and GetCVar("useUiScale") == "1" then
		SetCVar("uiScale", "0.84")
		suiData.scale = .90
	elseif ratio < 2.38 and GetCVar("useUiScale") == "0" then
		suiData.scale = .80
-- for 2K Ultrawide 21:9 Screens (3440 x 1440 etc.)
	elseif ratio > 2.38 and GetCVar("useUiScale") == "1" then
		SetCVar("uiScale", "0.70")
		suiData.scale = .80
	elseif ratio > 2.38 and GetCVar("useUiScale") == "0" then
		suiData.scale = .70
	end
	SpartanUI:SetScale(suiData.scale)
	DEFAULT_CHAT_FRAME:AddMessage("SpartanUI Autores Setting - uiScale: "..GetCVar("uiScale").." | suiScale: "..suiData.scale, 0.65, 0.65, 0.65)
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	For simple warning messages.						    |--
-----------------------------------------------------------------------------------------------
function Sui_MessageFlasher(message, flash, fade)
	local f = CreateFrame("Frame", "SUI_MessageFlasher", UIParent)
	f:SetWidth(500)
	f:SetHeight(125)
	f:SetFrameStrata("HIGH")
	f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	local t = f:CreateTexture(nil, "ARTWORK")
	t:SetTexture(0,0,0, 0.80)
	t:SetAllPoints(f)
	local s = f:CreateFontString("SUI_MessageFlasher_String","OVERLAY")
	s:SetPoint("CENTER", f, "CENTER")
	s:SetFontObject(SUI_FontTitle16)
	s:SetText(message)
	if flash then
		UIFrameFlash(f, 0.25, .25, -1, true, 0, 4)
	end
	if fade then
		UIFrameFlash(f, 0, 5, 10, false, 0, 5)
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Events Handlers								    |--
-----------------------------------------------------------------------------------------------
function Sui_OnEvent(event)
	if event == "ADDON_LOADED" then
		if arg1 == "Blizzard_BindingUI" then
			local i = 1
			while getglobal("KeyBindingFrameBinding"..i.."Description") do
				getglobal("KeyBindingFrameBinding"..i.."Description"):SetTextColor(1, .65, 0)
				getglobal("KeyBindingFrameBinding"..i.."Description"):SetFontObject(SUI_Multilingual)
				i = i + 1
			end
		end
	elseif event == "CHAT_MSG_ADDON" then
		if arg1 == "SUI" then
			local _, _, task, caller, subject, value = string.find(arg2, "(%a+) (%a+) (%a+) (.+)")
			if task == "find" then
				if subject == "spec" then
					local _, _, task, caller, subject, value, ttspec = string.find(arg2, "^(%a+) (%a+) (%a+) (.+) (%a+) $")
					if (UnitName("player") == ttspec) and (suiData.broadcastToggle == "on") then
						Sui_FindSpecInfo(UnitName("player"), caller, ttspec)
					end
				elseif subject == "version" then
					if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
						SendAddonMessage("SUI", "deliver "..UnitName("player").." "..subject.." "..SUI_currentVersion, "PARTY", caller)
					end
				elseif subject == "performance" then
					if (GetNumPartyMembers() <= 1 ) and (suiData.broadcastToggle == "on") then
						local fps, timestamp = math.floor(GetFramerate()), suiData.AFKTimestamp
						local down, up, lag = GetNetStats()
						if suiData.AFKTimestampStart > suiData.AFKTimestampStop then
							btime = GetTime() - suiData.AFKTimestampStart
							timestamp = date("%M:%S", btime)
							suiData.AFKTimestamp = "Was AFK for: "..timestamp
						elseif not timestamp then
							timestamp = "Zero"
						end
						SendAddonMessage("SUI", "deliver "..UnitName("player").." "..subject.." "..lag.."||"..fps.."||"..timestamp, "PARTY")
					end
				elseif subject == "petname" then
					if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
						SUI_Pet_Name:SetText(UnitName("pet"))
						if UnitName("pet") == UNKNOWNOBJECT then
							SendAddonMessage("SUI", "find "..UnitName("player").." petname".." ".."unknown", "PARTY", UnitName("player"))
						end
					end
				end
				elseif task == "deliver" then
					if subject == "spec" then
						local _, _, task, caller, subject, value, ttspec = string.find(arg2, "(%a+) (%a+) (%a+) (.+) (%a+)")
						if (not UnitIsUnit("target", "player")) and (UnitName("target") == ttspec) and (suiData.broadcastToggle == "on") then
							Sui_DeliverSpecInfo(value)
						end
				elseif (subject == "version") then
					if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
						DEFAULT_CHAT_FRAME:AddMessage(caller ..": ".. value, 0.65, 0.65, 0.65)
					end
				elseif subject == "performance" then
					local _, _, lag, fps, timestamp = string.find(arg2, "(%d+)||(%d+)||(.+)")
					if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
						if tonumber(timestamp) then
							timestamp = SecondsToTime((tonumber(timestamp)))
						end
					end
					DEFAULT_CHAT_FRAME:AddMessage(caller.." system stats: Lag: "..lag.."ms | FPS:"..fps.." | "..timestamp.." Min:Sec", 0.65, 0.65, 0.65)
				elseif subject == "AFK" then
					local toonID
					for v = 3, 6, 1 do
						if UnitName(suiData.unit[v].unit) == caller then
							caller = suiData.unit[v].unit
							if UnitIsUnit(suiData.unit[v].unit, caller) then
								toonID = v
								if value == "true" then
									Sui_Unit_UpdateAFK_Subtask(suiData.unit[toonID].unit, toonID, "true")
								elseif value == "false" then
									Sui_Unit_UpdateAFK_Subtask(suiData.unit[toonID].unit, toonID, "false")
								end
								break
							end
						end
					end
				elseif subject == "ReadyCheck" then
					if value ~= "resetall" then
						local toonID
						for v = 3, 6, 1 do
							if UnitName(suiData.unit[v].unit) == caller then
								caller = suiData.unit[v].unit
								if UnitIsUnit(suiData.unit[v].unit, caller) then
									toonID = v
									if value == "maybe" then
										Sui_Unit_UpdateReadyCheck_Subtask(suiData.unit[toonID].unit, toonID, "maybe")
									elseif value == "yes" then
										Sui_Unit_UpdateReadyCheck_Subtask(suiData.unit[toonID].unit, toonID, "yes")
									elseif value == "no" then
										Sui_Unit_UpdateReadyCheck_Subtask(suiData.unit[toonID].unit, toonID, "no")
									elseif value == "reset" then
										Sui_Unit_UpdateReadyCheck_Subtask(suiData.unit[toonID].unit, toonID, "reset")
									end
									break
								end
							end
						end
					elseif value == "resetall" then
						Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "reset")
						Sui_Unit_UpdateReadyCheck_Subtask(1, 3, "reset")
						Sui_Unit_UpdateReadyCheck_Subtask(1, 4, "reset")
						Sui_Unit_UpdateReadyCheck_Subtask(1, 5, "reset")
						Sui_Unit_UpdateReadyCheck_Subtask(1, 6, "reset")
					end
				end
			end
		end
	elseif event == "CHAT_MSG_COMBAT_FACTION_CHANGE" then
		local _, _, faction, change = string.find(arg1, "Your (.+) reputation has (.+) by ")
		suiData.currentFaction = faction
		if change ~= "increased" then
			suiData.currentFaction = suiData.currentFaction.." "..(change or "unknown")
		end
		if (GetWatchedFactionInfo()) ~= suiData.currentFaction then
			for factionIndex = 1, GetNumFactions() do
				local name, description, standingId, bottomValue, topValue, earnedValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, isWatched = GetFactionInfo(factionIndex)
				suiData.factionDescription = description
				suiData.factionIndex = factionIndex
				if name == (suiData.currentFaction or "none") then
					SetWatchedFactionIndex(factionIndex)
					Sui_RepBar()
				end
			end
		end
	elseif event == "CHAT_MSG_COMBAT_XP_GAIN" then
		local _, _, name, xp = string.find(arg1, "(.+) dies, you gain (%d+) experience.")
		SUI_mobXP = xp
		if name ~= "You" then
			SUI_mobLast = name
		end
	elseif event == "CHAT_MSG_SYSTEM" then
		-- Handles AFK status
		if arg1 == "You are now AFK: Away from Keyboard" then
			SetCVar("autoClearAFK", "1")
			suiData.AFKTimestampStart = GetTime()
			if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
				SendAddonMessage("SUI", "deliver "..UnitName("player").." AFK true", "PARTY")
			end
			Sui_SpinCam("on")
			Sui_Unit_UpdateAFK_Subtask(1, 1, "true")
		elseif arg1 == "You are no longer AFK." then
			SetCVar("autoClearAFK", "1")
			suiData.AFKTimestampStop = GetTime()
			if (UnitInParty("player")) and (suiData.broadcastToggle == "on") then
				SendAddonMessage("SUI", "deliver "..UnitName("player").." AFK false", "PARTY")
			end
			Sui_SpinCam("off")
			Sui_Unit_UpdateAFK_Subtask(1, 1, "false")
		end
		-- Handles RAID Ready Check finished
		if arg1 == "No players are AFK" then
			SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck resetall", "RAID")
		end
	elseif event == "UNIT_INVENTORY_CHANGED" then
		if suiData.buffToggle == "on" then
			if arg1 == (UnitName("player")) then
				if TemporaryEnchantFrame then
					TemporaryEnchantFrame:Hide()
					TemporaryEnchantFrame:SetAlpha(0)
				end
				Sui_BuffScan("player", 1)
			elseif arg2 == "ENCHANT_REMOVED" and arg7 == (UnitName("player")) then
				Sui_BuffScan("player", 1)
			end
		end
	elseif event == "UNIT_AURA" then
		if suiData.buffToggle == "on" then
			Sui_BuffScan(arg1)
		end
	elseif event == "UNIT_LEVEL" then
		local toonID = Sui_DeriveUnit(arg1, "number", 8)
		if not toonID then
			return
		end
		if getglobal(suiData.unit[toonID].frame.."_Level") then
			getglobal(suiData.unit[toonID].frame.."_Level"):SetText(UnitLevel(arg1))
		end
		if arg1 == "player" then
			SUI_XP_CurrentLevel:SetText("Level: "..UnitLevel("player"))
		end
	elseif event == "UNIT_HEALTH" or event == "UNIT_MANA" or event == "UNIT_RAGE" or event == "UNIT_ENERGY" then
		Sui_SetupMembers(arg1, "update")
		if UnitExists("targettarget") then
			Sui_SetupMembers("targettarget", "update")
		end
	elseif event == "UNIT_FOCUS" then
		if UnitIsUnit("target", "pet") then
			Sui_SetupMembers("target", "update")
		end
		if UnitIsUnit("targettarget", "pet") then
			Sui_SetupMembers("targettarget", "update")
		end
		Sui_SetupMembers("pet", "update")
		Sui_Pet_UpdateHappiness()
		if suiData.buffToggle == "on" then
			Sui_BuffScan("pet")
		end
	elseif event == "UNIT_PET" then
		if SUI_Pet_Name:GetText() == "Unknown" then
			SUI_Pet_Name:SetText(UnitName("pet"))
		end
		Sui_SetupMembers("pet","setup")
		Sui_Pet_UpdateHappiness()
		if suiData.buffToggle == "on" then
			Sui_BuffScan("pet")
		end
	elseif event == "UNIT_PORTRAIT_UPDATE" then
		local toonID = Sui_DeriveUnit(arg1, "number", 8)
		if not toonID then
			return
		end
		if getglobal(suiData.unit[toonID].frame.."_Portrait") then
			SetPortraitTexture(getglobal(suiData.unit[toonID].frame.."_Portrait"), arg1)
		end
		if arg1 == "player" then
			SetPortraitTexture(SUI_XP_Portrait, "player")
		elseif arg1 == "target" and UnitExists("targettarget") then
			SetPortraitTexture(SUI_TOT_Portrait,"targettarget")
		end
	elseif event == "UPDATE_FACTION" then
		Sui_RepBar()
	elseif event == "UNIT_FACTION" then
		if ( arg1 == "player" ) then
			Sui_Unit_Update(arg1)
		end
	elseif event == "UNIT_HAPPINESS" then
		Sui_Pet_UpdateHappiness()
	elseif event == "PLAYER_AURAS_CHANGED" then
		if suiData.buffToggle == "on" then
			Sui_BuffScan(arg1)
		end
	elseif event == "PARTY_MEMBERS_CHANGED" or event == "PARTY_LEADER_CHANGED" then
		Sui_SetupMembers("all", "setup")
		if not UnitExists("target") then
			SUI_TargetFrame:Hide()
		end
		Sui_UpdatePartyVisibility()
		Sui_Unit_Update()
		if suiData.buffToggle == "on" then
			Sui_BuffScan("party1")
		end
	elseif event == "PARTY_LOOT_METHOD_CHANGED" then
		Sui_Unit_Update()
	elseif event == "PLAYER_ALIVE" then
		Sui_Unit_Update()
		if suiData.buffToggle == "on" then
			Sui_BuffScan(arg1)
		end
	elseif event == "PLAYER_COMBO_POINTS" then
		Sui_UpdateComboPoints()
	elseif event == "PLAYER_DEAD" then
		if godmode == 1 then
			DEFAULT_CHAT_FRAME:AddMessage("Gee, I guess that feature isn't working yet. :(", 0.5, 0.5, 0.5)
			DEFAULT_CHAT_FRAME:AddMessage("Exiting God Mode.", 1, 0, 0)
			godmode=0
		end
		Sui_Unit_Update()
	elseif event == "PLAYER_ENTER_COMBAT" then
		Sui_Unit_Update()
		Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "reset")
		if (UnitInRaid("player")) and (suiData.broadcastToggle == "on") then
			SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck reset", "PARTY")
		end
	elseif event == "PLAYER_LEAVE_COMBAT" then
		Sui_Unit_Update()
	elseif event == "PLAYER_FLAGS_CHANGED" then
	elseif event == "PLAYER_FOCUS_CHANGED" then
		Sui_FocusUpdate()
	elseif event == "PLAYER_ENTERING_WORLD" then
		Sui_Bartender()
		Sui_SetupMembers("all", "setup")
		Sui_XPBar()
		Sui_Unit_Update()
		MultiBarBottomLeft:Hide()
		MultiBarBottomRight:Hide()
		MultiBarLeft:Hide()
		MultiBarRight:Hide()
		local inInstance, instanceType = IsInInstance()
		if inInstance == 1 then
			SUI_MinimapCoords:Hide()
		elseif not inInstance then
			SUI_MinimapCoords:Show()
			SetMapToCurrentZone()
		end
		FramerateLabel:ClearAllPoints()
		FramerateLabel:SetPoint("CENTER", "WorldFrame", "BOTTOM", -15, 125)
		FramerateLabel:SetFontObject(SUI_FontLevel)
		FramerateText:SetFontObject(SUI_FontLevel)
		if suiData.buffToggle == "on" then
			Sui_BuffScan(arg1)
		end
		Sui_ManageFrames()
		Sui_Bags()
		Sui_BarFix()
		-- Fix for CT_BarMod
		if IsAddOnLoaded("CT_BarMod") == 1 then
			local i = 1
			while i <= 120 do
				local frame = getglobal("CT_BarModActionButton"..i)
				if frame then
					frame:Hide()
				end
				i = i + 1
			end
			Sui_MessageFlasher("CT_BarMod cannot be used with SpartanUI.", false, true)
		end
		-- Fix for Titan
		if IsAddOnLoaded("Titan") == 1 then
			local unitServer = UnitName("player").."@"..GetRealmName()
			if SUI_Titan then
				TitanSettings.Players[unitServer].Panel.MinimapAdjust = 1
			else
				SUI_Titan = true
				Sui_MessageFlasher("Please reload or relog to fix the minimap icons.", true)
			end
		end
		suiData.AFKTimestampStart = 1
		suiData.AFKTimestampStop = 1
		-- Added redundant fix for zone/instance issue here in case zone is ready before loading UI is complete.
		Bartender:EnableAllBars()
	elseif event == "PLAYER_LEAVING_WORLD" then
		SetCVar("cameraYawMoveSpeed","230")
		MoveViewRightStop()
		suiData.AFKTimestampStart = 1
		suiData.AFKTimestampStop = 1
	elseif event == "PLAYER_REGEN_DISABLED" then
		Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "reset")
		if (UnitInRaid("player")) and (suiData.broadcastToggle == "on") then
			SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck reset", "PARTY")
		end
		Sui_Unit_Update()
	elseif event == "PLAYER_REGEN_ENABLED" then
		Sui_Unit_Update()
	elseif event == "PLAYER_TARGET_CHANGED" then
		suiData.lastTarget = suiData.newTarget or 0					-- on your first target, your last target will be nil
		suiData.newTarget = UnitExists("target") or 0					-- when a mob dies, your new target will be nil
		suiData.lastTarget_checked = 0
		if suiData.buffToggle == "on" then
			Sui_BuffScan("target")
		end
		SUI_MouseTooltip_Text:SetText("Not available.")
		if not UnitAffectingCombat("target") then
			SUI_Target:Hide()
		end
		Sui_SetupMembers("target", "setup")
		if UnitExists("targettarget") then
			Sui_SetupMembers("targettarget", "setup")
		else
			SUI_TOT:Hide()
		end
		Sui_Unit_Update()
		Sui_UpdateComboPoints()
		if not UnitIsPlayer("target") then
			Sui_MobInfo()
		end
	elseif event == "PLAYER_UPDATE_RESTING" then
		Sui_Unit_Update()
	elseif event == "PLAYER_XP_UPDATE" then
		Sui_XPBar()
	elseif event == "QUEST_LOG_UPDATE" then
	elseif event == "RAID_ROSTER_UPDATE" then
		Sui_UpdatePartyVisibility()
		if suiData.buffToggle == "on" then
			Sui_BuffScan(arg1)
		end
	elseif event == "RAID_TARGET_UPDATE" then
		Sui_RaidIcon()
	elseif event == "READY_CHECK" then
		Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "maybe")
		if (UnitInRaid("player")) and (suiData.broadcastToggle == "on") then
			SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck maybe", "PARTY")
		end
	elseif event == "READY_CHECK_CONFIRM" then
		-- these are here in case player is playing on a server where these events fire
		Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "yes")
		if (UnitInRaid("player")) and (suiData.broadcastToggle == "on") then
			SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck yes", "PARTY")
		end
	elseif event == "READY_CHECK_FINISHED" then
		-- these are here in case player is playing on a server where these events fire
		Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "reset")
		if (UnitInRaid("player")) and (suiData.broadcastToggle == "on") then
			SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck reset", "PARTY")
		end
	elseif event == "TIME_PLAYED_MSG" then
		if not suiData.xpSetup then
			suiData.totalTime, suiData.currentTime = arg1, arg2
			ChatFrame1:RegisterEvent("TIME_PLAYED_MSG")
			suiData.xpSetup = true
			Sui_XPBar()
		end
	elseif event == "UPDATE_SHAPESHIFT_FORMS" then
		Sui_BarFix()
	elseif event == "SPELLCAST_START" then							-- cast start
		CastingBarFrame:Hide()
		-- ARG1: spell name
		-- ARG2: spell cast time (ms)
		Sui_InitCastMath("player", arg1, arg2, "isCasting", 1)
	elseif ( event == "SPELLCAST_STOP" or event == "SPELLCAST_CHANNEL_STOP" ) then		-- cast stop
		Sui_InitCastMath("player", _, _, "isCasting", 0)
		Sui_InitCastMath("player", _, _, "isChanneling", 0)
	elseif event == "SPELLCAST_CHANNEL_START" then						-- channel start
		CastingBarFrame:Hide()
		-- ARG1: spell cast time (ms)
		-- ARG2: spell name
		Sui_InitCastMath("player", arg2, arg1, "isChanneling", 1)
	elseif ( event == "SPELLCAST_FAILED" or event == "SPELLCAST_INTERRUPTED" ) then		-- spell not ready
		Sui_InitCastMath("player", _, _, "isCasting", 0)
		Sui_InitCastMath("player", _, _, "isChanneling", 0)
	elseif event == "SPELLCAST_DELAYED" then						-- a real interruption (but for casts only)
		-- ARG1: spell cast time delay(ms)
		if arg1 == 0 then return end
		Sui_InitCastMath("player", _, _, "isCasting", 1, arg1)
		suiData.unit[1].spellEnd = suiData.unit[1].spellEnd + (arg1/1000)
		suiData.unit[1].spellDuration = suiData.unit[1].spellDuration + (arg1/1000)
	elseif event == "SPELLCAST_CHANNEL_UPDATE" then						-- a real interruption (but for channel only)
		-- ARG1: spell cast time (ms)
		if arg1 == 0 then return end
		Sui_InitCastMath("player", _, _, "isChanneling", 1, arg1)
		suiData.unit[1].spellEnd = suiData.unit[1].spellEnd + (arg1/1000)
		suiData.unit[1].spellDuration = suiData.unit[1].spellDuration + (arg1/1000)
	elseif event == "VARIABLES_LOADED" then
		if not suiData then
			Sui_InitializeVariables(false)
		end
		if not suiData.dbVersion then
			Sui_InitializeVariables(false)
		elseif suiData.dbVersion < 0.8 then
			Sui_InitializeVariables(false)
		elseif suiData.dbVersion < SUI_currentVersion or SUI_devmode==true then
			Sui_InitializeVariables(true)
		end
		Sui_InitializeLanguages()
		Sui_Setup()
	elseif event == "VOICE_START" or event == "VOICE_PUSH_TO_TALK_START" then
		local toonID = Sui_DeriveUnit(arg1, "number", 6)
		if not toonID then
			toonID=1
		end
		getglobal(suiData.unit[toonID].frame.."_VoiceIcon"):Show()
	elseif event == "VOICE_STOP" or event == "VOICE_PUSH_TO_TALK_STOP" then
		local toonID = Sui_DeriveUnit(msg, "number", 6)
		if not toonID then
			toonID=1
		end
		getglobal(suiData.unit[toonID].frame.."_VoiceIcon"):Hide()
	elseif event == "ZONE_CHANGED" then
		local inInstance, instanceType = IsInInstance()
		if inInstance == 1 then
			SUI_MinimapCoords:Hide()
		elseif not inInstance then
			SUI_MinimapCoords:Show()
			SetMapToCurrentZone()
		end
	end
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Offsets the HUD to compensate for FuBar/Titan panels.			    |--
-----------------------------------------------------------------------------------------------
function SUI_PanelOffSet()
	local offset = 0
	if suiData.fubar1 == true then
		offset = offset + FuBarFrame1:GetHeight()
	end
	if suiData.fubar2 == true then
		offset = offset + FuBarFrame2:GetHeight()
	end
	if suiData.titan1 == true then
		offset = offset + TitanPanelBarButton:GetHeight()
	end
	if suiData.titan2 == true then
		offset = offset + TitanPanelAuxBarButton:GetHeight()
	end
	SpartanUI:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, offset)
	SpartanUI:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, offset)
end
-----------------------------------------------------------------------------------------------
--|  Purpose:	Time delineated operations.  Split in 1, 12.5, and 32 FPS sections.	    |--
-----------------------------------------------------------------------------------------------
function Sui_OnUpdate(arg1)
	Sui_ManageFrames()
	Sui_Bags()
	if suiData then
		suiData.GeneralInterval = suiData.GeneralInterval + arg1
		suiData.FrequentInterval = suiData.FrequentInterval + arg1
		suiData.AnimationInterval = suiData.AnimationInterval + arg1
		suiData.FastInterval = suiData.FastInterval + arg1
		if (suiData.GeneralInterval > suiData.UpdateInterval) then			-- 1FPS
			suiData.GeneralInterval = 0
			if suiData.tooltipUpdate == true then
				Sui_BuffTooltip_Enter()
			end
			if SUI_Pet_Name:GetText() == "Unknown" then
				SUI_Pet_Name:SetText(UnitName("pet"))
			end
			if IsAddOnLoaded("FuBar") == 1 or IsAddOnLoaded("Titan") == 1 then
				if FuBarFrame1 then
					if FuBarFrame1:GetPoint() == "BOTTOMLEFT" and FuBarFrame1:IsVisible() then
						suiData.fubar1 = true
					else
						suiData.fubar1 = false
					end
					if FuBarFrame2 then
						if FuBarFrame2:GetPoint() == "BOTTOMLEFT" and FuBarFrame2:IsVisible() then
							suiData.fubar2 = true
						else
							suiData.fubar2 = false
						end
					end
				end
				if TitanPanelBarButton then
					if TitanPanelBarButton:GetPoint() == "TOPRIGHT" and TitanPanelBarButton:IsVisible() then
						suiData.titan1 = true
					else
						suiData.titan1 = false
					end
				end
				if TitanPanelAuxBarButton then
					local point, relativeTo, relativePoint, xOfs, yOfs = TitanPanelAuxBarButton:GetPoint()
					if point == "TOPRIGHT" and yOfs > 0 then
						suiData.titan2 = true
					else
						suiData.titan2 = false
					end
				end
				SUI_PanelOffSet()
			end
			--|  Minimap Coords  |--
			local posX, posY = GetPlayerMapPosition("player")
			posX = (math.floor(posX * 1000)) * .1
			posY = (math.floor(posY * 1000)) * .1
			if posX == 0 and posY == 0 then
				local inInstance, instanceType = IsInInstance()
				if not inInstance and not WorldMapFrame:IsVisible() then
					SetMapToCurrentZone()
				end
			end
			SUI_MinimapCoords:SetText(posX.." | "..posY)
			if not SUI_FirstLoad then
				if suiData.FrameAdvance > 1 then
					Sui_BarFix()
					SUI_FirstLoad=0
				end
			end
			if MouseIsOver(ChatFrame1) == 1 or MouseIsOver(ChatFrame2) == 1 or MouseIsOver(ChatFrame3) == 1
			or MouseIsOver(ChatFrame4) == 1 or MouseIsOver(ChatFrame5) == 1 or MouseIsOver(ChatFrame6) == 1
			or MouseIsOver(ChatFrame7) == 1 then
				Sui_ChatFrame("show")
			else
				Sui_ChatFrame("hide")
			end
		end
		if (suiData.FrequentInterval > suiData.UpdateInterval*0.36) then		-- around 3FPS
			suiData.FrequentInterval = 0
			if UnitExists("targettarget") then
				Sui_SetupMembers("targettarget", "setup")
			else
				SUI_TOTFrame:Hide()
				SUI_TOT:Hide()
			end
		end
		if (suiData.AnimationInterval > (suiData.UpdateInterval*0.08)) then		-- 12.5 FPS
			suiData.AnimationInterval = 0
			suiData.FrameAdvance = suiData.FrameAdvance + 1
			local i = 1
			while i <= 8 do
				if getglobal(suiData.unit[i].frame):IsVisible() then
					Sui_Animation(suiData.unit[i].unit, "Health", suiData.unit[i].frame.."_HealthBar", suiData.unit[i].healthbar_width, suiData.unit[i].healthbar_height, suiData.unit[i].direction, 3, i)
					Sui_Animation(suiData.unit[i].unit, "Power", suiData.unit[i].frame, suiData.unit[i].powerbar_width, suiData.unit[i].powerbar_height, suiData.unit[i].direction, 3, i)
				end
				i = i + 1
			end
			if (suiData.FrameAdvance < 5) then
				SUI_XP_Increase:Show()
				Sui_XPIncrease()
			elseif (suiData.FrameAdvance > 5) then
				SUI_XP_Increase:Hide()
			end
			if suiData.popUps == "on" then
				if MouseIsOver(SUI_PopLeft_Hit, 0, 0, 0, 0) == 1 then
					SUI_BarPoppupLeft_Top:Hide()
					SUI_PopLeft_Hit:Hide()
				elseif MouseIsOver(SUI_PopRight_Hit, 0, 0, 0, 0) == 1 then
					SUI_BarPoppupRight_Top:Hide()
					SUI_PopRight_Hit:Hide()
				else
					SUI_BarPoppupLeft_Top:Show()
					SUI_PopLeft_Hit:Show()
					SUI_BarPoppupRight_Top:Show()
					SUI_PopRight_Hit:Show()
				end
			elseif suiData.popUps == "off" then
				SUI_BarPoppupLeft_Top:Hide()
				SUI_PopLeft_Hit:Hide()
				SUI_BarPoppupRight_Top:Hide()
				SUI_PopRight_Hit:Hide()
			end
		end
		--|  CastBar animation  |--
		if (suiData.FastInterval > (suiData.UpdateInterval/32)) then			-- 32 FPS
			if SUI_MouseTooltip:IsVisible() then
				local x, y = GetCursorPosition()
				local realScale = (UIParent:GetEffectiveScale())*(suiData.scale)
				SUI_MouseTooltip:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", x/realScale-6, y/realScale+20)
			end
			if (UnitInRaid("raid1")) and ReadyCheckFrame:IsVisible() == 1 then
				if MouseIsOver(ReadyCheckFrameYesButton) == 1 then
					Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "yes")
					if suiData.broadcastToggle == "on" then
						SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck yes", "PARTY")
					end
				elseif MouseIsOver(ReadyCheckFrameNoButton) == 1 then
					Sui_Unit_UpdateReadyCheck_Subtask(1, 1, "no")
					if suiData.broadcastToggle == "on" then
						SendAddonMessage("SUI", "deliver "..UnitName("player").." ReadyCheck no", "PARTY")
					end
				end
			end
			local i = 1
			while i <= 8 do
				if suiData.unit[i].isCasting == 1 or suiData.unit[i].isChanneling == 1 then
					Sui_Animation(suiData.unit[i].unit, "Cast", suiData.unit[i].frame .. "_CastBar", suiData.unit[i].castbar_width, suiData.unit[i].castbar_height, suiData.unit[i].direction, 1, i)
				end
				i = i + 1
			end
			suiData.FastInterval = 0
		end
	end
end
