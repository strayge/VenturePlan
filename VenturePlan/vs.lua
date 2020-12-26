local _, T = ...
local SpellInfo = T.KnownSpells

local f32_ne, f32_perc, f32_pim do
	local frexp, lt = math.frexp, {
		[-80]=-0xcccccd*2^-24,
		[-60]=-0x99999a*2^-24,
		[-40]=-0xcccccd*2^-25,
		[-30]=-0x99999a*2^-25,
		[-20]=-0xcccccd*2^-26,
		[-10]=-0xcccccd*2^-27,
		[1]=0xa3d70a*2^-30,
		[3]=0xf5c28f*2^-29,
		[5]=0xcccccd*2^-28,
		[10]=0xcccccd*2^-27,
		[15]=0x99999a*2^-26,
		[20]=0xcccccd*2^-26,
		[30]=0x99999a*2^-25,
		[33]=0xa8f5c3*2^-25,
		[40]=0xcccccd*2^-25,
		[45]=0xe66666*2^-25,
		[60]=0x99999a*2^-24,
		[65]=0xa66666*2^-24,
		[70]=0xb33333*2^-24,
		[80]=0xcccccd*2^-24,
		[90]=0xe66666*2^-24,
		[120]=0x99999a*2^-23,
		[140]=0xb33333*2^-23,
		[160]=0xcccccd*2^-23,
		[4520]=0xb4cccd*2^-18,
		[9040]=0xb4cccd*2^-17,
	}
	function f32_perc(p)
		return lt[p] or f32_ne(p/100)
	end
	function f32_ne(f)
		local neg, s, e = f < 0, frexp(f)
		s = neg and -s or s
		local lo = s % 2^-24
		local a = lo >= 2^-25 and (lo > 2^-25 or s % 2^-23 >= 2^-24) and 2^-24 or 0
		local rv = (s - lo + a) * 2^e
		return neg and -rv or rv
	end
	function f32_pim(p, i)
		i = f32_ne(i * (lt[p] or f32_ne(p/100)))
		return i - i%1
	end
end

local VS, VSI = {}, {}
local VSIm = {__index=VSI}
local autotableMeta = {__index=function(t,k) t[k] = {} return t[k] end}

local boardSlotName = {}
for i=0,15 do
	boardSlotName[i] = ("%x"):format(i)
end

