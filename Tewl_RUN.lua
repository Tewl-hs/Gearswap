--[[
	Author: Tewl / Bismark
	Files: Tewl_RUN.lua 
--]]

function get_sets()    
    items = require('resources').items
    require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')
    -- Personal settings. You can remove these lines.
    load_macros() -- Edit function on line:356  
    send_command('wait 1;input /lockstyleset 13')
    send_command('input //equipviewer pos 1663 934')

    send_command('bind ^f9 gs c cycle idle')
    send_command('bind ^f10 gs c cycle engaged')

    sets.MoveSpeed = { legs = "Carmine Cuisses +1",} 

    -- Blue spells
    BlueSpells = T{'Grand Slam', 'Terror Touch', 'Healing Breeze', 'Cocoon', 'Pollen', 'Wild Carrot', 'Blank Gaze', 'Geist Wall', 'Soporific', 'Jettatura', 'Sheep Song', 'Metallic Body'}

    EnmitySpells = T{'Foil', 'Flash', 'Stun'}

    CurrentWeapon = ''
    
    -- Augmented Gear
    Capes = {}
    Capes.Enmity = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
    Capes.SIRD = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.DA = { name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    Capes.MAB = { name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
    Capes.WSD = { name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}

    sets.Enmity = {
        head        = "Halitus Helm",
        body        = "Emet Harness +1",
        hands       = "Kurys Gloves",
        legs        = "Eri. Leg Guards +3",
        feet        = "Erilaz Greaves +3",
        neck        = "Moonlight Necklace",
        waist       = "Kasiri Belt",
        left_ear    = "Cryptic Earring",
        right_ear   = "Trux Earring",
        left_ring   = "Eihwaz Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    }
    sets.Enmity['Foil'] = set_combine(sets.Enmity, {        
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Nyame Sollerets",
    })
    sets.Enmity.SIRD = { -- 106
        ammo        = "Staunch Tathlum +1", -- 11
        head        = "Erilaz Galea +3", -- 20
        body        = { name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands       = "Rawhide Gloves", -- 15
        legs        = "Carmine Cuisses +1", -- 20
        feet        = "Erilaz Greaves +3",
        neck        = "Moonlight Necklace", -- 15
        waist       = "Audumbla Sash", -- 10
        left_ear    = "Halasz Earring", -- 5
        right_ear   = "Trux Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD --  10
    }
    sets.precast = {}
    sets.precast.FC = {
        ammo        = "Sapience Orb",
        head        = "Carmine Mask +1",
        body        = "Erilaz Surcoat +3",
        hands       = "Leyline Gloves",
        legs        = "Aya. Cosciales +2",
        feet        = "Carmine Greaves +1",
        neck        = "Orunmila's Torque",
        waist       = "Audumbla Sash", 
        left_ear    = "Enchntr. Earring +1",
        right_ear   = "Loquac. Earring",
        left_ring   = "Kishar Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})

    sets.precast.JA = {
        ['Vivacious Pulse'] = {
            head        = "Erilaz Galea +3",
            legs        = "Rune. Trousers +1",
            neck        = "Incanter's Torque",
            left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
            right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        },
        ['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +3",legs="Futhark Trousers +3"}),
        ['Valiance'] = set_combine(sets.Enmity,{body="Runeist Coat +3",legs="Futhark Trousers +3"}),
        ['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Bottes +3"}),
        ['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"}),
        ['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"}),
        ['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons +3"}),
        ['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +3"}),
        ['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"}),
        ['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +3"}),
        ['Embolden'] = set_combine(sets.Enmity,{}),
        ['One For All'] = set_combine(sets.Enmity,{}),
        ['Provoke'] = set_combine(sets.Enmity, {}),
        ['Warcry'] = set_combine(sets.Enmity, {}),
        ['Animated Flourish'] = set_combine(sets.Enmity, {}),    
        ['Swipe'] = { 
            ammo        = "Seeth. Bomblet +1",
            head        = "Agwu's Cap",
            body        = "Agwu's Robe", 
            hands       = "Agwu's Gages",
            legs        = "Agwu's Slops",
            feet        = "Agwu's Pigaches",
            neck        = "Baetyl Pendant",
            waist       = "Orpheus's Sash",
            left_ear    = "Friomisi Earring",
            right_ear   = "Hermetic Earring",
            left_ring   = "Mujin Band",
            right_ring  = "Locus Ring",
            back        = Capes.MAB
        },
        ['Lunge'] = { 
            ammo        = "Seeth. Bomblet +1",
            head        = "Agwu's Cap",
            body        = "Agwu's Robe",
            hands       = "Agwu's Gages",
            legs        = "Agwu's Slops",
            feet        = "Agwu's Pigaches",
            neck        = "Baetyl Pendant",
            waist       = "Orpheus's Sash",
            left_ear    = "Friomisi Earring",
            right_ear   = "Hermetic Earring",
            left_ring   = "Mujin Band",
            right_ring  = "Locus Ring",
            back        = Capes.MAB
        },   
    }
    sets.precast.WS = {
        ammo        = "Knobkierrie",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Sherida Earring",
        left_ring   = "Ilabrat Ring",
        right_ring  = "Karieyh Ring +1",
        back        = Capes.DA
    }
    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		ammo        = "Knobkierrie",
		head        = "Nyame Helm",
		body        = "Nyame Mail",
		hands       = "Nyame Gauntlets",
		legs        = "Nyame Flanchard",
		feet        = "Nyame Sollerets",
		right_ring  = "Niqmaddu Ring",
		waist       = "Sailfi Belt +1",
		back      = Capes.WSD,
    })
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
        ammo        = "Seeth. Bomblet +1",
        head        = { name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        body        = { name="Lustr. Harness +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = "Meg. Chausses +2",
        feet        = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Niqmaddu Ring",
        back        = Capes.DA
    })
    sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS,{
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Nyame Sollerets",
        waist       = "Kentarch Belt +1",
        left_ear    = "Telos Earring",
        right_ear   = "Digni. Earring",
    })
    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS,{
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Nyame Sollerets",
        waist       = "Kentarch Belt +1",
        left_ear    = "Telos Earring",
        right_ear   = "Digni. Earring",
    })
    sets.midcast = {}
    sets.midcast['Healing Magic'] = {
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        hands       = "Erilaz Gauntlets +3",
        legs        = "Eri. Leg Guards +3",
        feet        = "Erilaz Greaves +3",
        neck        = "Incanter's Torque",
        left_ear    = "Odnowa Earring +1",
        right_ear   = "Tuisto Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        waist       = "Luminary Sash",
    }
    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'],{
        neck        = "Sacro Gorget",
        right_ear   = "Cryptic Earring",
        left_ring   = "Menelaus's Ring",
        right_ring  = "Eihwaz Ring",
        waist       = "Sroda Belt",
    })
    sets.midcast['Healing Magic'].SelfCure = set_combine(sets.midcast['Healing Magic'].Cure,{
        neck        = "Phalaina Locket",
        right_ear   = "Mendicant's Earring",
        right_ring  = "Kunaji Ring",
    })
    sets.midcast['Healing Magic'].Cursna = set_combine(sets.midcast['Healing Magic'],{
        body        = "Futhark Coat +3",
        hands       = "Nyame Gauntlets",
        neck        = "Nicander's Necklace",        
        left_ear    = "Odnowa Earring +1",
        right_ear   = "Eabani Earring",
        left_ring   = "Haoma's Ring",
        right_ring  = "Purity Ring",
        waist       = "Gishdubar Sash",
    })
    sets.midcast['Enhancing Magic'] = {
        ammo        = "Staunch Tathlum +1",
        head        = "Erilaz Galea +3",
        body        = "Nyame Mail",
        hands       = "Regal Gauntlets",
        legs        = "Futhark Trousers +3",
        feet        = "Carmine Greaves +1",
        neck        = "Incanter's Torque",
        left_ear    = "Odnowa Earring +1",
        right_ear   = "Tuisto Earring",
        right_ear   = "Mimir Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        waist       = "Olympus Sash",
        back        = "Moonlight Cape",
    }
    sets.midcast['Enhancing Magic']['Temper'] = set_combine(sets.midcast['Enhancing Magic'],{ 
        head        = "Carmine Mask +1",
        --body        = "Manasa Chasuble",
        hands       = "Runeist Mitons +3",
        legs        = "Carmine Cuisses +1",
        left_ear    = "Andoaa Earring",
    })
    sets.midcast['Enhancing Magic']['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
        ammo        = "Staunch Tathlum +1",
        head        = { name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
        hands       = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
        legs        = { name="Taeon Tights", augments={'"Fast Cast"+3','Phalanx +3',}},
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}},
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
    })
    sets.midcast['Enhancing Magic'].ProShell = set_combine(sets.midcast['Enhancing Magic'],{ 
        left_ear    = "Brachyura Earring",
    })
    sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'],{ 
		feet        = "Nyame Sollerets",
		waist       = "Gishdubar Sash",
    })
    sets.midcast['Enhancing Magic'].Regen = set_combine(sets.midcast['Enhancing Magic'], {
        head        = "Rune. Bandeau +2",
		feet        = "Nyame Sollerets",
        neck        = "Sacro Gorget",
        right_ear   = "Erilaz Earring +1",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        waist       = "Sroda Belt",
        back        = Capes.SIRD
    })
    
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Nyame Sollerets",
        neck        = "Futhark torque +2",
        waist       = "Engraved Belt",
        left_ear    = "Odnowa Earring +1",
        right_ear   = "Eabani Earring",
        left_ring   = "Shadow Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    }
    sets.aftercast.Engaged.DTLite = {
        ammo        = "Yamarang",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs        = "Meg. Chausses +2",
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
		neck        = "Futhark Torque +2",
		waist       = "Ioskeha Belt +1",
		left_ear    = "Telos Earring",
		right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.DA
    }
    sets.aftercast.Engaged.Hybrid = {
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Nyame Sollerets",
        neck        = "Anu Torque",
		waist       = "Ioskeha Belt +1",
		left_ear    = "Telos Earring",
		right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Niqmaddu Ring",
        back        = Capes.DA
    }
    sets.aftercast.Idle = {
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Runeist Coat +3", 
        --body        = "Nyame Mail",
        hands       = "Nyame Gauntlets",
        --legs        = "Eri. Leg Guards +3",
        legs        = "Nyame Flanchard",
        feet        = "Erilaz Greaves +3",
        neck        = "Futhark Torque +2",
        waist       = "Engraved Belt",
        --left_ear    = "Eabani Earring", 
        left_ear    = "Odnowa Earring +1",
		right_ear   = "Tuisto Earring",
        --right_ear   = "Erilaz Earring +1",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    } 
    
	include('FFXI-Display.lua')	
end
-- Set macros based on sub job
function load_macros()
	if player.sub_job == 'BLU' then
        coroutine.schedule(function() check_spells() end,2)
        set_macros(12,1)
    elseif player.sub_job == 'SCH' then
        set_macros(12,2)
    else
	    set_macros(12,1)
    end
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
end

function sub_job_change(new, old)
    if new == 'BLU' then
        coroutine.schedule(function() check_spells() end,2)
    end
end
    
function precast(spell,action)
	if spell.interrupted == true or (spell.target.hpp == 0  and not spell.name:startswith("Raise")) or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end        
    if spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123,'['..spell.name..'] Not enough TP.')
			cancel_spell()
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
        local spell_recasts = windower.ffxi.get_spell_recasts()
        local sr = math.floor(spell_recasts[spell.recast_id]/60)
        if sr > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..disp_time(sr))
            return
        end
        if sets.precast.FC[spell.name] then
            equip(sets.precast.FC[spell.name])
        else
            equip(sets.precast.FC)
        end
    end
end
    
function midcast(spell,action)
    if sets.Enmity[spell.name] then
        equip(sets.Enmity[spell.name])
    elseif EnmitySpells:contains(spell.name) then
        equip(sets.Enmity)
    elseif BlueSpells:contains(spell.name) then
        equip(sets.Enmity.SIRD)
    elseif spell.name:startswith('Regen') then
        equip(sets.midcast[spell.skill].Regen)
    elseif spell.name == 'Cursna' then
        equip(sets.midcast[spell.skill].Cursna)
    elseif spell.name:startswith('Cur') and spell.target.type == 'SELF' then
        equip(sets.midcast[spell.skill].SelfCure)
    elseif spell.name:startswith('Cur') then
        equip(sets.midcast[spell.skill].Cure)
    elseif spell.name:startswith('Shell') or spell.name:startswith('Protect') then
        equip(sets.midcast[spell.skill].ProShell)
    elseif sets.midcast[spell.skill] and sets.midcast[spell.skill][spell.name] then
        equip(sets.midcast[spell.skill][spell.name])
    elseif sets.midcast[spell.skill] then
        equip(sets.midcast[spell.skill])
    end
end
    
function aftercast(spell,action)
	if spell.name == 'Rayke' then
		windower.send_command('@timers c "Rayke" 35 up')
	end
	if spell.name == 'Gambit' then
		windower.send_command('@timers c "Gambit" 76 up')
	end
	equip_check()
end
    
function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
end
    
function buff_change(buff,gain)
    if buff == 'stun' and gain then
        equip_check()
	end
end

function equip_check()
    if player.status == 'Engaged' then
        if egs ~= nil and sets.aftercast.Engaged[egs] then 
            equip(sets.aftercast.Engaged[egs])
        else
            egs = nil
            equip(sets.aftercast.Engaged)
        end
    else
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            equip(sets.aftercast.Idle[ids])
        else
            ids = nil
            equip(sets.aftercast.Idle)
        end
    end
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
                add_to_chat('Idle mode set to: Normal')
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
                add_to_chat('Engaged mode set to: Normal')
            else
                add_to_chat('Engaged mode set to: '..egs)
            end
            equip_check()
        end
    elseif args[1] == 'toggle' and args[2] then
        --
    elseif args[1] == 'equip_check' then
        equip_check()
    end
    update_status()
end

function update_status()
	local spc = '   '
    local WeaponColor = get_weapon_color(CurrentWeapon)

    local engaged_display = egs or 'Default'
    local idle_display = ids or 'Default'

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)
	
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

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	if item and items[item['id']] then 
		local ew = items[item['id']].name
		if ew ~= CurrentWeapon then -- If weapon changed
			if ew == 'Gil' then
				CurrentWeapon = 'Empty'
				TwoHandedWeapon = false
				if auto_hasso == true then auto_hasso = false update_status() end
			else
				CurrentWeapon = ew
				if T{4,6,7,8,10,12}:contains(items[item['id']].skill) then -- GS GA Scythe Polearm GK Staff
					TwoHandedWeapon = true
				else 
					TwoHandedWeapon = false	
					if auto_hasso == true then auto_hasso = false update_status() end
				end
			end	
			update_status()
		end
	end
end