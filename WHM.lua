function get_sets()			
	-- Tables
	BarElement = T{'Barfire', 'Barfira', 'Barblizzard', 'Barblizzara', 'Baraero', 'Baraera', 'Barstone', 'Barstonra', 'Barthunder', 'Barthundra', 'Barwater', 'Barwatera'}

	sets.MoveSpeed = { feet = "Herald's Gaiters",}    --auto swaps when moving
	
	sets.Idle = {
		main		= "Queller Rod",
		sub 		= "Genbu's Shield",
		ammo		= "Homiliary",
		head		= "Inyanga Tiara +2",
		neck		= "Cleric's torque",
		right_ear	= "Moonshade earring",
		left_ear	= "Novia earring",
		body		= "Piety briault +3",
		hands		= "Inyanga Dastanas +2",
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Alaunus's Cape",
		waist		= "Fucho-no-obi",
		legs		= "Inyanga Shalwar +2",
		feet		= "Chironic Slippers"
	}
				
		sets.precast = {}
		sets.precast.FastCast = {
		main		= "Grioavolr",
		neck		= "Cleric's Torque",
		head		= "Nahtirah Hat",
		body		= "Inyanga Jubbah +2",
		ammo		= "Incantor Stone",
		hands		= "Chironic gloves",
		left_ear	= "Loquac. Earring",
		right_ear	= "Malignance earring",
		feet		= "Regal Pumps +1",
		legs		= "Ayanmo cosciales +2",
		left_ring	= "Prolix Ring",
		right_ring	= "Kishar Ring",
		back		= "Alaunus's Cape",
		waist		= "Embla Sash"
	}

	sets.Engaged = {
		main		= "Yagrush",
		sub 		= "Genbu's Shield"
	}	
	
	sets.Resting = {
		main		= "Queller Rod",
		sub 		= "Genbu's Shield",
		ammo		= "Homiliary",
		head		= "Nefer Khat",
		neck		= "Eidolon Pendant",
		left_ear	= "Magnetic earring",
		right_ear	= "Moonshade earring",
		body		= "Orvail Robe",
		hands		= "Oracle's Gloves",
		left_ring	= "Janniston Ring",
		right_ring	= "Tamas Ring",
		back		= "Felicitas Cape",
		waist		= "Austerity Belt",
		legs		= "Nisse Slacks",
		feet		= "Avocat Pigaches"
	}
	
		sets.midcast = {}
		sets.midcast.Healing = set_combine(sets.Idle,{
		main		= "Yagrush",
		sub 		= "Genbu's Shield",
		head		= "Orison Cap +2",
		neck		= "Cleric's torque",
		left_ear	= "Magnetic Earring",
		right_ear	= "Loquacious Earring",
		body		= "Orvail Robe",
		hands		= "Orison Mitts +2",
		body		= "Ebers bliaud +1",
		feet		= "Ebers Duckbills +1"
	})

	sets.midcast.Cursna = set_combine(sets.Healing,{
		left_ring	= "Haoma's Ring",
		right_ring	= "Menelaus's's Ring",
		body		= "Ebers bliaud +1",		
		neck		= "Debilis Medallion",
		right_ear	= "Meili Earring",
		Hands		= "Fanatic Gloves",
		legs		= "Theophany Pantaloons +3",
		back		= "Alaunus's Cape",
		feet		= "Vanya Clogs"
	})	
	
	sets.midcast.Cure = set_combine(sets.Idle,{
		main		= "Queller Rod",
		ammo		= "Hydrocera",
		head		= "Ebers cap +1",
		neck		= "Cleric's torque",
		body		= "Ebers bliaud +1",
		left_ear	= "Nourishing Earring +1",
		right_ear	= "Glorious Earring",
		hands		= "Bokwus Gloves",
		back		= "Alaunus's Cape",
		waist		= "Witful Belt",
		left_ring	= "Janniston Ring",
		right_ring	= "Tamas Ring",
		legs		= "Ebers Pantaloons +1",
		feet		= "Piety duckbills +3"
	})	
	
	sets.midcast.Enhancing = set_combine(sets.Idle,{
		main		= "Gada",
		sub			= "Genbu's Shield",
		head		= "Telchine Cap",
		neck		= "Melic Torque",
		left_ear	= "Magnetic Earring",
		right_ear	= "Andoaa Earring",
		body		= "Telchine chasuble",
		hands		= "Telchine Gloves",
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Merciful Cape",
		waist		= "Embla Sash",
		legs		= "Telchine Braconi",
		feet		= "Theophany Duckbills +3"
	})

	sets.midcast.Regen = set_combine(sets.Enhancing,{
		main		= "Bolelabunga",
		head		= "Inyanga Tiara +2",
		body		= "Piety Briault +3",
		hands		= "Ebers Mitts +1",
	})
	
	sets.midcast.Enfeebling = set_combine(sets.Idle,{
		main		= "Queller Rod",
		sub 		= "Genbu's Shield",
		ammo		= "Hedgehog Bomb",
		head		= "Elite Beret",
		body		= "Healer's Briault",
		hands		= "Cleric's Mitts",
		right_ring	= "Kishar Ring",
		left_ear	= "Magnetic Earring",
		back		= "Alaunus's Cape",
		waist		= "Hierarch Belt",
		legs		= "Augur's brais",
		feet		= "Rubeus Boots",
		neck		= "Spider Torque"
	})
	
	sets.midcast.BarElement = set_combine(sets.Idle,{
		main		= "Chatoyant Staff",
		sub 		= "Fulcio Grip",
		ammo		= "Incantor Stone",
		head		= "Ebers Cap +1",
		neck		= "Colossus's Torque",
		left_ear	= "Magnetic Earring",
		body		= "Ebers Bliaud +1",
		hands		= "Ebers Mitts +1",
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Merciful Cape",
		waist		= "Embla Sash",
		legs		= "Piety Pantaloons +3",
		feet		= "Ebers Duckbills +1"
	})

	sets.midcast.BarStatus = set_combine(sets.Idle,{
		main		= "Chatoyant Staff",
		sub 		= "Fulcio Grip",
		ammo		= "Incantor Stone",
		head		= "Ebers Cap +1",
		neck		= "Colossus's Torque",
		left_ear	= "Magnetic Earring",
		body		= "Ebers Bliaud +1",
		hands		= "Ebers Mitts +1",
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Merciful Cape",
		waist		= "Embla Sash",
		legs		= "Piety Pantaloons +3",
		feet		= "Ebers Duckbills +1"
	})
	
	sets.midcast.Divine = set_combine(sets.Idle,{
		main		= "Queller Rod",
		sub 		= "Genbu's Shield",
		ammo		= "Incantor Stone",
		neck		= "Inquisitor's Chain",
		left_ear	= "Novio Earring",
		body		= "Auger's Jaseran",
		hands		= "Cleric's mitts",
		waist		= "Witch sash",
		legs		= "Theophany Pantaloons",
		feet		= "Rubeus Boots",
		head		= "Marduk's Tiara"
	})
	
