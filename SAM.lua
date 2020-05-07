----------------------------------------------------------------------------------------------------------------------
-- Author: Tewl / Bismark
-- Files: SAM.lua 
--
-- Binds
-- CTRL+F9  : Toggle MAX STP/DefensiveAccuracy
-- CTRL+F10 : Toggle Ranged Mode
-- CTRL+F11 : Toggle DT SET
-- CTRL+F12 : Toggle Twilight set lock (Currently not functional. Needs adjustment)
--
-- Not all of this is my code, some was copied and altered for my own preferences.
-- This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
-- and to share with friends that might be interested or could help with it.
--
-- sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
--
----------------------------------------------------------------------------------------------------------------------
 function get_sets()			
--  Load Macros and set equipviewer position. Remove or alter these 2 lines for your own preferences
	send_command('input /macro book 15;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 1') -- Sets Macro set and lockstyle when changing to SAM
	send_command('input //equipviewer pos 1663 934') -- Repositions my equipviewer when I change to SAM
--  Sets binds 
	send_command('bind ^f9 gs c tstp')
	send_command('bind ^f10 gs c tr')
	send_command('bind ^f11 gs c tdt') 
	-- Commented out because I needs rewrite
	--send_command('bind ^f12 gs c twilight')

	sets.MoveSpeed = { feet = "Danzo Sune-Ate",} --auto swaps when moving

	max_stp = true
	range_mode = false
	use_twilight = false
	use_DT = false

--  NOT MY CODE! Testing content for displaying text under chat
	texts = require('texts')
	if stateBox then stateBox:destroy() end

	local settings = windower.get_windower_settings()
	local x,y

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

	stateBox = texts.new()
	stateBox:pos(x,y)
	stateBox:font(font)--Arial
	stateBox:size(size)
	stateBox:bold(bold)
	stateBox:bg_alpha(bg)--128
	stateBox:right_justified(false)
	stateBox:stroke_width(strokewidth)
	stateBox:stroke_transparency(stroketransparancy)

	update_status()
-- End of display code

-- Variables for auto-skill chain. Only edit AutoWS 
	AutoWS = 'Tachi: Enpi'
	ws_order = 1
	ws_new = 0

-- Variables for ranged/ammo/capes - These are not put into the sets because of mode changes and for augment shorthand 
   Gear = {} 
   Gear.Bow			= "Yoichinoyumi"
   Gear.Arrow 		= "Yoichi's Arrow"
   Gear.DTAmmo 		= "Staunch Tathlum +1"
   Gear.TPAmmo		= "Ginsen"
   Gear.WSAmmo		= "Knobkierrie"
   Gear.TPCape		= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
   Gear.WSCape 		= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
   Gear.RACape		= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+10 Rng.Atk.+10','Rng.Acc.+10','Weapon skill damage +10%',} }

-- JA Sets
	sets.precast = {}
	sets.precast['Seigan'] = {
		head		= "Kasuga Kabuto +1"
	}
	sets.precast['Meditate'] = {
		head		= "Wakido Kabuto +3",
		hands		= "Sakonji Kote +3",
		back		= Gear.TPCape
	}
	sets.precast['Hasso'] = {
		hands		= "Wakido Kote +3"
	}
	sets.precast['Sekkanoki'] = {
		hands		= "Kasuga Kote +1"
	}
	sets.precast['Warding Circle'] = {
		head		= "Wakido Kabuto +3"
	}
	sets.precast['Sengikori'] = {
		feet		= "Kasuga Sune-Ate +1"
	}
	sets.precast['Blade Bash'] = {
		hands		= "Sakonji Kote +3"
	}

-- Subjob JA Sets
	sets.precast.FastCast = {
		left_ear	= "Loquac. earring"
	}
		
-- WS Sets
	sets.WS = {}
	sets.WS.Normal = {
		-- ammo ** SET THIS IN Gear.WSAmmo
		head		= "Valorous Mask",
		body		= "Sakonji Domaru +3",
		hands		= "Valorous Mitts",
		legs		= "Wakido Haidate +3",
		feet		= "Valorous Greaves",
		neck		= "Sam. Nodowa +2",
		waist		= "Fotia Belt",
		left_ear	= "Moonshade Earring",
		right_ear	= "Thrud Earring",
		left_ring	= "Epaminondas's Ring", -- Epaminondas's Ring -- Regal Ring
		right_ring	= "Karieyh Ring",
		back		= Gear.WSCape
	}
		
	sets.WS.Yochi = {
		-- ammo ** SET THIS IN Gear.Arrow
		head		= "Sakonji Kabuto +3",
		hands		= "Kasuga Kote +1",
		feet		= "Wakido Sune. +2",
		neck		= "Fotia Gorget",
		back		= Gear.RACape
	}

