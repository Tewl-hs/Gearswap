--[[
	Author: Tewl / Bismark
	Files: Tewl_BLM.lua 

    Binds
    CTRL+F9     : Cycle burst mode on and off
    CTRL+F10    : Cycle Idle sets
    CTRL+F11    : Cycle Engaged sets
--]]
function get_sets()
	items = require('resources').items
	require('queues')
    
    include('FFXI-Mappings')
	
    include('FFXI-Utility')

    send_command('bind ^f9 gs c cycle burst')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c cycle engaged')

    set_macros(3,1)
	send_command('wait 1.5;input /lockstyleset 5')

    sets.MoveSpeed = { feet = "Herald's Gaiters",}
	BurstMode = false

    -- Gearsets
    sets.precast = {}
    sets.precast.FC = {
        main        = "Sucellus", -- 5
        sub         = "Ammurapi Shield",
        ammo        = "Sapience Orb", -- 2
        head        = "Amalric Coif +1", -- 11
        body        = { name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5','MND+8','Mag. Acc.+10',}}, --11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, -- 7
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Loquacious Earring", -- 2
        right_ear   = "Malignance Earring", -- 4
        right_ring  = "Kishar Ring", -- 4 
        left_ring   = "Prolix Ring", -- 2
        back        = { name="Taranus's Cape", augments={'MP+60','"Fast Cast"+10',}}, -- 10
    }
    sets.precast.JA = {
        ['Mana Wall'] = { },
        ['Manafont'] = { },
        ['Elemental Seal'] = { },
        ['Cascade'] = { },
        ['Manawell'] = { },
        ['Subtle Sorcery'] = { },
    }

    sets.midcast = {}
    sets.midcast['Elemental Magic'] = {
        main        = "Bunzi's Rod",
        sub         = "Ammurapi Shield",
        ammo        = "Pemphredo Tathlum",
        head        = "Arch. Petasos +3",
        body        = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands       = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs        = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet        = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck        = "Saevus Pendant +1",
        waist       = "Refoccilation Stone",
        left_ear    = "Regal Earring",
        right_ear   = "Malignance Earring",
        left_ring   = "Shiva Ring +1",
        right_ring  = "Freke Ring",
        back        = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
     }
    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        head		= "Ea Hat +1",
        body		= "Ea Houppe. +1",
        legs		= "Ea Slops +1",
        neck		= "Mizu. Kubikazari",
        waist		= "Skrymir Cord",
        left_ear	= "Regal Earring",
        right_ring	= "Mujin Band",
    })
    sets.midcast['Enfeebling Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        legs        = "Psycloth Lappas",
    }
    sets.midcast['Enfeebling Magic'].Dispelga = set_combine(sets.midcast['Enfeebling Magic'],sets.Dispelga)
    sets.midcast['Dark Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Pemphredo Tathlum",
        head        = "Agwu's Cap",
        body        = "Agwu's Robe",
        hands       = "Agwu's Gages",
        legs        = "Agwu's Slops",
        feet        = "Agwu's Pigaches",
        neck        = "Erra Pendant",
        waist       = "Luminary Sash",
        left_ear    = "Digni. Earring",
        right_ear   = "Crep. Earring",
        left_ring   = "Evanescence Ring",
        right_ring  = "Archon Ring",
        back        = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
    }
    sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
        head        = "Pixie Hairpin +1",
        waist       = "Austertiy Belt +1",
    })
    sets.midcast['Healing Magic'] = { }
    sets.midcast['Healing Magic'].Cursna = set_combine(sets.midcast['Healing Magic'], {

    })
    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'], {
        
    })
    sets.midcast['Enhancing Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield", -- 10
        ammo        = "Impatiens",
        head        = "Telchine Cap", --10
        body        = "Telchine Chas.", -- 8
        hands       = "Telchine Gloves", -- 10
        legs        = "Telchine Braconi", -- 10
        feet        = "Telchine Pigaches",  -- 8
        neck        = "Incanter's Torque",
        waist       = "Embla Sash", -- 10
    }
    sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head        = "Amalric Coif +1",
        feet        = "Inspirited Boots"
    })
    sets.aftercast = { }
    sets.aftercast.Idle = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Staunch Tathlum +1",
        head        = "Befouled Crown",
        body        = "Jhakri Robe +2",
    	hands		= { name="Merlinic Dastanas", augments={'Pet: AGI+2','"Store TP"+4','"Refresh"+2','Accuracy+20 Attack+20',}},
        legs        = "Assid. Pants +1",
        feet        = { name="Merlinic Crackows", augments={'Accuracy+7','Pet: "Dbl. Atk."+1','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        neck        = "Loricate Torque +1",
        waist       = "Fucho-no-obi",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe4" },
        back        = "Moonlight Cape"
    }
    sets.aftercast.Engaged = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Staunch Tathlum +1",
        head        = "Befouled Crown",
        body        = "Jhakri Robe +2",
    	hands		= { name="Merlinic Dastanas", augments={'Pet: AGI+2','"Store TP"+4','"Refresh"+2','Accuracy+20 Attack+20',}},
        legs        = "Assid. Pants +1",
        feet        = { name="Merlinic Crackows", augments={'Accuracy+7','Pet: "Dbl. Atk."+1','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        neck        = "Loricate Torque +1",
        waist       = "Fucho-no-obi",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe4" },
        back        = "Moonlight Cape"
     }

end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
end

function precast(spell)
    if spell.interrupted == true or spell.target.hpp == 0 or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end
    if spell.action_type == 'Magic' then
        if spell.english:startswith('Cur') and spell.name ~= 'Cursna' then
            equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
        end
        if spell.english == 'Dispelga' then
            equip(set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"}))
        elseif spell.name == 'Impact' then
            equip(sets.precast.FC,{body="Twilight Cloak"})
        elseif sets.precast.FC then
            equip(sets.precast.FC)
        end
    elseif spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123,'Unable to use: '..spell.english..'. Not enough TP.')
            cancel_spell()
            return
        end
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        elseif sets.precast.WS then
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
        if sets.precast.JA[spell.english] then
            equip(sets.precast.JA[spell.english])
        end
    end
end

function midcast(spell)
    if sets.midcast[spell.skill] then
        if spell.skill == 'Healing Magic' then
            if spell.name:startswith('Cur') and spell.name ~= "Cursna" and sets.midcast[spell.skill].Cure then
                equip(sets.midcast[spell.skill].Cure)
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Dark Magic' then
            if spell.name:startswith('Aspir') or spell.name:startswith('Drain') and sets.midcast[spell.skill].AspirDrain then
                equip(sets.midcast[spell.skill].AspirDrain)
            else
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Elemental Magic' then
            if sets.midcast[spell.skill].Burst and BurstMode == true then                
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name].Burst == nil then
                    equip(set_combine(sets.midcast[spell.skill].Burst,{body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst then
                    equip(sets.midcast[spell.skill][spell.name].Burst)
                else
                    equip(sets.midcast[spell.skill].Burst)
                end
            else        
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] == nil then
                    equip(set_combine(sets.midcast[spell.skill],{body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] then
                    equip(sets.midcast[spell.skill][spell.name])
                else
                    equip(sets.midcast[spell.skill])
                end
            end
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip({waist="Hachirin-no-Obi"})
            elseif spell.target.distance < (1.7 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            elseif spell.target.distance < (8 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.name == 'Dispelga' and sets.midcast[spell.skill][spell.name] then
                equip(set_combine(sets.midcast[spell.skill],{main='Daybreak',sub='Ammurapi Shield'}))
            elseif sets.midcast[spell.skill][spell.name] then
                equip(sets.midcast[spell.skill][spell.name])
            else
                equip(sets.midcast[spell.skill])
            end
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
            equip(sets.midcast[spell.skill])
        end
    end
end

function aftercast(spell)
	equip_check()
end

function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
end

function buff_change(buff,gain)
    if buff == 'silence' and gain then
        if player.inventory['Echo Drops'] then
            send_command('@input /item "Echo Drops" <me>')
        else
            add_to_chat(123,'Silenced, you are out of Echo Drops!')	
        end
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
            if last_egs == eds then egs = nil end
            if egs == nil then 
                add_to_chat('Engaged mode set to: Default')
            else
                add_to_chat('Engaged mode set to: '..egs)
            end
            equip_check()
        elseif args[2] == 'burst' then
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
end