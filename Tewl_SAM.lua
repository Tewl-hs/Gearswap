 --[[
	Author: Tewl / Bismarck
	Files: Tewl_SAM.lua 

	Note: 
		I assembled this lua. Mostly written by me but portions taking from other's work such as Motes/Selindriles as well as posts found on forums.
		This lua was written for my SAM and based on the gear I have and how I wanted to use that gear. However I have been trying to make it easy for
		other people to edit/use if they like. If you run across any bugs let me know and I will sort this ASAP.

		* If you are going to use this lua also get the files in the includes folder then follow the instructions in the readme.txt

	Binds
	CTRL+F9  : Cycle Engaged Mode (Default, Accuracy, Hybrid, MEVA, PDT, Subtle Blow)
	CTRL+F10 : Cycle Idle Mode (Default, Hybrid, MEVA, PDT, Refresh)
	CTRL+F11 : Toggle Twilight (Disabled by default)

	ALT+F9   : Toggle SkillChain Mode
	ALT+F10	 : Toggle WS Accuracy Mode
	ALT+F11  : Toggle Ranged Mode

	WIN+A	 : Equip Dojikiri Yasutsuna
	WIN+E	 : Equip Masamune
	WIN+K	 : Equip Kusanagi
	WIN+M	 : Equip Kogarasumaru
	WIN+P	 : Equip Shining One
	WIN+R	 : Equip Amanomurakumo
	WIN+S	 : Equip Soboro Sukehiro
	WIN+C	 : Equip Mafic Cudgel

	* Light SkillChains
	----------------------------------------------------------
	Tachi: Shoha → Tachi: Shoha = Light
	Tachi: Shoha → Tachi: Kasha (Light) → Tachi: Fudo = Light
	Tachi: Fudo → Tachi: Kasha (Fusion) → Tachi: Shoha (Light) → Tachi: Fudo = Light
	Tachi: Shoha → Tachi: Fudo (Distortion) → Tachi: Kasha (Fusion) → Tachi: Shoha (Light) → Tachi: Fudo = Light
	Tachi: Ageha → Tachi: Yukikaze (Detonation) → Tachi: Kasha (Gravitation) → Tachi: Shoha (Fragmentation) → Tachi: Kasha (Light) → Tachi: Fudo = Light

	Darkness SkillChains
	----------------------------------------------------------
	Tachi: Rana ←/→ Tachi: Fudo = Darkness
	Tachi: Shoha → Tachi: Fudo (Distortion) → Tachi: Rana = Darkness
	Tachi: Kasha → Tachi: Rana (Gravitation) → Tachi: Fudo = Darkness
	Tachi: Rana → Tachi: Shoha (Fragmentation) → Tachi: Fudo (Distortion) → Tachi: Rana = Darkness
	Tachi: Ageha → Tachi: Yukikaze (Detonation) → Tachi: Kasha (Gravitation) → Tachi: Fudo = Darkness
	Sonic Thrust → Sonic Thrust (Distortion) → Impulse Drive = Darkness
	Stardiver → Sonic Thrust (Distortion) → Impulse Drive = Darkness
--]]
function get_sets()
	items = require('resources').items
	require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')

	KeyBindings = {
		['@e'] = "input //gs equip sets.Weapons['Masamune']",
		['@m'] = "input //gs equip sets.Weapons['Kogarasumaru']",
		['@r'] = "input //gs equip sets.Weapons['Amanomurakumo']",
		['@k'] = "input //gs equip sets.Weapons['Kusanagi']",
		['@a'] = "input //gs equip sets.Weapons['Dojikiri Yasutsuna']",
		['@s'] = "input //gs equip sets.Weapons['Soboro Sukehiro']",
		['@p'] = "input //gs equip sets.Weapons['Shining One']",
		['@c'] = "input //gs equip sets.Weapons['Mafic Cudgel']",
		['!f9'] = 'gs c toggle autosc',
		['!f10'] = 'gs c toggle acc',
		['!f11'] = 'gs c toggle ranged',
		['^f9'] = 'gs c cycle engaged',
		['^f10'] = 'gs c cycle idle',
		['^f11'] = 'gs c toggle twilight',
	}
	bind_commands(KeyBindings)


	load_macros()
	send_command('wait 1.5;input /lockstyleset 1')
	send_command('input //equipviewer pos 1663 935')

    --
    CurrentWeapon = "Kusanagi"

    RangedWeapon = "Yoichinoyumi"
    RangedAmmo = "Yoichi's Arrow"

    -- Augmented Ambuscade Capes
	Capes = {}
	Capes.TP		= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',} }
	Capes.WS		= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
	Capes.DA		= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
	Capes.RA		= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',} }
	Capes.RWS		= { name="Smertrios's Mantle", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%',}}
	Capes.EWS		= { name="Smertrios's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Capes.HWS		= { name="Smertrios's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Capes.Snapshot 	= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Snapshot"+10',}}
	Capes.FC		= { name="Smertrios's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	Capes.Enmity 	= { name="Smertrios's Mantle", augments={'HP+60','Enmity+10',}}

	sets.MoveSpeed = { right_ring = "Shneddick ring +1",}

	sets.Twilight = { 
		head		= "Crepuscular helm",
		body		= "Twilight mail"
	}

	sets.Ranged = {
		range		= RangedWeapon,
		ammo		= RangedAmmo
	}

	sets.Weapons = {
		['Masamune'] = {main='Masamune',sub='Utu Grip'},
		['Kusanagi'] = {main='Kusanagi',sub='Utu Grip'},
		['Kogarasumaru'] = {main='Kogarasumaru',sub='Utu Grip'},
		['Amanomurakumo'] = {main='Amanomurakumo',sub='Utu Grip'},
		['Dojikiri Yasutsuna'] = {main='Dojikiri Yasutsuna',sub='Utu Grip'},
		['Shining One'] = {main='Shining One',sub='Utu Grip'},
		['Soboro Sukehiro'] = {main='Soboro Sukehiro',sub='Utu Grip'},
		['Mafic Cudgel'] = {main="Mafic Cudgel",sub="Forfend +1"}
	}
	sets.precast = {}
	sets.precast.JA = {
		['Seigan'] = {
			head	= "Kasuga Kabuto +3"
		},
		['Meditate'] = {
			head	= "Wakido Kabuto +4",
			hands	= "Sakonji Kote +4",
			back	= Capes.TP
		},
		['Hasso'] = {
			hands	= "Wakido Kote +3"
		},
		['Warding Circle'] = {
			head	= "Wakido Kabuto +4"
		},
		['Sengikori'] = {
			feet	= "Kasuga Sune-Ate +3"
		},
		['Blade Bash'] = {
			hands	= "Sakonji Kote +4"
		},
		['Meikyo Shisui'] = {
			feet	= "Sak. Sune-Ate +4"
		},
		['Provoke'] = {
			ammo		= "Sapience Orb",
			head		= "Loess Barbuta +1",
			neck		= "Unmoving Collar +1",
			body		= "Emet Harness +1",
			hands		= { name="Acro Gauntlets", augments={'Enmity+10',}},
			legs		= { name="Acro Breeches", augments={'Enmity+10',}},
			feet		= { name="Acro Leggings", augments={'Enmity+10',}},
			left_ear	= "Trux Earring",
			right_ear	= "Cryptic Earring",
			left_ring	= "Eihwaz Ring",
			right_ring	= "Supershear Ring",
			waist		= "Kasiri Belt",
			back		= Capes.Enmity
		},
		['Warcry'] = { },
	}
	sets.precast.FC = { -- 53%
		ammo		= "Sapience Orb", -- 2
		head		= { name="Acro Helm", augments={'"Fast Cast"+3',}}, -- 3
		neck		= "Orunmila's Torque", --5
		body		= "Sacro Breastplate", -- 10
		hands		= "Leyline Gloves", -- 8
		legs		= "Arjuna Breeches", -- 4
		feet		= { name="Acro Leggings", augments={'"Fast Cast"+3',}}, -- 3
		left_ear	= "Loquac. Earring", -- 2
		right_ear	= "Enchntr. Earring +1", -- 2
		left_ring	= "Prolix Ring", -- 2
		right_ring	= "Rahab Ring", -- 2
		back		= Capes.FC -- 10
	}
	sets.precast.RA = {
		head		= { name="Acro Helm", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		body		= { name="Acro Surcoat", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		hands		= { name="Acro Gauntlets", augments={'"Rapid Shot"+4','"Snapshot"+5',}},
		legs		= { name="Acro Breeches", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		feet		= { name="Acro Leggings", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		left_ring	= "Crepuscular Ring",
		waist		= "Yemaya Belt",
		back		= Capes.Snapshot
	}
	sets.precast.WS = {
		ammo		= "Knobkierrie",
		head		= "Mpaca's Cap",
		body		= { name="Sakonji Domaru +4", augments={'Enhances "Overwhelm" effect',}},
		hands		= "Kasuga Kote +3",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear	= "Thrud Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Cornelia's Ring",
		back		= Capes.WS
	}
	sets.precast.WS.Accuracy = set_combine(sets.precast.WS, {
		head		= "Nyame Helm",
		left_ring	= "Regal Ring",
	})
	sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, { })
	sets.precast.WS['Tachi: Fudo'].Accuracy = set_combine(sets.precast.WS['Tachi: Fudo'], {
		head		= "Nyame Helm",
		right_ear	= "Telos Earring",
		left_ring	= "Regal Ring",
		waist		= "Kentarch Belt +1"
	})
	sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.precast.WS['Tachi: Fudo'], { })
	sets.precast.WS['Tachi: Kaiten'].Accuracy = set_combine(sets.precast.WS['Tachi: Fudo'].Accuracy, { })
	sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {
		right_ring	= "Niqmaddu Ring",
	})
	sets.precast.WS['Tachi: Shoha'].Accuracy = set_combine(sets.precast.WS['Tachi: Shoha'], { })
	sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS['Tachi: Shoha'], {
		head		= "Nyame Helm",
		left_ear	= "Lugra Earring +1",
	})
	sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		right_ear	= "Friomisi Earring",
		waist		= "Orpheus's Sash",
		back		= Capes.HWS
	})
	sets.precast.WS['Raiden Thrust'] = sets.precast.WS['Tachi: Jinpu']
	sets.precast.WS['Tachi: Koki'] = sets.precast.WS['Tachi: Jinpu']
	sets.precast.WS['Tachi: Kagero'] = sets.precast.WS['Tachi: Jinpu']
	sets.precast.WS['Tachi: Goten'] = sets.precast.WS['Tachi: Jinpu']
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Tachi: Jinpu'],{
		neck		= "Sibyl Scarf",
		right_ring	= "Metamor. Ring +1",
		back		= Capes.EWS
	})
	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
		ammo		= "Pemphredo Tathlum",
		head		= "Kasuga Kabuto +3",
		body		= "Kasuga Domaru +3",
		hands		= "Kasuga Kote +3",
		legs		= "Kasuga Haidate +3",
		feet		= "Kas. Sune-Ate +3",
		neck		= "Sanctity Necklace",
		left_ear    = "Crep. Earring",
		right_ear	= "Digni. Earring",
		left_ring	= "Metamor. Ring +1",
		right_ring	= "Stikini Ring +1",
		waist		= "Eschan Stone",
		back		= Capes.HWS
	})
	sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS, {
		head		= "Nyame Helm",
		left_ear	= "Telos Earring",
		left_ring	= "Regal Ring",
		waist		= "Fotia Belt",
		back		= Capes.RWS
	})
	sets.precast.WS['Empyreal Arrow'] = set_combine(sets.precast.WS, {
		head		= "Nyame Helm",
		left_ring	= "Regal Ring",
		waist		= "Fotia Belt",
		back		= Capes.RWS
	})
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
		ammo		= { name="Coiste Bodhar", augments={'Path: A',}},
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		hands		= { name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
		legs		= "Mpaca's Hose",
		feet		= { name="Valorous Greaves", augments={'Attack+9','Crit. hit damage +4%','STR+8','Accuracy+3',}},
		right_ear	= "Schere Earring",
		left_ring	= "Regal Ring",
		right_ring	= "Niqmaddu Ring",
		waist		= "Fotia Belt",
		back		= Capes.DA,
	})
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, { })

	sets.midcast = {}
	sets.midcast.RA = {
		head		= { name="Sakonji Kabuto +4", augments={'Enhances "Ikishoten" effect',}},
		body		= { name="Sakonji Domaru +4", augments={'Enhances "Overwhelm" effect',}},
		hands		= "Wakido Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Wakido Sune. +3",
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= "Yemaya Belt",
		left_ear   	= "Telos Earring",
		right_ear	= "Crep. Earring",
		left_ring	= "Regal Ring",
		right_ring	= "Cacoethic ring +1",
		back		= Capes.RA
	}
	sets.aftercast = {}
	sets.aftercast.Engaged = {
		ammo		= { name="Coiste Bodhar", augments={'Path: A',}},
		head		= { name="Mpaca's Cap", augments={'Path: A',}},
		body		= "Kasuga Domaru +3",
		hands		= { name="Tatena. Gote +1", augments={'Path: A',}},
		legs		= "Kasuga Haidate +3",
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= "Dedition Earring",
		right_ear	= "Kasuga Earring +1",
		left_ring	= "Chirich Ring +1",
		right_ring	= "Niqmaddu Ring",
		back		= Capes.TP
	}
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged, {
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		hands		= "Wakido Kote +3",
		legs		= { name="Tatena. Haidate +1", augments={'Path: A',}},
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
		waist		= "Ioskeha Belt +1",
		right_ear	= "Regal Earring",
		left_ear	= "Digni. Earring",
	})
	sets.aftercast.Engaged.PDT = set_combine(sets.aftercast.Engaged, {
		head		= { name="Mpaca's Cap", augments={'Path: A',}},
		body		= { name="Mpaca's Doublet", augments={'Path: A',}},
		hands		= "Wakido Kote +3",
		legs		= { name="Mpaca's Hose", augments={'Path: A',}},
		feet		= { name="Mpaca's Boots", augments={'Path: A',}},
		waist		= "Ioskeha Belt +1",
		left_ring	= "Defending Ring",
		back		= Capes.TP
	})
	sets.aftercast.Engaged.MEVA = set_combine(sets.aftercast.Engaged, {
		head		= { name="Nyame Helm", augments={'Path: B',}},
		body		= { name="Nyame Mail", augments={'Path: B',}},
		hands		= { name="Nyame Gauntlets", augments={'Path: B',}},
		feet		= { name="Nyame Sollerets", augments={'Path: B',}},
		back		= Capes.TP
	})
	sets.aftercast.Engaged["Subtle Blow"] = set_combine(sets.aftercast.Engaged, {
 		ammo        = "Aurgelmir Orb +1",
		head        = "Ken. Jinpachi +1",
		body		= "Dagon Breast.",
		hands       = "Wakido Kote +3",
		legs        = "Mpaca's Hose",
		feet		= { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		neck		= "Bathy Choker +1",
		left_ear	= "Digni. Earring",
		right_ear	= "Schere Earring",
		left_ring	= "Chirich Ring +1",
		right_ring	= "Niqmaddu Ring",
		waist       = "Sarissapho. Belt",
		back		= Capes.TP
	})
	sets.aftercast.Engaged.Hybrid = set_combine(sets.aftercast.Engaged, {
		head		= "Kasuga Kabuto +3",
		waist       = "Windbuffet Belt +1",
		back		= Capes.TP
	})
	sets.aftercast.Idle = {
		ammo		= "Staunch Tathlum +1",
		head		= "Wakido Kabuto +4",
		body		= "Wakido Domaru +4",
		hands		= { name="Sakonji Kote +4", augments={'Enhances "Blade Bash" effect',}},
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		neck		= "Elite Royal Collar",
		waist		= "Flume Belt +1",
		left_ear	= "Tuisto Earring",
		right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring	= "Defending Ring",
		right_ring	= "Shneddick Ring +1",
		back		= Capes.TP
	}
	sets.aftercast.Idle.PDT = sets.aftercast.Engaged.PDT
	sets.aftercast.Idle.MEVA = sets.aftercast.Engaged.MEVA
	sets.aftercast.Idle.Hybrid = set_combine(sets.aftercast.Engaged.Hybrid, {
		ammo		= "Staunch Tathlum +1",
		neck		= "Elite Royal Collar",
		waist		= "Flume Belt +1",
		left_ear	= "Tuisto Earring",
		right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring	= "Defending Ring",
		right_ring	= "Shneddick Ring +1",
	})
	sets.aftercast.Idle.Refresh = set_combine(sets.aftercast.Idle,{
		left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
	})

	range_mode = false
	lock_twilight = false
	ws_acc_mode = false
	egs = nil
	ids = nil

	AutoSC = false
	ascWS = 'Tachi: Enpi'
	AutoSkillChain = T{'Tachi: Fudo','Tachi: Kasha','Tachi: Shoha','Tachi: Fudo'}
	asc_order = 1
	last_target = nil
	last_asc_time = 0
	pending_asc_ws = nil

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
            add_to_chat(123,'['..spell.name..'] Target out of range.')
			cancel_spell()
			return
		end
		if spell.name == ascWS and AutoSC == true then
			if os.time() - last_asc_time > 15 then
				asc_order = 1
			end

			cancel_spell()
			pending_asc_ws = AutoSkillChain[asc_order]
			send_command('@input /ws "'..pending_asc_ws..'" '..spell.target.raw)
			return
		end

		local ws = sets.precast.WS -- Default weaponskill set

		if sets.precast.WS[spell.name] then -- Specific weaponskill sets
			if ws_acc_mode == true and sets.precast.WS[spell.name].Accuracy then
				ws = sets.precast.WS[spell.name].Accuracy
			else
				ws = sets.precast.WS[spell.name]
			end
		elseif ws_acc_mode == true then
			ws = sets.precast.WS.Accuracy -- Default accuracy set
		end
		 -- Combine ranged weapon/ammo when in ranged mode
		if range_mode == true then
			ws = set_combine(ws, sets.Ranged)
		end
		 -- Equip relic feet for 750 TP weapon skills
		if buffactive['Meikyo Shisui'] then
			ws = set_combine(ws, sets.precast.JA['Meikyo Shisui'])
		end

		local std_set = standardize_set(ws)

        if player.tp < 1000 and not (player.tp > 749 and std_set.feet:startswith("Sak") and buffactive['Meikyo Shisui']) then
            add_to_chat(123,'['..spell.name..'] '..player.tp)
            cancel_spell()
            return
        end
		-- With weaponskills that vary w/ TP swap moonshade/mpaca when relevant 
		if player.tp > 2750 and std_set.left_ear:startswith('Moonshade') then
			ws = set_combine(ws,{head="Nyame Helm",left_ear="Lugra Earring +1"})
		elseif (world.time >= 17*60 or world.time < 7*60) and std_set.left_ear:startswith('Moonshade') then
			ws = set_combine(ws,{left_ear="Lugra Earring +1"})
		end
		if check_facing() == false and std_set.body:startswith("Sak") then
			ws = set_combine(ws,{body="Nyame Mail"})
		end
		equip(ws)
	elseif spell.action_type == 'Ability' then
		if not can_do('Ability') then
			cancel_spell()
			return
		end

		local abil_recasts = windower.ffxi.get_ability_recasts()
		local recast = abil_recasts[spell.recast_id] or 0
		if recast > 0 then
			cancel_spell()
			if spell.name ~= 'Hasso' then add_to_chat(121,'['..spell.name..'] '..disp_time(recast)) end
			return
		end

		if sets.precast.JA[spell.name] then
			if range_mode == true then
				equip(set_combine(sets.precast.JA[spell.name], sets.Ranged))
			else
				equip(sets.precast.JA[spell.name])
			end
		end
	elseif spell.action_type == 'Ranged Attack' and range_mode == true then
		equip(sets.precast.RA)
	elseif spell.action_type == 'Magic' then
		if not can_do('Magic') then
			cancel_spell()
			return
		end

        local spellCost = actual_cost(spell)
        if player.mp < spellCost then
            add_to_chat(123,'Unable to cast: Not enough MP. ('..player.mp..'/'..spellCost..')')
            cancel_spell()
            return
        end
        local spell_recasts = windower.ffxi.get_spell_recasts()
		local sr = math.floor((spell_recasts[spell.recast_id] or 0)/60)
        if sr > 0 then
			cancel_spell()
			add_to_chat(123,'['..spell.name..'] '..disp_time(sr))
            return
        end

		if range_mode == true then
			equip(sets.precast.FC,sets.Ranged)
		else
			equip(sets.precast.FC)
		end
	end
end

function midcast(spell)
	if spell.type == 'WeaponSkill' or spell.type == 'JobAbility' then return end
	if spell.action_type == 'Ranged Attack' and range_mode == true then
		equip(set_combine(sets.midcast.RA,sets.Ranged))
	elseif spell.action_type == 'Magic' then
		equip_check()
	end
end

function aftercast(spell)
	if pending_asc_ws and spell.name == pending_asc_ws then
		if not spell.interrupted then
			asc_order = asc_order + 1
			if asc_order > table.getn(AutoSkillChain) then
				asc_order = 1
			end
			last_asc_time = os.time()
		end
		pending_asc_ws = nil
	end

	if not spell.interrupted then
		if spell.name == 'Tachi: Ageha' then
			windower.send_command('@timers c "Phys. Def. Down" 180 up')
		elseif spell.name == 'Stardiver' then
			windower.send_command('@timers c "Crit. Def. Down" 60 up')
		end
	end
	if spell.name ~= "Hasso" then equip_check() end
end

function sub_job_change(new, old)
	load_macros()
end

function status_change(new, old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
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
	local eq = {}
	if player.status == 'Engaged' then	
		eq = sets.aftercast.Engaged
        if egs ~= nil and sets.aftercast.Engaged[egs] then
            eq = sets.aftercast.Engaged[egs]
        end
	else
		eq = sets.aftercast.Idle
		if ids ~= nil and sets.aftercast.Idle[ids] then
			eq = sets.aftercast.Idle[ids]
		end
	end

	if sets.Weapons[CurrentWeapon] then
		eq = set_combine(eq, sets.Weapons[CurrentWeapon])
	end

	if range_mode == true then
		eq = set_combine(eq, sets.Ranged)
	end

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
			if lock_twilight == false then
				equip(sets.Twilight)
				disable('head','body')
				lock_twilight = true
				update_status()
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
			equip_check()
		elseif args[2] == 'ranged' then
			range_mode = toggle_mode(range_mode, 'Ranged Mode: Enabled', 'Ranged Mode: Disabled')
			equip_check()
		end
		update_status()
	elseif args[1] == 'equip_check' then
		equip_check()
	elseif args[1] == 'update_status' then
		update_status()
	end
end

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	if item and items[item['id']] then
		local ew = items[item['id']].name
		if ew ~= CurrentWeapon then
			if ew == 'Gil' then
				CurrentWeapon = 'Empty'
			else
				CurrentWeapon = ew
			end
			update_status()
		end
	end
end

function load_macros()
	if player.sub_job == 'NIN' then set_macros(15,4) return end
	if player.sub_job == 'DRK' then set_macros(15,3) return end
	if player.sub_job == 'DRG' then set_macros(15,2) return end
	set_macros(15,1)
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
	if id == 0x050 then
		equip_change()
	end
end)

function update_status()
	if not stateBox then return end

	local spacing = '   '
	local segments = {
		get_weapon_color(CurrentWeapon)..CurrentWeapon,
		Colors.White..'Engaged: '..Colors.Blue..(egs or 'Default'),
		Colors.White..'Idle: '..Colors.Blue..(ids or 'Default'),
		Colors.White..'WS Accuracy: '..
			(ws_acc_mode and Colors.Yellow..'High' or Colors.Blue..'Normal'),
	}

	if range_mode then
		table.insert(segments, Colors.Yellow..'Ranged')
	end

	if lock_twilight then
		table.insert(segments, Colors.Yellow..'Twilight')
	end

	if AutoSC then
		local next_ws = AutoSkillChain[asc_order] or 'Unknown'
		table.insert(segments, Colors.White..'AutoSC Next: '..Colors.Yellow..next_ws)
	end

	stateBox:clear()
	stateBox:append(spacing..table.concat(segments, spacing))
	stateBox:show()
end