-- TP Sets
	sets.TP = {}
	sets.TP.Normal = {
		-- ammo ** SET THIS IN Gear.TPAmmo
		head		= "Flam. Zucchetto +2",
		body		= "Ken. Samue +1", 
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		hands		= "Wakido Kote +3",
		neck		= "Sam. Nodowa +2",
		waist		= "Ioskeha belt +1",
		left_ear	= "Telos earring",
		right_ear	= "Cessance earring",
		left_ring	= "Flamma Ring",
		right_ring	= "Niqmaddu Ring",
		back		= Gear.TPCape
	}

	sets.TP.STP = {
		body		= "Kasuga Domaru +1",
		legs		= "Ryuo Hakama +1",
		feet		= "Ryuo Sune-Ate +1",
		right_ear	= "Dedition earring"
	}
	
-- Special Sets
	sets.DT = {
		-- ammo ** SET THIS IN Gear.DTAmmo
		head		= "Ken. Jinpachi +1",
		body		= "Ken. Samue +1", -- Option: Wakido Domaru +3 (DT-8%)
		hands		= "Sakonji Kote +3", -- Option: Kendatsuba Tekko +1 (MDT/MEVA)
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		neck		= "Loricate Torque +1",
		waist		= "Flume Belt +1",
		left_ear	= "Colossus's Earring",
		right_ear	= "Odnowa Earring +1",
		left_ring	= "Defending Ring",
		right_ring	= "Gelatinous Ring +1",
		back		= Gear.TPCape
	}
	sets.Twilight = { 
		head		= "Twilight helm",
		body		= "Twilight mail"
	}
	
-- Aftercast/Idle Sets
	sets.aftercast = {}
	sets.aftercast.TP = sets.TP.Engaged
	sets.aftercast.Idle = {
		-- ammo ** SET THIS IN Gear.DTAmmo
		head		= "Wakido Kabuto +3",
		body		= "Ken. Samue +1",
		hands		= "Sakonji Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		neck		= "Loricate Torque +1",
		waist		= "Flume Belt +1",
		left_ear	= "Genmei Earring",
		right_ear	= "Odnowa Earring +1",
		left_ring	= "Defending Ring",
		right_ring	= "Karieyh Ring",
		back		= Gear.TPCape
	}
end

-- Precast/Midcast/Aftercast Functions
function precast(spell,action)
	if spell.english == 'Spectral Jig' then
		send_command('cancel 71;')
	end

	Mob_ID = player.target.id
    if Mob_ID ~= Old_Mob_ID then
     ws_order = 1
     ws_new = 0
     Old_Mob_ID = Mob_ID
	end

	if spell.type=="WeaponSkill" then
		if spell.name == AutoWS and ws_order == 4 then
			cancel_spell()
			send_command('@input /ws "Tachi: Fudo" '..spell.target.raw)
			add_to_chat(123,'Step '..ws_order)
			  ws_order = 1
			  ws_new = 1
			return
		end
		if spell.name == AutoWS and ws_order == 3 then
			cancel_spell()
			send_command('@input /ws "Tachi: Shoha" '..spell.target.raw)
			add_to_chat(123,'Step '..ws_order)
			ws_order = ws_order + 1
			return
		end
		if spell.name == AutoWS and ws_order == 2 then
			cancel_spell()
			send_command('@input /ws "Tachi: Kasha" '..spell.target.raw)
			add_to_chat(123,'Step '..ws_order)
			ws_order = ws_order + 1
			return
		end
		if spell.name == AutoWS and ws_order == 1  and ws_new == 0 then
			cancel_spell()
			send_command('@input /ws "Tachi: Fudo" '..spell.target.raw)
			add_to_chat(123,'Starting 4 step light skillchain!!!')
			add_to_chat(123,'Step '..ws_order)
			ws_order = ws_order + 1
			return
		end
		if spell.name == AutoWS and ws_order == 1  and ws_new == 1 then
			ws_new = 0
			cancel_spell()
			send_command('@input /ws "'..AutoWS..'" '..spell.target.raw)
			return
		end
		sets.WeaponSkill = sets.WS.Normal
		if range_mode == true then
			sets.WeaponSkill = set_combine(sets.WeaponSkill, {ammo=Gear.Arrow})
		else
			sets.WeaponSkill = set_combine(sets.WeaponSkill, {ammo=Gear.WSAmmo})
		end
		if spell.english == 'Namas Arrow' then
			sets.WeaponSkill = set_combine(sets.WeaponSkill,sets.WS.Yochi)
		end
		if buffactive['Sekkanoki'] then
			sets.WeaponSkill = set_combine(sets.WeaponSkill, sets.precast['Sekkanoki'])
		end
		if buffactive['reive mark'] then
			sets.WeaponSkill = set_combine(sets.WeaponSkill, {neck="Ygnas's Resolve +1"})
		end
		if buffactive['Meikyo Shisui'] then
			sets.WeaponSkill = set_combine(sets.WeaponSkill, {feet="Sak. Sune-Ate +3"})
		end
		equip(sets.WeaponSkill)
	elseif string.find(spell.english,'Waltz') then
		equip(sets.precast.Waltz)
	elseif spell.type == "Ninjutsu" then
		equip(sets.precast.FastCast)
	elseif sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	else
		if range_mode == true then
			equip({ammo=Gear.Arrow})
		end
	end
