 --[[
	Author: Tewl / Bismark
	Files: SAM.lua 

	Binds
	ALT+F9   : Toggle Mainhand weapon ('Empyrean', 'Relic', 'Aeonic', 'Polearm')

	CTRL+F9  : Toggle Engaged Mode (Normal, Accuracy, PDT, MDT, Hybrid)
	CTRL+F10 : Toggle Idle Mode (Normal, PDT, MDT, Hybrid)
	CTRL+F11 : Toggle Ranged Mode (Disabled by default)
	CTRL+F12 : Toggle Twilight (Disabled by default)

	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.

	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
--]]
function get_sets()
	send_command('bind !f9 gs c cycle weapon')
	send_command('bind ^f9 gs c cycle engaged')
	send_command('bind ^f10 gs c cycle idle')
	send_command('bind ^f11 gs c ranged') 
	send_command('bind ^f12 gs c twilight')

	--  Load Macros and set equipviewer position. Remove or alter these 2 lines for your own preferences
	send_command('input /macro book 15;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 1') -- Sets Macro set and lockstyle when changing to SAM
	send_command('input //equipviewer pos 1663 934') -- Repositions my equipviewer when I change to SAM
    
 	sets.MoveSpeed = { feet = "Danzo Sune-Ate",} --auto swaps when moving

    include('Modes.lua') -- Using Motes meta tables for modes
    EngagedMode = M{['description'] = 'Engaged Mode', 'Normal', 'PDT', 'MDT', 'Hybrid'}
    IdleMode = M{['description'] = 'Idle Mode', 'Normal', 'PDT', 'MDT'}
	EquipWeapon = M{['description'] = 'Equipped Weapon', 'Empyrean', 'Relic', 'Aeonic', 'Polearm'}

    Weapons = { } -- Thinking about doing Koga
    Weapons.Empyrean	= "Masamune"
    Weapons.Relic 		= "Amanomurakumo"
    Weapons.Aeonic		= "Dojikiri Yasutsuna"
	Weapons.Polearm		= "Shining One"

    range_mode = false
    use_twilight = false
    
    -- Initial setup variables
    AutoWS = 'Tachi: Enpi'
    WeaponSkills = T{'Tachi: Fudo','Tachi: Kasha','Tachi: Shoha','Tachi: Fudo'}
    ws_order = 1
