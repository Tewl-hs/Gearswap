function get_sets()	
    -- Personal settings: Load macros and set equipviewer position
    send_command('input /macro book 10;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 16')
    send_command('input //equipviewer pos 1663 934')
    -- 

    -- Variables for auto-skill chain. Only edit AutoWS 
	AWSEnabled = false
	AutoWS = 'Blade: Ei'
	WeaponSkills = T{'Blade: Hi', 'Blade: Hi'}
	ws_order = 1
	last_target = nil
    -- 

    ElementalSpells = {'Katon', 'Hyoton', 'Huton', 'Doton', 'Raiton', 'Suiton'}
    EnfeeblingSpells = {'Aisha', 'Jubaku', 'Hojo', 'Kurayami', 'Dokumori', 'Yurin'}
    EnhancingSpells= {'Tonko', 'Monomi', 'Utsusemi', 'Gekka', 'Yain', 'Myoshu', 'Kakka', 'Migawari'}

    sets.MoveSpeed = { feet = "Danzo Sune-Ate",} 

    Capes = {}
    Capes.DA = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Capes.STP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}} -- Needs dye
    Capes.EVA = { name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Evasion+15','Damage taken-5%',}} -- Need
    Capes.FC = { name="Andartia's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.Enmity = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Damage taken-5%',}}
    Capes.DEX = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%'}}
    Capes.AGI = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}}
    Capes.STR = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    Capes.MAB = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}} -- Need
    Capes.MACC = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Damage taken-5%',}} -- Need

    sets.Enmity = {
        ammo        = "Date Shuriken", -- 3
        body        = "Emet Harness +1", -- 10
        hands       = "Kurys Gloves", -- 9
        feet        = "Mochi. Kyahan +3", -- 8
        neck        = "Moonlight Necklace", -- 15
        right_ring  = "Cryptic Earring", -- 4
        left_ring   = "Trux Earring", -- 5
        right_ring  = "Eihwaz Ring", -- 5
        waist       = "Kasiri Belt", -- 3
        back        = Capes.Enmity -- 10
    }
    sets.precast = {}
    sets.precast.FC = { -- 66
        ammo        = "Sapience Orb", --2
        head        = { name="Herculean Helm", augments={'"Fast Cast"+6',}}, -- 13
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}}, -- 9
        hands       = "Leyline Gloves", --7
        legs        = "Rawhide Trousers", --5
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}}, --5
        neck        = "Orunmila's Torque", --5
        left_ear    = "Loquacious Earring", --2
        right_ear   = "Enchntr. Earring +1", --2
        left_ring   = "Kishar Ring", --4
        right_ring  = "Prolix Ring", -- 2
        waist       = "Sailfi Belt +1",
        back        = Capes.FC -- 10
    }
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { neck="Magoraga Beads", body="Mochizuki Chainmail +3" })
    sets.precast.JA = { }
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.WS = {
        ammo        = "Seeth. Bomblet +1",
        head        = "Hachiya Hatsu. +3",
        head        = "Ken. Jinpachi +1",
        body        = "Ken. Samue +1",
        hands       = "Ken. Tekko +1",
        legs        = "Samnuha Tights",
        feet        = "Ken. Sune-Ate +1",
        left_ear    = "Moonshade Earring",
        right_ear   = "Ishvara Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        back        = Capes.DEX
    }
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
        ammo        = "C. Palug Stone", -- "Aurgelmir Orb + 1",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = "Jokushu Haidate", -- { name="Rao Haidate +1", augments={'STR+12','DEX+12','Attack+20',}},
        feet        = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
        left_ear    = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Regal Ring",
        back        = Capes.DEX 
	})
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        ammo        = "Yetshila +1",
        head        = "Hachiya Hatsu. +3",
        body        = "Ken. Samue +1",
        hands       = "Mummu Wrists +2", -- { name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
        legs        = "Mummu Kecks +2", -- { name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
        feet        = "Mummu Gamash. +2", -- { name="Adhe. Gamashes +1", augments={'STR+12','DEX+12','Attack+20',}},
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Regal Ring",
        left_ear    = "Odr Earring",
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
        back        = Capes.AGI
	})
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, {
        ammo        = { name="Seeth. Bomblet +1", augments={'Path: A',}},
		head        = "Hachiya Hatsu. +3",
		body        = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs        = { name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		--feet        = { name="Ryuo Sune-Ate +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
		waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear    = "Brutal Earring",
		right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
		left_ring   = "Gere Ring",
		right_ring  = "Epona's Ring",
		back        = Capes.STR
    })
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
		ammo        = { name="Seeth. Bomblet +1", augments={'Path: A',}},
		head        = "Hachiya Hatsu. +3",
		body        = { name="Agony Jerkin +1", augments={'Path: A',}},
		hands       = { name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs        = { name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet        = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
		waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear    = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
		left_ring   = "Gere Ring",
		right_ring  = "Regal Ring",
		back        = Capes.STR
    })
    sets.midcast = {}
    sets.midcast.SIRD = { }
    sets.midcast.Utsusemi = set_combine(sets.precast.SIRD, { feet="Hattori Kyahan +1", })
    sets.midcast.Migawari = set_combine(sets.precast.SIRD, { body="Hattori Ningi +1", })
    sets.midcast.Elemental = { }
    sets.midcast.Elemental.Burst = { }
    sets.midcast.Enfeebling = { }
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        ammo        = "Seki Shuriken",
        head        = "Ken. Jinpachi +1",
        body        = "Ken. Samue +1",
        hands       =  { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs		= "Ken. Hakama +1",
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Cessance Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Gere Ring",
        right_ring  = "Epona's Ring",
        waist       = "Sailfi Belt +1",
        back        = Capes.DA,
    }
    sets.aftercast.Engaged.DW = { -- Current: 38
        ammo        = "Seki Shuriken",
		head        = "Ryuo Somen +1", -- 9
		body        = { name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}}, -- 9
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs		= { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet		= "Hiza. Sune-Ate +2", -- 8
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Cessance Earring", -- Suppanomimi -- 5
        right_ear   = "Eabani Earring", --5
        left_ring   = "Gere Ring",
        right_ring  = "Epona's Ring",
        waist       = "Reiki Yotai", -- 7 -- Gerdr Belt +1 -- 4
        back        = Capes.STP -- DEX STP
    }
    sets.aftercast.Idle = {  -- 65/61
        ammo        = "Staunch Tathlum +1", -- 3/3
        head        = "Malignance Chapeau",  -- 6/6
        body        = "Malignance Tabard",  -- 9/9
        hands       = "Malignance Gloves",  -- 5/5
        legs        = "Malignance Tights",  -- 7/7
        feet        = "Malignance Boots",  -- 4/4
        neck		= "Loricate Torque +1", -- 6/6
        waist		= "Flume Belt +1", -- 4/0
        left_ear	= "Genmei Earring", -- 2/0
        right_ear	= "Odnowa Earring +1", -- 3/5
        left_ring	= "Defending Ring", -- 10/10
        right_ring	= "Karieyh Ring",
        back		= "Moonlight Cape" -- 6/6
    }
end

function precast(spell,action)    
	local target = player.target.id
	if target ~= last_target then
		ws_order = 1
		last_target = target
	end

    if spell.type == 'WeaponSkill' then
		if spell.name == AutoWS and AWSEnabled == true then
			cancel_spell()
			send_command('@input /ws "'..WeaponSkills[ws_order]..'" '..spell.target.raw)
			ws_order = ws_order + 1
			if ws_order > table.getn(WeaponSkills) then
				ws_order = 1
			end
			return
        end
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end    
    elseif spell.action_type == 'Magic' then
        if sets.precast.FC[spell.name] then
            equip(sets.precast.FC[spell.name])
        elseif sets.precast.FC[spell.skill] then
            equip(sets.precast.FC[spell.skill])
        else
            equip(sets.precast.FC)
        end
    end
end

function midcast(spell,action)
    if spell.action_type == 'Magic' then
        if spell.english:startswith('Migawari') then
            equip(sets.midcast.Migawari)
        elseif spell.english:startswith('Utsusemi') then
            equip(sets.midcast.Utsusemi)
        else
            equip(sets.midcast.SIRD)
        end
    end
end

function aftercast(spell,action)
    if player.status == 'Engaged' then
        equip(sets.aftercast.Engaged)
    else
        equip(sets.aftercast.Idle)
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.aftercast.Idle)
    elseif new == 'Engaged' then
        equip(sets.aftercast.Engaged)
    end
