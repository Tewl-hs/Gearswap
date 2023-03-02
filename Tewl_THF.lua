
-- THF.lua
function get_sets()		
    send_command('input /macro book 18;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 8')
    send_command('input //equipviewer pos 1663 934')

    LockTH = false
    
    sets.MoveSpeed = { feet = "Pill. Poulaines +3",} 

    sets.TH = {
        ammo        = "Per. Lucky Egg",
        head        = "Wh. Rarab Cap +1",
        hands       = { name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
        feet        = "Skulk. Poulaines +1",
        waist       = "Chaac Belt",
    }

    sets.precast = {}
    sets.precast.JA = {
        ["Flee"] = { feet = "Pill. Poulaines +3",} 
     }

    sets.precast.WS = {
        ammo        = "Seeth. Bomblet +1",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = "Gleti's Cuirass",
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = "Gleti's Breeches",
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck		= "Fotia Gorget",
        waist       = "Kentarch Belt +1",
        left_ear    = "Odr Eerring",
        right_ear   = "Moonshade Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Ilabrat Ring",
        back        = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    }
    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
        hands       = "Nyame Gauntlets",
        feet        = "Nyame Sollerets",
        neck		= "Asn. Gorget +1",
        left_ear    = "Sherida Earring",
    })
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS['Evisceration'], {
        ammo        = "Yetshila +1",
    })

    sets.aftercast = { }
    sets.aftercast.Engaged = {
        ammo        = "Aurgelmir Orb +1",
        head        = "Malignance Chapeau",
        body        = "Malignance Tabard",
        --hands       = "Gleti's Gauntlets",
        hands       = { name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
        legs        = "Gleti's Breeches",
        --feet        = "Plun. Poulaines +3",
        feet        = "Skulk. Poulaines +1",
        neck        = "Asn. Gorget +1",
        waist       = "Windbuffet Belt +1",
        left_ear    = "Sherida Earring",
        right_ear   = "Dedition Earring",
        left_ring   = "Hetairoi Ring",
        right_ring  = "Gere Ring",
        back        = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    }
    sets.aftercast.Idle = {
        ammo        = "Staunch Tathlum +1",
        head        = "Malignance Chapeau",
        body        = "Malignance Tabard",
        hands       = "Malignance Gloves",
        legs        = "Malignance Tights",
        feet        = "Malignance Boots",
        neck        = "Asn. Gorget +1",
        waist       = "Sailfi Belt +1",
        left_ear    = "Sherida Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Gere Ring",
        back        = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    }
end
    
function precast(spell,action)
    if spell.name == 'Spectral Jig' then
        send_command('cancel 71;')
    end
    
    if spell.type=="WeaponSkill" then
        if sets.precast.WS[spell.name] then            
            if LockTH ~= false then
                equip(set_combine(sets.precast.WS[spell.name],sets.TH))
            else
                equip(sets.precast.WS[spell.name])
            end
        else            
            if LockTH == true then
                equip(set_combine(sets.precast.WS,sets.TH))
            else
                equip(sets.precast.WS)
            end
        end
    elseif spell.action_type == 'Ability' then
		if buffactive.amnesia or buffactive.impairment then
            add_to_chat(123,'Unable to perform action: [Amnesia, Impairment]')
            cancel_spell()
            return
        end
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..disp_time(abil_recasts[spell.recast_id]))
			return
		end
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
    end
end
    
function midcast(spell,action)
    if spell.name == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
        send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
    elseif spell.name == 'Monomi: Ichi' and buffactive['Sneak'] then
        send_command('@wait 1.0; cancel 71')
    end
end
    
function aftercast(spell,action)
    equip_check()
end
    
function status_change(new,old)
    equip_check()
end
    
function buff_change(status,gain_or_loss)
    if buff == 'stun' and gain then
        equip_check()
    end
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
    end
end

function equip_check()
    if player.status == 'Engaged' then
        if LockTH ~= false then
            equip(set_combine(sets.aftercast.Engaged,sets.TH))
        else
            equip(sets.aftercast.Engaged)
        end
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
                send_command('gs c equip_check')
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

function disp_time(time)
	local hours = math.floor(math.mod(time, 86400)/3600)
	local minutes = math.floor(math.mod(time,3600)/60)
	local seconds = math.floor(math.mod(time,60))
	if hours > 0 then
		return string.format("%02d:%02d:%02d",hours,minutes,seconds)
	else
		return string.format("%02d:%02d",minutes,seconds)
	end
end