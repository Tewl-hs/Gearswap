--[[
	Author: Tewl / Bismark
	Files: Tewl_GEO.lua

	Binds
	CTRL+F9     : Toggle Magic Burst mode
	CTRL+F10    : Cycle Idle sets
	CTRL+F11    : Cycle Engaged sets
	CTRL+F12    : Toggle Luopan overlay
--]]
local KeyBindings = {
	['^f9'] = 'gs c toggle burst',
	['^f10'] = 'gs c cycle idle',
	['^f11'] = 'gs c cycle engaged',
	['^f12'] = 'gs c toggle luopan',
}

function get_sets()
	items = require('resources').items
	require('queues')

	include('FFXI-Mappings')

	include('FFXI-Utility')
	-- Personal Settings
	set_macros(20, 1)
	send_command('wait 1.5;input /lockstyleset 2')
	send_command('input //equipviewer pos 1663 914')

	bind_commands(KeyBindings)

	BurstMode = false
	LuopanDisplay = true

	CurrentWeapon = 'Empty'

	-- Augmented Capes
	Capes = {}
	Capes.PetRegen = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	Capes.FC = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
	Capes.MagicDmg = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	Capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +20','Pet: Damage taken -3%',}}

	-- Movement speed gear for auto equip when moving
	sets.MoveSpeed = { feet = "Geo. Sandals +3",}

	-- Gear sets
	sets.luopan = {
		main		= "Idris",
		range		= { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		ammo		= empty,
		head		= "Azimuth Hood +3",
		neck		= "Bagua Charm +2",
		waist		= "Isa Belt",
		hands		= "Geo. Mitaines +3",
		feet		= "Bagua Sandals +3",
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
		back		= Capes.PetRegen,
	}

	sets.precast = {}
	sets.precast.FC = { -- FC 81/80
		range		= { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head		= "Amalric Coif +1", -- 11
		body		= "Merlinic Jubbah", -- 11
		hands		= { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
		legs		= "Geomancy Pants +3", -- 15
		feet		= { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
		neck		= "Orunmila's Torque", -- 5
		waist		= "Embla Sash", -- 5
		left_ear	= "Genmei Earring",
		right_ear	= "Azimuth Earring +1",
		left_ring	= "Kishar Ring", -- 4
		right_ring	= "Defending Ring",
		back		= Capes.FC, -- 10
	}
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"})
	sets.precast.FC.Impact = set_combine(sets.precast.FC,{head=empty,body="Twilight Cloak"})
	sets.precast.JA = {
		['Primeval Zeal'] = { head = "Bagua Galero +3" },
		['Full Circle'] = { head = "Azimuth Hood +3" },
		['Bolster'] = { body = "Bagua Tunic +3" },
		['Life Cycle'] = {
			body		= "Geomancy Tunic +3",
			back		= Capes.PetRegen
		},
		['Curative Recantation'] = { hands = "Bagua Mitaines +3"},
		['Mending Halation'] = { legs = "Bagua Pants +3" },
		['Radial Arcana'] = { feet = "Bagua Sandals +3" },
	}
	sets.precast.WS = {
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		waist		= "Grunfeld Rope",
		left_ear	= "Moonshade Earring",
		right_ear	= "Ishvara Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Cornelia's Ring",
	}

	sets.midcast = {}
	sets.midcast['Geomancy'] = {
		main		= "Idris",
		range		= { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 5/18
		head		= "Azimuth Hood +3", -- 15
		body		= "Bagua Tunic +3", -- 16
		hands		= "Geo. Mitaines +3", -- 19
		legs		= "Vanya Slops",
		feet		= "Medium's Sabots",
		neck		= "Bagua Charm +2",
		waist		= "Austerity Belt +1",
		left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
		back		= Capes.GeoSkill,
	}
	sets.midcast['Geomancy'].Indi = {
		main		= { name="Gada", augments={'Indi. eff. dur. +9','MND+5','Mag. Acc.+14','DMG:+1',}},
		neck		= "Incanter's Torque",
		legs		= "Bagua Pants +3",
		feet		= "Azimuth Gaiters +3",
	}

	sets.midcast['Elemental Magic'] = {
		main		= "Bunzi's Rod",
		sub			= "Ammurapi Shield",
		ammo		= "Ghastly Tathlum +1",
		head		= "Agwu's Cap",
		body		= "Amalric Doublet +1",
		hands		= "Amalric Gages +1",
		legs		= "Agwu's Slops",
		feet		= "Agwu's Pigaches",
		neck		= "Sibyl Scarf",
		waist		= "Acuity Belt +1",
		left_ear	= "Regal Earring",
		right_ear	= "Malignance Earring",
		left_ring	= "Freke Ring",
		right_ring	= "Metamor. Ring +1",
		back		= Capes.MagicDmg
	}

	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		head		= "Azimuth Hood +3",
		body		= "Azimuth Coat +3",
		hands		= "Agwu's Gages",
		legs		= "Azimuth Tights +3",
		feet		= "Agwu's Pigaches",
	})

	sets.midcast['Enfeebling Magic'] = {
		main		= "Daybreak",
		sub			= "Ammurapi Shield",
		head		= "Geo. Galero +3",
		body		= "Geomancy Tunic +3",
		hands		= "Regal Cuffs",
		legs		= "Geomancy Pants +3",
		feet		= "Geo. Sandals +3",
		neck		= "Bagua Charm +2",
		left_ear	= "Regal Earring",
		right_ear	= "Malignance Earring",
		left_ring	= "Kishar Ring",
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
		waist		= "Luminary Sash",
		back		= Capes.MagicDmg -- // Need to make a MND/MACC ambu cape
	}

	sets.midcast['Enhancing Magic'] = { -- Enhancing Duration: 70
		--main        = "Gada" -- // Enh. dur. +6%
		sub			= "Ammurapi Shield", -- 10
		head		= "Telchine Cap", --10
		body		= "Telchine Chas.", -- 10
		hands		= "Telchine Gloves", -- 10
		legs		= "Telchine Braconi", -- 10
		feet		= "Telchine Pigaches",  -- 10
		neck		= "Incanter's Torque",
		left_ear	= "Mimir Earring",
		right_ear	= "Andoaa Earring",
		left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
		waist		= "Embla Sash" -- 10
	}
	sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head		= "Amalric Coif +1",
		feet		= "Inspirited Boots",
		waist		= "Gishdubar Sash",
		back		= "Grapevine Cape"
	})

	sets.midcast['Dark Magic'] = {
		main		= "Daybreak", -- MA 40
		sub			= "Ammurapi Shield", -- MA 38
		ammo		= "Pemphredo Tathlum", -- MA 8
		head		= "Ea Hat +1", -- MA 51
		body		= "Geomancy Tunic +3", -- MA 50  / Skill 21
		hands		= "Agwu's Gages", -- MA 40 (Augment +15)
		legs		= "Azimuth Tights +3", -- MA 63 / Skill 10
		feet		= "Agwu's Pigaches", -- MA 40 (Augment +15)
		neck		= "Erra Pendant", -- MA 17 / Skill 10
		waist		= "Acuity Belt +1", -- MA +15
		left_ear	= "Digni. Earring", -- MA  10
		right_ear	= "Malignance Earring", -- MA 10
		left_ring	= "Evanescence Ring", -- MA 10
		right_ring	= "Metamor. Ring +1", -- MA 10
		back		= "Aurist's Cape +1" -- MA 33
	}
	sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
		feet		= "Agwu's Pigaches",
		waist		= "Austertiy Belt +1",
		left_ring	= "Evanescence Ring",
	})

	sets.midcast['Healing Magic'] = {
		main		= "Daybreak",
		sub			= "Ammurapi Shield", -- 10
		range		= empty,
		ammo		= "Hydrocera",
		head		= "Vanya Hood",
		body		= "Vanya Robe",
		hands		= "Vanya Cuffs",
		legs		= "Vanya Slops",
		feet		= "Vanya Clogs" ,
		neck		= "Incanter's Torque",
		left_ear	= "Etiolation Earring",
		right_ear	= "Halasz Earring",
		left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
		waist		= "Austerity Belt +1",
		back		= "Solemnity Cape",
	}

	sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'],{
		body		= "Heka's Kalasiris",
		neck		= "Nodens Gorget",
		left_ear	= "Mendicant's Earring",
		left_ring	= "Naji's Loop",
		back		= "Solemnity Cape",
	})
	sets.aftercast = {}
	sets.aftercast.Idle = {
		main		= "Daybreak",
		sub			= "Genmei Shield",
		range		= { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head		= { name="Merlinic Hood", augments={'"Counter"+3','"Drain" and "Aspir" potency +9','"Refresh"+2','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		body		= "Azimuth Coat +3",
		hands		= "Bagua Mitaines +3",
		legs		= { name="Merlinic Shalwar", augments={'"Dbl.Atk."+1','Accuracy+4','"Refresh"+2','Accuracy+15 Attack+15',}},
		feet		= "Geomancy Sandals +3",
		neck		= "Loricate Torque +1",
		left_ear	= "Etiolation Earring",
		right_ear	= "Genmei Earring",
		left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
		waist		= "Fucho-no-Obi",
		back		= "Moonlight Cape",
	}
	sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {
		range		= empty,
		ammo		= "Staunch Tathlum +1",
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		legs		= "Nyame Flanchard",
		left_ear	= "Etiolation Earring",
		right_ear	= "Genmei Earring",
		right_ring	= "Defending Ring",
	})

	sets.aftercast.Engaged = {

	}

	include('FFXI-Display.lua')
	include('FFXI-Geo.lua')
	equip_check()
end

function file_unload()
	unbind_commands(KeyBindings)
	if GeoTracker then GeoTracker.destroy() end
	if stateBox then
		stateBox:destroy()
		stateBox = nil
	end
end

function precast(spell)
	if spell.action_type == 'Magic' and sets.precast.FC then
		if spell.name:startswith('Cur') and spell.name ~= 'Cursna' then
			equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
		elseif sets.precast.FC[spell.name] then
			equip(sets.precast.FC[spell.name])
		else
			equip(sets.precast.FC)
		end
	elseif spell.type == 'WeaponSkill' then
		if player.tp < 1000 then
			add_to_chat(123,'Unable to use: '..spell.name..'. Not enough TP.')
			cancel_spell()
			return
		end
		if sets.precast.WS[spell.name] then
			equip(sets.precast.WS[spell.name])
		elseif sets.precast.WS then
			equip(sets.precast.WS)
		end
	elseif spell.action_type == 'Ability' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	end
end

function midcast(spell)
	if sets.midcast[spell.skill] then
		if spell.skill == 'Geomancy' and spell.name:startswith('Indi-') and sets.midcast[spell.skill].Indi then
			equip(sets.midcast[spell.skill].Indi)
		elseif spell.skill == 'Healing Magic' then
			if spell.name:startswith('Cur') and spell.name ~= "Cursna" and sets.midcast[spell.skill].Cure then
				equip(sets.midcast[spell.skill].Cure)
			elseif sets.midcast[spell.skill] then
				equip(sets.midcast[spell.skill])
			end
		elseif spell.skill == 'Dark Magic' then
			if spell.name:startswith('Aspir') or spell.name:startswith('Drain') and sets.midcast[spell.skill].AspirDrain then
				equip(sets.midcast[spell.skill].AspirDrain)
			else
				equip(sets.midcast[spell.skill])
			end
		elseif spell.skill == 'Elemental Magic' then
			if EleDebuff:contains(spell.name) and sets.midcast[spell.skill].Debuff then
				equip(sets.midcast[spell.skill].Debuff)
			elseif sets.midcast[spell.skill].Burst and BurstMode == true then
				if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst == nil then
					equip(set_combine(sets.midcast[spell.skill].Burst,{head=empty,body="Twilight Cloak"}))
				elseif sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst then
					equip(sets.midcast[spell.skill][spell.name].Burst)
				else
					equip(sets.midcast[spell.skill].Burst)
				end
			else
				if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] == nil then
					equip(set_combine(sets.midcast[spell.skill],{head=empty,body="Twilight Cloak"}))
				elseif sets.midcast[spell.skill][spell.name] then
					equip(sets.midcast[spell.skill][spell.name])
				else
					equip(sets.midcast[spell.skill])
				end
			end
			if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
				equip({waist="Hachirin-no-Obi"})
			elseif spell.target.distance < (1.7 + spell.target.model_size) then
				equip({waist="Orpheus's Sash"})
			elseif spell.element == world.day_element and spell.element == world.weather_element then
				equip({waist="Hachirin-no-Obi"})
			elseif spell.target.distance < (8 + spell.target.model_size) then
				equip({waist="Orpheus's Sash"})
			elseif spell.element == world.day_element or spell.element == world.weather_element then
				equip({waist="Hachirin-no-Obi"})
			end
		elseif spell.skill == 'Enfeebling Magic' then
			if spell.name == 'Dispelga' and sets.midcast[spell.skill][spell.name] == nil then
				equip(set_combine(sets.midcast[spell.skill],{main='Daybreak'}))
			elseif sets.midcast[spell.skill][spell.name] then
				equip(sets.midcast[spell.skill][spell.name])
			else
				equip(sets.midcast[spell.skill])
			end
		elseif sets.midcast[spell.skill][spell.name] then
			equip(sets.midcast[spell.skill][spell.name])
		else
			equip(sets.midcast[spell.skill])
		end
	end
end

function aftercast(spell)
	GeoTracker.aftercast(spell)
	equip_check()
end

function pet_change(pet_info, gain)
	GeoTracker.pet_change(pet_info, gain)
	equip_check()
end

function status_change(new, old)
	if new == 'Idle' or new == 'Resting' or new == 'Engaged' then
		equip_check()
	end
end

function buff_change(buff, gain)
	GeoTracker.buff_change(buff, gain)
	local name = buff:lower()
	if name == 'silence' and gain then
		if player.inventory['Echo Drops'] then
			send_command('@input /item "Echo Drops" <me>')
		else
			add_to_chat(123, 'Silenced, you are out of Echo Drops!')
		end
	elseif name == 'bolster' and not gain then
		add_to_chat(123, '[Bolster] OFF')
	elseif name == 'stun' and gain then
		equip_check()
	end
end

function equip_check()
	local current
	if player.status == 'Engaged' then
		current = sets.aftercast.Engaged[egs] or sets.aftercast.Engaged
	else
		current = sets.aftercast.Idle[ids] or sets.aftercast.Idle
	end
	if pet and pet.isvalid then
		current = set_combine(current, sets.luopan)
	end
	equip(current)
	update_status()
end

function self_command(cmd)
	local args = T(cmd:split(' '))
	if args[1] == 'cycle' then
		if args[2] == 'idle' then
			ids = cycle_set_mode(ids, sets.aftercast.Idle)
			add_to_chat(122, 'Idle mode set to: '..(ids or 'Default'))
			equip_check()
		elseif args[2] == 'engaged' then
			egs = cycle_set_mode(egs, sets.aftercast.Engaged)
			add_to_chat(122, 'Engaged mode set to: '..(egs or 'Default'))
			equip_check()
		end
	elseif args[1] == 'toggle' then
		if args[2] == 'burst' then
			BurstMode = toggle_mode(BurstMode, 'Burst mode enabled.', 'Burst mode disabled.')
			update_status()
		elseif args[2] == 'luopan' then
			LuopanDisplay = toggle_mode(LuopanDisplay, 'Luopan display enabled.', 'Luopan display disabled.')
			GeoTracker.set_enabled(LuopanDisplay)
		end
	elseif args[1] == 'equip_check' then
		equip_check()
	elseif args[1] == 'update_status' then
		update_status()
	end
end

windower.raw_register_event('outgoing chunk', function(id)
	if id == 0x00D then
		if GeoTracker then GeoTracker.set_zoning(true) end
		if stateBox then stateBox:hide() end
	end
end)

windower.raw_register_event('incoming chunk', function(id)
	if id == 0x00A then
		if GeoTracker then GeoTracker.set_zoning(false) end
		if stateBox then stateBox:show() end
	elseif id == 0x050 then
		equip_change()
	end
end)

function update_status()
	if not stateBox then return end

	local spc = '   '
	local WeaponColor = get_weapon_color(CurrentWeapon)

	local engaged_display = egs or 'Default'
	local idle_display = ids or 'Default'

	stateBox:clear()
	stateBox:append(spc)

	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)

	if BurstMode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'BurstMode', spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

function equip_change()
	local inventory = windower.ffxi.get_items()
	local equipment = inventory and inventory.equipment
	if not equipment or not equipment.main_bag or not equipment.main then return end

	local item = windower.ffxi.get_items(equipment.main_bag, equipment.main)
	local resource = item and items[item.id]
	local weapon = resource and resource.name
	if not weapon or weapon == 'Gil' then weapon = 'Empty' end
	if weapon ~= CurrentWeapon then
		CurrentWeapon = weapon
		update_status()
	end
end