end

function buff_change(buff,gain)
    
end

function self_command(commandArgs)
    local originalCommand = commandArgs
    if type(commandArgs) == 'string' then
        commandArgs = T(commandArgs:split(' '))
        if #commandArgs == 0 then
            return
        end
    end
    if commandArgs[1] == 'SwapGear' then
        SwapGear()
    end
end

function SwapGear()
    if player.status == 'Engaged' then
        equip(sets.aftercast.Engaged)
    else
        equip(sets.aftercast.Idle)
    end
end

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
	mov.x = windower.ffxi.get_mob_by_index(player.index).x
	mov.y = windower.ffxi.get_mob_by_index(player.index).y
	mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
 
moving = false
windower.raw_register_event('prerender',function()
	mov.counter = mov.counter + 1;
	if mov.counter>15 then
		local pl = windower.ffxi.get_mob_by_index(player.index)
		if pl and pl.x and mov.x then
			dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
			if dist > 1 and not moving then
				if player.status ~= 'Engaged' then
					send_command('gs equip sets.MoveSpeed')
				end
				moving = true
			elseif dist < 1 and moving then
				if player.status ~= 'Engaged' then
					send_command('gs c SwapGear')
				end
				moving = false
			end
		end
		if pl and pl.x then
			mov.x = pl.x
			mov.y = pl.y
			mov.z = pl.z
		end
		mov.counter = 0
	end
end)