--[[
	Author: Tewl / Bismarck
	File: Tewl_DRG.lua

	This file is intentionally usable while the DRG wardrobe is still being built.
	All future/upgraded pieces are real item names and are marked with TODO comments.
	Replace those entries with owned gear as needed; empty override sets are also safe.

	Binds
	CTRL+F9  : Cycle Engaged Mode (Default, Accuracy, Hybrid, MEVA, PDT, PetDT)
	CTRL+F10 : Cycle Idle Mode (Default, Hybrid, MEVA, PDT, Refresh, PetDT)
	CTRL+F11 : Toggle Twilight lock

	ALT+F9   : Toggle AutoSC (use Double Thrust to advance the sequence)
	ALT+F10  : Toggle WS Accuracy Mode
	ALT+F11  : Toggle automatic Jump upgrades

	WIN+T    : Equip Trishula
	WIN+R    : Equip Rhongomiant
	WIN+G    : Equip Gungnir
	WIN+P    : Equip Shining One
	WIN+N    : Equip Naegling
	AutoSC Darkness
	Stardiver -> Sonic Thrust (Distortion) -> Impulse Drive (Darkness)
--]]

function get_sets()
	items = require('resources').items
	require('queues')

	include('FFXI-Mappings')
	include('FFXI-Utility')

	KeyBindings = {
		['@t'] = "input //gs equip sets.Weapons['Trishula']",
		['@r'] = "input //gs equip sets.Weapons['Rhongomiant']",
		['@g'] = "input //gs equip sets.Weapons['Gungnir']",
		['@p'] = "input //gs equip sets.Weapons['Shining One']",
		['@n'] = "input //gs equip sets.Weapons['Naegling']",
		['!f9'] = 'gs c toggle autosc',
		['!f10'] = 'gs c toggle acc',
		['!f11'] = 'gs c toggle jumpupgrade',
		['^f9'] = 'gs c cycle engaged',
		['^f10'] = 'gs c cycle idle',
		['^f11'] = 'gs c toggle twilight',
	}
	bind_commands(KeyBindings)

	load_macros()
	send_command('wait 1.5;input /lockstyleset 1')
	send_command('input //equipviewer pos 1663 935')

	-- Shining One is already present in Tewl_SAM.lua and is the safe starting weapon.
	CurrentWeapon = 'Shining One'

	-- TODO: Build these Brigantia's Mantles over time. Change augments to owned capes.
	Capes = {}
	Capes.TP = {name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	Capes.WS = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Capes.DA = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Capes.Jump = {name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Pet: Damage taken -5%',}}
	Capes.Pet = {name="Brigantia's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}}
	Capes.FC = {name="Brigantia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	Capes.Enmity = {name="Brigantia's Mantle", augments={'HP+60','Enmity+10',}}

	sets.MoveSpeed = {
		right_ring	= 'Shneddick Ring +1',
	}
	sets.Twilight = {
		head		= 'Crepuscular Helm',
		body		= 'Twilight Mail',
	}
	sets.Weapons = {
		['Trishula'] = {
			main	= 'Trishula', -- TODO: future weapon
			sub		= 'Utu Grip',
		},
		['Rhongomiant'] = {
			main		= 'Rhongomiant', -- TODO: future weapon
			sub		= 'Utu Grip',
		},
		['Gungnir'] = {
			main	= 'Gungnir', -- TODO: future weapon
			sub		= 'Utu Grip',
		},
		['Shining One'] = {
			main	= 'Shining One',
			sub		= 'Utu Grip',
		},
		['Naegling'] = {
			main	= 'Naegling',
		},
	}

	sets.precast = {}
	sets.precast.JA = {
		['Spirit Surge'] = {
			body		= 'Ptero. Mail +3', -- TODO
		},
		['Call Wyvern'] = {
			body		= 'Ptero. Mail +3', -- TODO
		},
		['Ancient Circle'] = {
			legs		= 'Vishap Brais +3', -- TODO
		},
		['Deep Breathing'] = {
			head		= 'Ptero. Armet +3', -- TODO
		},
		['Spirit Link'] = {
			head		= 'Vishap Armet +3', -- TODO
			hands		= 'Pel. Vambraces +1', -- TODO
			feet		= 'Ptero. Greaves +3', -- TODO
			left_ear	= 'Pratik Earring', -- TODO
		},
		['Steady Wing'] = {
			legs		= 'Vishap Brais +3', -- TODO
			feet		= 'Ptero. Greaves +3', -- TODO
			neck		= "Chanoix's Gorget", -- TODO
			back		= Capes.Pet,
		},
		['Angon'] = {
			ammo		= 'Angon',
			hands		= 'Ptero. Fin. G. +3', -- TODO
		},
		['Provoke'] = {
			ammo		= 'Sapience Orb',
			head		= 'Loess Barbuta +1',
			neck		= 'Unmoving Collar +1',
			body		= 'Emet Harness +1',
			left_ear	= 'Trux Earring',
			right_ear	= 'Cryptic Earring',
			left_ring	= 'Eihwaz Ring',
			right_ring	= 'Supershear Ring',
			waist		= 'Kasiri Belt',
			back		= Capes.Enmity,
		},
		['Warcry'] = {},
	}

	-- Jump sets favor multi-attack/Store TP and the DRG artifact/relic bonuses.
	sets.precast.JA['Jump'] = {
		ammo		= {name='Coiste Bodhar', augments={'Path: A',}},
		head		= 'Flam. Zucchetto +2', -- TODO or best owned multi-attack head
		body		= 'Vishap Mail +3', -- TODO
		hands		= 'Vis. Fng. Gaunt. +3', -- TODO
		legs		= 'Ptero. Brais +3', -- TODO
		feet		= 'Ostro Greaves', -- TODO
		neck		= 'Anu Torque',
		left_ear	= 'Dedition Earring',
		right_ear	= 'Telos Earring',
		left_ring	= 'Chirich Ring +1',
		right_ring	= 'Niqmaddu Ring',
		waist		= 'Ioskeha Belt +1',
		back		= Capes.Jump,
	}
	sets.precast.JA['High Jump'] = set_combine(sets.precast.JA['Jump'], {})
	sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA['Jump'], {})
	sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA['Jump'], {})
	sets.precast.JA['Super Jump'] = {}

	sets.precast.FC = {
		ammo		= 'Sapience Orb',
		head		= {name='Acro Helm', augments={'"Fast Cast"+3',}},
		neck		= "Orunmila's Torque",
		body		= 'Sacro Breastplate',
		hands		= 'Leyline Gloves',
		legs		= 'Arjuna Breeches',
		feet		= {name='Acro Leggings', augments={'"Fast Cast"+3',}},
		left_ear	= 'Loquac. Earring',
		right_ear	= 'Enchntr. Earring +1',
		left_ring	= 'Prolix Ring',
		right_ring	= 'Rahab Ring',
		back		= Capes.FC,
	}

	-- Baseline WS gear uses broadly shared pieces already found in Tewl_SAM.lua.
	-- Replace with DRG-specific gear as it is acquired.
	sets.precast.WS = {
		ammo		= 'Knobkierrie',
		head		= 'Nyame Helm',
		body		= 'Nyame Mail',
		hands		= 'Nyame Gauntlets',
		legs		= 'Nyame Flanchard',
		feet		= 'Nyame Sollerets',
		neck		= 'Fotia Gorget',
		waist		= {name='Sailfi Belt +1', augments={'Path: A',}},
		left_ear	= {name='Moonshade Earring', augments={'Attack+4','TP Bonus +250',}},
		right_ear	= 'Thrud Earring',
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Cornelia's Ring",
		back		= Capes.WS,
	}
	sets.precast.WS.Accuracy = set_combine(sets.precast.WS, {
		left_ear	= 'Telos Earring',
		left_ring	= 'Regal Ring',
		waist		= 'Ioskeha Belt +1',
	})

	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {
		neck		= 'Dgn. Collar +2', -- TODO
	})
	sets.precast.WS["Camlann's Torment"].Accuracy = set_combine(sets.precast.WS["Camlann's Torment"], {
		left_ear	= 'Telos Earring',
		left_ring	= 'Regal Ring',
		waist		= 'Ioskeha Belt +1',
	})
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS["Camlann's Torment"], {})
	sets.precast.WS['Impulse Drive'].Accuracy = set_combine(sets.precast.WS["Camlann's Torment"].Accuracy, {})
	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS["Camlann's Torment"], {})
	sets.precast.WS['Sonic Thrust'].Accuracy = set_combine(sets.precast.WS["Camlann's Torment"].Accuracy, {})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {
		ammo		= {name='Coiste Bodhar', augments={'Path: A',}},
		right_ear	= 'Schere Earring',
		right_ring	= 'Niqmaddu Ring',
		back		= Capes.DA,
	})
	sets.precast.WS['Drakesbane'].Accuracy = set_combine(sets.precast.WS['Drakesbane'], {
		left_ear	= 'Telos Earring',
		left_ring	= 'Regal Ring',
		waist		= 'Ioskeha Belt +1',
	})
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS['Drakesbane'], {
		neck		= 'Fotia Gorget',
		waist		= 'Fotia Belt',
	})
	sets.precast.WS['Stardiver'].Accuracy = set_combine(sets.precast.WS['Drakesbane'].Accuracy, {
		neck		= 'Fotia Gorget',
		waist		= 'Fotia Belt',
	})
	sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS['Drakesbane'], {})
	sets.precast.WS['Geirskogul'].Accuracy = set_combine(sets.precast.WS['Drakesbane'].Accuracy, {})

	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS.Accuracy, {
		ammo		= 'Pemphredo Tathlum',
		right_ear	= 'Digni. Earring',
		left_ring	= 'Metamor. Ring +1',
		right_ring	= 'Stikini Ring +1',
	})
	sets.precast.WS['Raiden Thrust'] = set_combine(sets.precast.WS, {
		ammo		= 'Pemphredo Tathlum',
		head		= 'Nyame Helm',
		body		= 'Nyame Mail',
		hands		= 'Nyame Gauntlets',
		legs		= 'Nyame Flanchard',
		feet		= 'Nyame Sollerets',
		right_ear	= 'Friomisi Earring',
		right_ring	= 'Metamor. Ring +1',
		waist		= "Orpheus's Sash",
		back		= Capes.WS,
	})
	sets.precast.WS['Thunder Thrust'] = set_combine(sets.precast.WS['Raiden Thrust'], {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		-- STR/MND, WSD, and TP scaling. Nyame is a strong functional baseline.
		head		= 'Nyame Helm',
		body		= 'Nyame Mail',
		hands		= 'Nyame Gauntlets',
		legs		= 'Nyame Flanchard',
		feet		= 'Nyame Sollerets',
		neck		= 'Rep. Plat. Medal',
		waist		= {name='Sailfi Belt +1', augments={'Path: A',}},
		left_ear	= {name='Moonshade Earring', augments={'Attack+4','TP Bonus +250',}},
		right_ear	= 'Thrud Earring',
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Cornelia's Ring",
		back		= Capes.WS,
	})
	sets.precast.WS['Savage Blade'].Accuracy = set_combine(sets.precast.WS['Savage Blade'], {
		left_ear	= 'Telos Earring',
		left_ring	= 'Regal Ring',
		waist		= 'Ioskeha Belt +1',
	})
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS['Drakesbane'], {
		neck		= 'Fotia Gorget',
		waist		= 'Fotia Belt',
	})
	sets.precast.WS['Requiescat'].Accuracy = set_combine(sets.precast.WS['Drakesbane'].Accuracy, {
		neck		= 'Fotia Gorget',
		waist		= 'Fotia Belt',
	})

	sets.midcast = {}
	sets.midcast.HealingBreath = {
		head		= 'Ptero. Armet +3', -- TODO
		body		= {name='Acro Surcoat', augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}}, -- TODO/replace
		hands		= {name='Acro Gauntlets', augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}}, -- TODO/replace
		legs		= 'Vishap Brais +3', -- TODO
		feet		= 'Ptero. Greaves +3', -- TODO
		neck		= 'Dgn. Collar +2', -- TODO
		waist		= "Glassblower's Belt", -- TODO
		back		= Capes.Pet,
	}
	sets.midcast.ElementalBreath = set_combine(sets.midcast.HealingBreath, {
		left_ear	= 'Enmerkar Earring',
		right_ear	= "Dragoon's Earring", -- TODO
	})

	sets.aftercast = {}
	sets.aftercast.Engaged = {
		ammo		= {name='Coiste Bodhar', augments={'Path: A',}},
		head		= {name="Mpaca's Cap", augments={'Path: A',}},
		body		= {name="Mpaca's Doublet", augments={'Path: A',}},
		hands		= 'Nyame Gauntlets',
		legs		= {name="Mpaca's Hose", augments={'Path: A',}},
		feet		= {name="Mpaca's Boots", augments={'Path: A',}},
		neck		= 'Anu Torque',
		waist		= {name='Sailfi Belt +1', augments={'Path: A',}},
		left_ear	= 'Dedition Earring',
		right_ear	= 'Telos Earring',
		left_ring	= 'Chirich Ring +1',
		right_ring	= 'Niqmaddu Ring',
		back		= Capes.TP,
	}
	-- Naegling uses a one-handed, multi-attack-focused TP set.
	-- It is selected automatically and is not part of the CTRL+F9 mode cycle.
	sets.aftercast.Sword = set_combine(sets.aftercast.Engaged, {
		ammo		= {name='Coiste Bodhar', augments={'Path: A',}},
		head		= 'Flam. Zucchetto +2', -- TODO
		body		= {name="Gleti's Cuirass", augments={'Path: A',}}, -- TODO
		hands		= 'Pel. Vambraces +3', -- TODO
		legs		= 'Ptero. Brais +3', -- TODO
		feet		= 'Flam. Gambieras +2', -- TODO
		neck		= {name='Vim Torque +1', augments={'Path: A',}},
		waist		= 'Ioskeha Belt +1',
		left_ear	= 'Brutal Earring',
		right_ear	= 'Sherida Earring',
		left_ring	= 'Petrov Ring',
		right_ring	= 'Niqmaddu Ring',
		back		= Capes.DA,
	})
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged, {
		hands		= 'Nyame Gauntlets',
		waist		= 'Ioskeha Belt +1',
		left_ear	= 'Digni. Earring',
		right_ear	= 'Telos Earring',
		left_ring	= 'Regal Ring',
	})
	sets.aftercast.Engaged.PDT = set_combine(sets.aftercast.Engaged, {
		head		= 'Nyame Helm',
		body		= 'Nyame Mail',
		hands		= 'Nyame Gauntlets',
		legs		= 'Nyame Flanchard',
		feet		= 'Nyame Sollerets',
		left_ring	= 'Defending Ring',
	})
	sets.aftercast.Engaged.MEVA = set_combine(sets.aftercast.Engaged.PDT, {})
	sets.aftercast.Engaged.Hybrid = set_combine(sets.aftercast.Engaged, {
		head		= 'Nyame Helm',
		body		= 'Nyame Mail',
		left_ring	= 'Defending Ring',
	})
	sets.aftercast.Engaged.PetDT = set_combine(sets.aftercast.Engaged.Hybrid, {
		neck		= 'Dgn. Collar +2', -- TODO
		back		= Capes.Pet,
	})

	sets.aftercast.Idle = {
		ammo		= 'Staunch Tathlum +1',
		head		= 'Nyame Helm',
		body		= 'Nyame Mail',
		hands		= 'Nyame Gauntlets',
		legs		= 'Carmine Cuisses +1',
		feet		= 'Nyame Sollerets',
		neck		= 'Elite Royal Collar',
		waist		= 'Flume Belt +1',
		left_ear	= 'Tuisto Earring',
		right_ear	= {name='Odnowa Earring +1', augments={'Path: A',}},
		left_ring	= 'Defending Ring',
		right_ring	= 'Shneddick Ring +1',
		back		= Capes.TP,
	}
	sets.aftercast.Idle.PDT = set_combine(sets.aftercast.Engaged.PDT, {
		right_ring	= 'Shneddick Ring +1',
	})
	sets.aftercast.Idle.MEVA = set_combine(sets.aftercast.Engaged.MEVA, {
		right_ring	= 'Shneddick Ring +1',
	})
	sets.aftercast.Idle.Hybrid = set_combine(sets.aftercast.Engaged.Hybrid, {
		legs		= 'Carmine Cuisses +1',
		right_ring	= 'Shneddick Ring +1',
	})
	sets.aftercast.Idle.Refresh = set_combine(sets.aftercast.Idle, {
		left_ring	= {name='Stikini Ring +1', bag='wardrobe7'},
		right_ring	= {name='Stikini Ring +1', bag='wardrobe8'},
	})
	sets.aftercast.Idle.PetDT = set_combine(sets.aftercast.Idle.Hybrid, {
		neck		= 'Dgn. Collar +2', -- TODO
		back		= Capes.Pet,
	})

	wyvern_elemental_breaths = T{
		'Flame Breath','Frost Breath','Sand Breath','Hydro Breath','Gust Breath','Lightning Breath'
	}

	lock_twilight = false
	ws_acc_mode = false
	jump_upgrade_mode = true
	AngonDuration = 240 -- 5/5 Angon merits; use 180 at 1/5, +15 seconds per additional merit.
	egs = nil
	ids = nil

	AutoSC = false
	ascWS = 'Double Thrust'
	AutoSkillChain = T{'Stardiver','Sonic Thrust','Impulse Drive'}
	asc_order = 1
	last_target = nil
	last_asc_time = 0
	pending_asc_ws = nil
	jump_redirect = false

	include('FFXI-Display.lua')
