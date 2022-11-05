--[[
	Author: Tewl / Bismark
	Files: Tewl_GEO.lua 

    Binds
    CTRL+F9     : Cycle burst mode on and off
    CTRL+F10    : Cycle Idle sets
    CTRL+F11    : Cycle Engaged sets
--]]
function get_sets()
    -- Personal settings. You can remove these two lines.
    send_command('input /macro book 20;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 2')
    send_command('input //equipviewer pos 1663 912')

    send_command('bind ^f9 gs c cycle burst')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c cycle engaged')

    -- Movement speed gear for auto equip when moving
    sets.MoveSpeed = { feet = "Geo. Sandals +3",}
    
    IdleMode = {'Normal', 'DT'} -- Define idle sets
    i = 1
    EngagedMode = {'Normal','DT'}
    e = 1
    BurstMode = false

    -- Augmented Capes
    Capes = {}
    Capes.PetRegen = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
    Capes.FC_MagDmg = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +20','Pet: Damage taken -3%',}}
    
    -- Gear sets
    sets.luopan = { 
        main        = "Idris",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        ammo        = empty,
        head        = "Azimuth Hood +2",
        neck        = "Bagua Charm +2",
        waist       = "Isa Belt",
        hands       = "Geo. Mitaines +3",
        feet        = "Bagua Sandals +3",
        right_ring  = "Stikini Ring +1",
        back        = Capes.PetRegen,
    }

    sets.precast = {}
    sets.precast.FC = { -- FC 80/80 QC: 7/10
        head        = "Amalric Coif +1", -- 11
        body        = "Merlinic Jubbah", -- 11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}},
        legs        = "Geomancy Pants +3", -- 15
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}},    
        neck        = "Orunmila's Torque", -- 5
        waist       = "Witful Belt", -- 3|3
        left_ear    = "Malignance Earring", -- 4
        right_ear   = "Loquac. Earring", -- 2
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Lebeche Ring", -- 0|2
        back        = Capes.FC_MagDmg,
    }
    sets.precast.JA = {}
    sets.precast.JA['Primeval Zeal'] = {
        head        = "Bagua Galero +3"
    }
    sets.precast.JA['Full Circle'] = {
        head        = "Azimuth Hood +2"
    }
    sets.precast.JA['Bolster'] = {
        body        = "Bagua Tunic +3"
    }
    sets.precast.JA['Life Cycle'] = {
        body        = "Geomancy Tunic +2",
        back        = Capes.PetRegen
    }
    sets.precast.JA['Curative Recantation'] = {
        hands       = "Bagua Mitaines +3"
    }
    sets.precast.JA['Mending Halation'] = {
        legs        = "Bagua Pants +3"
    }
    sets.precast.JA['Radial Arcana'] = {
        feet        = "Bagua Sandals +3"
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
        head        = "Azimuth Hood +2", -- 15
        body        = "Bagua Tunic +3", -- 16
        hands       = "Geo. Mitaines +3", -- 19
        legs        = "Vanya Slops",   
        feet        = "Medium's Sabots",
        neck        = "Bagua Charm +2",
        waist       = "Austerity Belt +1",
        left_ring   = "Stikini Ring +1", -- 8/8
        right_ring  = "Stikini Ring +1", -- 8/8
        back        = Capes.GeoSkill,
    }
    sets.midcast['Geomancy'].Indi = {
        main        = "Gada",
        neck        = "Incanter's Torque",
        legs        = "Bagua Pants +3",   
        feet        = "Azimuth Gaiters +2",
    }

    sets.midcast['Elemental Magic'] = { 
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Pemphredo Tathlum",
        head        = "Jhakri Coronal +2",
        body        = "Amalric Doublet +1", 
        hands       = "Amalric Gages +1",
        legs        = "Amalric Slops +1",
        feet        = "Amalric Nails +1",   
        neck        = "Baetyl Pendant",
        waist       = "Eschan Stone",      
        left_ear    = "Malignance Earring",
        right_ear   = "Barkaro. Earring", 
        left_ring   = "Freke Ring",
        right_ring  = "Shiva Ring +1",
        back        = Capes.FC_MagDmg,  
    } 

    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        head		= "Ea Hat +1",
        body		= "Ea Houppe. +1",
        legs		= "Ea Slops +1",
        neck		= "Mizukage-no-Kubikazari",
        waist		= "Skrymir Cord +1",
        right_ring	= "Mujin Band",
    })

    sets.midcast['Enfeebling Magic'] = {
        sub         = "Ammurapi Shield",
        neck        = "Incanter's Torque",
        body        = "Vanya Robe",
        hands       = "Azimuth Gloves +2",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
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
        waist       = "Embla Sash" -- 10
    }

    sets.midcast['Dark Magic'] = {
        head        = "Bagua Galero +3",
        neck        = "Incanter's Torque",
        legs        = "Azimuth Tights +2",
        left_ear    = "Digni. Earring",
        right_ear   = "Crep. Earring",
        right_ring  = "Archon Ring",
        waist       = "Austertiy Belt +1"
    }

    sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
        feet        = "Agwu's Pigaches",
        left_ring   = "Evanescence Ring",
    })

    sets.midcast['Healing Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield", -- 10
        range       = empty,
        ammo        = "Hydrocera",
        head        = "Yanya Hood",
        body        = "Vanya Robe",
        hands       = "Vanya Cuffs",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs" ,
        neck        = "Incanter's Torque",
        left_ear    = "Etiolation Earring",
        right_ear   = "Halasz Earring",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
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
    sets.aftercast.Idle = {} -- Dont put gear here, sets.aftercast.Idle.Normal will be your default set.
    sets.aftercast.Idle.Normal = { 
        main        = "Daybreak",
        sub         = "Genmei Shield",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = "Befouled Crown",
        body        = "Jhakri Robe +2",
        hands       = "Bagua Mitaines +3",
        legs        = "Assid. Pants +1",
        feet        = "Geomancy Sandals +3",
        neck        = "Loricate Torque +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        waist       = "Fucho-no-Obi",   
        back        = "Moonlight Cape",         
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle.Normal, {
        range       = empty,
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        legs        = "Nyame Flanchard",
        left_ear    = "Etiolation Earring",
        right_ear   = "Genmei Earring",
        left_ring   = "Defending Ring",
    })

    sets.aftercast.Engaged = { } -- Don't put gear here, sets.aftercast.Engaged.Normal will be your default set.
    sets.aftercast.Engaged.Normal = {
        -- LOL MELEE GEO
    }
    sets.aftercast.Engaged.DT = set_combine(sets.aftercast.Engaged.Normal, { })
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
end

function test()
    for k,v in pairs(sets.midcast) do
        add_to_chat(123,k)
    end
end

function precast(spell)
    if spell.type == 'JobAbility' then
        if sets.precast.JA[spell.english] then
            equip(sets.precast.JA[spell.english])
        end
    elseif spell.action_type == 'Magic' then
        if buffactive.Silence then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
        end
        if spell.english:startswith('Cur') and spell.name ~= 'Cursna' then
            equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
        end
        if spell.english == 'Dispelga' then
            equip(set_combine(sets.precast.FC,{main="Daybreak"}))
        elseif spell.name == 'Impact' then
            equip(sets.precast.FC,{body="Twilight Cloak"})
        elseif sets.precast.FC then
            equip(sets.precast.FC)
        end
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        elseif sets.precast.WS then
            equip(sets.precast.WS)
        end
    end
end

function midcast(spell)
    if spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' then
        if sets.midcast[spell.name] then
            equip(sets.midcast[spell.name])
        elseif sets.midcast[spell.skill] then
            equip(sets.midcast[spell.skill])
        end
    elseif sets.midcast[spell.skill] then
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
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Elemental Magic' then
            if sets.midcast[spell.skill].Burst and BurstMode == true then                
                if spell.name == 'Impact' then
                    equip(set_combine(sets.midcast[spell.skill].Burst,{body="Twilight Cloak"}))
                else
                    equip(sets.midcast[spell.skill].Burst)
                end
            elseif sets.midcast[spell.skill] then         
                if spell.name == 'Impact' then
                    equip(set_combine(sets.midcast[spell.skill],{body="Twilight Cloak"}))
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
            if spell.name == 'Dispelga' then
                equip(set_combine(sets.midcast[spekk.skill],{weapon='Daybreak'}))
            elseif sets.midcast[spell.skill][spell.name] then
                equip(sets.midcast[spell.skill][spell.name])
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        elseif sets.midcast[spell.skill] then
            equip(sets.midcast[spell.skill])
        end
    end
end

function aftercast(spell)
    idle()
end

function pet_change()
    idle()
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        idle()
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

-- Determine what idle set to equip if a luopan is out
function idle()
    if player.status == 'Engaged' then
        local engagedSet = sets.aftercast.Engaged.Normal
        if sets.aftercast.Engaged[EngagedMode[e]] then 
            engagedSet = sets.aftercast.Idle[EngagedMode[e]]
        end
        if pet.isvalid then
            equip(set_combine(engagedSet,sets.luopan))
        else
            equip(engagedSet)
        end
    else	
        local idleSet = sets.aftercast.Idle.Normal
        if sets.aftercast.Idle[IdleMode[i]] then 
            idleSet = sets.aftercast.Idle[IdleMode[i]]
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
            i = i + 1 
            if (table.getn(IdleMode) < i) then i = 1 end
            add_to_chat('Engaged mode set to: '..IdleMode[i])
            idle()
        elseif args[2] == 'engaged' then
            e = e + 1 
            if (table.getn(EngagedMode) < e) then e = 1 end
            add_to_chat('Engaged mode set to: '..EngagedMode[e])
            idle()
        elseif args[2] == 'burst' then
            if BurstMode == false then
                BurstMode = true
                add_to_chat('BurstMode enabled.')
            else
                BurstMode = false
                add_to_chat('BurstMode disabled.')
            end
        end
    elseif args[1] == 'idle' then
        idle()
    elseif args[1] == 'test' then
        test()
    end
end
--- Auto equip movement speed when moving
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
                    send_command('gs c idle')
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