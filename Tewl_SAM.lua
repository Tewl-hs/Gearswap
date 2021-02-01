 --[[
	Author: Tewl / Bismark
	Files: Tewl_SAM.lua 

	Binds
	ALT+F9   : Toggle Mainhand weapon ('Empyrean', 'Mythic', 'Relic', 'Aeonic', 'Polearm')
	ALT+F10  : Toggle AutowS Mode

	WIN+A	 : Equip Dojikiri Yasutsuna
	WIN+E	 : Equip Masamune
	WIN+M	 : Equip Kogarasumaru
	WIN+P	 : Equip Shining One
	WIN+R	 : Equip Amanomurakumo

	CTRL+F9  : Toggle Engaged Mode (Normal, Accuracy, PDT, MDT, Hybrid)
	CTRL+F10 : Toggle Idle Mode (Normal, PDT, MDT, Hybrid)
	CTRL+F11 : Toggle Ranged Mode (Disabled by default)
	CTRL+F12 : Toggle Twilight (Disabled by default)

	Not all of this is my code, some was copied and altered for my own preferences.
--]]
function get_sets()
	items = require('resources').items

	send_command("bind @e input /equip main 'Masamune'")
	send_command("bind @m input /equip main 'Kogarasumaru'")
	send_command("bind @r input /equip main 'Amanomurakumo'")
	send_command("bind @a input /equip main 'Dojikiri Yasutsuna'")
	send_command("bind @p input /equip main 'Shining One'")
	send_command('bind !f9 gs c cycle weapon')
	send_command('bind !f10 gs c toggle autows') 
	send_command('bind ^f9 gs c cycle engaged')
	send_command('bind ^f10 gs c cycle idle')
	send_command('bind ^f11 gs c toggle ranged') 
	send_command('bind ^f12 gs c toggle twilight')

	--  Load Macros and set equipviewer position. Remove or alter these 2 lines for your own preferences
	send_command('input /macro book 15;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 19') -- Sets Macro set and lockstyle when changing to SAM
	send_command('input //equipviewer pos 1663 934') -- Repositions my equipviewer when I change to SAM
	
	sets.MoveSpeed = { feet = "Danzo Sune-Ate",} --auto swaps when moving

	EngagedMode = {'Normal', 'Accuracy', 'PDT', 'MDT', 'Hybrid'}
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
		['Masamune'] = {
			Color	= Colors.Red
		},
		['Kogarasumaru'] = {
			Color	= Colors.Blue
		},
		['Amanomurakumo'] = {
			Color	= Colors.Yellow
		},
		['Dojikiri Yasutsuna'] = {
			Color	= Colors.Green
		},
		['Shining One'] = {
			Color	= Colors.White
		}
	}

	range_mode = false
	lock_twilight = false
	
	-- Initial setup variables
	AWSEnabled = false
	AutoWS = 'Tachi: Enpi'
	WeaponSkills = T{'Tachi: Fudo','Tachi: Kasha','Tachi: Shoha','Tachi: Fudo'}
	ws_order = 1
	last_target = nil
    
    -- Gearsets
	Capes = {} 
	Capes.TPCape	= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
	Capes.WSCape	= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
	Capes.RACape	= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',} }
	Capes.RWSCape   = { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+10 Rng.Atk.+10','Rng.Acc.+10','Weapon skill damage +10%',} }

	sets.JA = {
		['Seigan'] = {
			head	= "Kasuga Kabuto +1"
		},
		['Meditate'] = {
			head	= "Wakido Kabuto +3",
			hands	= "Sakonji Kote +3",
			back	= Capes.TPCape
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
	sets.FC = { -- 35 / 51%
		ammo		= "Sapience Orb", -- 2
		head		= "Acro Helm", -- 3
		neck		= "Orunmila's Torque", --5
		body		= "Sacro Breastplate", -- 10
		hands		= "Leyline Gloves", -- 7
		--legs		= "Arjuna Breeches", -- 4 Zerde
		feet		= "Acro Leggings", -- 3
		left_ear	= "Loquac. Earring", -- 2
		right_ear	= "Etiolation Earring", -- 1
		left_ring	= "Prolix Ring", -- 2
		--right_ring	= "Rahab Ring", -- 2 AA TT
		--back		= Capes.FC -- 10
	}
	sets.RA = {
		sub		= "Utu Grip",
		range		= "Yoichinoyumi",
		ammo		= "Yoichi's Arrow",
		head		= "Sakonji Kabuto +3",
		body		= "Ken. Samue +1",
		hands		= "Wakido Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Wakido Sune. +3",
		neck		= "Sam. Nodowa +2", -- Need RA neck
		waist		= "Eschan Stone", -- "Reiki Yotai"
		left_ear	= "Telos earring",
		right_ear	= "Lugra Earring +1", -- "Enervating Earring",
		left_ring	= "Regal Ring",
		right_ring	= "Cacoethic ring +1",
		back		= Capes.RACape
	}
			
	sets.WS = {}
	sets.WS.Normal = {
		ammo		= "Knobkierrie",
		head		= { name="Valorous Mask", augments={'Attack+26','Weapon skill damage +3%','STR+15','Accuracy+13',}},
		body		= "Sakonji Domaru +3",
		hands		= { name="Valorous Mitts", augments={'Accuracy+23','Weapon skill damage +3%','STR+15','Attack+7',}},
		legs		= "Wakido Haidate +3",
		feet		= { name="Valorous Greaves", augments={'"Dbl.Atk."+1','STR+5','Weapon skill damage +8%','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		neck		= "Sam. Nodowa +2",
		waist		= "Fotia Belt",
		left_ear	= "Moonshade Earring",
		right_ear	= "Thrud Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring",
		back		= Capes.WSCape
	}
	sets.WS['Tachi: Fudo'] = set_combine(sets.WS.Normal, { 
		--head		= { name="Valorous Mask", augments={'"Cure" potency +2%','Weapon Skill Acc.+11','Weapon skill damage +7%','Accuracy+6 Attack+6','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		waist		= "Sailfi Belt +1",
	})
	sets.WS['Tachi: Kaiten'] = set_combine(sets.WS.Fudo, { })	
	sets.WS['Tachi: Shoha'] = set_combine(sets.WS.Normal, { 
		head		= { name="Stinger Helm +1", augments={'Path: A',}},
		waist		= "Sailfi Belt +1",
	})
	sets.WS['Tachi: Rana'] = set_combine(sets.WS.Shoha, { })
	sets.WS['Tachi: Jinpu'] = set_combine(sets.WS.Normal, { 
		ammo		= "Knobkierrie",
		head		= { name="Valorous Mask", augments={'"Cure" potency +2%','Weapon Skill Acc.+11','Weapon skill damage +7%','Accuracy+6 Attack+6','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		body		= "Sacro Breastplate",
		hands		= "Founder's Gauntlets",
		legs		= "Wakido Haidate +3",
		feet		= { name="Valorous Greaves", augments={'"Dbl.Atk."+1','STR+5','Weapon skill damage +8%','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		right_ear	= "Friomisi Earring",
		left_ear	= "Moonshade Earring",
		left_ring	= "Epaminondas's Ring",
		right_ring	= "Karieyh Ring",
		--waist		= "Orpheus's Sash",
		waist		= "Eschan Stone",
	})
	sets.WS['Tachi: Ageha'] = set_combine(sets.WS.Normal, {
		ammo		= "Pemphredo Tathlum",
		head		= "Flam. Zucchetto +2",
		body		= "Flamma Korazin +2",
		hands		= "Flam. Manopolas +2",
		legs		= "Flamma Dirs +2",
		feet		= "Flam. Gambieras +2",
		left_ring	= "Metamor. Ring +1",
		right_ring	= "Stikini Ring +1",
		waist		= "Eschan Stone",
	})		
	sets.WS['Namas Arrow'] = set_combine(sets.WS.Normal, {
		head		= "Sakonji Kabuto +3",
		body		= "Ken. Samue +1",
		hands		= "Ryuo Tekko +1",
		legs		= "Ken. Hakama +1",
		feet		= "Wakido Sune. +3",
		neck		= "Fotia Gorget",
		left_ring	= "Regal Ring",
		right_ring	= "Ilabrat Ring",
		left_ear	= "Ishvara Earring",
		right_ear	= "Thrud Earring",
		waist		= "Eschan Stone",
		back		= Capes.RWSCape
	})			
	sets.WS['Impulse Drive'] = set_combine(sets.WS.Normal, { 
		head		= "Blistering Sallet +1"
	})
	
	sets.Engaged = {}
	sets.Engaged.Normal = {
		sub		= "Utu Grip",
		ammo		= "Ginsen",
		head		= "Flam. Zucchetto +2",
		--body		= "Kasuga Domaru +1", -- ALT TP Set
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		legs		= { name="Tatena. Haidate +1", augments={'Path: A',}},
		--legs		= "Ryuo Hakama +1", -- ALT TP Set
		feet		= "Ryuo Sune-Ate +1",
		--hands		= "Wakido Kote +3", -- Equipped when hasso is up
		hands		= { name="Tatena. Gote +1", augments={'Path: A',}},
		neck		= "Sam. Nodowa +2",
		waist		= "Ioskeha Belt +1",
		left_ear	= "Telos Earring",
		right_ear	= "Dedition Earring",
		--left_ring	= "Flamma Ring", -- ALT TP Set
		left_ring   = "Chirich Ring +1", 
		right_ring	= "Niqmaddu Ring",
		back		= Capes.TPCape
	}	
	sets.Engaged.Accuracy = set_combine(sets.Engaged.Normal, {
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
		hands		= { name="Tatena. Gote +1", augments={'Path: A',}},
		legs		= { name="Tatena. Haidate +1", augments={'Path: A',}},
		feet		= { name="Tatena. Sune. +1", augments={'Path: A',}},
		right_ear	= "Cessance Earring", -- "Digni. Earring"
	})
	sets.Engaged.PDT = {
		sub		= "Utu Grip",
		ammo		= "Staunch Tathlum +1",
		head		= "Wakido Kabuto +3",
		body		= "Tartarus Platemail",
		hands		= "Sakonji Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		neck		= "Loricate Torque +1",
		waist		= "Flume Belt +1",
		left_ear	= "Genmei Earring",
		right_ear	= "Odnowa Earring +1",
		left_ring	= "Defending Ring",
		right_ring	= "Karieyh Ring",
		back		= Capes.TPCape
	}

	sets.Engaged.MDT = set_combine(sets.Engaged.PDT, {
		head		= "Ken. Jinpachi +1",
		body		= "Ken. Samue +1",
		hands		= "Ken. Tekko +1"
	})
	sets.Engaged.Hybrid = set_combine(sets.Engaged.Normal, { })
	
	sets.Idle = { }
	sets.Idle.Normal = {
		sub			= "Utu Grip",
		ammo		= "Staunch Tathlum +1",
		head		= "Wakido Kabuto +3",
		body		= "Tartarus Platemail",
		hands		= "Sakonji Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		neck		= "Loricate Torque +1",
		waist		= "Flume Belt +1",
		left_ear	= "Genmei Earring",
		right_ear	= "Odnowa Earring +1",
		left_ring	= "Defending Ring",
		right_ring	= "Karieyh Ring",
		back		= Capes.TPCape
	}
	sets.Idle.PDT = set_combine(sets.Idle.Normal, {
		head		= "Ken. Jinpachi +1",
		right_ring	= "Gelatinous Ring +1"
	})
	sets.Idle.MDT = set_combine(sets.Idle.PDT, {
		hands		= "Ken. Tekko +1"
	})

	sets.Twilight = { 
		head		= "Twilight helm",
		body		= "Twilight mail"
	}
	sets.Ranged = {
		range		= "Yoichinoyumi",
		ammo		= "Yoichi's Arrow"
	}

	--  NOT MY CODE! Testing content for displaying text under chat
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

	if displayx then x = displayx end
	if displayy then y = displayy end

	local font = displayfont or 'Arial'
	local size = displaysize or 12
	local bold = displaybold or true
	local bg = displaybg or 0
	local strokewidth = displaystroke or 2
	local stroketransparancy = displaytransparancy or 192

	stateBox = texts.new({flags = {draggable=false}})
	stateBox:pos(x,y)
	stateBox:font(font)--Arial
	stateBox:size(size)
	stateBox:bold(bold)
	stateBox:bg_alpha(bg)--128
	stateBox:right_justified(false)
	stateBox:stroke_width(strokewidth)
	stateBox:stroke_transparency(stroketransparancy)

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

	if spell.type == 'WeaponSkill' then
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
			ws = sets.WS[spell.english]
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
		if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
			if player.tp > 2750 then
				ws = set_combine(ws,{left_ear="Lugra Earring +1"})
			else
				ws = set_combine(ws,{right_ear="Lugra Earring +1"})
			end
		end
		equip(ws)
	elseif spell.action_type == 'Ranged Attack' and range_mode == true then
		equip(sets.RA)
	elseif spell.action_type == 'Magic' then
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
	if player.status == 'Engaged' then
		if buff == 'Hasso' then
			if gain == true then
				equip({hands="Wakido Kote +3"})
			else
				equip({hands="Tatena. Gote +1"})
			end
		end
	end
end

function equip_check()
	local eq = {}
	if player.status == 'Engaged' then	
		eq = set_combine(sets.Engaged.Normal, {main=CurrentWeapon})
		if sets.Engaged[EngagedMode[e]] then
			eq = set_combine(sets.Engaged[EngagedMode[e]], {main=CurrentWeapon})
		end
		if (buffactive['Hasso']) then
			eq = set_combine(eq,{hands="Wakido Kote +3"})
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

function self_command(...)
	local args = T{...}
	if #args == 0 then
		return
	end	
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
		elseif args[2] == 'autows' then
			if AWSEnabled == false then
				AWSEnabled = true
			else
				AWSEnabled = false
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
		end
		equip_check()
	end
end

function update_status()
	local spc = '   '

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, EngagedMode[e], spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, IdleMode[i], spc)

	if range_mode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Ranged', spc)
	else
		status_text = string.format("%s%s %s%s", status_text, Colors.Gray, 'Ranged', spc)
	end
	if lock_twilight == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'Twilight', spc)
	else
		status_text = string.format("%s%s %s%s", status_text, Colors.Gray, 'Twilight', spc)
	end
	if AWSEnabled == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'AutoWS: ', Colors.Yellow, AutoWS, spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

function clear_job_states()
	if stateBox then stateBox:destroy() end
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

-- MOVEMENT SPEED SWAP
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