local TP = {} do
	local mistypedAutoAttack = {[43386]=0, [43387]=0, [43390]=0, [43391]=0, [43445]=0, [43447]=0, [43448]=0, [43451]=0, [43525]=0, [43526]=0, [43527]=0, [43528]=0, [43905]=0, [43906]=0, [43907]=0, [43908]=0, [43925]=0, [43926]=0, [43927]=0, [43928]=0, [44030]=0, [44045]=0, [44089]=0, [44092]=0, [44110]=0, [44111]=0, [44145]=0, [44146]=0, [44147]=0, [44148]=0, [44169]=0, [44171]=0, [44172]=0, [44185]=0, [44186]=0, [44187]=0, [44188]=0, [44191]=0, [44249]=0, [44250]=0, [44252]=0, [44266]=0, [44285]=0, [44288]=0, [44291]=0, [44312]=0, [44491]=0, [44749]=0, [44752]=0, [44770]=0, [44789]=0, [44790]=0, [44791]=0, [44792]=0, [44830]=0, [44870]=0, [44871]=0, [45049]=0, [45050]=0, [45051]=0, [45052]=0, [45189]=0, [45191]=0, [45206]=0, [45207]=0, [45585]=0, [45586]=0, [45587]=0, [45588]=0, [45591]=0, [45751]=0, [45869]=0, [45872]=0, [45969]=0, [45970]=0, [45972]=0}
	local targetLists do
		targetLists = {
		[0]={
			[0]="56a79b8c", "67b8a5c9", "569a7b8c", "675a9b8c", "786ba5c9",
			"20314", "23014", "34201", "43120",
			"23014", "23401", "23401", "34201"
		},
		[1]={
			[0]="c89ba576", "95acb687", "c8b79a56", "9c58ab67", "95a6bc78",
			"41320", "41023", "20341", "20143",
			"41032", "10423", "01234", "20134"
		},
		[3]={
			[0]="23140", "03421", "03214", "20143", "31204",
			"56a79b8c", "5a769b8c", "56ba798c", "756a9b8c",
			"56a79b8c", "6b57a98c", "a5769cb8", "56a79b8c"
		},
		[4]={
			[0]="0", "1", "2", "3", "4",
			"5","6","7","8",
			"9","a","b","c",
		},
		[5]={
			[0]="9abc5678", "9abc5678", "9abc5678", "9abc5678", "9abc5678",
			"01234", "01234", "01234", "01234",
			"01234", "01234", "01234", "01234",
		},
		[6]={
			[0]="56789abc", "56789abc", "56789abc", "56789abc", "56789abc",
			"23401", "23401", "23401", "23401",
			"23401", "23401", "23401", "23401",
		},
		[7]={
			[0]="01234","01234","01234","01234","01234",
			"9abc5678", "9abc5678", "9abc5678", "9abc5678",
			"9abc5678", "9abc5678", "9abc5678", "9abc5678",
		},
		[8]={
			[0]="23401","23401","23401","23401","23401",
			"56789abc", "56789abc", "56789abc", "56789abc",
			"56789abc", "56789abc", "56789abc", "56789abc",
		},
		[9]={
			[0]="", "", "", "", "",
			"12340", "12340", "12340", "12340",
			"12340", "12340", "12340", "12340"
		},
		[10]={
		[0]="23410","23401","34012","24013","23014",
		"6789abc5", "5789abc6", "5689abc7", "5679abc8",
		"5678abc9", "56789bca", "56789acb", "56789abc",
		},
		}
		for _, m in pairs(targetLists) do
			for o, t in pairs(m) do
				local r = {}
				for i=1,#t do
					r[i] = tonumber(t:sub(i,i), 16)
				end
				m[o] = r
			end
		end
	end
	local adjCleave = {
		[0x25]=6, [0x26]=5, [0x29]=10, [0x2a]=9,
		[0x05]=6, [0x06]=5, [0x09]=10, [0x0a]=9,
		[0x36]=7, [0x37]=6, [0x3a]=11, [0x3b]=10,
		[0x16]=7, [0x17]=6, [0x1a]=11, [0x1b]=10,
		[0x47]=8, [0x48]=7, [0x4b]=12, [0x4c]=11,
		[0x50]=3, [0x83]=1,
		[0x62]=3, [0x63]=2, [0xa2]=3, [0xa3]=2,
		[0x73]=4, [0x74]=3, [0xb3]=4, [0xb4]=3,
		[0x70]=1,
		[0x35]=10, [0x07]=11,
	}
	local coneCleave = {
		[0x20]=1, [0x30]=1, [0x31]=1, [0x41]=1,
		[0x59]=1, [0x5a]=1,
		[0x69]=1, [0x6a]=1, [0x6b]=1,
		[0x7a]=1, [0x7b]=1, [0x7c]=1,
		[0x8b]=1, [0x8c]=1,
	}
	local friendSurround = {
		[0x01]=1, [0x02]=1, [0x03]=1,
		[0x10]=1, [0x13]=1, [0x14]=1,
		[0x20]=1, [0x23]=1,
		[0x30]=1, [0x31]=1, [0x32]=1, [0x34]=1,
		[0x41]=1, [0x43]=1,
	}
	local stt = {}
	local function GetTargets(source, tt, board)
		local ni, su, tl, lo, taunt = 1, board[source], targetLists[tt], source < 5
		taunt, tl = su and su.taunt, tl and tl[source]
		if tl then
			for i=1,#tl do
				local t = tl[i]
				local tu = board[t]
				if tu and tu.curHP > 0 and not tu.shroud then
					stt[ni], ni = source < 5 and t > 4 and taunt or t, ni + 1
					break
				end
			end
		elseif tt == "all-enemies" then
			for i=lo and 5 or 0, lo and 12 or 4 do
				local tu = board[i]
				if tu and tu.curHP > 0 and not tu.shroud then
					stt[ni], ni = i, ni + 1
				end
			end
		elseif tt == "all-other-allies" then
			for i=lo and 0 or 5, lo and 4 or 12 do
				local tu = board[i]
				if i ~= source and tu and tu.curHP > 0 then
					stt[ni], ni = i, ni + 1
				end
			end
		elseif tt == "all-allies" then
			for i=lo and 0 or 5, lo and 4 or 12 do
				local tu = board[i]
				if tu and tu.curHP > 0 then
					stt[ni], ni = i, ni + 1
				end
			end
		elseif tt == "all" then
			for i=0,12 do
				local tu = board[i]
				if tu and tu.curHP > 0 and not tu.shroud then
					stt[ni], ni = i, ni + 1
				end
			end
		elseif tt == "friend-surround" then
			local f = source*16
			for i=0,12 do
				if friendSurround[f+i] then
					local tu = board[i]
					if tu and tu.curHP > 0 then
						stt[ni], ni = i, ni + 1
					end
				end
			end
		elseif tt == "cone" then
			GetTargets(source, 0, board)
			if #stt > 0 then
				ni = 2
				local f = stt[1]*16
				for i=0,12 do
					if coneCleave[f+i] then
						local tu = board[i]
						if tu and tu.curHP > 0 and not tu.shroud then
							stt[ni], ni = i, ni + 1
						end
					end
				end
			end
		elseif tt == "cleave" then
			GetTargets(source, 0, board)
			if #stt > 0 then
				local t = adjCleave[source*16+stt[1]]
				local tu = board[t]
				stt[2] = tu and tu.curHP > 0 and not tu.shroud and t or nil
				ni = stt[2] and 3 or 2
			end
		elseif tt == "enemy-front" then
			local br = lo and 8 or 2
			for i=lo and 5 or 4, lo and 12 or 0, lo and 1 or -1 do
				local tu = board[i]
				if tu and tu.curHP > 0 and not tu.shroud then
					stt[ni], ni = i, ni + 1
				end
				if i == br and ni > 1 then
					break
				end
			end
		elseif tt == "enemy-back" then
			local br = lo and 9 or 1
			for i=lo and 12 or 0, lo and 5 or 4, lo and -1 or 1 do
				local tu = board[i]
				if tu and tu.curHP > 0 and not tu.shroud then
					stt[ni], ni = i, ni + 1
				end
				if i == br and ni > 1 then
					break
				end
			end
		elseif tt == "friend-back" or tt == "friend-back-hard" or tt == "friend-back-soft" then
			local br, selfOK = lo and 1 or 9, tt == "friend-back"
			for i=lo and 0 or 12, lo and 4 or 5, lo and 1 or -1 do
				local tu = board[i]
				if tu and (i ~= source or selfOK) and tu.curHP > 0 then
					stt[ni], ni = i, ni + 1
				end
				if i == br and ni > 1 then
					break
				end
			end
			if ni == 1 and tt == "friend-back-soft" then
				stt[ni], ni = source, ni + 1
			end
		elseif tt == "friend-front" or tt == "friend-front-hard" or tt == "friend-front-soft" then
			local br, selfOK = lo and 2 or 8, tt == "friend-front"
			for i=lo and 4 or 5, lo and 0 or 12, lo and -1 or 1 do
				local tu = board[i]
				if tu and (i ~= source or selfOK) and tu.curHP > 0 then
					stt[ni], ni = i, ni + 1
				end
				if i == br and ni > 1 then
					break
				end
			end
			if ni == 1 and tt == "friend-front-soft" then
				stt[ni], ni = source, ni + 1
			end
		elseif tt == "self" then
			stt[ni], ni = source, ni + 1
		end
		for i=#stt, ni, -1 do
			stt[i] = nil
		end
		return stt
	end
	function TP:GetAutoAttack(role, slot, mid, firstSpell)
		local a1 = slot and mid and mistypedAutoAttack[slot+20*mid]
		local a2 = slot == nil and role == 2 and (firstSpell == 45 or firstSpell == 52) and 0
		return (a1 or a2 or (role == 1 or role == 5) and 0 or 1) == 0 and 11 or 15
	end
	function TP:GetSpellTargetType(spellID)
		local si = SpellInfo[spellID]
		return si and type(si.target) == "number" and si.target or nil
	end
	TP.GetTargets = GetTargets
	TP.targetLists = targetLists
