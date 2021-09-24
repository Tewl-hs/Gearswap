--[[
	Author: Tewl / Bismark
	Files: BRD.lua 

	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
-]]
function get_sets()
    -- Load Macros
    send_command('input /macro book 1;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 3')

    sets.MoveSpeed = { feet = "Fili cothurnes +1",}    --auto swaps when moving
    send_command('input //equipviewer pos 1663 934')

    -- Augments
    Kali = {}
    Kali.Skill      = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',} }
    Kali.MACC       = { name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',} }

    Offhand = {
        sub         = "Ternion Dagger +1" -- Offhand weapon when dual weilding
    }

    -- DummySongs
    DummySongs = T{'Knight\'s Minne', 'Knight\'s Minne II'}

    -- Gear sets

    sets.precast = { }
    sets.precast.FastCast = { -- Current: 79% 
        range       = { name="Linos", augments={'"Fast Cast"+5',}}, -- 5
        head        = "Bunzi's Hat", -- 10
        body        = "Inyanga Jubbah +2", -- 14
        hands       = "Leyline Gloves", -- 7 (Max: 8)
        legs        = "Aya. Cosciales +2", -- 6
        feet        = "Chironic Slippers", -- 7 
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Loquacious Earring", -- 2
        right_ear   = "Enchntr. Earring +1", -- 2
        left_ring   = "Prolix Ring", -- 2
        right_ring  = "Kishar Ring", -- 4 
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10
    }
    sets.precast.BardSong = set_combine(sets.precast.FastCast,{
        head        = "Fili Calot +1", -- 14 song
        body        = "Brioso Justau. +3", --15 song
        feet        = "Bihu Slippers +3", -- 10 song
        left_ear    = "Genmei Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Gelatinous Ring +1",
    })
    sets.precast.DummySong = set_combine(sets.precast.BardSong,{ 
        range       = "Daurdabla",
    })
    sets.precast['Nightingale'] = {
        feet        = "Bihu Slippers +3"
    }
    sets.precast['Troubadour'] = {
        body        = "Bihu Jstcorps. +3"
    }
    sets.precast['Soul Voice'] = {
        legs        = "Bihu Cannions +3"
    }
    sets.precast.WS = {
        range       = { name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+2','CHR+8',}},
        head        = "Bihu Roundlet +3",
        body        = "Bihu Jstcorps. +3",
        hands       = "Bihu Cuffs +3",
        legs        = "Bihu Cannions +3",
        feet        = "Bihu Slippers +3",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Brutal Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Ilabrat Ring",
        back        = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.precast.WS["Mordant Rime"] = {
        range       = { name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+2','CHR+8',}},
        head        = "Bihu Roundlet +3",
        body        = "Bihu Jstcorps. +3",
        hands       = "Bihu Cuffs +3",
        legs        = "Bihu Cannions +3",
        feet        = "Bihu Slippers +3",
        neck        = "Bard's Charm +2",
        waist       = { name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear    = "Regal Earring",
        right_ear   = "Ishvara Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Metamor. Ring +1",
        back        = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}},
    }
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{
        head        = { name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        feet        = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        neck        = "Bard's Charm +2",
        waist       = { name="Kentarch Belt +1", augments={'Path: A',}},
        right_ear   = "Ishvara Earring",
    })

    sets.midcast = { }
    sets.midcast.BardSong = {        
        main        = "Carnwenhan", 
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Bihu Roundlet +3",
        body        = "Fili Hongreline +1",
        hands       = "Inyanga Dastanas +2",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +3",
        neck        = "Moonbow Whistle +1",
        waist       = "Luminary Sash",
        left_ear    = "Musical Earring",
        right_ear   = "Enchntr. Earring +1",
        left_ring	= { "Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { "Stikini Ring +1", bag="wardrobe4" },
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
    }

    -- Need to upgrade to Mousai +1
    sets.midcast.Threnody = {
        body        = "Mous. Manteel +1"
    }
    sets.midcast.Scherzo = {
        feet        = "Fili Cothurnes +1"
    }
    sets.midcast.Carol = {
        hands       = "Mousai Gages +1"
    }
    sets.midcast.Minne = {
        legs        = "Mous. Seraweels +1"
    }
    sets.midcast.Etude = {
        head        = "Mousai Turban +1"
    }
    sets.midcast.Mambo = {
        feet        = "Mou. Crackows +1"
    }
    sets.midcast.Ballad = {
        legs        = "Fili Rhingrave +1"
    }
    sets.midcast.Minuet = {
        body        = "Fili Hongreline +1"
    }
    sets.midcast.March = {
        hands       = "Fili Manchettes +1"
    }
    sets.midcast.Madrigal = {
        head        = "Fili Calot +1"
    }
    sets.midcast.Lullaby = {
        hands       = "Brioso Cuffs +3"
    }
    sets.midcast.Paeon = {
        head       = "Brioso Roundlet +3"
    }

    sets.aftercast = { }
    sets.aftercast.Idle = {    -- DT 60    
        main        = "Carnwenhan",
        sub         = "Ammurapi Shield", -- "Genmei Shield",  --
        range       = "Gjallarhorn",
        head        = "Bunzi's Hat", -- 7
        body        = "Bunzi's Robe", -- 10
        hands       = "Bunzi's Gloves", -- 8
        legs        = "Bunzi's Pants", -- 9
        feet        = "Bunzi's Sabots", -- 6
        neck        = "Warder's Charm +1", -- 6
        waist       = "Slipor Sash", 
        left_ear    = "Hearty Earring",
        right_ear   = "Odnowa Earring +1", -- 3
        left_ring   = "Moonlight Ring", -- 5
        right_ring  = "Shadow Ring",
        back        = "Moonlight Cape" -- 6
    }
    sets.aftercast.Engaged = {
        main        = "Carnwenhan",
        sub         = "Ammurapi Shield", -- "Genmei Shield",  --
        range       = { name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+2','CHR+8',}},
        head        = "Aya. Zucchetto +2",
        body        = "Ayanmo Corazza +2",
        hands       = "Aya. Manopolas +2",
        legs        = "Aya. Cosciales +2",
        feet        = "Aya. Gambieras +2",
        neck        = "Bard's Charm +2",
        waist       = "Sailfi Belt +1",
        left_ear    = "Eabani Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Chirich Ring +1", 
        right_ring  = "Chirich Ring +1", 
        back        = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }
end

function precast(spell)
    if spell.action_type == 'Magic' then
        if buffactive.Silence then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
        end

        local Precast = sets.precast.FastCast
        if spell.type == 'BardSong' then 
            Precast = sets.precast.BardSong
        end
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            Precast = set_combine(Precast, Offhand)
        end
        if spell.name == 'Honor March' then
            Precast = set_combine(Precast, {range="Marsyas"})
        elseif sets.precast[spell.name] then
            Precast = set_combine(Precast, sets.precast[spell.name])
        elseif DummySongs:contains(spell.name) then
            Precast = set_combine(Precast,sets.precast.DummySong)
        end
        equip(Precast)
    elseif sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    end
end

function midcast(spell)
    if spell.type == 'BardSong' then 
        if DummySongs:contains(spell.name) then
            --add_to_chat(121,'--- Singing Dummy Song ---')
            return
        end
        
        local Midcast = sets.midcast.BardSong
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            Midcast = set_combine(Midcast, Offhand)
        end
        if string.find(spell.name,'Ballad') then
            Midcast = set_combine(Midcast,sets.midcast.Ballad)
        elseif string.find(spell.name,'Carol') then
            Midcast = set_combine(Midcast,sets.midcast.Carol)
        elseif string.find(spell.name,'Minne') then
            Midcast = set_combine(Midcast,sets.midcast.Minne)
        elseif string.find(spell.name,'Threnody') then
            Midcast = set_combine(Midcast,sets.midcast.Threnody)
        elseif string.find(spell.name,'Mambo') then
            Midcast = set_combine(Midcast,sets.midcast.Mambo)
        elseif string.find(spell.name,'Etude') then
            Midcast = set_combine(Midcast,sets.midcast.Etude)
        elseif string.find(spell.name,'Minuet') then
            Midcast = set_combine(Midcast,sets.midcast.Minuet)
        elseif string.find(spell.name,'Paeon') then
            Midcast = set_combine(Midcast,sets.midcast.Paeon)
        elseif string.find(spell.name,'Scherzo') then
            Midcast = set_combine(Midcast,sets.midcast.Scherzo)
        elseif string.find(spell.name,'March') then
            Midcast = set_combine(Midcast,sets.midcast.March)
            if spell.name == 'Honor March' then 
                Midcast = set_combine(Midcast,{range="Marsyas"})
            end
        elseif string.find(spell.name,'Madrigal') then
            Midcast = set_combine(Midcast,sets.midcast.Madrigal)
        elseif string.find(spell.name,'Lullaby') then
            Midcast = set_combine(Midcast,sets.midcast.Lullaby)
            if spell.name:startswith('Horde') then
                Midcast = set_combine(Midcast,{range="Daurdabla"})
            end
        end
        equip(Midcast)
    end
end

function aftercast(spell)
    goIdle()
end

function status_change(new,old)
    if T{'Idle','Resting','Engaged'}:contains(new) then
        goIdle()
    end
end

function goIdle()
    local Aftercast = sets.aftercast.Idle
    if player.status == 'Engaged' then
        Aftercast = sets.aftercast.Engaged
    end
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        equip(set_combine(Aftercast,Offhand))
    else
        equip(Aftercast)
    end
end

function self_command(commandArgs)
    if commandArgs == 'goIdle' then
        goIdle()
    end
end

function buff_change(buff,gain)
    if buff == 'silence' and gain then
        if player.inventory['Echo Drops'] then
            send_command('@input /item "Echo Drops" <me>')
        else
            add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
        end
    end
end

function buff_refresh(name,buff_details)

end

-- Code for equiping movement speed when in motion. I did not write this.
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
                send_command('gs equip sets.MoveSpeed')
      		    moving = true
            elseif dist < 1 and moving then
                send_command('gs c goIdle')
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
