function get_sets()	
	items = require('resources').items
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

    -- Display stuff
	EngagedMode = {'Normal'}
	e = 1 -- Which set for initial setup in array.
	IdleMode = {'Normal'}
	i = 1

    MainWeapon = 'Kannagi'
    SubWeapon = 'Ternion Dagger +1'

	Colors = {
		Yellow = '\\cs(255,192,0)',
		Red = '\\cs(255,80,80)',
		Green = '\\cs(110,255,110)',
		Blue = '\\cs(140,160,255)',
		Gray = '\\cs(96,96,96)',
		White = '\\cs(255,255,255)'
	} 

    ElementalSpells = T{'Katon: Ichi', 'Katon: Ni', 'Katon: San', 'Hyoton: Ichi', 'Hyoton: Ni', 'Hyoton: San', 'Huton: Ichi', 'Huton: Ni', 'Huton: San',
                    'Doton: Ichi', 'Doton: Ni', 'Doton: San', 'Raiton: Ichi', 'Raiton: ni', 'Raiton: San', 'Suiton: Ichi', 'Suiton: Ni', 'Suiton: San'}
    EnfeeblingSpells = T{'Aisha: Ichi', 'Jubaku: Ichi', 'Hojo: Ichi', 'Hojo: Ni', 'Kurayami: Ichi', 'Kurayami: Ni', 'Dokumori: Ichi', 'Yurin: Ichi'}
    EnhancingSpells= T{'Tonko: Ichi', 'Tonko: Ni', 'Monomi: Ichi', 'Utsusemi: Ichi', 'Utsusemi: Ni', 'Utsusemi: San', 'Gekka: Ichi', 'Yain: Ichi', 'Myoshu: Ichi', 'Kakka: Ichi', 'Migawari: Ichi'}

    DualWield = {'None', 'Low (20)', 'High (40)'}

    sets.MoveSpeed = { feet = "Danzo Sune-Ate",} 

    Capes = {}
    Capes.DA = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Capes.STP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
    Capes.FC = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.Enmity = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Damage taken-5%',}}
    Capes.DEX = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%'}}
    Capes.AGI = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
    Capes.STR = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
    Capes.EVA = { name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Evasion+15','Damage taken-5%',}}
    Capes.MAB = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}} -- Need

    sets.Enmity = {
        ammo        = "Date Shuriken", -- 3
        body        = "Emet Harness +1", -- 10
        hands       = "Kurys Gloves", -- 9
        feet        = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}}, -- 8
        neck        = "Moonlight Necklace", -- 15
        right_ring  = "Cryptic Earring", -- 4
        left_ring   = "Trux Earring", -- 5
        right_ring  = "Eihwaz Ring", -- 5
        waist       = "Kasiri Belt", -- 3
        back        = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Damage taken-5%',}} -- 10
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
        back        = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
    }
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { neck="Magoraga Beads", body="Mochizuki Chainmail +3" })
    sets.precast.JA = { }
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.WS = {
        ammo        = { name="Seeth. Bomblet +1", augments={'Path: A',}},
		head		= "Nyame Helm", --head        = "Hachiya Hatsu. +3",
		body		= "Nyame Mail", -- body        = "Ken. Samue +1",
		hands		= "Nyame Gauntlets", -- hands       = "Ken. Tekko +1",
		legs		= "Nyame Flanchard", -- legs        = { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet		= "Nyame Sollerets", -- feet        = "Ken. Sune-Ate +1",
        left_ear    = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear   = "Ishvara Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring +1",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        back        = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%'}}
    }
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
        ammo        = "C. Palug Stone", -- "Aurgelmir Orb + 1", -- { name="Seeth. Bomblet +1", augments={'Path: A',}}, 
        head        = "Ken. Jinpachi +1", -- { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Tatena. Harama. +1", augments={'Path: A',}}, -- { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands       = { name="Tatena. Gote +1", augments={'Path: A',}}, --{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = { name="Tatena. Haidate +1", augments={'Path: A',}}, -- "Jokushu Haidate", -- { name="Rao Haidate +1", augments={'STR+12','DEX+12','Attack+20',}},
        feet        = "Ken. Sune-Ate +1", -- { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Odr Earring", -- { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Ilabrat Ring",
        right_ring  = "Regal Ring",
        waist       = "Fotia Belt",
        back        = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%'}}
	})
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        ammo        = "Yetshila +1",
        --head        = "Hachiya Hatsu. +3", -- { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        --body        = "Ken. Samue +1",
        --hands       = "Mummu Wrists +2", -- { name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
        --legs        = { name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
        --feet        = "Mummu Gamash. +2", -- { name="Adhe. Gamashes +1", augments={'STR+12','DEX+12','Attack+20',}},
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Odr Earring", -- "Cessance Earring", 
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Gere Ring", -- "Epaminondas's Ring", -- "Gere Ring",
        right_ring  = "Regal Ring",
        waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
        back        = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}}
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
		back        = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    })
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
		ammo		= "Aurgelmir Orb +1",
		--ammo        = { name="Seeth. Bomblet +1", augments={'Path: A',}},
		--head        = "Hachiya Hatsu. +3",
		--body        = { name="Agony Jerkin +1", augments={'Path: A',}},
		--hands       = { name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		--legs        = { name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		--feet        = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
		waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear    = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
		left_ring   = "Gere Ring",
		right_ring  = "Regal Ring",
		back        = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    })
    sets.midcast = {}
    sets.midcast.SIRD = { }
    sets.midcast.Utsusemi = set_combine(sets.precast.SIRD, { feet="Hattori Kyahan +1", })
    sets.midcast.Migawari = set_combine(sets.precast.SIRD, { body="Hattori Ningi +1", })
    sets.midcast.Enhancing = { }
    sets.midcast.Elemental = { 
        ammo        = { name="Ghastly Tathlum +1", augments={'Path: A',}},
		head        = { name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body        = "Nyame Mail",
		hands       = "Nyame Gauntlets",
		legs        = "Nyame Flanchard",
		feet        = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck        = "Sanctity Necklace",
		waist       = "Orpheus's Sash",
		left_ear    = "Crematio Earring",
		right_ear   = "Friomisi Earring",
		left_ring   = "Stikini Ring +1",
		right_ring  = { name="Metamor. Ring +1", augments={'Path: A',}},
		back        = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }
    sets.midcast.Elemental.Burst = { }
    sets.midcast.Enfeebling = {
        ammo        = "Yamarang",
		head        = "Hachiya Hatsu. +3",
		body        = "Malignance Tabard",
		hands       = "Malignance Gloves",
		legs        = "Malignance Tights",
		feet        = "Hachiya Kyahan +3",
		neck        = "Incanter's Torque",
		left_ear    = "Digni. Earring",
		right_ear   = "Hnoss Earring",
		left_ring   = "Stikini Ring +1",
		right_ring  = { name="Metamor. Ring +1", augments={'Path: A',}},
		waist       = "Eschan Stone",
		back        = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
     }
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        ammo        = "Date Shuriken",
        --head        = "Ken. Jinpachi +1",
        head        = "Adhemar Bonnet +1",
        body        = "Ken. Samue +1",
        hands       = "Tatena. Gote +1",
        --hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs		= "Ken. Hakama +1",
        --feet        = "Ken. Sune-Ate +1",
        feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Cessance Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Gere Ring",
        right_ring  = "Epona's Ring",
        waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
        back        = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    sets.aftercast.Engaged.DW = { -- Current: 43
        ammo        = "Date Shuriken",
		head        = { name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}}, -- 9
		body        = { name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}}, -- 9
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs		= { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet		= "Hiza. Sune-Ate +2", -- 8
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Suppanomimi", -- 5
        right_ear   = "Eabani Earring", --5
        left_ring   = "Gere Ring",
        right_ring  = "Epona's Ring",
        waist       = "Reiki Yotai", -- 7 -- Gerdr Belt +1 -- 4
        back        = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}} 
    }
    sets.aftercast.Idle = {  -- 65/61
        ammo        = "Staunch Tathlum +1", -- 3/3
        head        = "Malignance Chapeau",  -- 6/6
        body        = "Malignance Tabard",  -- 9/9
        hands       = "Malignance Gloves",  -- 5/5
        legs        = "Malignance Tights",  -- 7/7
        feet        = "Malignance Boots",  -- 4/4
        neck		= { name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
        waist		= "Flume Belt +1", -- 4/0
        left_ear	= "Genmei Earring", -- 2/0
        right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}}, -- 3/5
        left_ring	= "Defending Ring", -- 10/10
        right_ring	= "Karieyh Ring +1",
        back		= "Moonlight Cape" -- 6/6
    }
    
	texts = require('texts')
	if stateBox then stateBox:destroy() end

	local settings = windower.get_windower_settings()
	local x,y
    
	-- Adjust for screen resolution and positon of text on screen
	if settings["ui_x_res"] == 1920 and settings["ui_y_res"] == 1080 then
		x,y = settings["ui_x_res"]-1917, settings["ui_y_res"]-18 -- -285, -18
	else
		x,y = 0, settings["ui_y_res"]-17 -- -285, -18
	end

	stateBox = texts.new({flags = {draggable=false}})
	stateBox:pos(x,y)
	stateBox:font('Arial')
	stateBox:size(12)
	stateBox:bold(true)
	stateBox:bg_alpha(0)--128
	stateBox:right_justified(false)
	stateBox:stroke_width(2)
	stateBox:stroke_transparency(192)

	update_status()
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
        elseif EnfeeblingSpells:contains(spell.english) then
            equip(sets.midcast.Enfeebling)
        elseif EnhancingSpells:contains(spell.english) then
            equip(sets.midcast.Enhancing)
        elseif ElementalSpells:contains(spell.english) then
            equip(sets.midcast.Elemental)
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