end

local function enq(qs, k, e)
	local q = qs[k]
	if q == nil then
		q = {}
		qs[k] = q
	end
	q[#q+1] = e
end
local stacksort do
	local o, u
	local function cmp(a,b)
		return u[o[a]] < u[o[b]]
	end
	function stacksort(s, bom)
		o, u = s.o, bom
		table.sort(s, cmp)
	end
end

local mu = {}
function mu:stackf32(sourceIndex, targetIndex, stackName, magh, _sid)
	local b = self.board[targetIndex]
	local s = b.stacks[stackName]
	if s == nil then
		s = {m={}, o={}}
		b.stacks[stackName] = s
	end
	local tok = (self.lsToken or 0) - 1
	self.lsToken, self.lsName, self.lsTarget = tok, stackName, targetIndex
	s.m[tok], s.o[tok], s[#s+1] = f32_perc(magh), sourceIndex, tok
	if #s > 1 then stacksort(s, self.bom) end
	local nv = 1
	for i=1,#s do
		nv = f32_ne(nv + s.m[s[i]])
	end
	b[stackName] = nv
	return tok
end
function mu:unstackf32(_sourceIndex, targetIndex, stackName, cancelToken)
	local b = self.board[targetIndex]
	local s = b.stacks[stackName]
	local m, nv, wi = s.m, 1, 1
	if not m[cancelToken] then error("cannot unwind") end
	m[cancelToken] = nil
	for i=1,#s do
		local t = s[i]
		if t ~= cancelToken then
			s[wi], wi = t, wi+1
			nv = f32_ne(nv + m[t])
		end
	end
	b[stackName], s[wi] = nv, nil
end
function mu:funstackf32(sourceIndex, atTurn, ord)
	local sn = self.lsName
	if not sn then
		error("stackop desync")
	end
	enq(self.queue, atTurn, {"unstackf32", sourceIndex, self.lsTarget, sn, self.lsToken, ord=ord})
	self.lsName = nil
end
function mu:modDamageDealt(sourceIndex, targetIndex, mod, sid)
	mu.stackf32(self, sourceIndex, targetIndex, "modDamageDealt", mod, sid)
end
function mu:modDamageTaken(sourceIndex, targetIndex, mod, sid)
	mu.stackf32(self, sourceIndex, targetIndex, "modDamageTaken", mod, sid)
end
function mu:damage(sourceIndex, targetIndex, baseDamage, causeTag, causeSID)
	local board, ret = self.board, false
	local tu, su = board[targetIndex], board[sourceIndex]
	local tHP = tu.curHP
	if tHP > 0 then
		local points = math.floor(baseDamage) + su.plusDamageDealt
		points = math.floor(f32_ne(points * su.modDamageDealt)) + tu.plusDamageTaken
		points = math.floor(f32_ne(points * tu.modDamageTaken))
		if points > 0 then
			if self.traceEnabled then
				local tl = self.turnHitLog[self.turn]
				tl[#tl+1] = {"HIT", sourceIndex, targetIndex, points, tHP, causeTag, causeSID, #tl}
			end
			if tHP > points then
				tu.curHP = tHP-points
			else
				tu.curHP = 0
				mu.die(self, targetIndex, causeTag == "Thorn")
				ret=true
			end
			local thorns = tu.thornsDamage
			if thorns > 0 and causeTag ~= "Tick" and causeTag ~= "Thorn" and causeTag ~= "EEcho" then
				mu.damage(self, targetIndex, sourceIndex, thorns, "Thorn", tu.thornsSID)
			end
		end
	end
	return ret
end
function mu:dtick(sourceIndex, targetIndex, esid, eeid, causeTag, causeSID)
	local board, ret = self.board
	local tu, su = board[targetIndex], board[sourceIndex]
	if tu.curHP > 0 then
		local effect = eeid ~= 0 and SpellInfo[esid][eeid] or SpellInfo[esid]
		local datk, dperc = effect.damageATK, effect.damagePerc
		local points = (datk and f32_pim(datk,su.atk) or 0) + (dperc and math.floor(dperc*tu.maxHP/100) or 0)
		if points > 0 then
			ret = mu.damage(self, sourceIndex, targetIndex, points, "Tick", causeSID)
		end
		local datk, dperc = effect.healATK, effect.healPerc
		local points = (datk and f32_pim(datk,su.atk) or 0) + (dperc and math.floor(dperc*tu.maxHP/100) or 0)
		if points > 0 then
			mu.heal(self, sourceIndex, targetIndex, points, causeTag, causeSID)
		end
	end
	return ret
end
function mu:heal(sourceIndex, targetIndex, halfPoints, causeTag, causeSID)
	local board = self.board
	local tu = board[targetIndex]
	local cHP = tu.curHP
	if cHP > 0 then
		local points = math.floor(halfPoints)
		if points > 0 then
			local nhp, max = cHP + points, tu.maxHP
			nhp = nhp > max and max or nhp
			tu.curHP = nhp
			if self.traceEnabled then
				local tl = self.turnHitLog[self.turn]
				tl[#tl+1] = {"HEAL", sourceIndex, targetIndex, points, cHP, causeTag, causeSID, #tl}
			end
		end
	end
end
function mu:shroud(_sourceIndex, targetIndex, delta)
	local tu = self.board[targetIndex]
	if tu then
		local ns = (tu.shroud or 0) + delta
		tu.shroud = ns > 0 and ns or nil
	end
end
function mu:spell(source, sid, eid, ord)
	local si = eid ~= 0 and SpellInfo[sid][eid] or SpellInfo[sid]
	local board = self.board
	local su = board[source]
	local rflag = false
	local sit, sitt, tt = si.type, si.target
	if sitt == "fork" then
		if self.forkTarget == nil then
			return
		end
		tt = TP.GetTargets(self.forkTarget, "self", board)
	else
		tt = TP.GetTargets(source, sitt, board)
	end
	if sit == "passive" then
		local onDeath = su.deathUnwind or {}
		local mdd, tatk = si.modDamageDealt, si.thornsATK
		local td = tatk and f32_pim(tatk,su.atk)
		for i=1,#tt do
			i = tt[i]
			local tu = board[i]
			if mdd then
				mu.modDamageDealt(self, source, i, mdd, sid)
				onDeath[#onDeath+1] = {"unstackf32", source, i, self.lsName, self.lsToken}
				self.lsName = nil
			end
			if td then
				tu.thornsDamage = tu.thornsDamage + td
				tu.thornsSID = tu.thornsSID or sid
				onDeath[#onDeath+1] = {"statDelta", source, i, "thornsDamage", -td}
			end
		end
		su.deathUnwind = onDeath
	elseif sit == "aura" then
		local period, duration = si.period, si.duration
		local mdd, mdt = si.modDamageDealt, si.modDamageTaken
		local datk, hatk = si.damageATK, si.healATK
		local halfPoints = datk and f32_pim(datk, su.atk) or 0
		local healPoints = hatk and f32_pim(hatk, su.atk) or 0
		local tb = self.turn-1
		local d1 = si.damageATK1
		local pdda, pdta, thornsa = si.plusDamageDealtATK, si.plusDamageTakenATK, si.thornsATK
		local hasDamage, hasHeal = si.damageATK or si.damagePerc, si.healATK or si.healPerc
		local modHPP = si.modMaxHP
		local pdd, pdt = pdda and (pdda*su.atk/100), pdta and f32_pim(pdta, su.atk)

		for i=1,#tt do
			i = tt[i]
			local tu = board[i]
			local thornsp = thornsa and f32_pim(thornsa, tu.atk)
			if d1 then
				rflag = mu.damage(self, source, i, f32_pim(d1, su.atk), "EFirst", sid) or rflag
			end
			if not si.noFirstTick and halfPoints > 0 and not period then -- Periodic initial damage is deferred?
				rflag = mu.damage(self, source, i, halfPoints, d1 and "Tick" or "EFront", sid) or rflag
			end
			if healPoints > 0 and not si.noFirstTick and not period then -- Periodic heals are deferred too
				mu.heal(self, source, i, healPoints, "EFront", sid)
			end
			if tu.curHP > 0 then
				if mdd then
					mu.modDamageDealt(self, source, i, mdd, sid)
					mu.funstackf32(self, source, tb+duration+1, ord+(si.fadeOrd or -100))
				end
				if mdt then
					mu.modDamageTaken(self, source, i, mdt, sid)
					mu.funstackf32(self, source, tb+duration+1, ord+(si.fadeOrd or -100))
				end
				if pdd then
					tu.plusDamageDealt = tu.plusDamageDealt + pdd
					enq(self.queue, tb+duration+1, {"statDelta", source, i, "plusDamageDealt", -pdd, ord=ord-100})
				end
				if pdt then
					tu.plusDamageTaken = tu.plusDamageTaken + pdt
					enq(self.queue, tb+duration+1, {"statDelta", source, i, "plusDamageTaken", -pdt, ord=ord-100})
				end
				if modHPP then
					local d = math.floor(tu.maxHP*modHPP/100)
					tu.curHP, tu.maxHP = tu.curHP+d, tu.maxHP+d
					enq(self.queue, tb+duration+1, {"statDelta", source, i, "maxHP", -d, ord=ord-100})
				end
				if thornsp then
					tu.thornsDamage = tu.thornsDamage + thornsp
					tu.thornsSID = tu.thornsSID or sid
					enq(self.queue, tb+duration+1, {"statDelta", source, i, "thornsDamage", -thornsp, ord=ord-100})
				end
				if period == 2 then
					for j=3,duration+1,2 do
						if hasDamage or hasHeal then
							enq(self.queue, tb+j, {"dtick", source, i, sid, eid, "Effect", sid, ord=ord-100})
						end
					end
				else
					for j=2,duration do
						if hasDamage or hasHeal then
							enq(self.queue, tb+j, {"dtick", source, i, sid, eid, "Effect", sid, ord=ord-100})
						end
					end
				end
				if si.echo then
					enq(self.queue, tb+si.echo+1, {"damage", source, i, halfPoints, "EEcho", sid, ord=ord-100})
				end
			end
		end
	elseif sit == "nuke" then
		local mdd, sATK = si.modDamageDealt, su.atk
		local datk, datk2, dperc, echo = si.damageATK, si.damageATK2, si.damagePerc, si.echo
		local points1, points2 = datk and f32_pim(datk, sATK) or 0, datk2 and f32_pim(datk2, sATK) or 0
		echo = echo and (self.turn+echo) or nil
		for i=1,#tt do
			i = tt[i]
			local tu = board[i]
			rflag = mu.damage(self, source, i, points1 + (dperc and math.floor(dperc*tu.maxHP/100) or 0), "Spell", sid) or rflag
			if points2 > 0 then
				rflag = mu.damage(self, source, i, points2, "Spell", sid) or rflag
			end
			if mdd then
				mu.modDamageDealt(self, source, i, mdd, sid)
				mu.funstackf32(self, source, self.turn+si.duration, ord-100)
			end
			if echo then
				enq(self.queue, echo, {"damage", source, i, points1, "SEcho", sid, ord=ord-100})
			end
		end
		if si.healTarget == "self" then
			mu.heal(self, source, source, f32_pim(si.healATK or 0, su.atk), "DHeal", sid)
		end
	elseif sit == "heal" then
		local mdd, hPerc = si.modDamageDealt, si.healPercent
		for i=1,#tt do
			i = tt[i]
			local tu = board[i]
			local hatk = si.healATK
			local points = (hatk and f32_pim(hatk, su.atk) or 0) + (hPerc and math.floor(hPerc*tu.maxHP/100) or 0)
			mu.heal(self, source, i, points, "Spell", sid)
			if mdd then
				mu.modDamageDealt(self, source, i, mdd, sid)
				mu.funstackf32(self, source, self.turn+si.duration, ord)
			end
			if si.shroudTurns then
				tu.shroud = (tu.shroud or 0) + 1
				enq(self.queue, self.turn+si.shroudTurns, {"shroud", source, i, -1, ord=ord})
			end
		end
	elseif sit == "taunt" then
		for i=1,#tt do
			i = tt[i]
			local tu = board[i]
			tu.taunt = source
			enq(self.queue, self.turn+si.duration, {"untaunt", source, i, sid, ord=ord-100})
		end
	elseif sit == "fork" then
		self.forkTarget = nil
		local baseSpell, numChoices, oracle = SpellInfo[sid], 0, self.forkOracle
		for i=1,#tt do
			i = tt[i]
			numChoices = numChoices + 1
			if numChoices == 1 then
				self.forkTarget = i
			else
				local f = self:Clone()
				f.forkTarget = i
				local fq = f.queue[self.turn]
				for e2=eid+1,#baseSpell do
					fq[#fq+1] = {"spell", source, sid, e2, ord-eid+e2}
				end
			end
		end
		local swapWith = numChoices > 1 and oracle and oracle(self.turn, source, sid)
		if numChoices > 1 and not swapWith then
			local r = math.random(numChoices)
			swapWith = r > 1 and self.forks[#self.forks-numChoices+r].forkTarget
		end
		self.mass = self.mass * (numChoices > 1 and numChoices or 1)
		for i=2, numChoices do
			local f = self.forks[#self.forks-numChoices+i]
			f.mass, f.unfinishedTurn = self.mass, true
			if swapWith == f.forkTarget then
				self.forkTarget, f.forkTarget = f.forkTarget, self.forkTarget
			end
		end
	end
	return rflag
end
function mu:untaunt(source, target, _sid)
	local tu = self.board[target]
	if tu and tu.taunt == source then
		tu.taunt = nil
	end
end
function mu:statDelta(_sourceIndex, targetIndex, statName, delta)
	local tu = self.board[targetIndex]
	if tu then
		tu[statName] = tu[statName] + delta
		if statName == "maxHP" and tu.curHP > tu.maxHP then
			tu.curHP = tu.maxHP
		end
	end
end
function mu:die(deadIndex, doNotUnwind)
	local k, board = deadIndex < 5 and "liveFriends" or "liveEnemies", self.board
	self[k] = self[k] - 1
	if self[k] == 0 then
		self.over, self.won = true, deadIndex >= 5
	end
	local ds = 0
	for i=0,12 do
		local tu = board[i]
		if tu then
			if tu.taunt == deadIndex then
				tu.taunt = nil
			end
			local tds = (tu.deathSeq or 0)
			if tds > ds then
				ds = tds
			end
		end
	end
	local du = board[deadIndex]
	du.deathSeq = ds + 1
	local duw = not doNotUnwind and du.deathUnwind
	for i=1, duw and #duw or 0 do
		local q = duw[i]
		mu[q[1]](self, unpack(q,2))
	end
end
function mu:cast(sourceIndex, abIndex, qe)
	local board = self.board
	local su = board[sourceIndex]
	if su.curHP > 0 then
		local ab = su.abilities[abIndex]
		local sid = ab[1]
		local si = SpellInfo[sid]
		local ord1 = (qe.ord or 0)-1
		if si.type ~= "passive" then
			enq(self.queue, self.turn+ab[2]+1, qe)
		end
		if #si > 0 then
			for i=1,#si do
				mu.spell(self, sourceIndex, sid, i, ord1+i)
			end
		else
			mu.spell(self, sourceIndex, sid, 0, ord1+1)
		end
	end
end

function VSI:InitializeQueue()
	local qt = self.queue
	
	local baseOrd, lf, le = 1e5, 0, 0
	local boardOrder = self.boardOrder
	for s=1,#boardOrder do
		local b = boardOrder[s]
		local e = self.board[b]
		if e then
			lf, le = lf + (b < 5 and 1 or 0), le + (b >= 5 and 1 or 0)
			local slotOrd = baseOrd + s*1e3
			for i=1,#e.abilities do
				local sid = e.abilities[i][1]
				local si = SpellInfo[sid]
				local p, ord = si.phase, slotOrd + i*10
				local qe = {"cast", b, i}
				if p == 0 then
					qe.ord0, ord = 0, ord - baseOrd
				else
					ord=slotOrd+500+i*10
				end
				qe.ord, qe[4] = ord, qe
				enq(qt, si.firstTurn or 1, qe)
			end
		end
	end
	self.liveFriends, self.liveEnemies = lf, le
	self.over, self.won = lf == 0 or le == 0, le == 0 and lf > 0 or nil
end

function VSI:Turn(isResumed)
	local q, turn
	if isResumed then
		turn = self.turn
		q = self.queue[turn]
	else
		if self.turn == 0 then
			self:InitializeQueue()
		end
		turn = self.turn + 1
		q, self.turn = self.queue[turn], turn
		self:SortAttackOrder(q)
	end
	local retval, qi = true
	for i=#q,1,-1 do
		qi, q[i] = q[i], nil
		mu[qi[1]](self, unpack(qi, 2))
		if self.over then
			retval = false
			break
		end
	end
	self.checkpoints[self.turn] = self:CheckpointBoard()
	self.queue[self.turn] = nil
	return retval
end
function VSI:Run(forkLimit)
	if self.unfinishedTurn then
		self.unfinishedTurn = nil
		self:Turn(true)
	end
	while not self.over do
		self:Turn()
	end
	self.queue = nil
	if self.forks and not self.prime then
		local i, forks = (self.exploredForks or 0) + 1, self.forks
		local winMass, lossMass = self.winMass, self.lossMass
		if winMass == nil then
			winMass, lossMass = self.won and 1/self.mass or 0, self.won and 0 or 1/self.mass
		end
		local rMass = 1-winMass-lossMass
		forkLimit = forkLimit or 100
		while i <= #forks and i < forkLimit do
			local r = math.random()*rMass
			for j=i,#forks do
				local mj = 1/forks[j].mass
				if r <= mj then
					forks[i], forks[j] = forks[j], forks[i]
					break
				end
				r = r - mj
			end
			forks[i]:Run()
			local mi, won = 1/forks[i].mass, forks[i].won
			winMass, lossMass, rMass = winMass + (won and mi or 0), lossMass + (won and 0 or mi), rMass - mi
			i = i + 1
		end
		self.winMass, self.lossMass = winMass, lossMass
		self.pWin = lossMass == 0 and i >= #forks and 1 or winMass
		self.pLose = winMass == 0 and i >= #forks and 1 or lossMass
		self.exhaustive, self.exploredForks = i > #forks, i-1
	elseif not self.prime then
		self.pWin = self.won and 1 or 0
		self.pLoss = self.won and 0 or 1
		self.exhaustive = true
	end
end
function VSI:CheckpointBoard()
	local board = self.board
	local c = ""
	for i=0,12 do
		local b = board[i]
		if b and b.curHP > 0 then
			c = (c ~= "" and c .. "_" or "") .. boardSlotName[i] .. ":" .. b.curHP
		end
	end
	return c
end
function VSI:SortAttackOrder(q)
	local board, bo, bom = self.board, self.boardOrder, self.bom
	for b=0,12 do
		local e = board[b]
		if e then
			bom[b] = (b < 5 and 1e9 or 2e9) - e.curHP * 1e3 + b - 20*(e.deathSeq or 0)
		end
	end
	table.sort(bo, function(a,b)
		return bom[a] < bom[b]
	end)
	for i=1,#bo do
		bom[bo[i]] = i
	end
	table.sort(q, function(a, b)
		local ac, bc = a.ord0 or bom[a[2]], b.ord0 or bom[b[2]]
		if ac == bc then
			ac, bc = a.ord or 0, b.ord or 0
		end
		return ac > bc
	end)
end
function VSI:Clone()
	local n = setmetatable({}, VSIm)
	local q, r, s, d = {}, {[self]=n}, self, n
	local forks = self.forks or {[0]=self}
	self.forks, forks[#forks+1] = forks, n
	r[self.prime or 0], r[forks] = self.prime, forks
	r[0] = nil
	while s do
		q[s] = nil
		for k,v in pairs(s) do
			if r[k] then
				k = r[k]
			elseif type(k) == "table" then
				r[k] = setmetatable({}, getmetatable(k))
				q[k], k = r[k], r[k]
			end
			if r[v] then
				v = r[v]
			elseif type(v) == "table" then
				r[v] = setmetatable({}, getmetatable(v))
				q[v], v = r[v], r[v]
			end
			d[k] = v
		end
		q[s] = nil
		s, d = next(q)
	end
	n.prime, n.forkOracle = self.prime or self
	return n
end
function VSI:EnableTrace()
	if not self.turnHitLog then
		self.traceEnabled = true
		self.turnHitLog=setmetatable({}, autotableMeta)
	end
end

local function addActorProps(a)
	a.modDamageTaken = 1
	a.modDamageDealt = 1
	a.plusDamageTaken = 0
	a.plusDamageDealt = 0
	a.thornsDamage = 0
	return a
end
function VS:New(team, encounters, environmentSID, mid, forkOracle)
	local board, missingSpells = {}
	for _, f in pairs(team) do
		if f.stats then
			f.attack, f.health, f.maxHealth = f.stats.attack, f.stats.currentHealth, f.stats.maxHealth
		end
		local rf, ab = {maxHP=f.maxHealth, curHP=f.health, atk=f.attack, role=f.role, slot=f.boardIndex, name=f.name, stacks={}}, {}
		for i=1,#f.spells do
			local s = f.spells[i]
			local si = SpellInfo[s.autoCombatSpellID]
			if not si then
				missingSpells = missingSpells or {}
				missingSpells[s.autoCombatSpellID] = 1
			elseif si.type ~= "nop" then
				ab[i] = {s.autoCombatSpellID, s.cooldown, s.duration}
			end
		end
		table.insert(ab, 1, {TP:GetAutoAttack(rf.role, nil, nil, ab[1] and ab[1][1]), 0, 0})
		board[f.boardIndex], rf.abilities = addActorProps(rf), ab
	end
	for i=1,#encounters do
		local e = encounters[i]
		local rf, ab = {maxHP=e.maxHealth, curHP=e.maxHealth, atk=e.attack, role=e.role, slot=e.boardIndex, stacks={}}, {}
		for i=1,#e.autoCombatSpells do
			local s = e.autoCombatSpells[i]
			local si = SpellInfo[s.autoCombatSpellID]
			if not si then
				missingSpells = missingSpells or {}
				missingSpells[s.autoCombatSpellID] = 1
			elseif si.type ~= "nop" then
				ab[i] = {s.autoCombatSpellID, s.cooldown, s.duration}
			end
		end
		table.insert(ab, 1, {TP:GetAutoAttack(rf.role, rf.slot, mid, ab[1] and ab[1][1]), 0, 0})
		board[e.boardIndex], rf.abilities = addActorProps(rf), ab
	end
	local esi = SpellInfo[environmentSID]
	if environmentSID and (not esi or esi.type ~= "nop") then
		missingSpells = missingSpells or {}
		missingSpells[environmentSID] = 2
	end
	
	local boardOrder = {}
	for b=0,12 do
		local e = board[b]
		if e then
			boardOrder[1+#boardOrder] = b
		end
	end
	
	local ii = setmetatable({board=board, turn=0, queue={}, checkpoints={}, boardOrder=boardOrder, bom={}, mass=1, forkOracle=forkOracle}, VSIm)
	ii.checkpoints[0] = ii:CheckpointBoard()
	return ii, missingSpells
end


VS.TP = TP
T.VSim = VS