--[[
	Files: BRD.lua 
-]]
function get_sets()
    -- Load Macros
    send_command('input /macro book 1;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 2')

    sets.MoveSpeed = { feet = "Fili Cothurnes +1",}
    send_command('input //equipviewer pos 1022 573')

    -- Augments
    Kali = {}
    Kali.Skill      = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',} }
    Kali.MACC       = { name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',} }
    -- DummySongs
    DummySongs = T{'Knight\'s Minne', 'Knight\'s Minne II'}

    Offhand = { sub = "Ternion Dagger +1" }

    -- Gear sets
    sets.precast = { }
    sets.precast.FastCast = { -- 
        head        = "Nahtirah Hat", -- 10
        body        = "Inyanga Jubbah +2", -- 14
        hands       = "Leyline Gloves", -- 5
        legs        = "Aya. Cosciales +2", -- 6
        waist       = "Embla Sash", -- 5
        right_ear   = "Loquacious Earring", -- 2
        left_ring   = "Weather. Ring +1", -- 5
        right_ring  = "Kishar Ring", -- 4 
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10
    }
    sets.precast.BardSong = set_combine(sets.precast.FastCast,{
        head        = "Fili Calot +1", -- 14 song
        body        = "Brioso Justau. +3", --15 song
        feet        = "Bihu Slippers +3", -- 10 song
    })
    sets.precast.DummySong = set_combine(sets.precast.BardSong,{ 
        range       = "Blurred Harp +1",
    })

    sets.precast['Nightingale'] = { feet = "Bihu Slippers +3" }
    sets.precast['Troubadour'] = { body = "Bihu Jstcorps. +3" }
    sets.precast['Soul Voice'] = { legs = "Bihu Cannions +3" }

    sets.precast.WS = {
        
    }

    sets.midcast = { }
    sets.midcast.BardSong = {        
        range       = "Gjallarhorn",
        head        = "Bihu Roundlet +3",
        body        = "Fili Hongreline +1",
        hands       = "Inyan. Dastanas +2",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +3",
        neck        = "Moonbow Whistle +1",
        waist       = "Luminary Sash",
        left_ear    = "Crep. Earring",
        right_ear   = "Regal Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe2" },
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
    }

    sets.midcast.Threnody = { body = "Mous. Manteel +1" }
    sets.midcast.Scherzo = { feet = "Fili Cothurnes +1" }
    sets.midcast.Carol = { hands = "Mousai Gages +1" }
    sets.midcast.Minne = { legs = "Mous. Seraweels +1" }
    sets.midcast.Etude = { head = "Mousai Turban +1" }
    sets.midcast.Mambo = { feet = "Mou. Crackows +1" }
    sets.midcast.Ballad = { legs = "Fili Rhingrave +1" }
    sets.midcast.Minuet = { body = "Fili Hongreline +1" }
    sets.midcast.March = { hands = "Fili Manchettes +1" }
    sets.midcast.Madrigal = { head = "Fili Calot +1" }
    sets.midcast.Lullaby = { hands = "Brioso Cuffs +3" }
    sets.midcast.Paeon = { head = "Brioso Roundlet +3" }

    sets.aftercast = { }
    sets.aftercast.Idle = { 
        range       = "Gjallarhorn",
        head        = "Bihu Roundlet +3",
        body        = "Fili Hongreline +1",
        hands       = "Inyan. Dastanas +2",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +3",
        neck        = "Moonbow Whistle +1",
        waist       = "Luminary Sash",
        left_ear    = "Crep. Earring",
        right_ear   = "Regal Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe2" },
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10
    }
    sets.aftercast.Engaged = {
        range       = "Gjallarhorn",
        head        = "Bihu Roundlet +1",
        body        = "Fili Hongreline +1",
        hands       = "Inyan. Dastanas +2",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +3",
        neck        = "Moonbow Whistle +1",
        waist       = "Luminary Sash",
        left_ear    = "Crep. Earring",
        right_ear   = "Regal Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe2" },
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10
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
        if string.find(spell.name,'Lullaby') and spell.name:startswith('Horde') then
            Precast = set_combine(Precast,{range="Blurred Harp +1"})
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
                Midcast = set_combine(Midcast, {range="Marsyas"})
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
