--[[
	Author: Tewl / Bismark
	Files: Tewl_GEO.lua 

    Binds
    CTRL+F9     : Toggle burst mode on and off
    CTRL+F10    : Cycle Idle sets
    CTRL+F11    : Cycle Engaged sets
--]]
function get_sets()
	items = require('resources').items
	require('queues')
    
    include('FFXI-Mappings')
	
    include('FFXI-Utility')

    set_macros(20,1)
	send_command('wait 1.5;input /lockstyleset 2')
    send_command('input //equipviewer pos 1663 914')

    send_command('bind ^f9 gs c toggle burst')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c cycle engaged')

    -- Movement speed gear for auto equip when moving
    sets.MoveSpeed = { feet = "Geo. Sandals +3",}
    BurstMode = false

    -- Augmented Capes
    Capes = {}
    Capes.PetRegen = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
    Capes.FC = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
    Capes.MagicDmg = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
    Capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +20','Pet: Damage taken -3%',}}
    
    -- Gear sets
    sets.luopan = { 
        main        = "Idris",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        ammo        = empty,
        head        = "Azimuth Hood +3",
        neck        = "Bagua Charm +2",
        waist       = "Isa Belt",
        hands       = "Geo. Mitaines +3",
        feet        = "Bagua Sandals +3",
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = Capes.PetRegen,
    }

    sets.precast = {}
    sets.precast.FC = { -- FC 81/80
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = "Amalric Coif +1", -- 11
        body        = "Merlinic Jubbah", -- 11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = "Geomancy Pants +3", -- 15
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Genmei Earring",
        right_ear   = "Azimuth Earring +1",
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Defending Ring",
        back        = Capes.FC, -- 10
    }
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"})
    sets.precast.FC.Impact = set_combine(sets.precast.FC,{head=empty,body="Twilight Cloak"})
    sets.precast.JA = {
        ['Primeval Zeal'] = { head = "Bagua Galero +3" },
        ['Full Circle'] = { head = "Azimuth Hood +3" },
        ['Bolster'] = { body = "Bagua Tunic +3" },
        ['Life Cycle'] = {
            body        = "Geomancy Tunic +2",
            back        = Capes.PetRegen
        },
        ['Curative Recantation'] = { hands = "Bagua Mitaines +3"},
        ['Mending Halation'] = { legs = "Bagua Pants +3" },
        ['Radial Arcana'] = { feet = "Bagua Sandals +3" },
    }
    sets.precast.WS = {
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Nyame Gauntlets",
        legs		= "Nyame Flanchard",
        feet		= "Nyame Sollerets",
        waist       = "Grunfeld Rope",
        left_ear    = "Moonshade Earring",
        right_ear   = "Ishvara Earring",
        left_ring	= "Epaminondas's Ring",
        right_ring	= "Karieyh Ring +1",
    }
    
    sets.midcast = {}
    sets.midcast['Geomancy'] = { 
        main        = "Idris",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 5/18
        head        = "Azimuth Hood +3", -- 15
        body        = "Bagua Tunic +3", -- 16
        hands       = "Geo. Mitaines +3", -- 19
        legs        = "Vanya Slops",   
        feet        = "Medium's Sabots",
        neck        = "Bagua Charm +2",
        waist       = "Austerity Belt +1",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = Capes.GeoSkill,
    }
    sets.midcast['Geomancy'].Indi = {
        main        = { name="Gada", augments={'Indi. eff. dur. +9','MND+5','Mag. Acc.+14','DMG:+1',}},
        neck        = "Incanter's Torque",
        legs        = "Bagua Pants +3",   
        feet        = "Azimuth Gaiters +3",
    }

    sets.midcast['Elemental Magic'] = { 
        main        = "Bunzi's Rod",
        sub         = "Ammurapi Shield",
        ammo        = "Ghastly Tathlum +1",
        head        = "Jhakri Coronal +2",
        body        = "Amalric Doublet +1", 
        hands       = "Amalric Gages +1",
        legs        = "Amalric Slops +1",
        feet        = "Amalric Nails +1",   
        neck        = "Sibyl Scarf",
        waist       = "Acuity Belt +1",
        left_ear    = "Malignance Earring",
        right_ear   = "Regal Earring", 
        left_ring   = "Freke Ring",
        right_ring  = "Shiva Ring +1",
        back        = Capes.MagicDmg,  
    } 

    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        head		= "Ea Hat +1",
        body		= "Ea Houppe. +1",
        hands       = "Agwu's Gages",
        legs		= "Ea Slops +1",
        feet        = "Agwu's Pigaches",
        right_ring	= "Mujin Band",
    })

    sets.midcast['Enfeebling Magic'] = {
        sub         = "Ammurapi Shield",
        neck        = "Incanter's Torque",
        body        = "Vanya Robe",
        hands       = "Azimuth Gloves +3",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Luminary Sash"
    }

    sets.midcast['Enhancing Magic'] = { -- Enhancing Duration: 76
        sub         = "Ammurapi Shield", -- 10
        head        = "Telchine Cap", --10
        body        = "Telchine Chas.", -- 8
        hands       = "Telchine Gloves", -- 10
        legs        = "Telchine Braconi", -- 10
        feet        = "Telchine Pigaches",  -- 8
        neck        = "Incanter's Torque",
        right_ear   = "Augment. Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Embla Sash" -- 10
    }

    sets.midcast['Dark Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Pemphredo Tathlum",
        head        = "Agwu's Cap",
        body        = "Agwu's Robe",
        hands       = "Agwu's Gages",
        legs        = "Azimuth Tights +2",
        feet        = "Agwu's Pigaches",
        neck        = "Erra Pendant",
        waist       = "Luminary Sash",
        left_ear    = "Digni. Earring",
        right_ear   = "Crep. Earring",
        left_ring   = "Evanescence Ring",
        right_ring  = "Archon Ring",
        back        = Capes.MagicDmg
    }
    sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
        head        = "Bagua Galero +3",
        waist       = "Austertiy Belt +1",
    })

    sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
        feet        = "Agwu's Pigaches",
        left_ring   = "Evanescence Ring",
    })

    sets.midcast['Healing Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield", -- 10
        range       = empty,
        ammo        = "Hydrocera",
        head        = "Vanya Hood",
        body        = "Vanya Robe",
        hands       = "Vanya Cuffs",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs" ,
        neck        = "Incanter's Torque",
        left_ear    = "Etiolation Earring",
        right_ear   = "Halasz Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Austerity Belt +1",
        back        = "Solemnity Cape",
    }

    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'],{
        body        = "Heka's Kalasiris",
        neck        = "Nodens Gorget",
        left_ear    = "Mendicant's Earring",
        left_ring   = "Naji's Loop",
        back        = "Solemnity Cape",        
    })
    sets.aftercast = {}
    sets.aftercast.Idle = { 
        main        = "Daybreak",
        sub         = "Genmei Shield",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = { name="Merlinic Hood", augments={'"Counter"+3','"Drain" and "Aspir" potency +9','"Refresh"+2','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        body        = "Azimuth Coat +3",
        hands       = "Bagua Mitaines +3",
        legs        = "Assid. Pants +1",
        feet        = "Geomancy Sandals +3",
        neck        = "Loricate Torque +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Fucho-no-Obi",   
        back        = "Moonlight Cape",         
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {
        range       = empty,
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        legs        = "Nyame Flanchard",
        left_ear    = "Etiolation Earring",
        right_ear   = "Genmei Earring",
        right_ring   = "Defending Ring",
    })

    sets.aftercast.Engaged = { 
        -- LOL MELEE GEO
    }
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
end

function precast(spell)
    if spell.interrupted == true or (spell.target.hpp == 0  and not spell.name:startswith("Raise")) or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end
    if spell.action_type == 'Magic' and sets.precast.FC then
        if spell.english:startswith('Cur') and spell.name ~= 'Cursna' then
            equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
        elseif sets.precast.FC[spell.name] then
            equip(sets.precast.FC[spell.name])
        else
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
        if spell.skill == 'Geomancy' and spell.name:startswith('Indi-') and sets.midcast[spell.skill].Indi then
            equip(sets.midcast[spell.skill].Indi)
        elseif spell.skill == 'Healing Magic' then
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
            if EleDebuff:contains(spell.name) and sets.midcast[spell.skill].Debuff then
                equip(sets.midcast[spell.skill].Debuff)
            elseif sets.midcast[spell.skill].Burst and BurstMode == true then              
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst == nil then
                    equip(set_combine(sets.midcast[spell.skill].Burst,{head=empty,body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst then
                    equip(sets.midcast[spell.skill][spell.name].Burst)
                else
                    equip(sets.midcast[spell.skill].Burst)
                end
            else        
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] == nil then
                    equip(set_combine(sets.midcast[spell.skill],{head=empty,body="Twilight Cloak"}))
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
            if spell.name == 'Dispelga' and sets.midcast[spell.skill][spell.name] == nil then
                equip(set_combine(sets.midcast[spell.skill],{main='Daybreak'}))
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

function pet_change()
    equip_check()
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
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
    elseif buff == 'Bolster' and not gain then
        add_to_chat(123, '[Bolster] OFF') 
    end
end

function equip_check()
    if player.status == 'Engaged' then
        local engagedSet = sets.aftercast.Engaged
        if egs ~= nil and sets.aftercast.Engaged[egs] then 
            engagedSet = sets.aftercast.Engaged[egs]
        else
            egs = nil
        end
        if pet.isvalid then
            equip(set_combine(engagedSet,sets.luopan))
        else
            equip(engagedSet)
        end
    else	
        local idleSet = sets.aftercast.Idle
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            idleSet = sets.aftercast.Idle[ids]
        else
            ids = nil
        end
        if pet.isvalid then
            equip(set_combine(idleSet,sets.luopan))
        else
            equip(idleSet)
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
            if last_egs == egs then egs = nil end
            if egs == nil then 
                add_to_chat('Engaged mode set to: Default')
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
end