end

function file_unload()
	unbind_commands(KeyBindings)
end

function precast(spell, action)
	if spell.type == 'WeaponSkill' then
		if not can_do('Ability') then
			cancel_spell()
			return
		end

		local target_id = spell.target and spell.target.id
		if target_id ~= last_target then
			asc_order = 1
			last_target = target_id
			pending_asc_ws = nil
		end

		local range_modifier = range_mult[spell.range] or 1
		local target_size = spell.target and spell.target.model_size or 0
		local target_distance = spell.target and spell.target.distance
		local ws_range = spell.range or 0
		if target_distance and (target_size + ws_range * range_modifier) < target_distance then
			add_to_chat(123, '['..spell.name..'] Target out of range.')
			cancel_spell()
			return
		end

		if spell.name == ascWS and AutoSC then
			if os.time() - last_asc_time > 15 then asc_order = 1 end
			cancel_spell()
			pending_asc_ws = AutoSkillChain[asc_order]
			send_command('@input /ws "'..pending_asc_ws..'" '..spell.target.raw)
			return
		end

		local ws = sets.precast.WS
		if sets.precast.WS[spell.name] then
			if ws_acc_mode and sets.precast.WS[spell.name].Accuracy then
				ws = sets.precast.WS[spell.name].Accuracy
			else
				ws = sets.precast.WS[spell.name]
			end
		elseif ws_acc_mode then
			ws = sets.precast.WS.Accuracy
		end

		if player.tp < 1000 then
			add_to_chat(123, '['..spell.name..'] '..player.tp)
			cancel_spell()
			return
		end

		local std_set = standardize_set(ws)
		local left_ear = std_set.left_ear or ''
		if player.tp > 2750 and left_ear:startswith('Moonshade') then
			ws = set_combine(ws, {left_ear='Lugra Earring +1'})
		elseif (world.time >= 17*60 or world.time < 7*60) and left_ear:startswith('Moonshade') then
			ws = set_combine(ws, {left_ear='Lugra Earring +1'})
		end
		equip(ws)

	elseif spell.action_type == 'Ability' then
		if not can_do('Ability') then
			cancel_spell()
			return
		end

		-- Protect a healthy wyvern from accidental dismissal.
		if spell.name == 'Dismiss' and pet and pet.isvalid and pet.hpp and pet.hpp < 100 then
			add_to_chat(123, '[Dismiss] Cancelled: '..(pet.name or 'Wyvern')..' is at '..pet.hpp..'% HP.')
			cancel_spell()
			return
		end

		-- Optionally upgrade base jumps whenever the wyvern enables the stronger versions.
		if jump_upgrade_mode and not jump_redirect and pet and pet.isvalid then
			if spell.name == 'Jump' and player.main_job_level >= 77 then
				cancel_spell()
				jump_redirect = true
				send_command('@input /ja "Spirit Jump" '..spell.target.raw)
				return
			elseif spell.name == 'High Jump' and player.main_job_level >= 85 then
				cancel_spell()
				jump_redirect = true
				send_command('@input /ja "Soul Jump" '..spell.target.raw)
				return
			end
		end
		jump_redirect = false

		local abil_recasts = windower.ffxi.get_ability_recasts()
		local recast = abil_recasts[spell.recast_id] or 0
		if recast > 0 then
			cancel_spell()
			add_to_chat(121, '['..spell.name..'] '..disp_time(recast))
			return
		end

		if sets.precast.JA[spell.name] then equip(sets.precast.JA[spell.name]) end

	elseif spell.action_type == 'Magic' then
		if not can_do('Magic') then
			cancel_spell()
			return
		end
		local spellCost = actual_cost(spell)
		if player.mp < spellCost then
			add_to_chat(123, 'Unable to cast: Not enough MP. ('..player.mp..'/'..spellCost..')')
			cancel_spell()
			return
		end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local sr = math.floor((spell_recasts[spell.recast_id] or 0) / 60)
		if sr > 0 then
			cancel_spell()
			add_to_chat(123, '['..spell.name..'] '..disp_time(sr))
			return
		end
		equip(sets.precast.FC)
	end
