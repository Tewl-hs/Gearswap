--[[
	Author: Tewl / Bismark
	Files: Tewl_RUN.lua 
--]]

function get_sets()    
    items = require('resources').items
    require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')
    -- Personal settings. You can remove these two lines.
    set_macros(12,1)
    send_command('wait 1;input /lockstyleset 13')
    send_command('input //equipviewer pos 1663 934')

    send_command('bind ^f9 gs c cycle idle')
    send_command('bind ^f10 gs c cycle engaged')

    sets.MoveSpeed = { legs = "Carmine Cuisses +1",} 

    -- Blue spells
    BlueSpells = T{'Grand Slam', 'Terror Touch', 'Healing Breeze', 'Cocoon', 'Pollen', 'Wild Carrot', 'Blank Gaze', 'Geist Wall', 'Soporific', 'Jettatura', 'Sheep Song', 'Metallic Body'}

    EnmitySpells = T{'Foil', 'Flash', 'Stun'}
    
    -- Augmented Gear
    Capes = {}
    Capes.Enmity = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
    Capes.SIRD = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.DA = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Capes.MAB = { name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
    Capes.WSD = { name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}

    sets.Enmity = {
        head        = "Halitus Helm",
        body        = "Emet Harness +1",
        hands       = "Kurys Gloves",
        legs        = "Eri. Leg Guards +2",
        feet        = "Erilaz Greaves +2",
        neck        = "Moonlight Necklace",
        waist       = "Kasiri Belt",
        left_ear    = "Cryptic Earring",
        right_ear   = "Trux Earring",
        left_ring   = "Eihwaz Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    }
    sets.Enmity['Foil'] = set_combine(sets.Enmity, {        
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
    })
    sets.Enmity.SIRD = { -- 105%
        ammo        = "Staunch Tathlum +1", -- 11
        head        = { name="Taeon Chapeau", augments={'DEF+11','Spell interruption rate down -10%','HP+35',}}, -- 10
        body        = { name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands       = "Rawhide Gloves", -- 15
        legs        = "Carmine Cuisses +1", -- 20
        feet        = { name="Taeon Boots", augments={'DEF+12','Spell interruption rate down -9%','HP+36',}}, -- 9
        neck        = "Moonlight Necklace", --15
        waist       = "Audumbla Sash", -- 10
        left_ear    = "Halasz Earring", -- 5
        right_ear   = "Trux Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD -- 10
    }
    
    sets.precast = {}
    sets.precast.FC = { -- 73%
        ammo        = "Sapience Orb", -- 2
        head        = "Carmine Mask +1", -- 14
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}}, -- 9
        hands       = "Leyline Gloves", -- 7
        legs        = "Aya. Cosciales +2", -- 6
        feet        = "Carmine Greaves +1",  -- 8
        neck        = "Orunmila's Torque", -- 5
        waist       = "Audumbla Sash", 
        left_ear    = "Enchntr. Earring +1", -- 2
        right_ear   = "Loquac. Earring", -- 2
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD -- 10
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})

    sets.precast.JA = {
        ['Vivacious Pulse'] = {
            head        = "Erilaz Galea +2",
            legs        = "Rune. Trousers +1",
            neck        = "Incanter's Torque",
            left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
            right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        },
        ['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +3"}),
        ['Valiance'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +3"}),
        ['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +3"}),
        ['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"}),
        ['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"}),
        ['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +3"}),
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
            body        = "Agwu's Robe", -- "Samnuha Coat",
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
            body        = "Agwu's Robe", -- "Samnuha Coat",
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
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        waist       = "Kentarch Belt +1",
        left_ear    = "Telos Earring",
        right_ear   = "Digni. Earring",
    })
    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS,{
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        waist       = "Kentarch Belt +1",
        left_ear    = "Telos Earring",
        right_ear   = "Digni. Earring",
    })
    sets.midcast = {}
    sets.midcast['Enhancing Magic'] = {
        head        = "Erilaz Galea +2",
        hands       = "Regal Gauntlets",
        legs        = "Futhark Trousers +3",
    }
    sets.midcast['Enhancing Magic']['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
        ammo        = "Staunch Tathlum +1",
        head        = { name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
        hands       = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
        legs        = { name="Taeon Tights", augments={'"Fast Cast"+3','Phalanx +3',}},
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}},
        neck        = { name="Futhark Torque +2", augments={'Path: A',}},
        waist       = "Audumbla Sash",
        left_ear    = "Odnowa Earring +1",
        right_ear   = "Tuisto Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD
    })
    
    sets.aftercast = {}
    sets.aftercast.Engaged = { }
    sets.aftercast.Engaged.Normal = { -- DT (52) PDT (29) MDT (2)
        ammo        = "Staunch Tathlum +1", -- 3 0 0
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        -- Ongo cahnges
        --neck        = "Warder's Charm +1",
        --waist       = "Ioskeha Belt +1",
        --left_ear    = "Brutal Earring",
        --back        = Capes.DA,
        -- Normal equipment
        neck        = "Futhark torque +2", -- 7 0 0
        waist       = "Engraved Belt",
        left_ear    = "Odnowa Earring +1",
        right_ear   = "Eabani Earring", -- 3 0 2
        left_ring   = "Shadow Ring",
        --left_ring   = "Defending Ring", -- 10 0 0
        right_ring  = "Moonlight Ring", -- 5 0 0
        back        = Capes.Enmity -- 5 0 0
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
    sets.aftercast.Engaged.Hybrid = { -- DT 33 PDT 25
        ammo        = "Staunch Tathlum +1", -- 3 0 0
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        neck        = "Anu Torque",
		waist       = "Ioskeha Belt +1",
		left_ear    = "Telos Earring",
		right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring", -- 10 0 0
        right_ring  = "Niqmaddu Ring",
        back        = Capes.DA -- 5 0 0
    }
    sets.aftercast.Idle = { -- DT 55 PDT 29 
        ammo        = "Staunch Tathlum +1", -- 3 0 0
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Runeist's Coat +3", 
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Eri. Leg Guards +2",
        feet        = "Erilaz Greaves +2",
        neck        = "Futhark Torque +2", -- 7 0 0
        waist       = "Engraved Belt",
        left_ear    = "Eabani Earring", 
        right_ear   = "Erilaz Earring +1", -- 3
        left_ring   = "Defending Ring", -- 10 0 0
        right_ring  = "Moonlight Ring", -- 5 0 0
        back        = Capes.Enmity -- 5 0 0
    }

    coroutine.schedule(function() check_spells() end,2)
    
	include('FFXI-Display.lua')	
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
            add_to_chat(123,'['..spell.english..'] Not enough TP.')
			cancel_spell()
            return
        end
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] and abil_recasts[spell.recast_id] > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..disp_time(abil_recasts[spell.recast_id]))
			return
		end
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
    elseif sets.midcast[spell.skill][spell.name] then
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
            equip(aftercast.Idle[ids])
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
            if last_egs == eds then egs = nil end
            if egs == nil then 
                add_to_chat('Engaged mode set to: Normal')
            else
                add_to_chat('Engaged mode set to: '..egs)
            end
            equip_check()
        end
    elseif args[1] == 'toggle' and args[2] then
        if args[2] == 'burst' then
            if BurstMode == false then
                BurstMode = true
                add_to_chat('BurstMode enabled.')
            else
                BurstMode = false
                add_to_chat('BurstMode disabled.')
            end
        end
    elseif args[1] == 'equip_check' then
        equip_check()
    end
    update_status()
end

function update_status()
    local clr = {
        h='\\cs(255,192,0)', -- Yellow for active booleans and non-default modals
        w='\\cs(255,255,255)', -- White for labels and default modals
        n='\\cs(192,192,192)', -- White for labels and default modals
        s='\\cs(96,96,96)', -- Gray for inactive booleans
        Fire='\\cs(255,80,80)', -- Red For Fire Element
        Ice='\\cs(140,160,255)', -- Light Blue For Ice Element
        Wind='\\cs(110,255,110)', -- Light Green For Wind Element
        Earth='\\cs(220,214,110)', -- Brown/Yellow For Earth Element
        Lightning='\\cs(190,90,190)', -- Purple For Lightning Element
        Water='\\cs(110,110,255)', -- Blue For Water Element
        Light='\\cs(255,255,155)', -- Light Yellow For Light Element
        Dark='\\cs(90,90,90)', -- Dark Grey For Dark Element
    }

    local spc = '    '

    stateBox:clear()
    stateBox:append('   ')
    local status_text = ''
    local em = egs or 'Normal'
    status_text = string.format("%sEngaged: %s%s%s", clr.w, clr.h, em, spc)
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
end)