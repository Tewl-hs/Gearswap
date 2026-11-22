--[[
	Author: Tewl / Bismark
	Files: Tewl_RUN.lua 
--]]

local idle_mode = 'Normal'
local engaged_mode = 'Normal'
local next_engaged_mode = {Normal = 'DTLite', DTLite = 'Hybrid', Hybrid = 'Normal'}
local current_weapon = 'Empty'
local item_resources
local ability_timers = {Rayke = 35, Gambit = 76}

function get_sets()
    item_resources = require('resources').items
    items = item_resources
    require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')
    load_macros(player.sub_job)
    send_command('wait 1;input /lockstyleset 13')
    send_command('input //equipviewer pos 1663 934')

    send_command('bind ^f9 gs c cycle idle')
    send_command('bind ^f10 gs c cycle engaged')

    sets.MoveSpeed = {legs = 'Carmine Cuisses +1'}
    sets.Weapons = {
        epeolatry = {main = 'Epeolatry'},
        lionheart = {main = 'Lionheart'},
    }

    -- Blue spells
    BlueSpells = T{'Grand Slam', 'Terror Touch', 'Healing Breeze', 'Cocoon', 'Pollen', 'Wild Carrot', 'Blank Gaze', 'Geist Wall', 'Soporific', 'Jettatura', 'Sheep Song', 'Metallic Body'}

    EnmitySpells = T{'Foil', 'Flash', 'Stun'}


    -- Augmented Gear
    Capes = {}
    Capes.Enmity = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
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
    }
    sets.precast.JA.Lunge = sets.precast.JA.Swipe

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
        right_ring  = "Cornelia's Ring",
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
    sets.precast.WS.Upheaval = sets.precast.WS['Steel Cyclone']

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
        ammo        = "Homiliary",
        head        = "Turms Cap +1",
        body        = "Runeist Coat +3",
        hands       = "Regal Gauntlets",
        legs        = "Eri. Leg Guards +3",
        feet        = "Turms Leggings +1",
        neck        = "Bathy Choker +1",
        waist       = "Ioskeha Belt +1",
        left_ear    = "Eabani Earring", 
        right_ear   = "Erilaz Earring +1",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Erilaz Greaves +3",
        neck        = "Futhark Torque +2",
        waist       = "Engraved Belt",
        left_ear    = "Odnowa Earring +1",
		right_ear   = "Tuisto Earring",
    })

	load_blue_magic_spells(player.sub_job == 'BLU' and BlueSpells or nil, 'RUN', player.sub_job)
	include('FFXI-Display.lua')
end

function load_macros(sub_job)
    set_macros(12, sub_job == 'SCH' and 2 or 1)
end

function file_unload()
    cancel_blue_magic_load()
    send_command('unbind ^F9')
    send_command('unbind ^F10')
end

function sub_job_change(new)
    load_macros(new)
    load_blue_magic_spells(new == 'BLU' and BlueSpells or nil, 'RUN', new)
end

function precast(spell)
    if spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123, '[' .. spell.name .. '] Not enough TP.')
            cancel_spell()
            return
        end
        equip(sets.precast.WS[spell.name] or sets.precast.WS)
    elseif spell.action_type == 'Ability' then
        local ability_set = sets.precast.JA[spell.name]
        if ability_set then equip(ability_set) end
    elseif spell.action_type == 'Magic' then
        local recasts = windower.ffxi.get_spell_recasts()
        local remaining = recasts and recasts[spell.recast_id] or 0
        if remaining > 0 then
            cancel_spell()
            add_to_chat(121, '[' .. spell.name .. '] ' .. disp_time(math.ceil(remaining / 60)))
            return
        end
        local fast_cast = sets.precast.FC
        equip(fast_cast[spell.name] or fast_cast[spell.skill] or fast_cast)
    end
end

function midcast(spell)
    local name = spell.name
    if sets.Enmity[name] then
        equip(sets.Enmity[name])
        return
    elseif EnmitySpells:contains(name) then
        equip(sets.Enmity)
        return
    elseif BlueSpells:contains(name) then
        equip(sets.Enmity.SIRD)
        return
    end

    local skill_set = sets.midcast[spell.skill]
    if not skill_set then return end

    local spell_set = skill_set[name]
    if spell.skill == 'Healing Magic' and name:match('^Cur[ea]') then
        local self_target = spell.target and spell.target.type == 'SELF'
        spell_set = self_target and skill_set.SelfCure or skill_set.Cure
    elseif spell.skill == 'Enhancing Magic' then
        if name:match('^Regen') then
            spell_set = skill_set.Regen
        elseif name:match('^Protect') or name:match('^Shell') then
            spell_set = skill_set.ProShell
        end
    end
    equip(spell_set or skill_set)
end

function aftercast(spell)
    local duration = ability_timers[spell.name]
    if duration and not spell.interrupted then
        windower.send_command(('@timers c "%s" %d up'):format(spell.name, duration))
    end
    equip_check()
end

function status_change(new)
    if new == 'Idle' or new == 'Resting' or new == 'Engaged' then
        equip_check(new)
    end
end

function buff_change(buff, gain)
    if gain and buff:lower() == 'stun' then equip_check() end
end

function equip_check(status)
    if (status or player.status) == 'Engaged' then
        local engaged = sets.aftercast.Engaged
        equip(engaged[engaged_mode] or engaged)
    else
        local idle = sets.aftercast.Idle
        equip(idle[idle_mode] or idle)
    end
    update_status()
end

function self_command(cmd)
    local command, mode = cmd:lower():match('^%s*(%S+)%s*(%S*)')
    if command == 'cycle' and mode == 'idle' then
        idle_mode = idle_mode == 'DT' and 'Normal' or 'DT'
        add_to_chat('Idle mode set to: ' .. idle_mode)
        equip_check()
    elseif command == 'cycle' and mode == 'engaged' then
        engaged_mode = next_engaged_mode[engaged_mode]
        add_to_chat('Engaged mode set to: ' .. engaged_mode)
        equip_check()
    elseif command == 'weapon' then
        local weapon = sets.Weapons[mode]
        if weapon then equip(weapon) end
    elseif command == 'equip_check' then
        equip_check()
    elseif command == 'update_status' then
        equip_change()
        update_status()
    end
end

function update_status()
    if not stateBox then return end
    local spacing = '   '
    local text = string.format('%s%s%s%s%s%s%s%s%s%s%s%s',
        spacing, get_weapon_color(current_weapon), current_weapon, spacing,
        Colors.White, 'Engaged: ', Colors.Blue, engaged_mode, spacing,
        Colors.White, 'Idle: ', Colors.Blue .. idle_mode .. spacing)
    stateBox:clear()
    stateBox:append(text)
    stateBox:show()
end

function equip_change()
    local main = player.equipment and player.equipment.main
    current_weapon = main and main:lower() ~= 'empty' and main or 'Empty'
    update_status()
end

windower.raw_register_event('outgoing chunk', function(id)
    if id == 0x00D and stateBox then stateBox:hide() end
end)

windower.raw_register_event('incoming chunk', function(id, data)
    if id == 0x00A and stateBox then
        equip_change()
    elseif id == 0x050 and data and item_resources then
        -- Equipment updates contain the inventory index, equipment slot, and bag.
        local index, slot, bag = data:byte(5, 7)
        if slot ~= 0 or not bag then return end
        local item = index ~= 0 and windower.ffxi.get_items(bag, index)
        local resource = item and item_resources[item.id]
        current_weapon = resource and resource.en or 'Empty'
        update_status()
    end
end)
