-----------------------------------------------------------------------------------------------
--| ADAPT: Almost-Default Animated Portraits 1.5					    |--
--|											    |--
--| This small mod is an animated unit frames for (nearly) any UI.			    |--
--|											    |--
--| When a mod requests a portrait to be drawn, this mod intercepts			    |--
--| the request and instead draws a model to the dimensions of the			    |--
--| intended texture, dynamically creating the model if one didn't			    |--
--| exist for that texture yet.								    |--
--|											    |--
--| Slash commands:									    |--
--|	/adapt circle : shapes portraits as if in a circle border			    |--
--|	/adapt square : shapes portraits as if in a square border			    |--
--|	/adapt back : toggles the background on/off					    |--
--|	/adapt refresh : refreshes portraits						    |--
--|	/adapt unanimate frame : stops animating a frame on next login			    |--
--|	/adapt animate frame : animates a frame on next login				    |--
--|	/adapt list : list frames not animated and known frames				    |--
--|											    |--
--| 1.5, 8/21/06, changed DressUpModel to PlayerModel, moved SetCamera OnUpdate to OnShow   |--
--| 1.4, 6/22/06, disabled mouse on portraits, added known frames to /adapt list	    |--
--| 1.3, 6/11/06, /adapt animate/unanimate options, visibility fix by Lafiell,		    |--
--|		  attempt at more flexibility with frameStrata				    |--
-----------------------------------------------------------------------------------------------


local _G = getfenv(0)

Adapt = {
	Version = 1.5, -- version
	Textures = {}, -- table of textures models are replacing
	Frequency = .25, -- time (in seconds) between camera refresh
	xOffset = 0, -- x offset of model
	yOffset = 0, -- y offset of model
	StrataByIndex = { "PARENT", "BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG", "TOOLTIP"}, -- for strata guessing
				-- OLD: "BACKGROUND","LOW","MEDIUM","HIGH","TOOLTIP" }, -- for strata guessing
	StrataByName = { ["PARENT"]=1, ["BACKGROUND"]=2, ["LOW"]=3, ["MEDIUM"]=4, ["HIGH"]=5, ["DIALOG"]=6, ["FULLSCREEN"]=7, ["FULLSCREEN_DIALOG"]=8, ["TOOLTIP"]=9 }
				-- OLD: ["BACKGROUND"]=1, ["LOW"]=2, ["MEDIUM"]=3, ["HIGH"]=4, ["TOOLTIP"]=5
}

-----------------------------------------------------------------------------------------------
--| SavedVariables									    |--
-----------------------------------------------------------------------------------------------
function Adapt.CreateDefaults()
	Adapt_Settings = {
		Shape = "CIRCLE",	-- "CIRCLE" or "SQUARE" stretched to whole texture or shrunk within
		Backdrop = "ON",		-- "ON" or "OFF" whether background shows

	Use = {
		["SUI_Self_Portrait"] = 1,
		["SUI_Target_Portrait"] = 1,
		["SUI_Party1_Portrait"] = 1,
		["SUI_Party2_Portrait"] = 1,
		["SUI_Party3_Portrait"] = 1,
		["SUI_Party4_Portrait"] = 1,
		},
	DontUse = {
		["SUI_XP_Portrait"] = 1,
		["SUI_TOT_Portrait"] = 1,
		},
	}
end
Adapt.CreateDefaults()

-----------------------------------------------------------------------------------------------
--| Hooked SetPortraitTexture: display model if UnitIsVisible otherwise display old texture |--
-----------------------------------------------------------------------------------------------
function Adapt.newSetPortraitTexture(texture,unit)

	local swapHappened = nil -- whether a texture was swapped with a model

	if texture and texture.GetLeft then

		local textureName = texture:GetName()
		local xpos = texture:GetLeft()
		local ypos = texture:GetTop()

		if textureName and xpos and ypos and UnitExists(unit) and Adapt_Settings.Use[textureName] and not Adapt_Settings.DontUse[textureName] then

			if(UnitIsVisible(unit)) then
				local width=texture:GetRight()-xpos
				local height=ypos-texture:GetBottom()
				if width>24 and height>24 then

					if not Adapt.Textures[textureName] then
						Adapt.CreateModel(texture)
					end
					local m = Adapt.Textures[textureName].modelLayer
					-- m = CharacterModelFrame
					m:SetUnit(unit)
					m:SetCamera(0)
					-- added line to fix certain portraits faces being cut off due to distance
					m:SetModelScale(1.2)

					_,Adapt.Textures[textureName].class = UnitClass(unit)
					Adapt.ColorBackground(textureName,Adapt.Textures[textureName].class)
					texture:Hide()

					Adapt.Textures[textureName]:Show()

					-- Show the Model for the case, it was show by the code below - By Lafiell
					m:Show()

					swapHappened = 1
				end

			else
				-- Unit not in Sight - By Lafiell
				if (textureName and Adapt.Textures[textureName]) then
					Adapt.Textures[textureName].modelLayer:Hide()
				end
			end

		end
	end

	if not swapHappened then
        if CraftFrame:IsVisible() then return end
		Adapt.oldSetPortraitTexture(texture,unit)
		texture:Show()
		if textureName and Adapt.Textures[textureName] then
			Adapt.Textures[textureName]:Hide()
		end
	end

