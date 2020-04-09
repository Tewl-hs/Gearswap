
-- Functions
-- Gear Sets go here
function get_sets()			

-- Load Macros
send_command('input /macro book 15;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 1')

	sets.MoveSpeed = { feet = "Danzo Sune-Ate",}    --auto swaps when moving

-- test variables
	ws_order = 1
	ws_new = 0
	max_stp = false
	range_mode = false
	use_twilight = false

	AutoWS = 'Tachi: Enpi'

-- Augmented Gear
    Capes = {}
	Capes.TP 		= { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',} }
	Capes.WS 		= { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
	Capes.RA 		= { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+10 Rng.Atk.+10','Rng.Acc.+10','Weapon skill damage +10%',} }

-- JA Sets
	sets.precast = {}
	sets.precast['Seigan'] = {
		head		= "Kasuga Kabuto +1"
	}
	sets.precast['Meditate'] = {
		head		= "Wakido Kabuto +3",
		hands		= "Sakonji Kote +3",
		back		= Capes.TP
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
		back		= Capes.WS
	}
		
	sets.WS.Yochi = {
		head		= "Sakonji Kabuto +3",
		hands		= "Kasuga Kote +1",
		feet		= "Waki. Sune-Ate +2",
		neck		= "Fotia Gorget",
		back		= Capes.RA
	}

-- TP Sets
	sets.TP = {}
	sets.TP.Normal = {
		head		= "Flam. Zucchetto +2",
		body		= "Ken. Samue +1", 
		legs		= "Ken. Hakama +1",
		feet		= "Flam. Gambieras +2",
		hands		= "Wakido Kote +3",
		neck		= "Sam. Nodowa +2",
		waist		= "Ioskeha belt +1",
		left_ear	= "Telos earring",
		right_ear	= "Cessance earring",
		left_ring	= "Flamma Ring",
		right_ring	= "Niqmaddu Ring",
		back		= Capes.TP
	}

	sets.TP.STP = {
		body		= "Kasuga Domaru +1",
		legs		= "Ryuo Hakama +1",
		feet		= "Ryuo Sune-Ate +1",
		right_ear	= "Dedition earring"
	}
		
	sets.TP.DD = {}
	sets.TP.Hybrid = {}
	sets.TP.Ranged = {}
	sets.TP.Engaged = {}
	sets.WeaponSkill = {}
	
-- Special Sets
	sets.DT = {
		ammo		= "Staunch Tathlum +1",
		head		= "Sakonji Kabuto +3",
		body		= "Wakido Domaru +2",
		hands		= "Sakonji Kote +3",
		neck		= "Loricate Torque +1",
		waist		= "Flume Belt +1",
		left_ear	= "Colossus's Earring",
		right_ear	= "Odnowa Earring +1",
		left_ring	= "Defending Ring",
		right_ring	= "Gelatinous Ring +1",
		back		= Capes.TP
	}
	sets.Twilight = { 
		head		= "Twilight helm",
		body		= "Twilight mail"
	}
	
-- Aftercast/Idle Sets
	sets.aftercast = {}
	sets.aftercast.TP = sets.TP.Engaged
	sets.aftercast.Idle = {
		ammo		= "Staunch Tathlum +1",
		head		= "Wakido Kabuto +3",
		body		= "Ken. Samue +1",
		hands		= "Sakonji Kote +3",
		legs		= "Ken. Hakama +1",
		feet		= "Flam. Gambieras +2",
		neck		= "Loricate Torque +1",
		waist		= "Flume Belt +1",
		left_ear	= "Genmei Earring",
		right_ear	= "Odnowa Earring +1",
		left_ring	= "Defending Ring",
		right_ring	= "Karieyh Ring",
		back		= Capes.TP
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
			sets.WeaponSkill = set_combine(sets.WeaponSkill, {ammo="Yoichi's Arrow"})
		else
			sets.WeaponSkill = set_combine(sets.WeaponSkill, {ammo="Knobkierrie"})
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
		if player.equipment.range == 'Yoichinoyumi' then
			equip({ammo="Yoichi's Arrow"})
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
			equip(set_combine(sets.TP.Engaged, {ammo="Ginsen"}))
		else
			equip(set_combine(sets.TP.Engaged, {ammo="Yoichi's Arrow"}))
		end
	else
		if player.equipment.range ~= 'Yoichinoyumi' then
			equip(sets.aftercast.Idle)
		else
			equip(set_combine(sets.aftercast.Idle, {ammo="Yoichi's Arrow"}))
		end
	end
end

-- Status change (spells, songs, etc.)
function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		if range_mode == false then
			equip(set_combine(sets.aftercast.Idle, {ammo="Ginsen"}))
		else
			equip(set_combine(sets.aftercast.Idle, {ammo="Yoichi's Arrow"}))
		end
	elseif new == 'Engaged' then
		sets.TP.DD = sets.TP.Normal
		if range_mode == false then
			sets.TP.DD = set_combine(sets.TP.DD, {ammo="Ginsen"})
		else
			sets.TP.DD = set_combine(sets.TP.DD, {ammo="Yoichi's Arrow"})
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
function self_command(command)
	-- 
end

--- Detecting Movement : Found @ https://www.ffxiah.com/forum/topic/53719/new-area-function-councilors-garb/
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
					send_command('gs equip sets.aftercast.Idle')
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