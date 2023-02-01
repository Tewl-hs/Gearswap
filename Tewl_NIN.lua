--[[
    Author: Tewl / Bismarck
]]
function get_sets()	
    items = require('resources').items
    require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')
    -- Personal settings. You can remove these two lines.
    set_macros(10,1)
    send_command('wait 1;input /lockstyleset 16')
	send_command('input //equipviewer pos 1663 935') 

    send_command('bind ^f9 gs c cycl engaged')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c toggle burst')
    
	send_command('bind !f10 gs c toggle autosc') 

    BurstMode = false

    AutoSC = false
	ascWS = 'Blade: Ei'
	AutoSkillChain = T{'Blade: To', 'Blade: Teki'} -- Skillchain order
	asc_order = 1
	last_target = nil

    MainWeapon = 'Heishi Shorinken'
    SubWeapon = 'Kunimitsu'

    Capes = {}
    Capes.EVA  = { name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Damage taken-5%',}}
    Capes.AGI = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10','Damage taken-5%',}}
    Capes.DEX = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Capes.FC  = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.STR = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
    Capes.STP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
    Capes.Enmity ={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Damage taken-5%',}}
    Capes.MAB = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}

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
        back        = Capes.Enmity
    }
    sets.precast.JA = {
        ['Mijin Gakure'] = {
            legs    = "Mochi.  Hakama +3",
        }
    }
    sets.precast = {}
    sets.precast.FC = { -- 67%
        ammo        = "Sapience Orb", --2
        head        = { name="Herculean Helm", augments={'"Fast Cast"+6',}}, -- 13
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}}, -- 9
        hands       = "Leyline Gloves", --8
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
        ammo        = { name="Seeth. Bomblet +1", augments={'Path: A',}},
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
        feet        = "Hattori Kyahan +3",
		left_ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear   = "Ishvara Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring +1",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        back        = Capes.DEX
    }
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, {
        ammo        = "Crepuscular Pebble",
        head        = { name="Blistering Sallet +1", augments={'Path: A',}},
        body        = "Malignance Tabard",
        hands       = "Malignance Gloves",
        legs        = { name="Mpaca's Hose", augments={'Path: A',}},
        feet        = "Hattori Kyahan +3",
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Brutal Earring",
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Regal Ring",
    })
    sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS, {
        head        = "Mochi. Hatsuburi +3",
		feet		= "Nyame Sollerets",
        neck        = "Ninja Nodowa +2",
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        waist       = "Orpheus's Sash",
        back        = Capes.STR
    })
    sets.precast.WS['Blade: Ei'] = set_combine(sets.precast.WS, { })
    sets.precast.WS['Blade: To'] = set_combine(sets.precast.WS['Blade: Chi'], { })
    sets.precast.WS['Blade: Teki'] = set_combine(sets.precast.WS['Blade: Chi'], { })
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
        ammo        = "Crepuscular Pebble",
        head        = "Ken. Jinpachi +1",
        body        = "Malignance Tabard",
        hands       = "Malignance Gloves",
        legs        = { name="Mpaca's Hose", augments={'Path: A',}},
        feet        = "Ken. Sune-Ate +1",
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
		left_ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Regal Ring",
        waist       = "Fotia Belt",
        back        = Capes.DEX
	})
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        ammo        = "Yetshila +1",
        head        = { name="Nyame Helm", augments={'Path: B',}},
        body        = { name="Nyame Mail", augments={'Path: B',}},
        hands       = { name="Nyame Gauntlets", augments={'Path: B',}},
        legs        = { name="Nyame Flanchard", augments={'Path: B',}},
        feet        = "Hattori Kyahan +3",
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear    = "Odr Earring",
        right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Regal Ring",
        back        = Capes.AGI -- { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}}
	})
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
        ammo        = "Crepuscular Pebble",
		head        = "Hachiya Hatsu. +3",
        body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        legs        = { name="Mpaca's Hose", augments={'Path: A',}},
        feet        = "Hattori Kyahan +3",
		neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
		waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear   = { name="Lugra Earring +1", augments={'Path: A',}},
		left_ring   = "Gere Ring",
		right_ring  = "Regal Ring",
		back        = Capes.STR
    })
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS['Blade: Ten'], {
		left_ear    = "Brutal Earring",
    })
    sets.midcast = {}
    sets.midcast.SIRD = { -- 116%
        ammo        = "Staunch Tathlum +1", -- 11
        head        = { name="Taeon Chapeau", augments={'DEF+11','Spell interruption rate down -10%','HP+35',}}, -- 10
        body        = { name="Taeon Tabard", augments={'Spell interruption rate down -9%',}}, -- 9
        hands       = "Rawhide Gloves", -- 15
        legs        = { name="Taeon Tights", augments={'Spell interruption rate down -9%',}}, -- 9
        feet        = { name="Taeon Boots", augments={'DEF+12','Spell interruption rate down -9%','HP+36',}}, -- 9
        neck        = "Moonlight Necklace", -- 15
        waist       = "Audumbla Sash", -- 10
        left_ear    = "Halasz Earring", -- 5
        right_ear   = "Magnetic Earring", -- 8
        left_ring   = "Defending Ring",
        right_ring  = "Evanescence Ring", -- 5
        back        = Capes.FC --  10
    }
    sets.midcast.Utsusemi = set_combine(sets.precast.SIRD, { feet="Hattori Kyahan +3", })
    sets.midcast.Migawari = set_combine(sets.precast.SIRD, { body="Hattori Ningi +3", })
    sets.midcast.Ninjitsu = set_combine(sets.precast.SIRD, { })
    sets.midcast.Ninjitsu.Enhancing = set_combine(sets.precast.SIRD, { }) -- Not sure if this set even needs to exist
    sets.midcast.Ninjitsu.Elemental = { 
        ammo        = { name="Ghastly Tathlum +1", augments={'Path: A',}},
		head        = { name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body        = "Nyame Mail",
		hands       = "Nyame Gauntlets",
		legs        = "Nyame Flanchard",
		feet        = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck        = "Sibyl Scarf",
		waist       = "Orpheus's Sash",
		left_ear    = "Hermetic Earring", -- "Crematio Earring",
		right_ear   = "Friomisi Earring",
        left_ring	= "Mujin Band",
		right_ring  = { name="Metamor. Ring +1", augments={'Path: A',}},
		back        = Capes.MAB
    }
    sets.midcast.Ninjitsu.Elemental.Burst = set_combine(sets.midcast.Ninjitsu.Elemental, {
        hands       = "Hattori Tekko +3",
    })
    sets.midcast.Ninjitsu.Enfeebling = {
        ammo        = "Yamarang",
		head        = "Hachiya Hatsu. +3",
		body        = "Malignance Tabard",
		hands       = "Malignance Gloves",
		legs        = "Malignance Tights",
		feet        = "Hachiya Kyahan +3",
		neck        = "Incanter's Torque",
		left_ear    = "Digni. Earring",
		right_ear   = "Hnoss Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring  = { name="Metamor. Ring +1", augments={'Path: A',}},
		waist       = "Eschan Stone",
		back        = Capes.FC
     }
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        ammo        = "Seki Shuriken",
        head		= "Malignance Chapeau",
        body		= "Tatena. Harama. +1",
        hands		= { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = "Samnuha Tights", 
        feet        = "Malignance Boots", 
        neck        = { name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear    = "Dedition Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Gere Ring",
        right_ring  = "Epona's Ring",
        waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
        back        = Capes.STP
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
        back        = Capes.STP
    }
    sets.aftercast.Idle = {  -- 65/61
        ammo        = "Staunch Tathlum +1", -- 3/3
        head		= "Mpaca's Cap",
        body		= "Mpaca's Doublet",
        hands		= "Mpaca's Gloves",
        legs        = "Mpaca's Hose", 
        feet        = "Mpaca's Boots", 
        neck		= { name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
        waist		= "Flume Belt +1", -- 4/0
        left_ear	= "Genmei Earring", -- 2/0
        right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}}, -- 3/5
        left_ring	= "Defending Ring", -- 10/10
        right_ring	= "Karieyh Ring +1",
        back		= "Moonlight Cape" -- 6/6
    }
    
    include('FFXI-Display.lua')	
    equip_change()
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
end

function precast(spell,action)    
    if spell.interrupted == true or (spell.target.hpp == 0  and not spell.name:startswith("Raise")) or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end
    
	local target = player.target.id
	if target ~= last_target then
		ws_order = 1
		last_target = target
	end

	if spell.type == 'WeaponSkill' then
		if (spell.target.model_size + spell.range * range_mult[spell.range]) < spell.target.distance then
            add_to_chat(123,'['..spell.name..'] Target out of range.')
			cancel_spell()
			return
		end
		if spell.name == ascWS and AutoSC == true then
			cancel_spell()
			send_command('@input /ws "'..AutoSkillChain[asc_order]..'" '..spell.target.raw)
			asc_order = asc_order + 1
			if asc_order > table.getn(AutoSkillChain) then
				asc_order = 1
			end
			return
		end
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
			cancel_spell()
            return
		end
        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end    
    elseif spell.action_type == 'Magic' then
        local spellCost = actual_cost(spell)
        if player.mp < spellCost then
            add_to_chat(123,'Unable to cast: Not enough MP. ('..player.mp..'/'..spellCost..')')
            cancel_spell()
            return
        end
        local spell_recasts = windower.ffxi.get_spell_recasts()
        local sr = math.floor(spell_recasts[spell.recast_id]/60)
        if sr > 0 then
			cancel_spell()
			add_to_chat(123,'['..spell.name..'] '..disp_time(sr))
            return
        end
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
        if spell.skill == 'Ninjitsu' then
            if spell.english:startswith('Migawari') then
                equip(sets.midcast.Migawari)
            elseif spell.english:startswith('Utsusemi') then
                equip(sets.midcast.Utsusemi)
            elseif EnfNinjitsu:contains(spell.english) then
                equip(sets.midcast.Enfeebling)
            elseif EnhNinjitsu:contains(spell.english) then
                equip(sets.midcast.Enhancing)
            elseif EleNinjitsu:contains(spell.english) then
                if buffactive("Futae") or BurstMode == true then
                    equip(sets.midcast.Ninjitsu.Elemental.Burst)
                else
                    equip(sets.midcast.Ninjitsu.Elemental)
                end
            else
                equip(sets.midcast.SIRD)
            end
        end
    elseif sets.midcast[spell.skill] and sets.midcast[spell.skill][spell.name] then
        equip(sets.midcast[spell.skill][spell.name])
    elseif sets.midcast[spell.skill] then
        equip(sets.midcast[spell.skill])
    end
end

function aftercast(spell,action)
    equip_check()
end

function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
end

function buff_change(buff,gain)
    if name == "silence" and gain =="True" then
        if player.inventory['Echo Drops'] then
            send_command('@input /item "Echo Drops" <me>')
        else
            add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
        end
    end
end

function equip_check()
    local eq = {}
    if player.status == 'Engaged' then
        if egs ~= nil and sets.aftercast.Engaged[egs] then 
            eq = sets.aftercast.Engaged[egs]
        else
            egs = nil
            eq = sets.aftercast.Engaged
        end
    else
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            eq = sets.aftercast.Idle[ids]
        else
            ids = nil
            eq = sets.aftercast.Idle
        end
    end
    equip(set_combine(eq,{main=MainWeapon,sub=SubWeapon}))
	update_status()
end

function self_command(cmd)
    local args = T(cmd:split(' '))
    if args[1] == 'cycle' and args[2] then
        if args[2] == 'idle' then
            local last_ids = ids 
            for k,v in pairs(sets.aftercast.Idle) do
                if slot_names:contains(k) then
                    -- do nothing
                elseif ids == nil then
                    ids = k
                    break
                elseif ids == k then
                    ids = nil
                end
            end
            if last_ids == ids then ids = nil end
            if ids == nil then 
                add_to_chat('Idle mode set to: Default')
            else
                add_to_chat('Idle mode set to: '..ids)
            end
            equip_check()
        elseif args[2] == 'engaged' then
            local last_egs = egs 
            for k,v in pairs(sets.aftercast.Engaged) do
                if slot_names:contains(k) then
                    -- do nothing
                elseif egs == nil then
                    egs = k
                    break
                elseif egs == k then
                    egs = nil
                end
            end
            if last_egs == egs then egs = nil end
            if egs == nil then 
                add_to_chat('Engaged mode set to: Default')
            else
                add_to_chat('Engaged mode set to: '..egs)
            end
            equip_check()
        end
		update_status()
    elseif args[1] == 'toggle' and args[2] then
        if args[2] == 'burst' then
            if BurstMode == false then
                BurstMode = true
                add_to_chat('BurstMode enabled.')
            else
                BurstMode = false
                add_to_chat('BurstMode disabled.')
            end        
		elseif args[2] == 'autosc' then
			if AutoSC == false then
				AutoSC = true
			else
				AutoSC = false
			end
        end
		update_status()
    elseif args[1] == 'movement' then
        if world.time >= 17*60 or world.time < 7*60 then
            equip({feet="Hachiya Kyahan +3"})
        else
            equip({feet="Danzo Sune-Ate"})
        end
    elseif args[1] == 'equip_check' then
        equip_check()
	elseif args[1] == 'update_status' then
		update_status()
    end
end

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	local sitem = windower.ffxi.get_items(equipment["sub_bag"],equipment["sub"])
	if (item and items[item['id']]) and (sitem and items[sitem['id']]) then 
		local mw = items[item['id']].name
        local sw = items[sitem['id']].name
		if mw ~= MainWeapon then 
			if mw == 'Gil' then -- No idea why? 
				MainWeapon = 'Empty'
				TwoHandedWeapon = false
			else
                if T{4,6,7,8,10,12}:contains(items[item['id']].skill) then -- GS GA Scythe Polearm GK Staff
					TwoHandedWeapon = true
				else 
					TwoHandedWeapon = false	
                end
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
        update_status()
	end
end

function update_status()
	local spc = '   '
    local WeaponColor = get_weapon_color(MainWeapon)
    local SubColor = get_weapon_color(SubWeapon)

    local engaged_display = egs or 'Default'
    local idle_display = ids or 'Default'

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s%s%s%s%s", WeaponColor, MainWeapon, Colors.White,' / ',SubColor,SubWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)
	
	if BurstMode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'BurstMode', spc)
	end
    
	if AutoSC == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'AutoSC: ', Colors.Yellow, ascWS, spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then
		stateBox:hide()
	end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then
		stateBox:show()
	end
	if id == 0x050 then
		equip_change()
	end
end)