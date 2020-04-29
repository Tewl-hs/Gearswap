function get_sets()

-- Load Macros
    send_command('input /macro book 1;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 3')

    sets.MoveSpeed = { feet = "Fili cothurnes +1",}    --auto swaps when moving
    send_command('input //equipviewer pos 1663 934')

    -- Augments
    Kali = {}
    Kali.Skill      = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',} }
    Kali.MACC       = { name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',} }

-- Gear sets

    sets.precast = { }
    sets.precast.FastCast = { 
        main        = Kali.Skill, -- 7
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Fili Calot +1", -- 14 song
        body        = "Inyanga Jubbah +1", -- 13
        hands       = "Leyline Gloves", -- 6
        legs        = "Aya. Cosciales +2", -- 6
        feet        = "Bihu Slippers +3", -- 10 song
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Aoidos' Earring", -- 2 song
        right_ear   = "Loquacious Earring", --2
        left_ring   = "Prolix Ring", -- 2
        right_ring  = "Kishar Ring", -- 4 
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10888
    }
    sets.precast.DummySong = { 
        range       = "Daurdabla",
        neck        = "Orunmila's Torque"
    }
    sets.precast.Nightingale = {
        feet        = "Bihu Slippers +3"
    }
    sets.precast.Troubadour = {
        body        = "Bihu Justaucorps +1"
    }
    sets.precast.SoulVoice = {
        legs        = "Bihu Cannions +1"
    }

    sets.midcast = { }
    sets.midcast.BardSong = {        
        main        = Kali.Skill, 
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Fili Calot +1",
        body        = "Fili Hongreline +1",
        hands       = "Inyanga Dastanas +1",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +1",
        neck        = "Moonbow Whistle +1",
        waist       = "Luminary Sash",
        left_ear    = "Aoidos' Earring",
        right_ear   = "Musical Earring",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
     }
    sets.midcast.Ballad = {
        legs        = "Fili Rhingrave +1"
    }
    sets.midcast.Minuet = {
        Body        = "Fili Hongreline +1"
    }
    sets.midcast.March = {
        hands       = "Fili Manchettes +1"
    }
    sets.midcast.Madrigal = {
        head        = "Fili Calot +1"
    }

    sets.PC = { }
    sets.MC = { }

    sets.aftercast = { }
    sets.aftercast.Idle = {        
        main        = "Sangoma", 
        sub         = "Genbu's Shield", 
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
        back        = "Moonbeam Cape"
    }
end

function precast(spell)
    if spell.type=="Item" then
        return
    end
    if spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' then
        if buffactive.Silence then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
        end
        sets.PC = sets.precast.FastCast
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            sets.PC = set_combine(sets.PC, {sub=Kali.MACC})
        end
        if spell.english == 'Honor March' then
            sets.PC = set_combine(sets.PC, {range="Marsyas"})
        elseif sets.precast[spell.english] then
            sets.PC = set_combine(sets.PC, sets.precast[spell.english])
        elseif spell.english == 'Knight\'s Minne' or spell.english == 'Knight\'s Minne II' then
            sets.PC = set_combine(sets.PC,sets.precast.DummySong)
        end
        equip(sets.PC)    
    end
end

function midcast(spell)
    if spell.type=="BardSong" then 
        if spell.english == 'Knight\'s Minne' or spell.english == 'Knight\'s Minne II' then
            add_to_chat(121,'--- Singing Dummy Song ---')
            return
        end

        sets.MC = sets.midcast.BardSong
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            sets.MC = set_combine(sets.MC, {sub=Kali.MACC})
        end
        if string.find(spell.english,'Ballad') then
            sets.MC = set_combine(sets.MC,sets.midcast.Ballad)
        elseif string.find(spell.english,'Minuet') then
            sets.MC = set_combine(sets.MC,sets.midcast.Minuet)
        elseif string.find(spell.english,'March') then
            sets.MC = set_combine(sets.MC,sets.midcast.March)
            if spell.english == 'Honor March' or string.find(spell.english,'Lullaby') then 
                sets.MC = set_combine(sets.MC,{range="Marsyas"})
            end
        elseif string.find(spell.english,'Madrigal') then
            sets.MC = set_combine(sets.MC,sets.midcast.Madrigal)
        end
        equip(sets.MC)
    end
end

function aftercast(spell)
    goIdle()
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        goIdle()
    end
end

function goIdle()
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        equip(set_combine(sets.aftercast.Idle,{main=Kali.Skill},{sub=Kali.MACC}))
    else
        equip(sets.aftercast.Idle)
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

--- Detecting Movement : Found @ https://www.ffxiah.com/forum/topic/53719/new-area-function-councilors-garb/
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