end

function midcast(spell)
	if spell.type == 'WeaponSkill' or spell.type == 'JobAbility' then return end
	if spell.action_type == 'Magic' then equip_check() end
end

function pet_midcast(spell)
	if spell.name:startswith('Healing Breath') or spell.name == 'Restoring Breath' then
		equip(sets.midcast.HealingBreath)
	elseif wyvern_elemental_breaths:contains(spell.name) then
		equip(sets.midcast.ElementalBreath)
	end
end

function pet_aftercast(spell)
	equip_check()
end

function pet_change(pet_info, gain)
	if gain then
		add_to_chat(122, '[Wyvern] '..(pet_info.name or 'Wyvern')..' called.')
	else
		add_to_chat(123, '[Wyvern] No longer present.')
	end
	equip_check()
end

function aftercast(spell)
	jump_redirect = false
	if pending_asc_ws and spell.name == pending_asc_ws then
		if not spell.interrupted then
			asc_order = asc_order + 1
			if asc_order > table.getn(AutoSkillChain) then asc_order = 1 end
			last_asc_time = os.time()
		end
		pending_asc_ws = nil
	end

	if not spell.interrupted and spell.name == 'Stardiver' then
		windower.send_command('@timers c "Crit. Def. Down" 60 up')
	elseif not spell.interrupted and spell.name == 'Angon' then
		windower.send_command('@timers c "Defense Down (Angon)" '..AngonDuration..' down')
	end
	equip_check()
