function get_sets()

-- Load Macros
    send_command('input /macro book 1;wait 0.2;input /macro set 1;')

    -- Augments
    Kali = {}
    Kali.Skill      = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',} }
    Kali.MACC       = { name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',} }

-- Gear sets

    sets.precast = { }
    sets.precast.Normal = { 
        main        = Kali.Skill, 
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Nahtirah Hat",
        body        = "Inyanga Jubbah +1",
        hands       = "Madk. Dastanas +1",
        legs        = "Aya. Cosciales +2",
        feet        = "Bihu Slippers +3",
        neck        = "Aoidos' Matinee",
        waist       = "Aoidos' Belt",
        left_ear    = "Aoidos' Earring",
        right_ear   = "Loquacious Earring",
        left_ring   = "Prolix Ring",
        right_ring  = "Kishar Ring",
        back        = "Intarabus's Cape"
    }
    sets.precast.DummySong = { 
        range       = "Daurdabla",
        neck        = "Orunmila's Torque"
    }
    sets.precast.Nightingale = {
        feet        = "Bihu Slippers +1"
    }
    sets.precast.Troubadour = {
        body        = "Bihu Justaucorps +1"
    }
    sets.precast.SoulVoice = {
        legs        = "Bihu Cannions +1"
    }

    sets.midcast = { }
    sets.midcast.Normal = {        
        main        = Kali.Skill, 
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Fili Calot +1",
        body        = "Fili Hongreline +1",
        hands       = "Inyanga Dastanas +1",
        legs        = "Inyanga Shalwar +2",
        feet        = "Fili cothurnes +1",
        neck        = "Moonbow Whistle +1",
        waist       = "Aoidos' Belt",
        left_ear    = "Aoidos' Earring",
        right_ear   = "Musical Earring",
        left_ring   = "Inyanga Ring",
        right_ring  = "Kishar Ring",
        back        = "Intarabus's Cape"
     }
    sets.midcast.Ballad = {
        legs        = "Fili Rhingrave"
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
        head        = "Aya. Zucchetto +1",
        body        = "Ayanmo Corazza +2",
        hands       = "Aya. Manopolas +1",
        legs        = "Aya. Cosciales +2",
        feet        = "Aya. Gambieras +2",
        neck        = "Loricate Torque +1",
        waist       = "Flume Belt +1",
        left_ear    = "Colossus's Earring",
        right_ear   = "Cassie Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Gelatinous Ring +1",
        back        = "Moonbeam Cape"
    }
end

function precast(spell)
    if spell.type=="Item" then
        return
    end
    sets.PC = sets.precast.Normal
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

function midcast(spell)
    if spell.type=="BardSong" then 
        if spell.english == 'Knight\'s Minne' or spell.english == 'Knight\'s Minne II' then
            send_command('@input /echo <----- Dummy Song Playing ----->')
            return
        end

        sets.MC = sets.midcast.Normal
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            sets.MC = set_combine(sets.MC, {sub=Kali.MACC})
        end
        if string.find(spell.english,'Ballad') then
            sets.MC = set_combine(sets.MC,sets.midcast.Ballad)
        elseif string.find(spell.english,'Minuet') then
            sets.MC = set_combine(sets.MC,sets.midcast.Minuet)
        elseif string.find(spell.english,'March') then
            sets.MC = set_combine(sets.MC,sets.midcast.March)
            if spell.english == 'Honor March' then 
                sets.MC = set_combine(sets.MC,{range="Marsyas"})
            end
        elseif string.find(spell.english,'Madrigal') then
            sets.MC = set_combine(sets.MC,sets.midcast.Madrigal)
        end
        equip(sets.MC)
    end
end

function aftercast(spell)
    equip(sets.aftercast.Idle)
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.aftercast.Idle)
    end
end

function buff_change(buff,gain)
    if buff == 'silence' and gain then
		if player.inventory['Echo Drops'] or player.satchel['Echo Drops'] then
			send_command('@input /item "Echo Drops" <me>')
		else
			add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
		end
	end
end
