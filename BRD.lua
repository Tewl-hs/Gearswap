--[[
	Author: Tewl / Bismark
	Files: BRD.lua 

	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.

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

    Offhand = "Taming Sari" -- Offhand weapon when dual weilding

    -- Gear sets

    sets.precast = { }
    sets.precast.FastCast = { -- Current: 72% (65% if main hand locked)
        main        = Kali.Skill, -- 7
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Nahtirah Hat", -- 10
        body        = "Inyanga Jubbah +2", -- 14
        hands       = "Leyline Gloves", -- 6
        legs        = "Aya. Cosciales +2", -- 6
        neck        = "Orunmila's Torque", -- 5
        waist       = "Witful Belt", -- 5
        left_ear    = "Loquacious Earring", --2
        right_ear   = "Etiolation Earring", -- 1
        left_ring   = "Prolix Ring", -- 2
        right_ring  = "Kishar Ring", -- 4 
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10
    }
    sets.precast.BardSong = set_combine(sets.precast.FastCast,{
        head        = "Fili Calot +1", -- 14 song
        right_ear   = "Aoidos' Earring", -- 2 song
        feet        = "Bihu Slippers +3", -- 10 song
        waist       = "Embla Sash", -- 5
    })
    sets.precast.DummySong = { 
        range       = "Daurdabla",
        neck        = "Orunmila's Torque"
    }
    sets.precast['Nightingale'] = {
        feet        = "Bihu Slippers +3"
    }
    sets.precast['Troubadour'] = {
        body        = "Bihu Jstcorps. +3"
    }
    sets.precast['Soul Voice'] = {
        legs        = "Bihu Cannions +3"
    }

    sets.midcast = { }
    sets.midcast.BardSong = {        
        main        = "Carnwenhan", --Kali.Skill, 
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
        right_ear   = "Aoidos' Earring",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
    }

    -- Need to buy Su3 +1
    sets.midcast.Threnody = { }
    sets.midcast.Carol = { }
    sets.midcast.Minne = { }
    sets.midcast.Etude = { }

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
        range       = "Marsyas",
        hands       = "Brioso Cuffs +2"
    }
    sets.midcast.Paeon = {
        hands       = "Brioso Roundlet +2"
    }

    sets.Weaponskill = { 
        body        = "Bihu Jstcorps. +3"
    }

    sets.aftercast = { }
    sets.aftercast.Idle = {        
        main        = "Carnwenhan",--"Sangoma", 
        sub         = "Ammurapi Shield", --"Genbu's Shield", 
        range       = "Gjallarhorn",
        head        = "Aya. Zucchetto +2",
        body        = "Ayanmo Corazza +2",
        hands       = "Aya. Manopolas +2",
        legs        = "Aya. Cosciales +2",
        feet        = "Aya. Gambieras +2",
        neck        = "Loricate Torque +1",
        waist       = "Flume Belt +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Gelatinous Ring +1",
        back        = "Moonlight Cape"
    }
    sets.Engaged = set_combine(sets.precast.Idle,{
        head        = "Aya. Zucchetto +2",
        body        = "Ayanmo Corazza +2",
        hands       = "Aya. Manopolas +2",
        legs        = "Aya. Cosciales +2",
        feet        = "Aya. Gambieras +2",
        neck        = "Bard's Charm +2",
        waist       = "Sailfi Belt +1",
        left_ear    = "Dedition Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Chirich Ring +1", -- Need to buy
        right_ring  = "Chirich Ring +1", -- ' '
        back        = "Intarabus's Cape" -- Next month ambuscade / 30DEX, 20Acc/Atk, 10 Store TP, -5 DT
    })
    sets.WS = {
        head        = "Bihu Roundlet +3",
        body        = "Bihu Jstcorps. +3",
        hands       = "Bihu Cuffs +3",
        legs        = "Bihu Cannions +3",
        feet        = "Bihu Slippers +3",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Ishvara Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Karieyh Ring",
        back        = "Intarabus's Cape" -- Next month ambuscade / 30DEX, 20Acc/Atk, 10 WS Damage, -5 DT 
    }
    sets.WS = set_combine(sets.WS,{
        neck        = "Bard's Charm +2",
        waist       = "Grunfeld Rope",
        left_ear    = "Regal Earring",
        back        = "Intarabus's Cape" -- Next month ambuscade / 30CHR, 20Acc/Atk, 10 WS Damage, -5 DT 
    })
end

function precast(spell)
    if spell.type == 'Item' then
        return
    end
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
        elseif spell.name == 'Knight\'s Minne' or spell.name == 'Knight\'s Minne II' then
            Precast = set_combine(Precast,sets.precast.DummySong)
        end
        equip(Precast)
    elseif sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.type == 'WeaponSkill' then
        if sets.WS[spell.name] then
            equip(sets.WS[spell.name])
        else
            equip(sets.WS)
        end
    end
end

function midcast(spell)
    if spell.type == 'BardSong' then 
        if spell.name == 'Knight\'s Minne' or spell.name == 'Knight\'s Minne II' then
            add_to_chat(121,'--- Singing Dummy Song ---')
            return
        end
        
        local Midcast = sets.midcast.BardSong
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            Midcast = set_combine(Midcast, Offhand)
        end
        if string.find(spell.name,'Ballad') then
            Midcast = set_combine(Midcast,sets.midcast.Ballad)
        elseif string.find(spell.name,'Minuet') then
            Midcast = set_combine(Midcast,sets.midcast.Minuet)
        elseif string.find(spell.name,'Paeon') then
            Midcast = set_combine(Midcast,sets.midcast.Paeon)
        elseif string.find(spell.name,'March') then
            Midcast = set_combine(Midcast,sets.midcast.March)
            if spell.name == 'Honor March' then 
                Midcast = set_combine(Midcast,{range="Marsyas"})
            end
        elseif string.find(spell.name,'Madrigal') then
            Midcast = set_combine(Midcast,sets.midcast.Madrigal)
        elseif string.find(spell.name,'Lullaby') then
            Midcast = set_combine(Midcast,sets.midcast.Lullaby)
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
        Aftercast = sets.Engaged
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