end

function sub_job_change(new, old)
	load_macros()
end

function status_change(new, old)
	if T{'Idle','Resting','Engaged'}:contains(new) then equip_check() end
end

function buff_change(buff, gain)
	if buff == 'sleep' and player.status == 'Engaged' then
		if gain then
			send_command('cancel Stoneskin')
			equip_check()
			equip({neck='Vim Torque +1'})
		else
			equip_check()
		end
	elseif buff == 'stun' and gain then
		equip_check()
	end
end

function equip_check()
	local eq
	if player.status == 'Engaged' then
		eq = sets.aftercast.Engaged
		if egs and sets.aftercast.Engaged[egs] then eq = sets.aftercast.Engaged[egs] end
		if CurrentWeapon == 'Naegling' then eq = set_combine(eq, sets.aftercast.Sword) end
	else
		eq = sets.aftercast.Idle
		if ids and sets.aftercast.Idle[ids] then eq = sets.aftercast.Idle[ids] end
	end

	if sets.Weapons[CurrentWeapon] then eq = set_combine(eq, sets.Weapons[CurrentWeapon]) end
	equip(eq)
	update_status()
end

function self_command(cmd)
	local args = T(cmd:split(' '))
	if args[1] == 'cycle' and args[2] then
		if args[2] == 'idle' then
			ids = cycle_set_mode(ids, sets.aftercast.Idle)
			add_to_chat(122, 'Idle mode set to: '..(ids or 'Default'))
		elseif args[2] == 'engaged' then
			egs = cycle_set_mode(egs, sets.aftercast.Engaged)
			add_to_chat(122, 'Engaged mode set to: '..(egs or 'Default'))
		end
		equip_check()
	elseif args[1] == 'toggle' and args[2] then
		if args[2] == 'twilight' then
			if not lock_twilight then
				equip(sets.Twilight)
				disable('head','body')
				lock_twilight = true
			else
				enable('head','body')
				lock_twilight = false
				equip_check()
			end
		elseif args[2] == 'autosc' then
			AutoSC = toggle_mode(AutoSC, 'AutoSC: Enabled', 'AutoSC: Disabled')
			if not AutoSC then pending_asc_ws = nil end
		elseif args[2] == 'acc' then
			ws_acc_mode = toggle_mode(ws_acc_mode, 'WS Accuracy Mode: High', 'WS Accuracy Mode: Normal')
		elseif args[2] == 'jumpupgrade' then
			jump_upgrade_mode = toggle_mode(jump_upgrade_mode, 'Jump Upgrade: Enabled', 'Jump Upgrade: Disabled')
		end
		update_status()
	elseif args[1] == 'equip_check' then
		equip_check()
	elseif args[1] == 'update_status' then
		update_status()
	end
