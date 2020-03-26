function get_sets()			

	sets.MoveSpeed = { feet = "Herald's Gaiters",}    --auto swaps when moving
	
	--TP Sets--
	sets.WHM = {}
	
	sets.WHM.Idle = {
		main="Queller Rod",
		sub="Genbu's Shield",
		ammo="Homiliary",
		head="Inyanga Tiara +2",
		neck="Cleric's torque",
		ear2="Moonshade earring",
		ear1="Novia earring",
		body="Piety briault +3",
		hands="Inyanga Dastanas +2",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Alaunus's Cape",
		waist="Fucho-no-obi",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +1"
	}
				
	sets.WHM.FastCast = {
		neck="Cleric's Torque",
		head="Nahtirah Hat",
		body="Inyanga Jubbah +2",
		ammo="Incantor Stone",
		hands="Chironic gloves",
		ear1="Loquac. Earring",
		ear2="Malignance earring",
		feet="Regal Pumps +1",
		legs="Ayanmo cosciales +2",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		waist="Embla Sash"
	}

	sets.WHM.Melee = {
		main="Yagrush",
		sub="Genbu's Shield"
	}	
	
	sets.WHM.Resting = {
		main="Queller Rod",
		sub="Genbu's Shield",
		ammo="Homiliary",
		head="Nefer Khat",
		neck="Eidolon Pendant",
		ear1="Magnetic earring",
		ear2="Moonshade earring",
		body="Orvail Robe",
		hands="Oracle's Gloves",
		ring1="Janniston Ring",
		ring2="Tamas Ring",
		back="Felicitas Cape",
		waist="Austerity Belt",
		legs="Nisse Slacks",
		feet="Avocat Pigaches"
	}
	
	sets.WHM.Healing = set_combine(sets.WHM.Idle,{
		main="Yagrush",
		sub="Genbu's Shield",
		head="Orison Cap +2",
		neck="Cleric's torque",
		ear1="Magnetic Earring",
		ear2="Loquacious Earring",
		body="Orvail Robe",
		hands="Orison Mitts +2",
		body="Ebers bliaud +1",
		feet="Eber's Duckbills +1"
	})

	sets.WHM.Cursna = set_combine(sets.WHM.Healing,{
		ring1="Haoma's Ring",
		ring2="Menelaus's's Ring",
		body="Ebers bliaud +1",		
		neck="Debilis Medallion",
		Hands="Fanatic Gloves",
		legs="Theophany Pantaloons +3",
		back="Alaunus's Cape",
		feet="Vanya Clogs"
	})	
	
	sets.WHM.Cure = set_combine(sets.WHM.Idle,{
		main="Queller Rod",
		ammo="Hydrocera",
		head="Ebers cap +1",
		neck="Cleric's torque",
		body="Ebers bliaud +1",
		ear1="Nourishing Earring +1",
		ear2="Glorious Earring",
		hands="Bokwus Gloves",
		back="Alaunus's Cape",
		waist="Witful Belt",
		ring1="Janniston Ring",
		ring2="Tamas Ring",
		legs="Ebers Pantaloons +1",
		feet="Piety duckbills +3"
	})	
	
	sets.WHM.Enhancing = set_combine(sets.WHM.Idle,{
		main="Yagrush",
		sub="Genbu's Shield",
		head="Ebers cap +1",
		neck="Colossus's Torque",
		ear1="Magnetic Earring",
		body="Cleric's Briault",
		hands="Orison Mitts +2",
		back="Merciful Cape",
		waist="Embla Sash",
		legs="Cleric's Pantaloons +2",
		feet="Eber's Duckbills +1"
	})
	
	sets.WHM.Enfeebling = set_combine(sets.WHM.Idle,{
		main="Queller Rod",
		sub="Genbu's Shield",
		ammo="Hedgehog Bomb",
		head="Elite Beret",
		body="Healer's Briault",
		hands="Cleric's Mitts",
		ring2="Kishar Ring",
		ear1="Magnetic Earring",
		back="Alaunus's Cape",
		waist="Hierarch Belt",
		legs="Augur's brais",
		feet="Rubeus Boots",
		neck="Spider Torque"
	})
	
	sets.WHM.BarSpells = set_combine(sets.WHM.Idle,{
		main="Yagrush",
		sub="Genbu's Shield",
		ammo="Incantor Stone",
		neck="Colossus's Torque",
		ear1="Magnetic Earring",
		body="Ebers Bliaud +1",
		hands="Augur's gloves",
		back="Merciful Cape",
		legs="Cleric's Pantaloons +2",
		feet="Orison Duckbills +2",
		head="Orison Cap +2"
	})
	
	sets.WHM.Divine = set_combine(sets.WHM.Idle,{
		main="Queller Rod",
		sub="Genbu's Shield",
		ammo="Incantor Stone",
		neck="Inquisitor's Chain",
		ear1="Novio Earring",
		body="Auger's Jaseran",
		hands="Cleric's mitts",
		waist="Witch sash",
		legs="Theophany Pantaloons",
		feet="Rubeus Boots",
		head="Marduk's Tiara"
	})
	
end

function equipx(gearset)
	if player.status == 'Engaged' then
		equip(gearset,sets.WHM.Melee)
	else
		equip(gearset)
	end
end

function precast(spell)
	if spell.type:endswith('Magic') then
		equipx(sets.WHM.FastCast)
	end
end
	
function midcast(spell,action)
	if spell.type == 'WeaponSkill' then
		-- Do nothing here (yet)
	elseif spell.type == 'JobAbility' then
		-- Do nothing- here (yet)
	elseif spell.type == 'Ninjitsu' then
		-- Do nothing here (yet)
	elseif spell.type == 'BardSong' then
		-- Do nothing here (yet)
	elseif spell.type:endswith('Magic') then
		if buffactive.Silence then
			cancel_spell()
			if player.inventory['Echo Drops'] then
				send_command('@input /item "Echo Drops" <me>')
				add_to_chat(123,'Using Echo Drop, Recast '..spell.name..' on '..spell.target.name)	
			else
				add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
			end
			return
		end
		if spell.skill == 'Healing Magic' then
			if spell.english:startswith('Cure') or spell.english:startswith("Cura") then
				equipx(sets.WHM.Cure)
			elseif spell.english == 'Cursna' then
				equipx(sets.WHM.Cursna)
			else
				equipx(sets.WHM.Healing)
			end
		elseif spell.skill == 'Enfeebling Magic' then
			equipx(sets.WHM.Enfeebling)
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name=="Erase" then
				equipx(set_combine(sets.WHM.Enhancing,{neck="Cleric's torque"}))
			else
				equipx(sets.WHM.Enhancing)
			end
		elseif spell.skill == 'Divine Magic' then
			equipx(sets.WHM.Divine)
		end
	end
end

function aftercast(spell)
	equipx(sets.WHM.Idle)
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.WHM.Resting)
	else
		equipx(sets.WHM.Idle)
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
		equipx(sets.WHM.Idle)
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