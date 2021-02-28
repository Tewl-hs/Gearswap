function get_sets()	
    -- Personal settings: Load macros and set equipviewer position
    send_command('input /macro book 10;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 4')
    send_command('input //equipviewer pos 1663 934')

    -- Variables for auto-skill chain. Only edit AutoWS 
	AWSEnabled = false
	AutoWS = 'Blade: Ei'
	WeaponSkills = T{'Blade: Hi', 'Blade: Hi'}
	ws_order = 1
	last_target = nil

    buffs = {}

    sets.MoveSpeed = { feet = "Danzo Sune-Ate",} 

    -- Augmented Gear
    Capes = {}
    Capes.TP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}

    sets.Enmity = {
        ammo        = "Sapience Orb", --2
        body        = "Emet Harness +1", --10
        hands       = "Kurys Gloves", --9
        neck        = "Moonlight Necklace", --15
        right_ring  = "Cryptic Earring", --4
        left_ring   = "Trux Earring", --5
        right_ring  = "Eihwaz Ring", --5
    }
    sets.precast = {}
    sets.precast.FC = {
        ammo        = "Sapience Orb", --2
        hands       = "Leyline Gloves", --7
        legs        = "Rawhide Trousers", --5
        neck        = "Orunmila's Torque", --5
        left_ear    = "Loquacious Earring", --2
        right_ear   = "Enchntr. Earring +1", --2
        left_ring   = "Kishar Ring", --4
        right_ring  = "Prolix Ring",
        waist       = "Sailfi Belt +1",
    }
    sets.precast.JA = { }
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.WS = {
        ammo        = "C. Palug Stone",
        head        = "Ken. Jinpachi +1",
        body        = "Ken. Samue +1",
        hands       = "Ken. Tekko +1",
        legs        = "Samnuha Tights",
        feet        = "Ken. Sune-Ate +1",
        left_ear    = "Mache Earring +1",
        right_ear   = "Lugra Earring +1",
        left_ring   = "Gere Ring",
        right_ring  = "Ilabrat Ring",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
    }
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        
	})
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        ammo        = "Ginsen",
        head        = "Ken. Jinpachi +1",
		body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs		= "Ken. Hakama +1",
		feet		= "Hiza. Sune-Ate +2",
        neck        = "Moonbeam Nodowa",
        left_ear    = "Cessance Earring",
        right_ear   = "Eabani Earring", --5
        left_ring   = "Gere Ring",
        right_ring  = "Epona's Ring",
        waist       = "Sailfi Belt +1",
        back        = Capes.TP
    }
    sets.aftercast.Idle = {  -- 65/61
        ammo        = "Staunch Tathlum +1", -- 3/3
        head        = "Malignance Chapeau",  -- 6/6
        body        = "Malignance Tabard",  -- 9/9
        hands       = "Malignance Gloves",  -- 5/5
        legs        = "Malignance Tights",  -- 7/7
        feet        = "Malignance Boots",  -- 4/4
        neck		= "Loricate Torque +1", -- 6/6
        waist		= "Flume Belt +1", -- 4/0
        left_ear	= "Genmei Earring", -- 2/0
        right_ear	= "Odnowa Earring +1", -- 3/5
        left_ring	= "Defending Ring", -- 10/10
        right_ring	= "Karieyh Ring",
        back		= "Moonlight Cape" -- 6/6
    }
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
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        else
            equip(sets.precast.WS)
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
        equip(sets.aftercast.Engaged)
    else
        equip(sets.aftercast.Idle)
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.aftercast.Idle)
    elseif new == 'Engaged' then
        equip(sets.aftercast.Engaged)
    end
end

function buff_change(buff,gain)
    
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
    end
end

function SwapGear()
    if player.status == 'Engaged' then
        equip(sets.aftercast.Engaged)
    else
        equip(sets.aftercast.Idle)
    end
end

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