end

function equip_change()
	local inventory = windower.ffxi.get_items()
	local equipment = inventory['equipment']
	local item = windower.ffxi.get_items(equipment['main_bag'], equipment['main'])
	if item and items[item['id']] then
		local ew = items[item['id']].name
		if ew ~= CurrentWeapon then
			CurrentWeapon = ew == 'Gil' and 'Empty' or ew
			update_status()
		end
	end
end

function load_macros()
	if player.sub_job == 'SAM' then set_macros(8,2) return end
	if player.sub_job == 'NIN' then set_macros(8,3) return end
	if player.sub_job == 'DNC' then set_macros(8,4) return end
	set_macros(8,1)
end

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then stateBox:hide() end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then stateBox:show() end
	if id == 0x050 then equip_change() end
end)

function update_status()
	if not stateBox then return end

	local spacing = '   '
	local pet_status = 'None'
	if pet and pet.isvalid then
		pet_status = (pet.name or 'Wyvern')..' '..(pet.hpp or '?')..'%'
	end
	local segments = {
		get_weapon_color(CurrentWeapon)..CurrentWeapon,
		Colors.White..'Engaged: '..Colors.Blue..(egs or 'Default'),
		Colors.White..'Idle: '..Colors.Blue..(ids or 'Default'),
		Colors.White..'WS Accuracy: '..(ws_acc_mode and Colors.Yellow..'High' or Colors.Blue..'Normal'),
		Colors.White..'Wyvern: '..(pet and pet.isvalid and Colors.Green or Colors.Red)..pet_status,
		Colors.White..'Jump Upgrade: '..(jump_upgrade_mode and Colors.Green..'On' or Colors.Red..'Off'),
	}

	if lock_twilight then table.insert(segments, Colors.Yellow..'Twilight') end
	if AutoSC then
		local next_ws = AutoSkillChain[asc_order] or 'Unknown'
		table.insert(segments, Colors.White..'AutoSC Next: '..Colors.Yellow..next_ws)
	end

	stateBox:clear()
	stateBox:append(spacing..table.concat(segments, spacing))
	stateBox:show()
end