end

function midcast(spell,action)
	if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
		send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
	elseif spell.english == 'Monomi: Ichi' and buffactive['Sneak'] then
		send_command('@wait 1.0; cancel 71')
	end
end

function aftercast(spell,action)
	if player.status == 'Engaged' then
		sets.TP.Engaged = sets.TP.Normal
		if max_stp == true then
			sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.TP.STP)
		end
		if range_mode == false then
			sets.TP.Engaged = set_combine(sets.TP.Engaged, {ammo=Gear.TPAmmo})
			if use_DT == true then
				sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.DT)
				sets.TP.Engaged = set_combine(sets.TP.Engaged, {ammo=Gear.DTAmmo})
			end
			equip(sets.TP.Engaged)
		else
			if use_DT == true then
				sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.DT)
			end
			equip(set_combine(sets.TP.Engaged, {ammo=Gear.Arrow}))
		end
	else
		if range_mode == false then
			equip(set_combine(sets.aftercast.Idle, {ammo=Gear.DTAmmo}))
		else
			equip(set_combine(sets.aftercast.Idle, {ammo=Gear.Arrow}))
		end
	end
end

-- Status change (spells, songs, etc.)
function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		if range_mode == false then
			equip(set_combine(sets.aftercast.Idle, {ammo=Gear.DTAmmo}))
		else
			equip(set_combine(sets.aftercast.Idle, {ammo=Gear.Arrow}))
		end
	elseif new == 'Engaged' then
		sets.TP.DD = sets.TP.Normal

		if max_stp == true then 
			sets.TP.DD = set_combine(sets.TP.DD, sets.TP.STP)
		end

		if range_mode == false then
			sets.TP.DD = set_combine(sets.TP.DD, {ammo=Gear.TPAmmo})
			if use_DT == true then
				sets.TP.DD = set_combine(sets.TP.DD,sets.DT)
				sets.TP.DD = set_combine(sets.TP.DD, {ammo=Gear.DTAmmo})
			end
		else
			if use_DT == true then
				sets.TP.DD = set_combine(sets.TP.DD,sets.DT)
			end
			sets.TP.DD = set_combine(sets.TP.DD, {ammo=Gear.Arrow})
		end

		if max_stp == true then 
			sets.TP.DD = set_combine(sets.TP.DD, sets.TP.STP)
		end

		sets.TP.Engaged = sets.TP.DD
		
		if buffactive['Weakness'] or buffactive['Doom'] and use_twilight == true then
			sets.aftercast.TP = set_combine(sets.TP.Engaged,sets.Twilight)
		else
			sets.aftercast.TP = sets.TP.Engaged
		end
 		equip(sets.aftercast.TP)
	end
end

function buff_change(status,gain_or_loss)
	--
end

-- Self commands 
function SwapGear()
	if player.status == 'Engaged' then
		sets.TP.Engaged = sets.TP.Normal
		if max_stp == true then
			sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.TP.STP)
		end
		if range_mode == false then
			sets.TP.Engaged = set_combine(sets.TP.Engaged, {ammo=Gear.TPAmmo})
			
			if use_DT == true then
				sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.DT)
				sets.TP.Engaged = set_combine(sets.TP.Engaged, {ammo=Gear.DTAmmo})
			end

			equip(sets.TP.Engaged)
		else
			if use_DT == true then
				sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.DT)
			end
			equip(set_combine(sets.TP.Engaged, {range=Gear.Bow,ammo=Gear.Arrow}))
		end
	else
		if range_mode == false then
			equip(set_combine(sets.aftercast.Idle, {ammo=Gear.DTAmmo}))
		else
			equip(set_combine(sets.aftercast.Idle, {range=Gear.Bow,ammo=Gear.Arrow}))
		end
	end
	update_status()
