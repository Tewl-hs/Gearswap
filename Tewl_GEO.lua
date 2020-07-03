function get_sets()

    -- Load Macros
    send_command('input /macro book 20;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 2')
    send_command('input //equipviewer pos 1663 915')

    sets.MoveSpeed = { feet = "Geomancy Sandals +3",}
    
    -- Gear sets
    sets.idle = { 
        main        = "Daybreak",
        sub         = { name="Genbu's Shield", augments={'"Cure" potency +3%','Mag. Acc.+5','HP+24',}},
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = "Befouled Crown",
        neck        = "Loricate Torque +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        body        = "Jhakri Robe +2",
        hands       = "Bagua Mitaines +3",
        left_ring   = "Defending Ring",
        right_ring  = "Gelatinous Ring +1",
        back        = "Moonlight Cape",
        waist       = "Fucho-no-Obi",
        legs        = "Assid. Pants +1",
        feet        = "Geomancy Sandals +3"            
    }

    sets.idle.DT = { -- Full DT items
        neck        = "Loricate Torque +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Gelatinous Ring +1",
        back        = "Moonlight Cape"
    }

    sets.luopan = { 
        main        = "Sucellus", -- Solstice: Pet: Regen -3, DT +1
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = "Azimuth Hood +1",
        hands       = "Geo. Mitaines +3",
        back        = "Nantosuelta's Cape",
        waist       = "Isa Belt",
        feet        = "Bagua Sandals +3"            
    }

    sets.precast = {}
    sets.precast.FC = { -- FC 81/80 QC: 7/10
        main        = "Solstice", -- 5
        ammo        = "Impatiens", -- 0|2
        head        = "Nahtirah Hat", -- 10
        neck        = "Orunmila's Torque", -- 5
        left_ear    = "Malignance Earring", -- 4
        right_ear   = "Loquac. Earring", -- 2
        body        = "Merlinic Jubbah", -- 11
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Lebeche Ring", -- 0|2
        back        = "Lifestream Cape", -- 7
        waist       = "Witful Belt", -- 3|3
        hands       = "Merlinic Dastanas", -- 6
        legs        = "Geomancy Pants +3", -- 15
        feet        = "Merlinic Crackows" -- 11       
    }
    sets.precast.JA = {}
    sets.precast.JA['Primeval Zeal'] = {
        head        = "Bagua Galero +3"
    }
    sets.precast.JA['Full Circle'] = {
        head        = "Azimuth Hood +1"
    }
    sets.precast.JA['Bolster'] = {
        body        = "Bagua Tunic +3"
    }
    sets.precast.JA['Life Cycle'] = {
        body        = "Geomancy Tunic +2"
    }
    sets.precast.JA['Curative Reecantation'] = {
        hands       = "Bagua Mitaines +3"
    }
    sets.precast.JA['Mending Halation'] = {
        legs        = "Bagua Pants +3"
    }
    sets.precast.JA['Radial Arcana'] = {
        feet        = "Bagua Sandals +3"
    }

    
    sets.midcast = {}
    sets.midcast['Geomancy'] = { 
        main        = "Solstice",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = "Azimuth Hood +1",
        neck        = "Incanter's Torque",
        body        = "Bagua Tunic +3",
        hands       = "Geo. Mitaines +3",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        back        = "Lifestream Cape",
        waist       = "Austertiy Belt +1",
        legs        = "Bagua Pants +3",   
        feet        = "Azimuth Gaiters +1"  
    }

    sets.midcast['Elemental Magic'] = { 
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Ghastly Tathlum +1",
        head        = "Jhakri Coronal +2",--"Bagua Galero +3",
        neck        = "Baetyl Pendant",
        left_ear    = "Malignance Earring",
        right_ear   = "Barkaro. Earring",
        body        = "Amalric Doublet +1", -- "Jhakri Robe +2",
        hands       = "Amalric Gages +1",--"Bagua Mitaines +3",
        left_ring   = "Mujin Band", -- Shiva Ring +1 if not bursting
        right_ring  = "Shiva Ring +1",
        waist       = "Eschan Stone",
        legs        = "Amalric Slops +1",--"Azimuth Tights +1",
        feet        = "Amalric Nails +1"            
    } 

    sets.midcast['Enfeebling Magic'] = {
        sub         = "Ammurapi Shield",
        neck        = "Incanter's Torque",
        body        = "Vanya Robe",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        waist       = "Luminary Sash"
    }

    sets.midcast['Dispelga'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        neck        = "Incanter's Torque",
        body        = "Vanya Robe",
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
        waist       = "Austertiy Belt +1"
    }

    sets.midcast['Healing Magic'] = {
        neck        = "Incanter's Torque"
    }

    sets.midcast.Cure = { 
        main        = "Daybreak",
        sub         = { name="Genbu's Shield", augments={'"Cure" potency +3%','Mag. Acc.+5','HP+24',}},
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        neck        = "Nodens Gorget",
        left_ear    = "Mendicant's Earring",
        head        = "Yanya Hood",
        body        = "Heka's Kalasiris",
        hands       = "Vanya Cuffs",
        back        = "Altruistic Cape",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs"         
    }

    end
    
    function precast(spell)
        if spell.english:startswith('Cure') then
            equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
        elseif spell.type == 'JobAbility' then
            if sets.precast.JA[spell.english] then
                equip(sets.precast.JA[spell.english])
            end
        elseif spell.action_type == 'Magic' then
            if spell.english == 'Dispelga' then
                equip(set_combine(sets.precast.FC,{main="Daybreak"}))
            else
                equip(sets.precast.FC)
            end
        end
    end
    
    function midcast(spell)
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
            if spell.english:startswith('Cure') then
                equip(set_combine(sets.midcast.cure,{body="Heka's Kalasiris"}))
            elseif sets.midcast[spell.english] then
                    equip (sets.midcast[spell.english])
            elseif sets.midcast[spell.skill] then
                equip (sets.midcast[spell.skill])
            end
        end
        if sets.midcast[spell.skill] then
            equip (sets.midcast[spell.skill])
        end
    end
    
    function aftercast(spell)
        goIdle()
    end

    function pet_change()
        goIdle()
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
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
    -- Determine what idle set to equip if a luopan is out
    function goIdle()
        if pet.isvalid then
            equip(set_combine(sets.idle,sets.luopan))
        else
            equip(sets.idle)
        end
    end

    function self_command(commandArgs)
        if commandArgs == 'goIdle' then
            goIdle()
        end
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
	    			if player.status ~= 'Engaged' then
	    				send_command('gs equip sets.MoveSpeed')
	    			end
        		    moving = true
			    elseif dist < 1 and moving then
				    if player.status ~= 'Engaged' then
					    send_command('gs c goIdle')
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