function equip_check()
	local eq = {}
	if player.status == 'Engaged' then	
		eq = set_combine(sets.aftercast.Engaged.Normal, {main=MainWeapon,sub=SubWeapon})
		if acc_mode == true and sets.aftercast.Engaged[EngagedMode[e]].Accuracy then
			eq = set_combine(sets.aftercast.Engaged[EngagedMode[e]].Accuracy, {main=MainWeapon,sub=SubWeapon})
		elseif sets.aftercast.Engaged[EngagedMode[e]] then
			eq = set_combine(sets.Engaged[EngagedMode[e]], {main=MainWeapon,sub=SubWeapon})
		end
	else
		eq = set_combine(sets.aftercast.Idle.Normal, {main=MainWeapon,sub=SubWeapon})
		if sets.aftercast.Idle[IdleMode[i]] then
			eq = set_combine(sets.aftercast.Idle[IdleMode[i]], {main=MainWeapon,sub=SubWeapon})
		end
	end
	equip(eq)
	update_status()
end

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	local sitem = windower.ffxi.get_items(equipment["main_bag"],equipment["sub"])
	if (item and items[item['id']]) and (sitem and items[sitem['id']]) then 
		local mw = items[item['id']].name
        local sw = items[sitem['id']].name
		if mw ~= MainWeapon then 
			if mw == 'Gil' then -- No idea why? 
				MainWeapon = 'Empty'
			else
				MainWeapon = mw
			end	
		end
        if sw ~= SubWeapon then 
			if sw == 'Gil' then -- No idea why? 
				SubWeapon = 'Empty'
			else
				SubWeapon = sw
			end	
		end
		equip_check()
	end
end

function update_status()
	local spc = '   '

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", Colors.White, MainWeapon..' / '..SubWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, EngagedMode[e], spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, IdleMode[i], spc)

	if acc_mode == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Accuracy: ',  Colors.Yellow, 'High', spc)
	else
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Accuracy: ',  Colors.Blue, 'Normal', spc)
	end
	
	if range_mode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Ranged', spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then
		stateBox:hide()
	end
	if (id == 0x1A or id == 0x50) then
		equip_change()
	end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then
		stateBox:show()
	end
	if (id == 0x37 or id == 0x1D) then
		equip_change()
	end
end)

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