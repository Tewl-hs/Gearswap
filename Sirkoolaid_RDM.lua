function get_sets()			
	sets.MoveSpeed = { legs = "Carmine Cuisses +1",}    --auto swaps when moving

    Macro_Book = '1'
    Macro_Page = '1'
	send_command('input /macro book '..Macro_Book..';wait 0.2;input /macro set '..Macro_Page)
	send_command('input //equipviewer pos 1022 575')

	Capes = {}
	Capes.MND = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
				
	sets.precast = {}
	sets.precast.FastCast = { -- 63/50
		ammo		= "Sapience Orb", -- 2
		head		= "Atrophy Chapeau +3", -- 16
		body		= "Vitiation Tabard +3", -- 15
		waist		= "Embla Sash", -- 5
		left_ear	= "Loquac. Earring", -- 2
		right_ear	= "Malignance earring", -- 4
		left_ring	= "Weatherspoon Ring", -- 5
		right_ring	= "Kishar Ring", -- 4
		back		= Capes.MND -- 10
	}

	sets.precast.JA = {}
	sets.precast.JA["Composure"] = {

	}
	
	sets.midcast = {}	
	sets.midcast.Cursna = {
	}
	
	sets.midcast.Cure = {	
		main		= "Daybreak",
		sub			= "Ammurapi Shield",
		ammo		= "",
		head		= "Vanya Hood",
		body		= "Artsieq Jubbah",
		hands		= "Vanya Cuffs",
		legs		= "Chironic Hose",
		feet		= "Vanya Clogs",
		neck		= "Dls. Torque +2",
		waist		= "Othila Sash",
		left_ear	= "Magnetic Earring",
		right_ear	= "Malignance Earring",
		left_ring	= { name="Stikini Ring +1", bag="Wardrobe1" },
		right_ring	= "Lebeche Ring",
		back		= Capes.MND	
	}
	sets.midcast.Healing = {
	}
	sets.midcast.Enfeebling = {
        main		= "Daybreak",
        sub			= "Ammurapi Shield",
        ammo		= "Regal Gem",
        head		= "Viti. Chapeau +3",
        body		= "Lethargy Sayon +1",
        hands		= "",
        legs		= "Chironic Hose",
        feet		= "Vitiation Boots +3",
        neck		= "Dls. Torque +2",
        left_ear	= "Malignance Earring",
        right_ear	= "Snotra Earring",
        left_ring	= { name="Stikini Ring +1", bag="Wardrobe1" },
        right_ring	= "Kishar Ring",
		waist		= "Luminary Sash",
		back		= Capes.MND
	}
	sets.midcast.Enhancing = {	
	}
	sets.midcast.Elemental = {
	}

	sets.aftercast = {}
	sets.aftercast.engaged = {
	}
	sets.aftercast.idle = {
		main		= "Daybreak",
		sub			= "Ammurapi Shield",
		ammo		= "Homiliary",
		head		= "Vitiation Chapeau +3",
		body		= "Jhakri Robe +2",
		hands		= "Chironic Gloves", 
		legs		= "Chironic Hose",
		feet		= "Chironic Slippers",
		neck		= "Dls. Torque +2",
		waist		= "Fucho-no-obi",
		left_ear	= "Halasz Earring",
		right_ear	= "Moonshade earring",
		left_ring	= { name="Stikini Ring +1", bag="Wardrobe1" },
		right_ring	= { name="Stikini Ring +1", bag="Wardrobe2" },
		back		= "Solemnity Cape"
	}
end

function precast(spell)
    if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.english] then
			equip(sets.precast.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
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
	if spell.action_type == 'Magic' then
		if spell.skill == 'Healing Magic' then
			if spell.english == 'Cursna' then
				-- equip(sets.midcast.Cursna)
			elseif spell.english:startswith('Cur') then
				equip(sets.midcast.Cure)
			else
				equip(sets.midcast.Healing)
			end
		elseif spell.skill == 'Enfeebling Magic' then
			if sets.midcast.Enfeebling[spell.name] then
				equip(sets.midcast.Enfeebling[spell.name])
			else
				equip(sets.midcast.Enfeebling)
			end
		elseif spell.skill == 'Enhancing Magic' then
			if sets.midcast.Enhancing[spell.name] then
				equip(sets.midcast.Enhancing[spell.name])
			else
				equip(sets.midcast.Enhancing)
			end
		end
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(set_combine(sets.aftercast.idle,sets.aftercast.engaged))
	else
		equip(sets.aftercast.idle)
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		if player.status == 'Engaged' then
			equip(set_combine(sets.aftercast.idle,sets.aftercast.engaged))
		else
			equip(sets.aftercast.idle)
		end
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
	if command == 'swapgear' then
		if player.status == 'Engaged' then
			equip(set_combine(sets.aftercast.idle,sets.aftercast.engaged))
		else
			equip(sets.aftercast.idle)
		end
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
                send_command('gs c swapgear')
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