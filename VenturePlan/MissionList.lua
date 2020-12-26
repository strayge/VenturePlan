local _, T = ...
local EV = T.Evie

local W = {} do
	local missionCreditCriteria = {}
	function W.AddMissionAchievementInfo(missions)
		if not missions or #missions == 0 then
			return missions
		end
		if not next(missionCreditCriteria) then
			local aid=14844
			for i=1,GetAchievementNumCriteria(aid) do
				local _, ct, com, _, _, _, _, asid, _, cid = GetAchievementCriteriaInfo(aid, i)
				if ct == 174 and asid then
					missionCreditCriteria[asid] = aid*2 + cid*1e6 + (com and 1 or 0)
				end
			end
		end
		if next(missionCreditCriteria) and missions then
			for i=1,#missions do
				local mi = missions[i]
				local mid = mi.missionID
				local ai = missionCreditCriteria[mid]
				if ai then
					mi.achievementID = math.floor(ai % 1e6 / 2)
					if ai % 2 == 1 then
						mi.achievementComplete = true
					else
						local cid = math.floor(ai / 1e6)
						local _, _, isComplete = GetAchievementCriteriaInfoByID(mi.achievementID, cid)
						mi.achievementComplete, missionCreditCriteria[mid] = isComplete, isComplete and ai + 1 or ai
					end
				end
			end
		end
		return missions
	end
end

local MissionPage, MissionList

local startedMissions, finishedMissions, FlagMissionFinish = {}, {} do
	function EV:I_MISSION_PRE_START(mid)
		startedMissions[mid] = 1
	end
	function EV:ADVENTURE_MAP_CLOSE()
		startedMissions = {}
		finishedMissions = {}
		if MissionList then
			MissionList:ReturnToTop()
		end
	end
	function EV:GARRISON_MISSION_STARTED(_, mid)
		if mid then
			startedMissions[mid] = nil
		end
	end
	function FlagMissionFinish(mid)
		if mid then
			finishedMissions[mid] = 1
		end
	end
end

local function LogCounter_OnClick(self)
	local cb = self:GetParent().CopyBox
	cb.Title:SetText("Wanted: Adventure Reports")
	cb.Intro:SetText("The Cursed Adventurer's Guide hungers. Only the tales of your companions' adventures, conveyed in excruciating detail, will satisfy it.")
	cb.FirstInputBoxLabel:SetText("To submit your adventure reports,|n1. Visit:")
	cb.SecondInputBoxLabel:SetText("2. Copy the following text:")
	cb.ResetButton:SetText("Reset Adventure Reports")
	cb.FirstInputBox:SetText("https://www.townlong-yak.com/addons/venture-plan/submit-reports")
	cb.FirstInputBox:SetCursorPosition(0)
	cb.SecondInputBox:SetText(T.ExportMissionReports())
	cb.SecondInputBox:SetCursorPosition(0)
	cb:Show()
	PlaySound(170567)
end
local function LogCounter_Update()
	local lc, c = MissionPage.LogCounter, T.GetMissionReportCount()
	lc:SetShown(c > 0)
	lc:SetText(BreakUpLargeNumbers(c))
end

local baseXPReward = {title="Follower XP", tooltip="Awarded even if the adventurers are defeated.", icon="Interface/Icons/XP_Icon", qualityAtlas="loottoast-itemborder-purple"}

