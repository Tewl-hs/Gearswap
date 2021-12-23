 --[[
	File: Keanne_BLM.lua 
--]]
function get_sets()
	send_command('bind ^f9 gs c toggle burst') 

    Macro_Book = '2'
    Macro_Page = '1'
    send_command('input /macro book '..Macro_Book..';wait 0.2;input /macro set '..Macro_Page)

	BurstMode = false

    ElemEnfeebs = T{'Burn','Choke','Rasp','Frost','Drown','Shock'}
    -- Gearsets
    sets = {}
    sets.MoveSpeed = { feet = "Herald's Gaiters", } 

    sets.precast = {}
    sets.precast.FC = {
		main		= { name="Gada", augments={'"Fast Cast"+5',}},
		sub		    = "Ammurapi Shield",
		head		= "Nahtirah Hat",
		body		= "Merlinic Jubbah",
		hands		= { name="Merlinic Dastanas", augments={'Mag. Acc.+18','"Fast Cast"+6','"Mag.Atk.Bns."+3',}},
		legs		= { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet		= { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+7','CHR+8',}},
		neck		= "Voltsurge Torque",
		waist		= "Embla Sash",
		left_ear	= "Loquac. Earring",
		right_ear	= "Malignance earring",
		left_ring	= "Kishar Ring",
		right_ring	= "Prolix Ring",
		back		= { name="Taranus's Cape", augments={'"Fast Cast"+10',}},
    }
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
        body        = "Twilight Cloak"
    })
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main        = "Daybreak"
    })
    sets.precast.JA = {
        ['Mana Wall'] = { },
        ['Manafont'] = { },
        ['Elemental Seal'] = { },
        ['Cascade'] = { },
        ['Manawell'] = { },
        ['Subtle Sorcery'] = { },
    }

    sets.midcast = {}
    sets.midcast['Elemental Magic'] = {
	main		= "Laevateinn",
        sub		= "Enki Strap",
        ammo		= "Ghastly Tathlum +1",
        head		= { name="Arch. Petasos +3", augments={'Increases Ancient Magic damage and magic burst damage',}},
        body		= { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands		= { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs		= { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet		= { name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
        neck		= "Saevus Pendant +1",
        waist		= "Skrymir Cord",
        left_ear	= "Friomisi Earring",
        right_ear	= "Malignance Earring",
        left_ring	= "Freke Ring",
        right_ring	= "Shiva Ring +1",
        back={ name	= "Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
     }
    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        head		= "Ea Hat +1",
        body		= "Ea Houppe. +1",
        legs		= "Ea Slops +1",
        neck		= "Mizu. Kubikazari",
        waist		= "Skrymir Cord",
        left_ear	= "Regal Earring",
        right_ring	= "Mujin Band",
    })
    sets.midcast['Elemental Magic'].Enfeebs = set_combine(sets.midcast['Elemental Magic'], {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo		= "Pemphredo Tathlum",
        neck        = "Incanter's Torque",
        left_ear	= "Regal Earring",
    })
    sets.midcast['Enfeebling Magic'] = { }
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
    })
    sets.midcast['Dark Magic'] = { }
    sets.midcast['Healing Magic'] = { }
    sets.midcast['Healing Magic'].Cursna = set_combine(sets.midcast['Healing Magic'], {

    })
    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'], {
        
    })
    sets.midcast['Enhancing Magic'] = { }
    sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], {

    })

    sets.aftercast = {}
    sets.aftercast.Idle = {
        main		= "Daybreak",
        sub		    = "Ammurapi Shield",
        ammo		= "Pemphredo Tathlum",
        head		= "Befouled Crown",
        body		= "Jhakri Robe +2",
        hands		= { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs		= "Assid. Pants +1",
        feet		= { name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
        neck		= "Mizu. Kubikazari",
        waist		= "Fucho-no-Obi",
        left_ear	= "Regal Earring",
        right_ear	= "Malignance Earring",
        left_ring	= "Stikini Ring +1",
        right_ring	= "Stikini Ring +1",
        back		= { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }
    sets.aftercast.Engaged = { }
    sets.aftercast.Resting = set_combine(sets.aftercast.Idle, {
        --  Using Idle set for resting, add gear here to make changes
    })

    ---------------------------------
    --------- DISPLAY  CODE ---------
    -- DO NOT EDIT BELOW THIS LINE --
    ---------------------------------
	Colors = {
		Yellow = '\\cs(255,192,0)',
		Red = '\\cs(255,80,80)',
		Green = '\\cs(110,255,110)',
		Blue = '\\cs(140,160,255)',
		Gray = '\\cs(96,96,96)',
		White = '\\cs(255,255,255)'
	}

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

function file_unload()  
	send_command('unbind ^F9')
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return index
        end
    end
    return table.getn(tab)
end

function precast(spell)
    if buffactive.terror or buffactive.petrification or buffactive.sleep or buffactive.Lullaby or buffactive.stun then
        add_to_chat(123,'Unabled to perform action: Status effect (Terror, Petrify, Sleep, Stun)')
        cancel_spell()
        return
    end
    if spell.action_type == 'Magic' then
        if buffactive.silence or buffactive.mute or buffactive.Omerta then
            add_to_chat(123,'Unabled to perform action: Status effect (Silence, Mute, Omerta)')
            cancel_spell()
            return
        end
        local spellCost = actual_cost(spell)
        if player.mp < spellCost then
            add_to_chat(123,'Unable to cast: '..spell.english..'. Not enough MP. ('..player.mp..'/'..spellCost..')')
            cancel_spell()
            return
        end
		equip(sets.precast.FC)
    elseif spell.type == 'WeaponSkill' then
		if buffactive.amnesia or buffactive.impairment then
            add_to_chat(123,'Abort: Status effect (Amnesia, Impairment)')
            cancel_spell()
            return
        end
        if player.tp < 1000 then
            add_to_chat(123,'Unable to use: '..spell.english..'. Not enough TP.')
        end
	elseif spell.action_type == 'Ability' then
		if buffactive.amnesia or buffactive.impairment then
            add_to_chat(123,'Unabled to perform action: Status effect (Amnesia, Impairment)')
            cancel_spell()
            return
        end
		if sets.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	end
end

function midcast(spell)
    if spell.skill == 'Elemental Magic' and BurstMode ~= false then
        if spell.name == 'Impact' then
            equip(set_combine(sets.midcast[spell.skill].Burst,{body='Twilight Cloak'}))
        elseif ElemEnfeebs:contains(spell.name) then
            equip(sets.midcast['Elemental Magic'].Enfeebs)
        else
            equip(sets.midcast[spell.skill].Burst)
        end
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip({waist="Hachirin-no-Obi"})
		end
    elseif spell.skill == 'Enhancing Magic' then
        if spell.name:startswith('Refresh') and spell.target.type == 'SELF' and sets.midcast[spell.skill].Refresh then
            equip(sets.midcast[spell.skill].Refresh)
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
            equip(sets.midcast[spell.skill])
        end
    elseif spell.skill == 'Enfeebling Magic' then
        if spell.name == 'Dispelga' then
            equip(sets.midcast[spell.skill].Dispelga)
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
           equip(sets.midcast[spell.skill])
        end
    elseif spell.skill == 'Healing Magic' then
        if spell.name == 'Cursna' and sets.midcast[spell.skill].Cursna then
            equip(sets.midcast[spell.skill].Cursna)
        elseif spell.name ~= Cursna and spell.name:startswith('Cur') and sets.midcast[spell.skill].Cure then
            equip(sets.midcast[spell.skill].Cure)
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
            equip(sets.midcast[spell.skill])
        end
    elseif sets.midcast[spell.skill] then
        if sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
           equip(sets.midcast[spell.skill])
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
    
end

function equip_check()
	local eq = {}
	if player.status == 'Engaged' then	
		eq = sets.aftercast.Engaged
    elseif player.status == 'Resting' then	
		eq = sets.aftercast.Resting
	else
		eq = sets.aftercast.Idle
	end
	equip(eq)
	update_status()
end

function self_command(cmd)
	local args = T(cmd:split(' '))
	if args[1] == 'toggle' and args[2] then
		if args[2] == 'burst' then
			if BurstMode == false then
				BurstMode = true
			else
				BurstMode = false
			end
			equip_check()
        end
		update_status()
	elseif args[1] == 'equip_check' then
		equip_check()
	elseif args[1] == 'update_status' then
		update_status()
	end
end

function update_status()
	local spc = '   '

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = ''

	if BurstMode == true then
		status_text = string.format("%s%s%s%s", 'CastingMode: ',  Colors.Yellow, 'Burst', spc)
	else
		status_text = string.format("%s%s%s%s", 'CastingMode: ',  Colors.Blue, 'Normal', spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then
		stateBox:hide()
	end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then
		stateBox:show()
	end
    
end)

-- Copied from Motes
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
				if player.status ~= 'Engaged' then -- When not engaged and moving equip movement speed
					send_command('gs equip sets.MoveSpeed')
				end
				moving = true
			elseif dist < 1 and moving then -- When stopping and not engaged, equip idle set
				if player.status ~= 'Engaged' then
					send_command('gs c equip_check') -- Custom command for changing gear.
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

-- Copied from Selindrile's
function actual_cost(spell)
    local cost = spell.mp_cost
	if buffactive["Manafont"] or buffactive["Manawell"]
		then return 0
    elseif spell.type=="WhiteMagic" then
        if buffactive["Penury"] then
            return cost*.5
        elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
            return cost*.9
        elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            return cost*1.1
        end
    elseif spell.type=="BlackMagic" then
        if buffactive["Parsimony"] then
            return cost*.5
        elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            return cost*.9
        elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
            return cost*1.1
        end
    end
    return cost
end