end

function equipx(gearset)
	if player.status == 'Engaged' then
		equip(gearset,sets.Engaged)
	else
		equip(gearset)
	end
end

function precast(spell)
    if spell.type=="Item" then
        return
    end
    if spell.action_type == 'Magic' then
        if buffactive.Silence then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
                add_to_chat(123,'You were silenced try recasting!')	
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
		end
		equipx(sets.precast.FastCast)
	end
end
	
function midcast(spell,action)	
	if spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			if spell.english == 'Cursna' then
				equipx(sets.midcast.Cursna)
			elseif spell.english:startswith('Cur') then
				equipx(sets.midcast.Cure)
			else
				equipx(sets.midcast.Healing)
			end
		elseif spell.skill == 'Enfeebling Magic' then
			equipx(sets.midcast.Enfeebling)
		elseif spell.skill == 'Enhancing Magic' then
            if spell.name == 'Erase' then
				equipx(set_combine(sets.midcast.Enhancing,{main="Yagrush",neck="Cleric's torque"}))
			elseif spell.name:startswith('Regen') then
				equipx(sets.midcast.Regen)
			elseif spell.name:startswith('Bar') then
				if BarElement:contains(spell.name) then
					equipx(sets.midcast.BarElement)
				else
					equipx(sets.midcast.Barstatus)
				end
			else
				equipx(sets.midcast.Enhancing)
			end
		elseif spell.skill == 'Divine Magic' then
			equipx(sets.midcast.Divine)
		end
	end
end

function aftercast(spell)
	equipx(sets.Idle)
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.Resting)
	else
		equipx(sets.Idle)
	end
end

function buff_change(buff,gain)
	if name == "silence" and gain =="True" then
		if player.inventory['Echo Drops'] then
			send_command('@input /item "Echo Drops" <me>')
		else
			add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
		end
	end
end

function self_command(command)
	if command == 'goIdle' then
		equipx(sets.Idle)
	end
end

--- Detecting Movement 
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