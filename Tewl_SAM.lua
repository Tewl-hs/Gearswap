 --[[
	Author: Tewl / Bismark
	Files: Tewl_SAM.lua 

	Binds
	ALT+F9   : Toggle Mainhand weapon ('Empyrean', 'Mythic', 'Relic', 'Aeonic', 'Polearm')
	ALT+F10  : Toggle SkillChain Mode

	WIN+A	 : Equip Dojikiri Yasutsuna
	WIN+E	 : Equip Masamune
	WIN+M	 : Equip Kogarasumaru
	WIN+P	 : Equip Shining One
	WIN+R	 : Equip Amanomurakumo

	CTRL+F9  : Toggle Engaged Mode (Normal, Accuracy, PDT, MDT, Hybrid)
	CTRL+F10 : Toggle Idle Mode (Normal, PDT, MDT, Hybrid)
	CTRL+F11 : Toggle Ranged Mode (Disabled by default)
	CTRL+F12 : Toggle Twilight (Disabled by default)
--]]
function get_sets()
	items = require('resources').items

	send_command("bind @e input //gs equip sets.Weapons['Masamune']")
	send_command("bind @m input //gs equip sets.Weapons['Kogarasumaru']")
	send_command("bind @r input //gs equip sets.Weapons['Amanomurakumo']")
	send_command("bind @a input //gs equip sets.Weapons['Dojikiri Yasutsuna']")
	send_command("bind @p input //gs equip sets.Weapons['Shining One']")
	send_command('bind !f9 gs c cycle weapon')
	send_command('bind !f10 gs c toggle autows') 
	send_command('bind !f11 gs c toggle wsacc')
	send_command('bind ^f9 gs c cycle engaged')
	send_command('bind ^f10 gs c cycle idle')
	send_command('bind ^f11 gs c toggle ranged') 
	send_command('bind ^f12 gs c toggle twilight')

	--  Load Macros and set equipviewer position. Remove or alter these 2 lines for your own preferences
	send_command('input /macro book 15;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 1') -- Sets Macro set and lockstyle
	send_command('input //equipviewer pos 1663 935') -- Repositions my equipviewer
	
	sets.MoveSpeed = { feet = "Danzo Sune-Ate",} --auto swaps when moving

	EngagedMode = {'Normal', 'PDT', 'MDT', 'Subtle Blow', 'Hybrid'}
	e = 1 -- Which set for initial setup in array.
	IdleMode = {'Normal', 'PDT', 'MDT'}
	i = 1
	Weapons = T{'Masamune', 'Kogarasumaru', 'Amanomurakumo', 'Dojikiri Yasutsuna', 'Shining One'}
	w = 1

	Colors = {
		Yellow = '\\cs(255,192,0)',
		Red = '\\cs(255,80,80)',
		Green = '\\cs(110,255,110)',
		Blue = '\\cs(140,160,255)',
		Gray = '\\cs(96,96,96)',
		White = '\\cs(255,255,255)'
	}

	CurrentWeapon = 'Masamune'
	WeaponColor = Colors.Red

	Weapon = { 
		['Masamune'] = { Color = Colors.Red },
		['Kogarasumaru'] = { Color = Colors.Blue },
		['Amanomurakumo'] = { Color	= Colors.Yellow },
		['Dojikiri Yasutsuna'] = { Color = Colors.Green },
		['Shining One'] = { Color = Colors.White }
	}

	range_mode = false
	lock_twilight = false
	acc_mode = false
	
	-- Initial setup variables
	AWSEnabled = false
	AutoWS = 'Tachi: Enpi'
	WeaponSkills = T{'Tachi: Fudo','Tachi: Kasha','Tachi: Shoha','Tachi: Fudo'}
	ws_order = 1
	last_target = nil
    
    -- Gearsets
	Capes = {} 
	Capes.TP	= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
	Capes.STP	= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',} }
	Capes.WS	= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
	Capes.RA	= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',} }
	Capes.RWS	= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+10 Rng.Atk.+10','Rng.Acc.+10','Weapon skill damage +10%',} }
	Capes.FC	= { name="Smertrios's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Spell interruption rate down-10%',}}

	LugraWS = T{'Tachi: Fudo', 'Tachi: Kasha', 'Tachi: Yukikaze', 'Tachi: Gekko', 'Tachi: Kaiten', 'Impulse Drive'}

	sets.Weapons = {
		['Masamune'] = {main='Masamune',sub='Utu Grip'},
		['Kogarasumaru'] = {main='Kogarasumaru',sub='Utu Grip'},
		['Amanomurakumo'] = {main='Amanomurakumo',sub='Utu Grip'},
		['Dojikiri Yasutsuna'] = {main='Dojikiri Yasutsuna',sub='Utu Grip'},
		['Shining One'] = {main='Shining One',sub='Utu Grip'},
	}
	sets.JA = {
		['Seigan'] = {
			head	= "Kasuga Kabuto +1"
		},
		['Meditate'] = {
			head	= "Wakido Kabuto +3",
			hands	= "Sakonji Kote +3",
			back	= Capes.TP
		},
		['Hasso'] = {
			hands	= "Wakido Kote +3"
		},
		['Sekkanoki'] = {
			hands	= "Kasuga Kote +1"
		},
		['Warding Circle'] = {
			head	= "Wakido Kabuto +3"
		},
		['Sengikori'] = {
			feet	= "Kasuga Sune-Ate +1"
		},
		['Blade Bash'] = {
			hands	= "Sakonji Kote +3"
		},
		['Meikyo Shisui'] = {
			feet	= "Sak. Sune-Ate +3"
		}
	}
	sets.FC = { -- 50 / 52%
		ammo		= "Sapience Orb", -- 2
		head		= "Acro Helm", -- 3
		neck		= "Orunmila's Torque", --5
		body		= "Sacro Breastplate", -- 10
		hands		= "Leyline Gloves", -- 7
		legs		= "Arjuna Breeches", -- 4 Zerde
		feet		= "Acro Leggings", -- 3
		left_ear	= "Loquac. Earring", -- 2
		right_ear	= "Enchntr. Earring +1", -- 2
		left_ring	= "Prolix Ring", -- 2
		--right_ring	= "Rahab Ring", -- 2 [AA TT]
		back		= Capes.FC -- 10
	}
	sets.Enmity = {
		ammo		= "Sapience Orb", 
		head		= "Loess Barbuta +1",
		-- neck		= "Unmoving Collar +1", -- [UNM]
		body		= "Emet Harness +1",
		--hands		= "Acro Gauntlets", -- [Skirmish]
		--legs		= "Acro Breeches", -- [Skirmish]
		--feet		= "Acro Leggings", -- [Skirmish]
		left_ear	= "Trux Earring",
		right_ear	= "Cryptic Earring +1",
		left_ring	= "Eihwaz Ring",
		--right_ring	= "Supershear Ring", -- [Titan Prime II]
		--back		= Capes.Enmity -- [Ambuscade]

	}
	sets.RA = {
		range		= { name="Yoichinoyumi", augments={'Path: A',}},
		ammo		= "Yoichi's Arrow",
		body		= { name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		body		= "Wakido Domaru +3",
		hands		= "Wakido Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Wakido Sune. +3",
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= "Reiki Yotai", -- Yemaya Belt [Duke Vesper]
    	left_ear   	= "Telos Earring", 
    	right_ear   = "Crep. Earring",
		left_ring	= "Regal Ring",
		right_ring	= "Cacoethic ring +1",
		back		= Capes.RA
	}
	sets.WS = {}
	sets.WS.Normal = {
		ammo		= "Knobkierrie",
		head		= "Mpaca's Cap",
		body		= { name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		--hands		= { name="Valorous Mitts", augments={'Accuracy+23','Weapon skill damage +3%','STR+15','Attack+7',}},
		hands		= { name="Valorous Mitts", augments={'Attack+28','Pet: INT+2','Weapon skill damage +9%','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		legs		= "Wakido Haidate +3",
		feet		= { name="Valorous Greaves", augments={'"Dbl.Atk."+1','STR+5','Weapon skill damage +8%','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear	= "Thrud Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring +1",
		back		= Capes.WS
	}
	sets.WS.Normal.Accuracy = set_combine(sets.WS.Normal, { 
		head		= { name="Valorous Mask", augments={'"Cure" potency +2%','Weapon Skill Acc.+11','Weapon skill damage +7%','Accuracy+6 Attack+6','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		left_ring	= "Regal Ring",
	})
	sets.WS['Tachi: Fudo'] = set_combine(sets.WS.Normal, { })
	sets.WS['Tachi: Fudo'].Accuracy = set_combine(sets.WS['Tachi: Fudo'], { 
		head		= { name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
		feet		= { name="Sak. Sune-Ate +3", augments={'Enhances "Meikyo Shisui" effect',}},
		right_ear	= "Telos Earring",
		left_ring	= "Regal Ring",
		waist		= "Kentarch Belt +1"
	})
	sets.WS['Tachi: Kaiten'] = set_combine(sets.WS['Tachi: Fudo'], { })
	sets.WS['Tachi: Kaiten'].Accuracy = set_combine(sets.WS['Tachi: Fudo'].Accuracy, { })
	sets.WS['Tachi: Shoha'] = set_combine(sets.WS.Normal, { 
		right_ear	= { name="Lugra Earring +1", augments={'Path: A',}},
		right_ring	= "Niqmaddu Ring",
		feet		= "Flam. Gambieras +2"
	})
	sets.WS['Tachi: Rana'] = set_combine(sets.WS['Tachi: Shoha'], { })
	sets.WS['Tachi: Jinpu'] = set_combine(sets.WS.Normal, { 
		head		= { name="Valorous Mask", augments={'"Cure" potency +2%','Weapon Skill Acc.+11','Weapon skill damage +7%','Accuracy+6 Attack+6','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		body		= "Sacro Breastplate",
		hands		= "Founder's Gauntlets",
		feet		= { name="Valorous Greaves", augments={'"Dbl.Atk."+1','STR+5','Weapon skill damage +8%','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		right_ear	= "Friomisi Earring",
		waist		= "Orpheus's Sash",
		--waist "Eschan Stone",
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
	})		
	sets.WS['Namas Arrow'] = set_combine(sets.WS.Normal, {
		head		= { name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
		hands		= "Kasuga Kote +1",
		legs		= "Ken. Hakama +1",
		feet		= "Wakido Sune. +3",
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		right_ring	= "Regal Earring",
		left_ear	= "Telos Earring",
		right_ear	= "Thrud Earring",
		waist		= "Fotia Belt",
		back		= Capes.RWS
	})			
	sets.WS['Impulse Drive'] = set_combine(sets.WS.Normal, { 
		hands       = { name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
	})
	sets.WS['Stardiver'] = set_combine(sets.WS.Normal, { 
		hands       = { name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		right_ear	= { name="Lugra Earring +1", augments={'Path: A',}},
		left_ring	= "Regal Ring",
		right_ring	= "Niqmaddu Ring",
	})
	sets.Engaged = {}
	sets.Engaged.Normal = {
		sub			= "Utu Grip",
		ammo		= "Aurgelmir Orb +1",
		--ammo { name="Coiste Bodhar", augments={'Path: A',}},
		head		= "Flam. Zucchetto +2",
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		hands		= "Wakido Kote +3",
		legs		= { name="Tatena. Haidate +1", augments={'Path: A',}},
		feet		= { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}},
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear	= "Telos Earring",
		right_ear	= "Dedition Earring",
		left_ring	= "Chirich Ring +1", 
		right_ring	= "Niqmaddu Ring",
		back		= Capes.TP
	}	
	sets.Engaged.Accuracy = set_combine(sets.Engaged.Normal, {
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		hands		= "Wakido Kote +3",
		legs		= { name="Tatena. Haidate +1", augments={'Path: A',}},
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
		waist		= "Ioskeha Belt +1",
		right_ring	= "Regal Earring",
		right_ear	= "Digni. Earring",
	})
	sets.Engaged.PDT = { -- DT 51/32
		sub			= "Utu Grip",
		ammo		= "Staunch Tathlum +1", -- 3/3
		head		= "Mpaca's Cap", -- 7/0
		body		= "Wakido Domaru +3", -- 8/8
		hands		= "Wakido Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		neck		= { name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
		waist		= "Flume Belt +1", -- 4/0
		left_ear	= "Telos Earring",
		right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}}, -- 3/5
		left_ring	= "Defending Ring", -- 10/10
		right_ring	= "Chirich Ring +1",
		back		= Capes.TP -- 10/0
	}
	sets.Engaged.MDT = set_combine(sets.Engaged.PDT, {
		--head		= "Ken. Jinpachi +1",
		head		= "Mpaca's Cap", -- 7/0
		body		= "Ken. Samue +1",
		hands		= "Ken. Tekko +1",
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		left_ear	= "Etiolation Earring",
		waist		= "Ioskeha Belt +1",
	})
	sets.Engaged["Subtle Blow"] = { -- MEVA 376 MDB 45 DT 3 PDT 32 Haste 26 SB1 27 SB2 10 STP 46
    	sub         = "Utu Grip",
    	ammo        = "Staunch Tathlum +1", -- 0 0 3
    	head        = { name="Mpaca's Cap", augments={'Path: A',}}, -- MEVA 69 MDB 12 PDT 7
    	body        = "Flamma Korazin +2", -- MEVA 69 MDB 6 Haste 2 SB1 17 STP 9 ::: Dagon Breastplate [Kin]
    	hands       = "Wakido Kote +3", -- MEVA 46 MDB 2 Haste 4 STP 7 
    	legs        = "Mpaca's Hose", -- MEVA 96 MDB 13 Haste 9 SB2 5 PDT 9
    	feet        = "Mpaca's Boots", -- MEVA 96 MDB 12 Haste 3 PDT 6
    	neck        = { name="Sam. Nodowa +2", augments={'Path: A',}}, -- STP 14
    	waist       = "Ioskeha Belt +1", -- Haste 8
    	left_ear   	= "Telos Earring", -- STP 5
    	right_ear   = "Crep. Earring", -- STP 5
    	left_ring   = "Niqmaddu Ring", -- SB2 5
    	right_ring  = "Chirich Ring +1", -- SB1 10 STP 6
    	back        = Capes.STP
	}
	sets.Engaged.Hybrid = set_combine(sets.Engaged.PDT, { -- DT 38/21 EVA 333 MEVA 512 MDB 36
		sub			= "Utu Grip",
		ammo		= "Staunch Tathlum +1", -- 3/3
		head		= "Mpaca's Cap", -- 7/0
		body		= "Wakido Domaru +3", -- 8/8
		hands		= "Wakido Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		neck		= { name="Sam. Nodowa +2", augments={'Path: A',}}, 
		waist		= "Ioskeha Belt +1",
		left_ear	= "Telos Earring",
		right_ear	= "Dedition Earring",
		left_ring	= "Defending Ring", -- 10/10
		right_ring	= "Chirich Ring +1",
		back		= Capes.TP -- 10/0
	})
	sets.Idle = { }
	sets.Idle.Normal = { -- PDT 20 DT 15+19+10+3 MDT 2 68/49
		sub			= "Utu Grip",
		ammo		= "Staunch Tathlum +1",
		head		= "Wakido Kabuto +3",
		body		= "Tartarus Platemail",
		hands		= { name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
		neck		= { name="Loricate Torque +1", augments={'Path: A',}},
		waist		= "Flume Belt +1",
		left_ear	= "Tuisto Earring", 
		right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring	= "Defending Ring",
		right_ring	= "Karieyh Ring +1",
		back		= Capes.TP
	}
	sets.Idle.PDT = sets.Engaged.PDT
	sets.Idle.MDT = sets.Engaged.MDT
	sets.Idle.Hybrid = sets.Engaged.Hybrid

	sets.Twilight = { 
		head		= "Twilight helm",
		body		= "Twilight mail"
	}
	sets.Ranged = {
		range		= { name="Yoichinoyumi", augments={'Path: A',}},
		ammo		= "Yoichi's Arrow"
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

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return index
        end
    end
    return table.getn(tab)
end

function precast(spell,action)
	local target = player.target.id
	if target ~= last_target then
		ws_order = 1
		last_target = target
	end
	if buffactive.terror or buffactive.petrification or buffactive.sleep or buffactive.Lullaby or buffactive.stun then
        add_to_chat(123,'Unabled to perform action: Status effect (Terror, Petrify, Sleep, Stun)')
        cancel_spell()
        return
    end

	if spell.type == 'WeaponSkill' then
		if buffactive.amnesia or buffactive.impairment then
            add_to_chat(123,'Abort: Status effect (Amnesia, Impairment)')
            cancel_spell()
            return
        end
        if player.tp < 1000 then
            add_to_chat(123,'Unable to use: '..spell.english..' (TP:'..player.tp..')')
            cancel_spell()
            return
        end
		if spell.name == AutoWS and AWSEnabled == true then
			cancel_spell()
			send_command('@input /ws "'..WeaponSkills[ws_order]..'" '..spell.target.raw)
			ws_order = ws_order + 1
			if ws_order > table.getn(WeaponSkills) then
				ws_order = 1
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
			ws = set_combine(ws, sets.JA['Sekkanoki'])
		end
		if buffactive['Meikyo Shisui'] then
			ws = set_combine(ws, sets.JA['Meikyo Shisui'])
		end
		if LugraWS:contains(spell.english) and acc_mode == false then
			if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
				if player.tp > 2750 then
					ws = set_combine(ws,{left_ear="Lugra Earring +1"})
				else
					ws = set_combine(ws,{right_ear="Lugra Earring +1"})
				end
			end
		end
		equip(ws)
	elseif spell.action_type == 'Ability' then
		if buffactive.amnesia or buffactive.impairment then
            add_to_chat(123,'Unabled to perform action: Status effect (Amnesia, Impairment)')
            cancel_spell()
            return
        end
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..abil_recasts[spell.recast_id]..'s')
			return
		end
		if sets.JA[spell.name] then
			equip(sets.JA[spell.name])
		end
	elseif spell.action_type == 'Ranged Attack' and range_mode == true then
		equip(sets.RA)
	elseif spell.action_type == 'Magic' then
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
        local spell_recasts = windower.ffxi.get_spell_recasts()
        local sr = math.floor(spell_recasts[spell.recast_id]/60)
        if sr > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..sr..'s')
            return
        end
		equip(sets.FC)
	end
end

function midcast(spell,action)

end

function aftercast(spell,action)
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
		eq = set_combine(sets.Engaged.Normal, {main=CurrentWeapon})
		if acc_mode == true and sets.Engaged[EngagedMode[e]].Accuracy then
			eq = set_combine(sets.Engaged[EngagedMode[e]].Accuracy, {main=CurrentWeapon})
		elseif sets.Engaged[EngagedMode[e]] then
			eq = set_combine(sets.Engaged[EngagedMode[e]], {main=CurrentWeapon})
		end
		if Weapons:contains(CurrentWeapon) then
			eq = set_combine(eq, {sub='Utu Grip'})
		end
		if range_mode == true then
			eq = set_combine(eq, sets.Ranged)
		end
		if (buffactive['Weakness'] or buffactive['Doom']) and lock_twilight == true then
			eq = set_combine(eq,sets.Twilight)
		end
	else
		eq = set_combine(sets.Idle.Normal, {main=CurrentWeapon})
		if sets.Idle[IdleMode[i]] then
			eq = set_combine(sets.Idle[IdleMode[i]], {main=CurrentWeapon})
		end
		if Weapons:contains(CurrentWeapon) then
			eq = set_combine(eq, {sub='Utu Grip'})
		end
		if range_mode == true then
			eq = set_combine(eq, sets.Ranged)
		end
		if (buffactive['Weakness'] or buffactive['Doom']) and lock_twilight == true then
			eq = set_combine(eq,sets.Twilight)
		end
	end
	equip(eq)
	update_status()
end

function self_command(cmd)
	local args = T(cmd:split(' '))
	if args[1] == 'cycle' and args[2] then
        if args[2] == 'engaged' then
            e = e + 1 
            if (table.getn(EngagedMode) < e) then e = 1 end
		elseif args[2] == 'weapon' then
			w = w + 1 
			if (table.getn(Weapons) < w) then w = 1 end
			CurrentWeapon = Weapons[w]
		elseif args[2] == 'idle' then
			i = i + 1 
			if (table.getn(IdleMode) < i) then i = 1 end
		end
		equip_check()
	elseif args[1] == 'toggle' and args[2] then
		if args[2] == 'twilight' then
			if lock_twilight == false then
				lock_twilight = true
			else
				lock_twilight = false
			end
			equip_check()
		elseif args[2] == 'autows' then
			if AWSEnabled == false then
				AWSEnabled = true
			else
				AWSEnabled = false
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
				WeaponColor = Colors.Gray
			else
				CurrentWeapon = ew
				if Weapon[ew] then
					WeaponColor = Weapon[ew].Color
				else
					WeaponColor = Colors.White
				end
			end	
			w = has_value(Weapons, CurrentWeapon)
			equip_check()
		end
	end
end

function update_status()
	local spc = '   '

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, EngagedMode[e], spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, IdleMode[i], spc)

	if acc_mode == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Accuracy: ',  Colors.Yellow, 'High', spc)
	else
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Accuracy: ',  Colors.Blue, 'Normal', spc)
	end
	
	if range_mode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Ranged', spc)
	end

	if lock_twilight == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Twilight', spc)
	end

	if AWSEnabled == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'AutoWS: ', Colors.Yellow, AutoWS, spc)
	end
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

-- MOVEMENT SPEED SWAP / Taken from Motes
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

function actual_cost(spell)
    local cost = spell.mp_cost
	if spell.type=="WhiteMagic" then
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