function get_sets()

    -- Load Macros
    send_command('input /macro book 1;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 1')
    send_command('input //equipviewer pos 1022 550')

    sets.MoveSpeed = { feet = "Geo. Sandals +1",}
    
    -- Gear sets
    sets.idle = { 
        main        = "Daybreak",
        sub         = "Genbu's Shield",
        range       = "Dunna",
        neck        = "Bagua Charm +1",
        head        = "Befouled Crown",
        body        = "Jhakri Robe +2",
        hands       = "Bagua Mitaines +1",
        legs        = "Assid. Pants +1",
        feet        = "Geo. Sandals +2",  
        back        = "Nantosuelta's Cape",
        left_ear    = "Moonshade Earring",
        right_ear   = "Loquac. Earring",
        left_ring   = "Stikini Ring +1", -- Need to buy/borrow
        right_ring  = "Stikini Ring +1",
        waist       = "Fucho-no-Obi",
    }

    sets.idle.DT = {
    
    }

    sets.luopan = { 
        main        = { name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        range       = "Dunna",
        head        = "Azimuth Hood +1",
        hands       = "Geo. Mitaines +2",
        back        = "Nantosuelta's Cape",
        waist       = "Isa Belt",
        feet        = "Bagua Sandals +1"            
    }

    sets.precast = {}
    sets.precast.fastcast = { -- 83/80
        main        = { name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}}, -- 5
        range       = "Dunna", -- 3
        head        = "Merlinic Hood", -- 14
        neck        = "Baetyl Pendant", -- 4
        right_ear   = "Loquac. Earring", -- 2
        body        = "Merlinic Jubbah", -- 12
        left_ring   = "Weather. Ring", -- 5
        right_ring  = "Prolix Ring", -- 2
        back        = "Lifestream Cape", -- 7
        waist       = "Witful Belt", -- 3 
        hands       = "Merlinic Dastanas", -- 6
        legs        = "Geomancy Pants +2", -- 13
        feet        = "Merlinic Crackows" -- 7        
    }
    sets.precast.JA = {}
    sets.precast.JA['Primeval Zeal'] = {
        head        = "Bagua Galero +1"
    }
    sets.precast.JA['Full Circle'] = {
        head        = "Azimuth Hood +1"
    }
    sets.precast.JA['Bolster'] = {
        body        = "Bagua Tunic +1"
    }
    sets.precast.JA['Life Cycle'] = {
        body        = "Geo. Tunic +1"
    }
    sets.precast.JA['Curative Reecantation'] = {
        hands       = "Bagua Mitaines + 1"
    }
    sets.precast.JA['Mending Halation'] = {
        legs        = "Bagua Pants +2"
    }
    sets.precast.JA['Radial Arcana'] = {
        feet        = "Bagua Sandals +1"
    }

    
    sets.midcast = {}
    sets.midcast['Geomancy'] = { 
        main        = { name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
        range       = "Dunna",
        head        = "Azimuth Hood +1",
        neck        = "Bagua Charm +1",
        body        = "Bagua Tunic +1",
        hands       = "Geo. Mitaines +2",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        back        = "Lifestream Cape",
        waist       = "Austerity Belt +1",
        legs        = "Bagua Pants +2",   
        feet        = "Azimuth Gaiters +1"  
    }

    sets.midcast['Elemental Magic'] = { 
        main        = "Daybreak",
        head        = "Jhakri Coronal +1",
        neck        = "Baetyl Pendant",
        body        = "Jhakri Robe +2",
        hands       = "Jhakri Cuffs +1",
        left_ring   = "Shiva Ring +1", -- Need to buy/borrow
        right_ring  = "Mujin Band",
        waist       = "Eschan Stone",
        legs        = "Jhakri Slops +1",
        feet        = "Jhakri Pigaches +2"            
    } 

    sets.midcast['Enfeebling Magic'] = {
        body        = "Vanya Robe",
        hands       = "Azimuth Gloves +1",
        feet        = "Bagua Sandals +1",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        waist       = "Luminary Sash"
    }

    sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'],{
        main        = "Daybreak",
    })

    sets.midcast['Enhancing Magic'] = {
        waist       = "Embla Sash"
    }

    sets.midcast['Dark Magic'] = {
        head        = "Bagua Galero +1",
        body        = "Geo. Tunic +1",
        Pants       = "Azimuth Tights +1",
        waist       = "Austertiy Belt +1",
        neck        = "Erra Pendant"
    }

    sets.midcast['Healing Magic'] = {

    }

    sets.midcast.Cure = { 
        main        = { name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}}, -- Needs something here
        sub         = "Genbu's Shield",
        range       = "Dunna",
        head        = "Yanya Hood",
        body        = "Vanya Robe",
        hands       = "Vanya Cuffs",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs"         
    }

    end
    
    function precast(spell)        
        if buffactive.Silence and spell.action_type == 'Magic' then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
        end

        if spell.type == 'JobAbility' then
            if sets.precast.JA[spell.english] then
                equip(sets.precast.JA[spell.english])
            end
        else
            if spell.english == 'Dispelga' then
                equip(set_combine(sets.precast.fastcast,{main="Daybreak",waist="Embla Sash"}))
            else
                equip(sets.precast.fastcast)
            end
        end
    end
    
    function midcast(spell)
        if spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' then
            if spell.english:startswith('Cure') then
                equip(sets.midcast.cure)
            elseif sets.midcast[spell.english] then
                equip(sets.midcast[spell.english])
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        end
        if sets.midcast[spell.skill] then
            equip(sets.midcast[spell.skill])
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
        elseif commandArgs == 'doDispel' then
            send_command('input /ma Dispel <bt>')
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