end
-----------------------------------------------------------------------------------------------
--| Creates the model as the function name implies					    |--
-----------------------------------------------------------------------------------------------
function Adapt.CreateModel(texture)
	local textureName = texture:GetName()
	local width = texture:GetWidth()
	local height = texture:GetHeight()
	if texture.GetParent and texture:GetParent().GetFrameStrata and texture:GetParent():GetFrameStrata()=="BACKGROUND" then
		texture:GetParent():SetFrameStrata("LOW")
	end
	local modelName = textureName.."Model"
	Adapt.Textures[textureName] = CreateFrame("Button",modelName,texture:GetParent())
	local frame = Adapt.Textures[textureName]
	frame:EnableMouse(1)
	frame:SetWidth(width)
	frame:SetHeight(height)
	frame.width = width
	frame.height = height
	frame:SetPoint("CENTER",texture,"CENTER",0,0)
	local strata
	if texture.GetParent then
		strata = Adapt.StrataByIndex[(Adapt.StrataByName[texture:GetParent():GetFrameStrata() or ""] or 1)-1]
	end
	frame:SetFrameStrata(strata or "BACKGROUND")
	frame.backLayer = frame:CreateTexture(modelName.."Back","BACKGROUND")
	frame.backLayer:SetTexture("Interface\\AddOns\\SpartanUI\\Modules\\Adapt\\Adapt-ModelBack")
	frame.backLayer:SetWidth(width)
	frame.backLayer:SetHeight(height)
	frame.backLayer:SetPoint("CENTER",frame,"CENTER",0,0)
	if Adapt_Settings.Backdrop=="OFF" then
		frame.backLayer:Hide()
	end
	frame.modelLayer = CreateFrame("PlayerModel",modelName.."Model",texture:GetParent())
	frame.modelLayer:SetPoint("CENTER",frame,"CENTER",0,0)
	frame.modelLayer:SetFrameLevel(1)
	frame.modelLayer:SetScript("OnShow",function() this:SetCamera(0) end)
	Adapt.Shape(textureName)
	frame.modelLayer.timer = 0
end

function Adapt.OnLoad(arg1)
	Adapt.oldSetPortraitTexture = SetPortraitTexture
	SetPortraitTexture = Adapt.newSetPortraitTexture
	SlashCmdList["ADAPT"] = Adapt.SlashHandler
	SLASH_ADAPT1 = "/adapt"
	this:RegisterEvent("PLAYER_LOGIN")
end

function Adapt.OnEvent(arg1)
	if not Adapt_Settings.Use then
		Adapt_Settings.Use = {
		["SUI_Self_Portrait"] = 1,
		["SUI_Target_Portrait"] = 1,
		["SUI_Party1_Portrait"] = 1,
		["SUI_Party2_Portrait"] = 1,
		["SUI_Party3_Portrait"] = 1,
		["SUI_Party4_Portrait"] = 1,
		}
	end
	if not Adapt_Settings.DontUse then
		-- default ToT has the perl epilepsy problem of constantly going back to first frame
		Adapt_Settings.DontUse = {
		["SUI_XP_Portrait"] = 1,
		["SUI_TOT_Portrait"] = 1,
		}
	end
end

function Adapt.Status()
	DEFAULT_CHAT_FRAME:AddMessage("|cFF44BBEEAdapt|cFFFFFFFF version:|cFFFFFF00"..Adapt.Version.."|cFFFFFFFF shape:|cFFFFFF00"..tostring(Adapt_Settings.Shape).."|cFFFFFFFF backdrop:|cFFFFFF00"..tostring(Adapt_Settings.Backdrop))