local function ConfigureReward(w, rew, isOvermax, pw)
	w:SetShown(not not rew)
	if not rew then
		return
	end
	local q, tooltipTitle, tooltipText, cq = rew.quantity, rew.title
	if rew.icon then
		w.Icon:SetTexture(rew.icon)
	elseif rew.itemID then
		w.Icon:SetTexture(GetItemIcon(rew.itemID))
	end
	if rew.currencyID then
		w.RarityBorder:SetAtlas("loottoast-itemborder-gold")
		if rew.currencyID == 0 then
			q = math.floor(rew.quantity / 1e4)
			tooltipText = GetMoneyString(rew.quantity)
		else
			local ci = C_CurrencyInfo.GetCurrencyContainerInfo(rew.currencyID, rew.quantity)
			if ci then
				w.Icon:SetTexture(ci.icon)
				tooltipTitle = (ci.quality and "|c" .. (select(4,GetItemQualityColor(ci.quality)) or "ff00ffff") or "") .. ci.name
				tooltipText = NORMAL_FONT_COLOR_CODE .. (ci.description or "")
				local lb = LOOT_BORDER_BY_QUALITY[ci.quality]
				if lb then
					w.RarityBorder:SetAtlas(lb)
				end
			end
			if rew.currencyID == 1828 then
				w.RarityBorder:SetAtlas("loottoast-itemborder-orange")
			end
			cq = (isOvermax and pw and pw.currencyID == rew.currencyID and pw.currencyQ or 0) + q
		end
	elseif rew.itemID then
		q = rew.quantity == 1 and "" or rew.quantity or ""
		local _,_,r = GetItemInfo(rew.itemID)
		w.RarityBorder:SetAtlas(
			((r or 2) <= 2) and "loottoast-itemborder-green"
			or r == 3 and "loottoast-itemborder-blue"
			or r == 4 and "loottoast-itemborder-purple"
			or "loottoast-itemborder-orange"
		)
	elseif rew.followerXP then
		q, tooltipTitle, tooltipText = BreakUpLargeNumbers(rew.followerXP), rew.title, rew.tooltip
		w.RarityBorder:SetAtlas(rew.qualityAtlas or "loottoast-itemborder-green")
	end
	local overfullText = isOvermax and "|cffff8000" .. "Bonus roll reward" .. "|r" or nil
	w.OvermaxRewardIcon:SetShown(isOvermax)
	w.currencyID, w.currencyAmount, w.itemID, w.tooltipExtra, w.tooltipHeader, w.tooltipText = rew.currencyID, rew.quantity, rew.itemID, overfullText, tooltipTitle, tooltipText
	w.currencyQ = cq
	w.Quantity:SetText(q == 1 and "" or q or "")
