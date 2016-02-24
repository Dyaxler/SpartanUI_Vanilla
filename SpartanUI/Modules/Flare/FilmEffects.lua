--| Purpose: 25ASA Film Grain & Vignette |--
--| Author: Jonathan Woodburn (a.k.a. Ansu) |--
--| eMail: Ansu@SpartanUI.com |--
--| URL: www.SpartanUI.com |--

local _G = getfenv(0)

local f = CreateFrame("Frame", "FilmEffects", WorldFrame)
f:SetScript("OnUpdate", function(this, elapsed) FG_OnUpdate(this, elapsed) end)
f:SetScript("OnEvent", function(this, event) FG_OnEvent(event) end)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetHeight(64)
f:SetWidth(64)
f:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -128, 256)
f:SetFrameStrata("BACKGROUND")

FEDB = {}
FEDB = {
	Interval = 12.5,
	animationInterval = 0,
	record = 1,
	root = "Interface\\AddOns\\SpartanUI\\Modules\\"
}

function FG_OnEvent(arg1, arg2)
	if not FE_Vignette and arg1=="vignette" then
		local t = f:CreateTexture("FE_Vignette", "OVERLAY")
		t:SetAllPoints(UIParent)
		t:SetTexture(FEDB.root.."Flare\\Textures\\vignette")
		t:SetBlendMode("MOD")
		FEDB.vignette = true
	elseif arg1=="vignette" then
		if FE_Vignette:IsVisible() then
			FE_Vignette:Hide()
			FEDB.vignette = nil
		else
			FE_Vignette:Show()
			FEDB.vignette = true
		end
	end

	if arg1=="film" and arg2=="blur" then
		if not FG_Fuzzy then
			local t = f:CreateTexture("FG_Fuzzy", "OVERLAY")
			local t2 = f:CreateTexture("FG_Fuggly", "OVERLAY")
			t:SetTexture(FEDB.root.."Flare\\Textures\\25ASA_Add")
			t2:SetTexture(FEDB.root.."Flare\\Textures\\25ASA_Mod")
			t:SetBlendMode("ADD")
			t2:SetBlendMode("MOD")
			t:SetAlpha(.1)
			t2:SetAlpha(.02)

			local x = GetScreenWidth()
			local y = GetScreenHeight()

			t:SetHeight((tonumber(y))+256)
			t:SetWidth((tonumber(x))+256)
			t2:SetHeight((tonumber(y))+256)
			t2:SetWidth((tonumber(x))+256)

			t:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
			t2:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
			FEDB.animateGrainFuzzy = true
		else
			if FG_Fuzzy:IsVisible() then
				FG_Fuzzy:Hide()
				FG_Fuggly:Hide()
				FEDB.animateGrainFuzzy = nil
			else
				FG_Fuzzy:Show()
				FG_Fuggly:Show()
				FEDB.animateGrainFuzzy = true
			end
		end
	end

	if arg1=="film" and arg2=="crisp" then
		if not _G["FG_1_1_Add"] then
			local x = GetScreenWidth()
			local y = GetScreenHeight()

			local i = 1
			local ix = 1
			local iy = 1

			local xLimit = math.floor((tonumber(x))/512 + 1)
			local yLimit = math.floor((tonumber(y))/512 + 1)
			local iLimit = xLimit * yLimit
			local intensity = 1

			local fatherF = CreateFrame("Frame", "FG_Crispy", f)
			while i <= iLimit do
				local nameAdd = "FG_"..ix.."_"..iy.."_Add"
				local nameMod = "FG_"..ix.."_"..iy.."_Mod"
				local t = fatherF:CreateTexture(nameAdd, "OVERLAY")
				local t2 = fatherF:CreateTexture(nameMod, "OVERLAY")

				t:SetTexture(FEDB.root.."Flare\\Textures\\25ASA_Add")
				t2:SetTexture(FEDB.root.."Flare\\Textures\\25ASA_Mod")

				t:SetWidth(512)
				t:SetHeight(512)
				t2:SetWidth(512)
				t2:SetHeight(512)

				t:SetBlendMode("ADD")
				t2:SetBlendMode("MOD")
				t:SetAlpha(intensity * .35)
				t2:SetAlpha(intensity * .2)

				local father, anchor
				father = _G["FG_"..(ix-1).."_"..iy.."_Add"] or _G["FG_"..ix.."_"..(iy-1).."_Add"] or f

				if _G["FG_"..(ix-1).."_"..iy.."_Add"] then
					anchor = "TOPRIGHT"
				elseif _G["FG_"..ix.."_"..(iy-1).."_Add"] then
					anchor = "BOTTOMLEFT"
				else
					anchor = "TOPLEFT"
				end

				t:SetPoint("TOPLEFT", father, anchor, 0, 0)
				t2:SetPoint("TOPLEFT", t, "TOPLEFT", 0, 0)

				ix = ix + 1
				if ix > xLimit then
					ix = 1
					iy = iy + 1
				end
				i = i + 1
			end
			FEDB.animateGrainCrispy = true
		else
			if FG_Crispy:IsVisible() then
				FG_Crispy:Hide()
				FEDB.animateGrainCrispy = nil
			else
				FG_Crispy:Show()
				FEDB.animateGrainCrispy = true
			end
		end
	end

end

function FG_OnUpdate(this, elapsed)
	if elapsed then
		FEDB.animationInterval = FEDB.animationInterval + elapsed
		if FEDB.animationInterval > 0.02 then		-- 50 FPS
			FEDB.animationInterval = 0

			local yOfs = math.random(0, 256)
			local xOfs = math.random(-128, 0)

			if FEDB.animateGrainFuzzy or FEDB.animateGrainCrispy then
				f:SetPoint("TOPLEFT", UIParent, "TOPLEFT", xOfs, yOfs)
			end
		end
	end
end