end
-----------------------------------------------------------------------------------------------
--| Options/Slash Handler								    |--
-----------------------------------------------------------------------------------------------
function Adapt.SlashHandler(msg)

	local _,_,frame = string.find(msg,"animate (.+)")
	if frame then
		local unanimate = string.find(msg,"unanimate")
		if getglobal(frame) then
			if getglobal(frame).GetTexture then
				Adapt_Settings.DontUse[frame] = unanimate and 1 or nil
				DEFAULT_CHAT_FRAME:AddMessage("Frame \""..frame.."\" will "..(unanimate and "no longer " or "").."be handled by Adapt on next login.")
			else
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFF2222Frame \"|cFFFFFFFF"..frame.."|cFFFF4411\" exists but is not a texture.")
			end
			Adapt.Status()
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFF2222Frame \"|cFFFFFFFF"..frame.."|cFFFF4411\" doesn't exist. Caps correct?")
		end
		return
	end

	msg = string.lower(msg)

	if msg=="square" then
		Adapt_Settings.Shape = "SQUARE"
		Adapt.Reshape()
	elseif msg=="circle" then
		Adapt_Settings.Shape = "CIRCLE"
		Adapt.Reshape()
	elseif msg=="backdrop" then
		--Adapt_Settings.Backdrop = Adapt_Settings.Back=="ON" and "OFF" or "ON"
		--Adapt.Reback()
	elseif msg=="refresh" then
		Adapt.Reshape()
		Adapt.Reback()
	elseif msg=="list" then
		DEFAULT_CHAT_FRAME:AddMessage("|cFF11FF11__ Frames not animated __")
		local count = 0
		for i in Adapt_Settings.Use do
			count = count + 1
			DEFAULT_CHAT_FRAME:AddMessage(i)
		end
		for i in Adapt_Settings.DontUse do
			count = count + 1
			DEFAULT_CHAT_FRAME:AddMessage(i)
		end
		if count==0 then
			DEFAULT_CHAT_FRAME:AddMessage("- None -")
		end
		DEFAULT_CHAT_FRAME:AddMessage("|cFF11FF11__ Known animated frames __")
		count = 0
		for i in Adapt.Textures do
			count = count + 1
			DEFAULT_CHAT_FRAME:AddMessage(i)
		end
		if count==0 then
			DEFAULT_CHAT_FRAME:AddMessage("- None -")
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage("/adapt square : sizes portraits as if in a square")
		DEFAULT_CHAT_FRAME:AddMessage("/adapt circle : sizes portraits as if in a circle")
		DEFAULT_CHAT_FRAME:AddMessage("/adapt backdrop : toggles portrait backgrounds")
		DEFAULT_CHAT_FRAME:AddMessage("/adapt refresh : redraws all portraits")
		DEFAULT_CHAT_FRAME:AddMessage("/adapt unanimate frame : stops animating frame on next login")
		DEFAULT_CHAT_FRAME:AddMessage("/adapt animate frame : animates frame on next login")
		DEFAULT_CHAT_FRAME:AddMessage("/adapt list : list frames not animated and known portrait frames")
	end
	Adapt.Status()
end
-----------------------------------------------------------------------------------------------
--| Color background by raid class color						    |--
-----------------------------------------------------------------------------------------------
function Adapt.ColorBackground(textureName,class)
	local back = Adapt.Textures[textureName].backLayer
	local color = RAID_CLASS_COLORS[class or ""]
	if color then
		back:SetVertexColor(color.r/1.5,color.g/1.5,color.b/1.5,1)
	else
		back:SetVertexColor(5,.5,.5,1)
	end
	if Adapt_Settings.Backdrop=="OFF" then
		back:Hide()
	end
end

-----------------------------------------------------------------------------------------------
--| Sets portrait back ground								    |--
-----------------------------------------------------------------------------------------------
function Adapt.Reback()
	for i in Adapt.Textures do
		if Adapt_Settings.Backdrop=="ON" then
			Adapt.Textures[i].backLayer:Show()
		else
			Adapt.Textures[i].backLayer:Hide()
		end
	end
end
-----------------------------------------------------------------------------------------------
--| Sets texcoords and width/height of all known backgrounds and models			    |--
-----------------------------------------------------------------------------------------------
function Adapt.Reshape()
	for i in Adapt.Textures do
		Adapt.Shape(i)
	end
end
-----------------------------------------------------------------------------------------------
--| Shapes an individual texture (named as a string) to square or circle.		    |--
--| Square is anchored to two corners of the texture					    |--
--| Circle is anchored to the center and shrunk slightly				    |--
-----------------------------------------------------------------------------------------------
function Adapt.Shape(i)
	if not i or type(i)~="string" or not Adapt.Textures[i] then
		return
	end

	local back = Adapt.Textures[i].backLayer
	local model = Adapt.Textures[i].modelLayer
	local texture = getglobal(i)
	if texture then
		width = texture:GetWidth()
		height = texture:GetHeight()
	else
		width = Adapt.Textures[i].width
		height = Adapt.Textures[i].height
	end
	if Adapt_Settings.Shape=="SQUARE" then
		back:SetTexCoord(.2,.8,.2,.8)
		back:ClearAllPoints()
		back:SetPoint("TOPLEFT",i,"TOPLEFT")
		back:SetPoint("BOTTOMRIGHT",i,"BOTTOMRIGHT",0,0)
		model:ClearAllPoints()
		model:SetPoint("TOPLEFT",i,"TOPLEFT")
		model:SetPoint("BOTTOMRIGHT",i,"BOTTOMRIGHT",0,0)
	else
		back:SetTexCoord(0,1,0,1)
		back:ClearAllPoints()
		back:SetPoint("CENTER",i,"CENTER",0,0)
		back:SetWidth(width)
		back:SetHeight(height)
		model:ClearAllPoints()
		model:SetPoint("CENTER",i,"CENTER",Adapt.xOffset,Adapt.yOffset)
		model:SetWidth(width*1)
		model:SetHeight(height*1)
	end
end