-- Gearsets

    Capes = {} 
    Capes.TPCape    = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
    Capes.WSCape    = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
    Capes.RACape    = { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',} }
    Capes.RWSCape   = { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+10 Rng.Atk.+10','Rng.Acc.+10','Weapon skill damage +10%',} }

    sets.JA = {
        ['Seigan'] = {
            head		= "Kasuga Kabuto +1"
        },
        ['Meditate'] = {
            head		= "Wakido Kabuto +3",
            hands		= "Sakonji Kote +3",
            back		= Capes.TPCape
        },
        ['Hasso'] = {
            hands		= "Wakido Kote +3"
        },
        ['Sekkanoki'] = {
            hands		= "Kasuga Kote +1"
        },
        ['Warding Circle'] = {
            head		= "Wakido Kabuto +3"
        },
        ['Sengikori'] = {
            feet		= "Kasuga Sune-Ate +1"
        },
        ['Blade Bash'] = {
            hands		= "Sakonji Kote +3"
        },
        ['Meikyo Shisui'] = {
            feet		= "Sak. Sune-Ate +3"
        }
    }
    sets.FC = {
        left_ear	= "Loquac. earring"
    }
    sets.RA = {
        main        = Weapons[EquipWeapon.value],
        sub         = "Utu Grip",
        range 		= "Yoichinoyumi",
        ammo		= "Yoichi's Arrow",
        head        = "Sakonji Kabuto +3",
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
        back        = Capes.RACape
    }
            
    sets.WS = {}
    sets.WS.Normal = {
        main        = Weapons[EquipWeapon.value],
        sub         = "Utu Grip",
        ammo        = "Knobkierrie",
		head		= { name="Valorous Mask", augments={'Attack+26','Weapon skill damage +3%','STR+15','Accuracy+13',}},
		body		= "Sakonji Domaru +3",
		hands		= { name="Valorous Mitts", augments={'Accuracy+23','Weapon skill damage +3%','STR+15','Attack+7',}},
		legs		= "Wakido Haidate +3",
		feet		= { name="Valorous Greaves", augments={'"Dbl.Atk."+1','STR+5','Weapon skill damage +8%','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		neck		= "Sam. Nodowa +2",
		waist		= "Fotia Belt",
		left_ear	= "Moonshade Earring",
		right_ear	= "Thrud Earring",
		left_ring	= "Epaminondas's Ring", -- Regal Ring
		right_ring	= "Karieyh Ring",
		back		= Capes.WSCape
    }
    sets.WS['Tachi: Fudo'] = set_combine(sets.WS.Normal, { 
		waist		= "Sailfi Belt +1",
	})
    sets.WS['Tachi: Kaiten'] = set_combine(sets.WS.Fudo, { })    
    sets.WS['Tachi: Shoha'] = set_combine(sets.WS.Normal, { 
		head		= { name="Stinger Helm +1", augments={'Path: A',}},
		waist		= "Sailfi Belt +1",
	})
    sets.WS['Tachi: Rana'] = set_combine(sets.WS.Shoha, { })
    sets.WS['Tachi: Jinpu'] = set_combine(sets.WS.Normal, { 
		body		= "Sacro Breastplate",
		hands		= "Founder's Gauntlets",
		feet		= "Founder's Greaves",
		right_ear	= "Friomisi Earring",
		left_ring	= "Regal Ring",
		right_ring	= "Niqmaddu Ring",
		waist		= "Eschan Stone",
	})
    sets.WS['Tachi: Ageha'] = set_combine(sets.WS.Normal, {
		ammo		= "Pemphredo Tathlum",
		head		= "Flam. Zucchetto +2",
		body		= "Flamma Korazin +2",
		hands		= "Flam. Manopolas +2",
		legs		= "Flamma Dirs +2",
		feet		= "Flam. Gambieras +2",
		waist		= "Eschan Stone",
	})        
    sets.WS['Namas Arrow'] = set_combine(sets.WS.Normal, {
		head		= "Sakonji Kabuto +3",
        body		= "Kendatsuba Samue",
		hands		= "Ryuo Tekko +1",
        legs		= "Kendatsuba Hakama",
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
        main        = Weapons[EquipWeapon.value],
        sub         = "Utu Grip",
        ammo        = "Ginsen",
        head		= "Flam. Zucchetto +2",
        body		= "Kasuga Domaru +1",
        legs		= "Ryuo Hakama +1",
        feet		= "Ryuo Sune-Ate +1",
		hands		= "Wakido Kote +3",
		neck		= "Sam. Nodowa +2",
		waist		= "Ioskeha belt +1",
		left_ear	= "Telos earring",
        right_ear	= "Dedition earring",
		left_ring	= "Flamma Ring",
		right_ring	= "Niqmaddu Ring",
		back		= Capes.TPCape
     }    
    sets.Engaged.Accuracy = set_combine(sets.Engaged.Normal, {
		body		= "Ken. Samue +1", 
		legs		= "Ken. Hakama +1",
		feet		= "Ken. Sune-Ate +1",
		right_ear	= "Cessance earring",
    })
    sets.Engaged.PDT = set_combine(sets.Engaged.Normal, { })
    sets.Engaged.MDT = set_combine(sets.Engaged.Normal, { })
    sets.Engaged.Hybrid = set_combine(sets.Engaged.Normal, { })
    
    sets.Idle = { }
    sets.Idle.Normal = {
        main        = Weapons[EquipWeapon.value],
        sub         = "Utu Grip",
        ammo        = "Staunch Tathlum +1",
		head		= "Wakido Kabuto +3",
		body		= "Tartarus Platemail", --"Ken. Samue +1",
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
        range 		= "Yoichinoyumi",
        ammo		= "Yoichi's Arrow"
    }
-- 

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
end

function file_unload()  
	send_command('unbind !F9')
	send_command('unbind ^F9')
	send_command('unbind ^F10')
	send_command('unbind ^F11')
	send_command('unbind ^F12')
end

function precast(spell,action)
	if spell.english == 'Spectral Jig' then
		send_command('cancel 71;')
	end

	Mob_ID = player.target.id
	if Mob_ID ~= Old_Mob_ID then
		ws_order = 1
		Old_Mob_ID = Mob_ID
	end

	if spell.type == 'WeaponSkill' then
		if spell.name == AutoWS then
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
		if buffactive['Reive Mark'] then
			ws = set_combine(ws, {neck="Ygnas's Resolve +1"})
		end
		if buffactive['Meikyo Shisui'] then
			ws = set_combine(ws, sets.JA['Meikyo Shisui'])
        end
        -- Write: Insert Lugra Earring +1 check
        equip(ws)
    elseif spell.action_type == 'Ranged Attack' and range_mode == true then
        equip(sets.RA)
	elseif spell.action_type == 'Magic' then
		equip(sets.FC)
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
	equip_check()
end

function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
        equip_check()
    end
end

function buff_change(status,gain)
	
end

function equip_check()
    local eq = {}
	if player.status == 'Engaged' then	
		eq = set_combine(sets.Engaged.Normal, {main=Weapons[EquipWeapon.value]})
        if sets.Engaged[EngagedMode.value] then
            eq = set_combine(sets.Engaged[EngagedMode.value], {main=Weapons[EquipWeapon.value]})
        end
		if range_mode == true then
			eq = set_combine(eq, sets.Ranged)
		end
		if (buffactive['Weakness'] or buffactive['Doom']) and use_twilight == true then
			eq = set_combine(eq,sets.Twilight)
		end
	else
		eq = set_combine(sets.Idle.Normal, {main=Weapons[EquipWeapon.value]})
        if sets.Idle[IdleMode.value] then
            eq = set_combine(sets.Idle[IdleMode.value], {main=Weapons[EquipWeapon.value]})
        end
		if range_mode == true then
			eq = set_combine(eq, sets.Ranged)
		end
		if (buffactive['Weakness'] or buffactive['Doom']) and use_twilight == true then
			eq = set_combine(eq,sets.Twilight)
		end
    end
    equip(eq)
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
	if commandArgs[1] == 'equip_check' then
		equip_check()
	elseif commandArgs[1] == 'ranged' then
		if range_mode == false then
			range_mode = true
            equip_check()
		else
			range_mode = false
            equip_check()
		end
    elseif commandArgs[1] == 'cycle' then
        if commandArgs[2] and commandArgs[2] == 'engaged' then
            EngagedMode:cycle()
        elseif commandArgs[2] and commandArgs[2] == 'weapon' then
            EquipWeapon:cycle()
        elseif commandArgs[2] and commandArgs[2] == 'idle' then
            IdleMode:cycle()
        end
        equip_check()
	elseif commandArgs[1] == 'twilight' then
		if use_twilight == false then
			use_twilight = true
		else
			use_twilight = false
        end
        equip_check()
	elseif commandArgs[1] == 'update_status' then
		update_status()
	end
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

	local spc = '    '

    stateBox:clear()
	stateBox:append('   ')
    local status_text = ''
    
    if EquipWeapon.value == 'Empyrean' then
        status_text = string.format("%s%s%s", clr.Fire, Weapons[EquipWeapon.value], spc)
    elseif EquipWeapon.value == 'Relic' then
        status_text = string.format("%s%s%s", clr.h, Weapons[EquipWeapon.value], spc)
    elseif EquipWeapon.value == 'Aeonic' then
        status_text = string.format("%s%s%s", clr.Wind, Weapons[EquipWeapon.value], spc)
    else
        status_text = string.format("%s%s%s", clr.w, Weapons[EquipWeapon.value], spc)
    end

    status_text = string.format("%s%s %s%s%s%s", status_text, clr.w, 'Engaged: ', clr.Ice, EngagedMode.value, spc)
    
    status_text = string.format("%s%s %s%s%s%s", status_text, clr.w, 'Idle: ', clr.Ice, IdleMode.value, spc)

	--stateBox:append(spc)
	if range_mode == true then
		status_text = string.format("%s%s %s%s", status_text, clr.h, 'Ranged', spc)
	else
		status_text = string.format("%s%s %s%s", status_text, clr.s, 'Ranged', spc)
	end
	if use_twilight == true then
		status_text = string.format("%s%s %s%s", status_text, clr.h, 'Twilight', spc)
	else
		status_text = string.format("%s%s %s%s", status_text, clr.s, 'Twilight', spc)
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