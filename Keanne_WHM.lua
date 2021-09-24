function get_sets()			
	-- Tables
	BarElement = T{'Barfire', 'Barfira', 'Barblizzard', 'Barblizzara', 'Baraero', 'Baraera', 'Barstone', 'Barstonra', 'Barthunder', 'Barthundra', 'Barwater', 'Barwatera'}

	sets.MoveSpeed = { feet = "Herald's Gaiters",}    --auto swaps when moving

    Macro_Book = '1'
    Macro_Page = '1'
    send_command('input /macro book '..Macro_Book..';wait 0.2;input /macro set '..Macro_Page)
	
	IdleMode = {'Normal', 'PDT'} i = 1
	CurrentWeapon = 'Empty'
	WeaponColor = Colors.Gray
	
	sets.Idle = { }
	sets.Idle.Normal = {
		main		= "Queller Rod",
		sub			= "Ammurapi Shield",
		ammo		= "Homiliary",
		head		= "Chironic Hat",
		neck		= "Cleric's torque",
		right_ear	= "Moonshade earring",
		left_ear	= "Novia earring",
		body		= "Piety bliaut +3",
		hands		= { name="Chironic Gloves", augments={'Weapon skill damage +1%','Attack+11','"Refresh"+2','Accuracy+4 Attack+4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Alaunus's Cape",
		waist		= "Fucho-no-obi",
		legs		= "Chironic Hose",
		feet		= "Chironic Slippers"
	}

	sets.Idle.DT = set_combine(sets.Idle,{
    	head		= "Bunzi's Hat",
    	body		= "Bunzi's Robe",
    	hands		= "Bunzi's Gloves",
    	legs		= "Bunzi's Pants",
    	--feet		= "Bunzi's Sabots", -- 6
		neck		= "Loricate Torque +1", -- 6
		left_ring	= "Defending Ring", -- 10
		back		= "Alaunus's Cape", -- 5
	})
				
	sets.precast = {}
	sets.precast.FastCast = {
		main		= { name="Gada", augments={'"Fast Cast"+5',}},
		sub			= "Ammurapi Shield",
		neck		= "Cleric's Torque",
		head		= "Nahtirah Hat",
		body		= "Inyanga Jubbah +2",
		ammo		= "Incantor Stone",
		hands		= { name="Chironic Gloves", augments={'MND+6','INT+1','"Fast Cast"+5','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
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
		sub			= "Ammurapi Shield",
	}	
	
	sets.Resting = {
		main		= "Queller Rod",
		sub			= "Ammurapi Shield",
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
	sets.midcast.Healing = {
		main		= "Yagrush",
		sub			= "Ammurapi Shield",
		head		= "Orison Cap +2",
		neck		= "Cleric's torque",
		left_ear	= "Magnetic Earring",
		right_ear	= "Loquacious Earring",
		body		= "Orvail Robe",
		hands		= "Orison Mitts +2",
		body		= "Ebers bliaut +1",
		feet		= "Ebers Duckbills +1"
	}

	sets.midcast.Cursna = set_combine(sets.midcast.Healing,{
		left_ring	= "Haoma's Ring",
		right_ring	= "Menelaus's Ring",
		head		= { name="Kaykaus Mitra +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
		body		= "Ebers bliaut +1",		
		neck		= "Debilis Medallion",
		right_ear	= "Meili Earring",
		Hands		= "Fanatic Gloves",
		legs		= "Theophany Pantaloons +3",
		back		= "Alaunus's Cape",
		feet		= "Vanya Clogs"
	})	
	
	sets.midcast.Cure = {
		main		= "Raetic Rod +1",
		ammo		= "Hydrocera",
		head		= "Kaykaus Mitra +1",
		neck		= "Cleric's torque",
		body		= "Ebers bliaut +1",
		left_ear	= "Nourishing Earring +1",
		right_ear	= "Glorious Earring",
		hands		= "Kaykaus Cuffs +1",
		back		= "Alaunus's Cape",
		waist		= "Austerity Belt",
		left_ring	= "Janniston Ring +-1",
		right_ring	= "Naji's Loop",
		legs		= "Ebers Pantaloons +1",
		feet		= "Piety duckbills +3"
	}	
	
	sets.midcast.Enhancing = {
		main		= { name="Gada", augments={'Enh. Mag. eff. dur. +5','"Mag.Atk.Bns."+3',}},
		sub			= "Ammurapi Shield",
		head		= "Telchine Cap",
		neck		= "Melic Torque",
		left_ear	= "Mimir Earring",
		right_ear	= "Andoaa Earring",
		body		= "Telchine chasuble",
		hands		= "Telchine Gloves",
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Fi Follet Cape +1",
		waist		= "Embla Sash",
		legs		= "Telchine Braconi",
		feet		= "Theophany Duckbills +3"
	}

	sets.midcast.Enhancing['Auspice'] = set_combine(sets.midcast.Enhancing,{
		feet		= "Ebers Duckbills +1"
	})

	sets.midcast.Regen = set_combine(sets.midcast.Enhancing,{
		main		= "Bolelabunga",
		sub			= "Ammurapi Shield",
		head		= "Inyanga Tiara +2",
		body		= "Piety bliaut +3",
		hands		= "Ebers Mitts +1",
	})
	sets.midcast.BarElement = set_combine(sets.midcast.Enhancing,{
		main		= { name="Gada", augments={'Enh. Mag. eff. dur. +5','"Mag.Atk.Bns."+3',}},
		sub			= "Ammurapi Shield",
		ammo		= "Incantor Stone",
		head		= "Ebers Cap +1",
		neck		= "Melic Torque",
		left_ear	= "Andoaa Earring",
		right_ear	= "Mimir Earring",
		body		= "Ebers bliaut +1",
		hands		= "Ebers Mitts +1",
		left_ring	= "Stikini Ring +1",
		right_ring	= "Stikini Ring +1",
		back		= "Fi Follet Cape +1",
		waist		= "Embla Sash",
		legs		= "Piety Pantaloons +3",
		feet		= "Ebers Duckbills +1"
	})
	
	sets.midcast.Enfeebling = {
		main		= { name="Grioavolr", augments={'Enfb.mag. skill +9','INT+3','Mag. Acc.+25','"Mag.Atk.Bns."+8',}},
		sub			= "Enki Strap",
		ammo		= "Hydrocera",
		head		= "Inyanga Tiara +2",
		body		= "Theophany bliaut +3",
		hands		= "Theophany Mitts +3",
		right_ring	= "Stikini Ring +1",
		left_ring	= "Stikini Ring +1",
		right_ear	= "Regal Earring",
		left_ear	= "Malignance Earring",
		back		= "Alaunus's Cape",
		waist		= "Luminary Sash",
		legs		= "Th. Pant. +3",
		feet		= "Theophany Duckbills +3",
		neck		= "Henic Torque"
	}
	
	sets.midcast.Divine = {
		main		= "Daybreak",
    	sub			= "Ammurapi Shield",
    	ammo		= "Hydrocera",
    	head		= "Bunzi's Hat",
    	body		= "Bunzi's Robe",
    	hands		= "Bunzi's Gloves",
    	legs		= "Bunzi's Pants",
    	feet		= "Bunzi's Sabots",
    	neck		= "Sanctity Necklace",
    	waist		= "Skrymir Cord",
    	left_ear	= "Malignance Earring",
    	right_ear	= "Regal Earring",
    	left_ring	= "Stikini Ring +1",
    	right_ring	= "Stikini Ring +1",
    	back		= { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	--------------------------------------------------------------------------
	-- THIS CODE IS FOR THE ONSCREEN DISPLAY
	--------------------------------------------------------------------------

	Colors = {
		Yellow = '\\cs(255,192,0)',
		Red = '\\cs(255,80,80)',
		Green = '\\cs(110,255,110)',
		Blue = '\\cs(140,160,255)',
		Gray = '\\cs(96,96,96)',
		White = '\\cs(255,255,255)'
	}
	
	items = require('resources').items

	texts = require('texts')
	if stateBox then stateBox:destroy() end

	local settings = windower.get_windower_settings()
	local x,y
    
	-- Adjust for screen resolution and positon of text on screen
	if settings["ui_x_res"] == 1920 and settings["ui_y_res"] == 1080 then
		x,y = settings["ui_x_res"]-1917, settings["ui_y_res"]-18 -- -285, -18
	else
		x,y = 0, settings["ui_y_res"]-17 -- -285, -18
	end

	stateBox = texts.new({flags = {draggable=false}})
	stateBox:pos(x,y)
	stateBox:font('Arial')
	stateBox:size(12)
	stateBox:bold(true)
	stateBox:bg_alpha(0)--128
	stateBox:right_justified(false)
	stateBox:stroke_width(2)
	stateBox:stroke_transparency(192)

	update_status()
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
		equip(sets.precast.FastCast)
	end
end
	
function midcast(spell,action)	
	if spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			if spell.english == 'Cursna' then
				equip(sets.midcast.Cursna)
			elseif spell.english:startswith('Cur') then
				equip(sets.midcast.Cure)
			else
				equip(sets.midcast.Healing)
			end
		elseif spell.skill == 'Enfeebling Magic' then
			equip(sets.midcast.Enfeebling)
		elseif spell.skill == 'Enhancing Magic' then
            if spell.name == 'Erase' then
				equip(set_combine(sets.midcast.Enhancing,{main="Yagrush",neck="Cleric's torque"}))
			elseif spell.name:startswith('Regen') then
				equip(sets.midcast.Regen)
			elseif spell.name:startswith('Bar') then
				equip(sets.midcast.BarElement)
			else
				if sets.midcast.Enhancing[spell.name] then
					equip(sets.midcast.Enhancing[spell.name])
				else
					equip(sets.midcast.Enhancing)
				end
			end
		elseif spell.skill == 'Divine Magic' then
			equip(sets.midcast.Divine)
		end
	end
end

function aftercast(spell)
	equip_check()
end

function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
end

function buff_change(buff,gain)
	if buff == "silence" and gain == "True" then
		if player.inventory['Echo Drops'] then
			send_command('@input /item "Echo Drops" <me>')
		else
			add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
		end
	end
end

function equip_check()
	local eq = sets.Idle.Normal
	if sets.Idle[IdleMode[i]] then
		eq = sets.Idle[IdleMode[i]]
	end
	if player.status == 'Engaged' then	
		eq = set_combine(eq, sets.Engaged)
	end
	equip(eq)
	update_status()
end

function equip_change()
	local ew = get_weapon()
	if ew ~= CurrentWeapon then -- If weapon changed
		CurrentWeapon = ew
		if CurrentWeapon == 'Empty' then
			WeaponColor = Colors.Gray
		else
			if CurrentWeapon == 'Yagrush' then
				WeaponColor = Colors.Blue
			else
				WeaponColor = Colors.White
			end
		end	
		equip_check()
	end
end

function get_weapon()
	if windower.ffxi.get_items().equipment.main > 0 and items[windower.ffxi.get_items().inventory[windower.ffxi.get_items().equipment.main].id].english then
		return items[windower.ffxi.get_items().inventory[windower.ffxi.get_items().equipment.main].id].english
	else
		return 'Empty'
	end
end

function self_command(cmd)
	local args = T(cmd:split(' '))
	if args[1] == 'cycle' and args[2] then
        if args[2] == 'idle' then
			i = i + 1 
			if (table.getn(IdleMode) < i) then i = 1 end
		end
		equip_check()
	elseif args[1] == 'equip_check' then
		equip_check()
	elseif args[1] == 'update_status' then
		update_status()
	end
end

--  Update onscreen display
function update_status()
	local spc = '   '

	stateBox:clear()
	stateBox:append(spc)

	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, IdleMode[i], spc)

	stateBox:append(status_text)
	stateBox:show()
end

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then
		stateBox:hide()
	end
	if (id == 0x1A or id == 0x50) then
		equip_change()
	end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then
		stateBox:show()
	end
	if (id == 0x37 or id == 0x1D) then
		equip_change()
	end
end)

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
                if player.status ~= 'Engaged' then
					send_command('gs c equip_check')
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