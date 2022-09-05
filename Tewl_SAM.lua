 --[[
	Author: Tewl / Bismark
	Files: Tewl_SAM.lua 

	Note: 
		I assembled this lua. Mostly written by me but portions taking from other's work such as Motes/Selindriles as well as posts found on forums.
		This lua was written for my SAM and based on the gear I have and how I wanted to use that gear. However I have been trying to make it easy for
		other people to edit/use if they like. If you run across any bugs let me know and I will sort this ASAP.

		* If you are going to use this lua also get the files in the includes folder then follow the instructions in the readme.txt

	Binds
	CTRL+F9  : Toggle Engaged Mode (Normal, Accuracy, PDT, MDT, Hybrid)
	CTRL+F10 : Toggle Idle Mode (Normal, PDT, MDT, Hybrid)
	CTRL+F11 : Toggle Twilight (Disabled by default)
	CTRL+F12 : N/A

	ALT+F9   : Toggle Auto Hasso (Disabled by default)
	ALT+F10  : Toggle SkillChain Mode
	ATL+F11	 : Toggle Accuracy Mode
	ALT+F12  : Toggle Ranged Mode

	WIN+A	 : Equip Dojikiri Yasutsuna
	WIN+E	 : Equip Masamune
	WIN+M	 : Equip Kogarasumaru
	WIN+P	 : Equip Shining One
	WIN+R	 : Equip Amanomurakumo
	WIN+S	 : Equip Soboro Sukehiro
	WIN+C	 : Equip Mafic Cudgel
--]]
function get_sets()
	items = require('resources').items
	require('queues')
    
    include('FFXI-Mappings')
	
    include('FFXI-Utility')

	send_command("bind @e input //gs equip sets.Weapons['Masamune']")
	send_command("bind @m input //gs equip sets.Weapons['Kogarasumaru']")
	send_command("bind @r input //gs equip sets.Weapons['Amanomurakumo']")
	send_command("bind @a input //gs equip sets.Weapons['Dojikiri Yasutsuna']")
	send_command("bind @s input //gs equip sets.Weapons['Soboro Sukehiro']")
	send_command("bind @p input //gs equip sets.Weapons['Shining One']")
	send_command("bind @c input //gs equip sets.Weapons['Mafic Cudgel']")

	send_command('bind !f9 gs c toggle autohs')
	send_command('bind !f10 gs c toggle autosc') 
	send_command('bind !f11 gs c toggle acc')
	send_command('bind !f12 gs c toggle ranged')

	send_command('bind ^f9 gs c cycle engaged')
	send_command('bind ^f10 gs c cycle idle')
	send_command('bind ^f11 gs c toggle twilight')


	load_macros()
	send_command('wait 1.5;input /lockstyleset 1')
	send_command('input //equipviewer pos 1663 935') 
    
    --
    CurrentWeapon = "Masamune"

    TwoHandedWeapon = true

    RangedWeapon = "Yoichinoyumi"
    RangedAmmo = "Yoichi's Arrow"

    -- Augmented Ambuscade Capes
	Capes = {} 
	Capes.TP		= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',} }
	Capes.WS		= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
	Capes.DA		= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
	Capes.RA		= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',} }
	Capes.RWS		= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+10 Rng.Atk.+10','Rng.Acc.+10','Weapon skill damage +10%',} }
	Capes.EWS		= { name="Smertrios's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Capes.HWS		= { name="Smertrios's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Capes.Snapshot 	= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Snapshot"+10',}}
	Capes.FC		= { name="Smertrios's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	Capes.Enmity 	= { name="Smertrios's Mantle", augments={'HP+60','Enmity+10',}}
	
	sets.MoveSpeed = { feet = "Danzo Sune-Ate",}

	sets.Weapons = {
		['Masamune'] = {main='Masamune',sub='Utu Grip'},
		['Kogarasumaru'] = {main='Kogarasumaru',sub='Utu Grip'},
		['Amanomurakumo'] = {main='Amanomurakumo',sub='Utu Grip'},
		['Dojikiri Yasutsuna'] = {main='Dojikiri Yasutsuna',sub='Utu Grip'},
		['Shining One'] = {main='Shining One',sub='Utu Grip'},
		['Soboro Sukehiro'] = {main='Soboro Sukehiro',sub='Utu Grip'},
		['Mafic Cudgel'] = {main="Mafic Cudgel",sub="Forfend +1"}
	}
	sets.JA = {
		['Seigan'] = {
			head	= "Kasuga Kabuto +2"
		},
		['Meditate'] = {
			head	= "Wakido Kabuto +3",
			hands	= "Sakonji Kote +3",
			back	= Capes.TP
		},
		['Hasso'] = {
			hands	= "Wakido Kote +3"
		},
		['Warding Circle'] = {
			head	= "Wakido Kabuto +3"
		},
		['Sengikori'] = {
			feet	= "Kasuga Sune-Ate +2"
		},
		['Blade Bash'] = {
			hands	= "Sakonji Kote +3"
		},
		['Meikyo Shisui'] = {
			feet	= "Sak. Sune-Ate +3"
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
			right_ear	= "Cryptic Earring +1",
			left_ring	= "Eihwaz Ring",
			right_ring	= "Supershear Ring",
			back		= Capes.Enmity
		},
		['Warcry'] = {
			ammo		= "Sapience Orb", 
			head		= "Loess Barbuta +1",
			neck		= "Unmoving Collar +1",
			body		= "Emet Harness +1",
			hands		= { name="Acro Gauntlets", augments={'Enmity+10',}},
			legs		= { name="Acro Breeches", augments={'Enmity+10',}},
			feet		= { name="Acro Leggings", augments={'Enmity+10',}},
			left_ear	= "Trux Earring",
			right_ear	= "Cryptic Earring +1",
			left_ring	= "Eihwaz Ring",
			right_ring	= "Supershear Ring",
			back		= Capes.Enmity
		},
	}
	sets.FC = { -- 53%
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
	sets.Preshot = {
		head		= { name="Acro Helm", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		body		= { name="Acro Surcoat", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		hands		= { name="Acro Gauntlets", augments={'"Rapid Shot"+4','"Snapshot"+5',}},
		legs		= { name="Acro Breeches", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		feet		= { name="Acro Leggings", augments={'"Rapid Shot"+4','"Snapshot"+4',}},
		left_ring	= "Crepuscular Ring",
		waist		= "Yemaya Belt",
		back		= Capes.Snapshot
	}
	sets.RA = {
		head		= { name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
		body		= { name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
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
	sets.WS = {}
	sets.WS.Normal = {
		ammo		= "Knobkierrie",
		head		= "Mpaca's Cap", -- R25
		body		= "Nyame Mail", -- R25 { name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands		= "Nyame Gauntlets", -- R25
		legs		= "Nyame Flanchard", -- R25
		feet		= "Nyame Sollerets", -- R25
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear	= "Thrud Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring +1",
		back		= Capes.WS
	}
	sets.WS.Normal.Accuracy = set_combine(sets.WS.Normal, { 
		head		= "Nyame Helm",
		left_ring	= "Regal Ring",
	})
	sets.WS['Tachi: Fudo'] = set_combine(sets.WS.Normal, { })
	sets.WS['Tachi: Fudo'].Accuracy = set_combine(sets.WS['Tachi: Fudo'], { 
		head		= "Nyame Helm",
		right_ear	= "Telos Earring",
		left_ring	= "Regal Ring",
		waist		= "Kentarch Belt +1"
	})
	sets.WS['Tachi: Kaiten'] = set_combine(sets.WS['Tachi: Fudo'], { })
	sets.WS['Tachi: Kaiten'].Accuracy = set_combine(sets.WS['Tachi: Fudo'].Accuracy, { })
	sets.WS['Tachi: Shoha'] = set_combine(sets.WS.Normal, { 
		right_ring	= "Niqmaddu Ring",
		feet		= "Nyame Sollerets"
	})
	sets.WS['Tachi: Shoha'].Accuracy = set_combine(sets.WS['Tachi: Shoha'], { })
	sets.WS['Tachi: Rana'] = set_combine(sets.WS['Tachi: Shoha'], {
		head		= "Nyame Helm",
		left_ear	= "Lugra Earring +1",
	})
	sets.WS['Tachi: Jinpu'] = set_combine(sets.WS.Normal, { 
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		right_ear	= "Friomisi Earring",
		waist		= "Orpheus's Sash",
		back		= Capes.HWS
	})
	sets.WS['Raiden Thrust'] = sets.WS['Tachi: Jinpu']
	sets.WS['Tachi: Koki'] = sets.WS['Tachi: Jinpu']
	sets.WS['Tachi: Kagero'] = sets.WS['Tachi: Jinpu']
	sets.WS['Tachi: Goten'] = sets.WS['Tachi: Jinpu']
	sets.WS['Aeonlian Edge'] = set_combine(sets.WS['Tachi: Jinpu'],{
		neck		= "Sibyl Scarf",
		right_ring	= "Metamor. Ring +1",
		back		= Capes.EWS
	})
	sets.WS['Tachi: Ageha'] = set_combine(sets.WS.Normal, {
		ammo		= "Pemphredo Tathlum",
		head		= { name="Blistering Sallet +1", augments={'Path: A',}},
		body		= "Mpaca's Doublet",
		hands		= "Mpaca's Gloves",
		legs        = "Mpaca's Hose", 
		feet        = "Mpaca's Boots", 
		neck		= "Sanctity Necklace",
		left_ear    = "Crep. Earring",
		right_ear	= "Digni. Earring",
		left_ring	= "Metamor. Ring +1",
		right_ring	= "Stikini Ring +1",
		waist		= "Eschan Stone",
		back		= Capes.HWS
	})		
	sets.WS['Namas Arrow'] = set_combine(sets.WS.Normal, {
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		legs		= "Wakido Haidate +3",
		left_ear	= "Telos Earring",
		right_ear	= "Thrud Earring",
		left_ring	= "Regal Ring",
		waist		= "Fotia Belt",
		back		= Capes.RWS
	})		
	sets.WS['Stardiver'] = set_combine(sets.WS.Normal, { 
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
	sets.WS['Impulse Drive'] = set_combine(sets.WS.Normal, { 
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
	})
	sets.Engaged = {}
	sets.Engaged.Normal = {
		ammo		= { name="Coiste Bodhar", augments={'Path: A',}},
		head		= "Flam. Zucchetto +2",
		body		= "Kasuga Domaru +2",
		hands		= { name="Tatena. Gote +1", augments={'Path: A',}},
		legs		= "Kasuga Haidate +2",
		--feet		= { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= "Dedition Earring", 
		right_ear	= "Telos Earring", -- Need Sortie Earring
		left_ring	= "Chirich Ring +1", 
		right_ring	= "Niqmaddu Ring",
		back		= Capes.TP,
	}	
	sets.Engaged.Accuracy = set_combine(sets.Engaged.Normal, {
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		hands		= "Wakido Kote +3",
		legs		= { name="Tatena. Haidate +1", augments={'Path: A',}},
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
		waist		= "Ioskeha Belt +1",
		right_ring	= "Regal Earring",
		left_ear	= "Digni. Earring",
	})
	sets.Engaged.PDT = set_combine(sets.Engaged.Normal, {
		head		= { name="Mpaca's Cap", augments={'Path: A',}}, 
		body		= { name="Mpaca's Doublet", augments={'Path: A',}}, 
		hands		= "Wakido Kote +3",
		legs		= { name="Mpaca's Hose", augments={'Path: A',}},
		feet		= { name="Mpaca's Boots", augments={'Path: A',}},
		waist		= "Ioskeha Belt +1", 
		left_ring	= "Defending Ring",
	})
	sets.Engaged.MEVA = set_combine(sets.Engaged.Normal, {
		head		= { name="Nyame Helm", augments={'Path: B',}},
		body		= { name="Nyame Mail", augments={'Path: B',}},
		hands		= { name="Nyame Gauntlets", augments={'Path: B',}},
		feet		= { name="Nyame Sollerets", augments={'Path: B',}},
	})
	sets.Engaged["Subtle Blow"] = set_combine(sets.Engaged.Normal, {
		ammo        = "Staunch Tathlum +1", -- 0 0 3
		head        = { name="Mpaca's Cap", augments={'Path: A',}}, -- MEVA 69 MDB 12 PDT 7
		body		= "Ken. Samue +1", -- MEVA 69 MDB 6 Haste 2 SB1 17 STP 9 ::: Need Dagon Breastplate [Kin]
		hands       = "Wakido Kote +3", -- MEVA 46 MDB 2 Haste 4 STP 7 
		legs        = "Mpaca's Hose", -- MEVA 96 MDB 13 Haste 9 SB2 5 PDT 9
		feet        = "Mpaca's Boots", -- MEVA 96 MDB 12 Haste 3 PDT 6
		waist       = "Ioskeha Belt +1", -- Haste 8
		right_ear   = "Schere Earring", -- SB 3
	})
	sets.Engaged.Hybrid = set_combine(sets.Engaged.Normal, {
		head		= "Kasuga Kabuto +2",
		legs		= "Kasuga Haidate +2",
		--feet		= { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
	})
		
	sets.Idle = { }
	sets.Idle.Normal = { -- PDT 20 DT 47 MDT 2 68/49
		ammo		= "Staunch Tathlum +1",
		head		= "Wakido Kabuto +3",
		body		= "Sacro Breastplate",
		hands		= { name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		neck		= "Elite Royal Collar",
		waist		= "Flume Belt +1",
		left_ear	= "Tuisto Earring", 
		right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring	= "Defending Ring",
		right_ring	= "Karieyh Ring +1",
		back		= Capes.TP
	}
	sets.Idle.PDT = sets.Engaged.PDT
	sets.Idle.MEVA = sets.Engaged.MEVA
	sets.Idle.Hybrid = sets.Engaged.Hybrid
	sets.Idle.Refresh = set_combine(sets.Idle.Normal,{
		left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
		right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
	})
	
	sets.Twilight = { 
		head		= "Twilight helm",
		body		= "Twilight mail"
	}
	
	sets.Ranged = {
		range		= RangedWeapon,
		ammo		= RangedAmmo
	}

	EngagedMode = {'Normal', 'PDT', 'MEVA', 'Subtle Blow', 'Hybrid'}
	EngagedIndex = 1

	IdleMode = {'Normal', 'PDT', 'MEVA', 'Hybrid', 'Refresh'}
	IdleIndex = 1

	range_mode = false
	lock_twilight = false
	acc_mode = false
	auto_hasso = true
    
	-- Variables for Auto Skillchainer
	AutoSC = false
	ascWS = 'Tachi: Enpi'
	AutoSkillChain = T{'Tachi: Fudo','Tachi: Kasha','Tachi: Shoha','Tachi: Fudo'} -- Skillchain order
	asc_order = 1
	last_target = nil

	include('FFXI-Display.lua')	
end

function file_unload()  
	send_command('unbind @e')
	send_command('unbind @m')
	send_command('unbind @r')
	send_command('unbind @a')
	send_command('unbind @p')
	send_command('unbind !F9')
	send_command('unbind !F10')
	send_command('unbind !F11')
	send_command('unbind !F12')
	send_command('unbind ^F9')
	send_command('unbind ^F10')
	send_command('unbind ^F11')
	send_command('unbind ^F12')
end

function precast(spell, action)
	local target = player.target.id
	if target ~= last_target then
		asc_order = 1
		last_target = target
	end

	if can_do(spell.action_type) == false then cancel_spell() end

	if spell.type == 'WeaponSkill' then
		if (spell.target.model_size + spell.range * range_mult[spell.range]) < spell.target.distance then
            add_to_chat(123,'['..spell.name..'] Target out of range.')
			cancel_spell()
			return
		end
		if spell.name == ascWS and AutoSC == true then
			cancel_spell()
			send_command('@input /ws "'..AutoSkillChain[asc_order]..'" '..spell.target.raw)
			asc_order = asc_order + 1
			if asc_order > table.getn(AutoSkillChain) then
				asc_order = 1
			end
			return
		end

		local ws = sets.WS.Normal -- Default weaponskill set

		if sets.WS[spell.english] then -- Specific weaponskill sets
			if acc_mode == true and sets.WS[spell.english].Accuracy then
				ws = sets.WS[spell.english].Accuracy
			else
				ws = sets.WS[spell.english]
			end
		end

		if range_mode == true then
			ws = set_combine(ws, sets.Ranged)
		end
		if buffactive['Sekkanoki'] then
			ws = set_combine(ws, {hands="Kasuga Kote +2"})
		end
		if buffactive['Meikyo Shisui'] then
			ws = set_combine(ws, sets.JA['Meikyo Shisui'])
		end
		std_set = standardize_set(ws)
        if player.tp < 1000  or (player.tp < 900 and not std_set.feet:startswith("Sak") and not buffactive['Meikyo Shisui']) then
            add_to_chat(123,'['..spell.name..'] '..player.tp)
            cancel_spell()
            return
        end
		if std_set.left_ear:startswith('Moonshade') and acc_mode == false then
			if player.tp > 2750 then -- Dusk to Dawn time or more than 2750 tp
				ws = set_combine(ws,{head="Nyame Helm",left_ear="Lugra Earring +1"})
			end
		end
		if check_facing() == false and std_set.body:startswith("Sak") then
		   ws = set_combine(ws,{body="Nyame Mail"})
		end
		equip(ws)
	elseif spell.action_type == 'Ability' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
			cancel_spell()
			if spell.name ~= 'Hasso' then add_to_chat(121,'['..spell.name..'] '..disp_time(abil_recasts[spell.recast_id])) end
			return
		end
		-- Enable AutoHasso on Hasso use if down
		if spell.name == 'Hasso' then
			if TwoHandedWeapon == false then cancel_spell() end
			if auto_hasso == false then auto_hasso = true update_status() end
		end
		-- Disable AutoHasso if needing to use Seigan 
		if spell.name == 'Seigan' then
			if TwoHandedWeapon == false then cancel_spell() end
			if auto_hasso == true then auto_hasso = false update_status() end
		end
		if sets.JA[spell.name] then
			if range_mode == true then
				equip(set_combine(sets.JA[spell.name], sets.Ranged))
			else
				equip(sets.JA[spell.name])
			end
		end
	elseif spell.action_type == 'Ranged Attack' and range_mode == true then
		equip(sets.Preshot)
	elseif spell.action_type == 'Magic' then
        local spellCost = actual_cost(spell)
        if player.mp < spellCost then
            add_to_chat(123,'Unable to cast: Not enough MP. ('..player.mp..'/'..spellCost..')')
            cancel_spell()
            return
        end
        local spell_recasts = windower.ffxi.get_spell_recasts()
        local sr = math.floor(spell_recasts[spell.recast_id]/60)
        if sr > 0 then
			cancel_spell()
			add_to_chat(123,'['..spell.name..'] '..disp_time(sr))
            return
        end

		if range_mode == true then
			equip(sets.FC,sets.Ranged)
		else
			equip(sets.FC)
		end
	end
end

function midcast(spell)
	if spell.type == 'WeaponSkill' or spell.type == 'JobAbility' then return end
	if spell.action_type == 'Ranged Attack' and range_mode == true then
		equip(set_combine(sets.RA,sets.Ranged))
	end
end

function aftercast(spell)
	if spell.name == 'Tachi: Ageha' then
		windower.send_command('@timers c "Phys. Def. Down" 180 up')
	end
	if spell.name == 'Stardiver' then
		windower.send_command('@timers c "Crit. Def. Down" 60 up')
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
			equip({neck='Vim Torque +1'})
		else
			equip_check()
		end
	end
	if player.status == 'Engaged' and auto_hasso and buff == 'Hasso' and not gain then
		windower.chat.input:schedule(1,'/ja Hasso <me>')
	end
end

function equip_check()
	local eq = {}
	if player.status == 'Engaged' then	
		eq = sets.Engaged.Normal
		
		if sets.Weapons[CurrentWeapon] then
			eq = set_combine(eq, sets.Weapons[CurrentWeapon])
		end
		if acc_mode == true and sets.Engaged[EngagedMode[EngagedIndex]].Accuracy then
			eq = set_combine(eq,sets.Engaged[EngagedMode[EngagedIndex]].Accuracy)
		elseif sets.Engaged[EngagedMode[EngagedIndex]] then
			eq = set_combine(eq,sets.Engaged[EngagedMode[EngagedIndex]])
		end
		if range_mode == true then
			eq = set_combine(eq, sets.Ranged)
		end
	else
		eq = sets.Idle.Normal
		
		if sets.Weapons[CurrentWeapon] then
			eq = set_combine(eq, sets.Weapons[CurrentWeapon])
		end
		if sets.Idle[IdleMode[IdleIndex]] then
			eq = set_combine(eq,sets.Idle[IdleMode[IdleIndex]])
		end
		if range_mode == true then
			eq = set_combine(eq, sets.Ranged)
		end
	end
	equip(eq)
	if auto_hasso and player.status == 'Engaged' and not buffactive['Hasso'] then
		windower.chat.input:schedule(1,'/ja Hasso <me>')
	end
	update_status()
end

function self_command(cmd)
	local args = T(cmd:split(' '))
	if args[1] == 'cycle' and args[2] then
        if args[2] == 'engaged' then
            EngagedIndex = EngagedIndex + 1 
            if (table.getn(EngagedMode) < EngagedIndex) then EngagedIndex = 1 end
		elseif args[2] == 'idle' then
			IdleIndex = IdleIndex + 1 
			if (table.getn(IdleMode) < IdleIndex) then IdleIndex = 1 end
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
		elseif args[2] == 'autohs' then
			if auto_hasso == false then
				if TwoHandedWeapon == false then
					add_to_chat(122, 'AutoHasso requires a 2-handed weapon.')
				else
				    auto_hasso = true
					update_status()
				end
			else
				auto_hasso = false
				update_status()
			end
		elseif args[2] == 'autosc' then
			if AutoSC == false then
				AutoSC = true
			else
				AutoSC = false
			end
		elseif args[2] == 'wsacc' then
			if acc_mode == false then
				acc_mode = true
				add_to_chat(122, 'Accuracy Mode: High')
			else
				acc_mode = false
				add_to_chat(122, 'Accuracy Mode: Normal')
			end
		elseif args[2] == 'ranged' then
			if range_mode == false then
				range_mode = true
				equip_check()
			else
				range_mode = false
				equip_check()
			end
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
		if ew ~= CurrentWeapon then -- If weapon changed
			if ew == 'Gil' then
				CurrentWeapon = 'Empty'
				TwoHandedWeapon = false
				if auto_hasso == true then auto_hasso = false update_status() end
			else
				CurrentWeapon = ew
				if T{4,6,7,8,10,12}:contains(items[item['id']].skill) then -- GS GA Scythe Polearm GK Staff
					TwoHandedWeapon = true
				else 
					TwoHandedWeapon = false	
					if auto_hasso == true then auto_hasso = false update_status() end
				end
			end	
			equip_check()
		end
	end
end

function can_do(act)
	if buffactive.terror then
        add_to_chat(123,'Unable to perform action: [Terrorized]')
        return false
	elseif buffactive.stun then
        add_to_chat(123,'Unable to perform action: [Stunned]')
        return false
	elseif buffactive.petrification then
        add_to_chat(123,'Unable to perform action: [Petrified]')
        return false
	elseif buffactive.sleep or buffactive.Lullaby then
        add_to_chat(123,'Unable to perform action: [Asleep]')
        return false
    end
	if act == 'Magic' then
        if buffactive.silence then
            add_to_chat(123,'Unable to cast: [Silenced]')
            return false
		elseif buffactive.mute then
            add_to_chat(123,'Unable to cast: [Mute]')
            return false
		elseif buffactive.Omerta then
            add_to_chat(123,'Unable to cast: [Omerta]')
            return false
        end
	end
	if act == 'Ability' then
		if buffactive.amnesia then
            add_to_chat(123,'Unable to perform action: [Amnesia]')
            return false
		elseif buffactive.impairment then			
			add_to_chat(123,'Unable to perform action: [Impairment]')
			return false
        end
	end
	return true
end

function load_macros()
	if player.sub_job == 'NIN' then set_macros(15,4) return end
	if player.sub_job == 'DRK' then set_macros(15,3) return end
	if player.sub_job == 'DRG' then set_macros(15,2) return end
	set_macros(15,1) -- Default /WAR
end

windower.raw_register_event('add item', function(bag, index, id, count)
	if id == 4146 and world.area == "Ghoyu's Reverie" then --4146 Revitalizer ID
        windower.chat.input('/item Revitalizer <me>')
	end
end)

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then
		stateBox:hide()
	end
	--if (id == 0x1A or id == 0x50) then
	--	equip_change()
	--end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then
		stateBox:show()
	end
	--if (id == 0x37 or id == 0x1D) then
	if id == 0x050 then
		equip_change()
	end
end)


function update_status()
	local spc = '   '
    local WeaponColor = get_weapon_color(CurrentWeapon)

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, EngagedMode[EngagedIndex], spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, IdleMode[IdleIndex], spc)

	if acc_mode == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Accuracy: ',  Colors.Yellow, 'High', spc)
	else
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Accuracy: ',  Colors.Blue, 'Normal', spc)
	end
	
	if auto_hasso == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Hasso', spc)
	end
	
	if range_mode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Ranged', spc)
	end

	if lock_twilight == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Twilight', spc)
	end

	if AutoSC == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'AutoSC: ', Colors.Yellow, ascWS, spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end