end

function self_command(commandArgs)
	local originalCommand = commandArgs
    if type(commandArgs) == 'string' then
        commandArgs = T(commandArgs:split(' '))
        if #commandArgs == 0 then
            return
        end
    end
	if commandArgs[1] == 'SwapGear' then
		SwapGear()
	elseif commandArgs[1] == 'tr' then
		if range_mode == false then
			range_mode = true
			add_to_chat(123,"-- [RANGED MODE ACTIVATED] --")
			send_command('gs c SwapGear')
		else
			range_mode = false
			add_to_chat(123,"-- [RANGED MODE DEACTIVATED] --")
			send_command('gs c SwapGear')
		end
	elseif commandArgs[1] == 'tstp' then
		if max_stp == false then
			max_stp = true
			add_to_chat(123,"-- [MAX STP ACTIVATED] --")
			send_command('gs c SwapGear')
		else
			max_stp = false
			add_to_chat(123,"-- [MAX STP DEACTIVATED] --")
			send_command('gs c SwapGear')
		end
	elseif commandArgs[1] == 'tdt' then
		if use_DT == false then
			use_DT = true
			add_to_chat(123,"-- [DMG TAKEN SET ACTIVATED] --")
			send_command('gs c SwapGear')
		else
			use_DT = false
			add_to_chat(123,"-- [DMG TAKEN SET DEACTIVATED] --")
			send_command('gs c SwapGear')
		end
	elseif commandArgs[1] == 'twilight' then
		if use_twilight == false then
			use_twilight = true
			add_to_chat(123,"-- [TWILIGHT ACTIVATED] --")
			send_command('gs c SwapGear')
		else
			use_twilight = false
			add_to_chat(123,"-- [TWILIGHT DEACTIVATED] --")
		end
	elseif commandArgs[1] == 'update_status' then
		update_status()
	end
end

function file_unload()     
	send_command('unbind ^F9')
	send_command('unbind ^F10')
	send_command('unbind ^F11')
	send_command('unbind ^F12')
end

-- More code for displaying text -- Not finished 
function update_status()
	local clr = {
        h='\\cs(255,192,0)', -- Yellow for active booleans and non-default modals
		w='\\cs(255,255,255)', -- White for labels and default modals
        n='\\cs(192,192,192)', -- White for labels and default modals
        s='\\cs(96,96,96)', -- Gray for inactive booleans
		Fire='\\cs(255,80,80)', -- Red For Fire Element
		Ice='\\cs(140,160,255)', -- Light Blue For Ice Element
		Wind='\\cs(110,255,110)', -- Light Green For Wind Element
		Earth='\\cs(220,214,110)', -- Brown/Yellow For Earth Element
		Lightning='\\cs(190,90,190)', -- Purple For Lightning Element
		Water='\\cs(110,110,255)', -- Blue For Water Element
		Light='\\cs(255,255,155)', -- Light Yellow For Light Element
		Dark='\\cs(90,90,90)', -- Dark Grey For Dark Element
    }

    local info = {}
    local orig = {}
	local spc = '    '
	
	local labels = {
		Weapons = "Weapons",
        OffenseMode = "Offense",
		RangedMode = "Ranged",
        DefenseMode = "Defense",
        HybridMode = "Hybrid",
        IdleMode = "Idle",
    }

    stateBox:clear()
	stateBox:append('   ')
	--max_stp = true
	--range_mode = false
	--use_twilight = false
	--use_DT = false
	if max_stp or max_stp == nil then
		stateBox:append(string.format("%sMode: %s%s", clr.w, clr.Ice, 'Normal'))
	else
		stateBox:append(string.format("%sMode: %s%s", clr.w, clr.h, 'Defensive'))
	end
	stateBox:append(spc)

    stateBox:update(info)
    stateBox:show()
end

function clear_job_states()
    if stateBox then stateBox:destroy() end
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
-- End of Display Code

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
				if player.status ~= 'Engaged' then
					send_command('gs equip sets.MoveSpeed')
				end
        		moving = true
			elseif dist < 1 and moving then
				if player.status ~= 'Engaged' then
					send_command('gs c SwapGear')
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