end
local function ConfigureMission(me, mi, isAvailable)
	local mid = mi.missionID
	local emi = C_Garrison.GetMissionEncounterIconInfo(mid)
	mi.encounterIconInfo, mi.isElite, mi.isRare = emi, emi.isElite, emi.isRare
	
	me.missionID, me.isAvailable, me.offerEndTime = mid, isAvailable, mi.offerEndTime
	me.baseCost, me.baseCostCurrency = mi.basecost, mi.costCurrencyTypesID
	me.hasOvermaxRewards = not not (mi.overmaxRewards and mi.overmaxRewards[1])
	me.hasUsefulOvermaxRewards = mi.overmaxRewardScore ~= 0
	me.Name:SetText(mi.name)
	if mi.isElite then
		me.Name:SetTextColor(1, 0xf0/255, 0x48/255)
	elseif mi.isRare then
		me.Name:SetTextColor(0x70/255, 0xD8/255, 0xFF/255)
	else
		me.Name:SetTextColor(0.97, 0.97, 0.80)
	end
	if (mi.description or "") ~= "" then
		me.Description:SetText(mi.description)
	end
	
	local mdi = C_Garrison.GetMissionDeploymentInfo(mid)
	
	local timeNow = GetTime()
	local expirePrefix, expireAt, expireRoundUp = false, nil, nil, false
	me.completableAfter = nil
	if mi.offerEndTime then
		expirePrefix = "|A:worldquest-icon-clock:0:0:0:0|a"
		expireAt = mi.offerEndTime
	elseif mi.timeLeftSeconds then
		me.completableAfter = timeNow+mi.timeLeftSeconds
		me.ProgressBar.Text:SetText("")
		me.ProgressBar:SetProgressCountdown(mi.timeLeftSeconds+timeNow, mi.durationSeconds, "Click to complete", true, true)
	elseif mi.completed then
		me.completableAfter = timeNow-1
		me.ProgressBar:SetProgress(1)
		me.ProgressBar.Text:SetText("Click to complete")
	end
	me.ProgressBar:SetMouseMotionEnabled(me.completableAfter and me.completableAfter <= timeNow)
	me:SetCountdown(expirePrefix, expireAt, nil, nil, true, expireRoundUp)

	baseXPReward.followerXP = mdi.xp
	ConfigureReward(me.Rewards[1], baseXPReward)
	ConfigureReward(me.Rewards[2], mi.rewards and mi.rewards[1])
	ConfigureReward(me.Rewards[3], mi.rewards and mi.rewards[2])
	me.Rewards.Container:SetWidth(52*(1+#mi.rewards)-2)
	me.AchievementReward.assetID = mi.missionID
	me.AchievementReward.achievementID = mi.achievementID
	me.AchievementReward:SetShown(mi.achievementID and not mi.achievementComplete)
	
	local isMissionActive = not not (mi.completed or mi.timeLeftSeconds)
	local veilShade = mi.timeLeftSeconds and 0.65 or 1
	me.Veil:SetShown(isMissionActive)
	me.ProgressBar:SetShown(isMissionActive and not mi.isFakeStart)
	me.ViewButton:SetShown(not isMissionActive)
	for i=1,#me.Rewards do
		me.Rewards[i].RarityBorder:SetVertexColor(veilShade, veilShade, veilShade)
	end
	local hasNovelSpells, enemies = false, mdi.enemies
	for i=1,#enemies do
		for j=1,#enemies[i].autoCombatSpells do
			if not T.KnownSpells[enemies[i].autoCombatSpells[j].autoCombatSpellID] then
				hasNovelSpells = true
			end
		end
	end
	
	local di, totalHP, totalATK = C_Garrison.GetMissionDeploymentInfo(mi.missionID), 0, 0
	for i=1,di and di.enemies and #di.enemies or 0 do
		local e = di.enemies[i]
		if e then
			totalHP = totalHP + e.health
			totalATK = totalATK + e.attack
		end
	end
	me.enemyATK:SetText(BreakUpLargeNumbers(totalATK))
	me.enemyHP:SetText(BreakUpLargeNumbers(totalHP))
	me.animaCost:SetText(BreakUpLargeNumbers(mi.cost))
	me.duration:SetText(mi.duration)
	me.statLine:SetWidth(me.duration:GetRight() - me.statLine:GetLeft())
	me.sciIcon:SetShown(hasNovelSpells)
	
	me:Show()
end
local function cmpMissionInfo(a,b)
	local ac, bc = a.completed or a.timeLeftSeconds == 0, b.completed or b.timeLeftSeconds == 0
	if ac ~= bc then
		return ac
	end
	if startedMissions[a.missionID] and not a.timeLeftSeconds then
		a.timeLeftSeconds, a.offerEndTime = a.durationSeconds
	end
	if startedMissions[b.missionID] and not b.timeLeftSeconds then
		b.timeLeftSeconds, b.offerEndTime = b.durationSeconds
	end
	ac, bc = a.timeLeftSeconds, b.timeLeftSeconds
	if (not ac) ~= (not bc) then
		return not ac
	end
	if ac ~= bc then
		return ac < bc
	end
	ac, bc = a.offerEndTime, b.offerEndTime
	if ac and bc and ac ~= bc then
		return ac < bc
	end
	ac, bc = a.durationSeconds, b.durationSeconds
	if ac and bc and ac ~= bc then
		return ac < bc
	end
	return a.name < b.name
end
local function UpdateMissions()
	local missions = C_Garrison.GetAvailableMissions(123) or {}
	local inProgressMissions = C_Garrison.GetInProgressMissions(123)
	local cMissions = C_Garrison.GetCompleteMissions(123)
	for i=1,inProgressMissions and #inProgressMissions or 0 do
		missions[#missions+1] = inProgressMissions[i]
	end
	for i=1,cMissions and #cMissions or 0 do
		local cid = cMissions[i].missionID
		for j=1, inProgressMissions and #inProgressMissions or 0 do
			if inProgressMissions[j].missionID == cid then
				cid = nil
				break
			end
		end
		if cid and not finishedMissions[cid] then
			missions[#missions+1] = cMissions[i]
		end
	end
	W.AddMissionAchievementInfo(missions)
	table.sort(missions, cmpMissionInfo)
	
	local Missions =  MissionList.Missions
	for i=1,#missions do
		ConfigureMission(Missions[i], missions[i], true)
	end
	MissionList.numMissions = #missions
	for i=#missions+1, #Missions do
		Missions[i]:Hide()
	end
end

local function HookAndCallOnShow(frame, f)
	frame:HookScript("OnShow", f)
	if frame:IsVisible() then
		f(frame)
	end
end
function EV:I_ADVENTURES_UI_LOADED()
	MissionPage, MissionList = T.CreateObject("MissionPage", CovenantMissionFrame.MissionTab)
	local lc = MissionPage.LogCounter
	lc.tooltipHeader, lc.tooltipText = "|cff1eff00Adventure Report", NORMAL_FONT_COLOR_CODE .. "A detailed record of an adventure completed by your companions.|n|n|cff1eff00Use: Feed the Cursed Adventurer's Guide."
	lc:SetScript("OnClick", LogCounter_OnClick)
	HookAndCallOnShow(CovenantMissionFrame.MissionTab.MissionList, function(self)
		self:Hide()
		MissionPage:Show()
	end)
	HookAndCallOnShow(MissionList, function()
		CovenantMissionFrameFollowers:Hide()
		UpdateMissions()
		LogCounter_Update()
	end)
	hooksecurefunc(C_Garrison, "MissionBonusRoll", FlagMissionFinish)
	EV.I_STORED_LOG_UPDATE = LogCounter_Update
	MissionPage.CopyBox.ResetButton:SetScript("OnClick", function(self)
		EV("I_RESET_STORED_LOGS")
		self:GetParent():Hide()
	end)
	return "remove"
end