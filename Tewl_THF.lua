
-- THF.lua
function get_sets()		
    items = require('resources').items
    include('FFXI-Mappings.lua')
    include('FFXI-Utility.lua')

    set_macros(18, 1)
    send_command('wait 1;input /lockstyleset 8')
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
        left_ear    = "Odr Earring",
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
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
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
    
function precast(spell)
    if spell.name == 'Spectral Jig' then
        send_command('cancel 71;')
    end

    if spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123, '['..spell.name..'] Not enough TP.')
            cancel_spell()
            return
        end
        local ws = sets.precast.WS[spell.name] or sets.precast.WS
        if LockTH then
            equip(ws, sets.TH)
        else
            equip(ws)
        end
    elseif spell.action_type == 'Ability' then
        if not can_do('Ability') then
            cancel_spell()
            return
        end
        local recasts = windower.ffxi.get_ability_recasts()
        local remaining = recasts and recasts[spell.recast_id] or 0
        if remaining > 0 then
            cancel_spell()
            add_to_chat(121, '['..spell.name..'] '..disp_time(remaining))
            return
        end
        local ability_set = sets.precast.JA[spell.name]
        if ability_set then equip(ability_set) end
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
    
function status_change(new)
    if new == 'Engaged' or new == 'Idle' or new == 'Resting' then
        equip_check(new)
    end
end

function buff_change(buff, gain)
    if gain and buff:lower() == 'stun' then equip_check() end
end

function self_command(cmd)
    local command, mode = cmd:lower():match('^%s*(%S+)%s*(%S*)')
    if command == 'toggle' and mode == 'th' then
        LockTH = toggle_mode(LockTH, 'Treasure Hunter lock enabled.', 'Treasure Hunter lock disabled.')
        equip_check()
    elseif command == 'equip_check' then
        equip_check()
    end
end

function equip_check(status)
    if (status or player.status) == 'Engaged' then
        if LockTH ~= false then
            equip(set_combine(sets.aftercast.Engaged,sets.TH))
        else
            equip(sets.aftercast.Engaged)
        end
    else
        equip(sets.aftercast.Idle)
    end
end
    
local movement_frames = 0
local moving = false
local last_position

windower.raw_register_event('prerender', function()
    movement_frames = movement_frames + 1
    if movement_frames <= 15 then return end
    movement_frames = 0

    local position = player and player.index and windower.ffxi.get_mob_by_index(player.index)
    if not position or not position.x or not position.y or not position.z then
        last_position = nil
        moving = false
        return
    end
    if last_position then
        local dx = position.x - last_position.x
        local dy = position.y - last_position.y
        local dz = position.z - last_position.z
        local distance_squared = dx * dx + dy * dy + dz * dz
        if distance_squared > 1 and not moving then
            if player.status ~= 'Engaged' then send_command('gs equip sets.MoveSpeed') end
            moving = true
        elseif distance_squared < 1 and moving then
            send_command('gs c equip_check')
            moving = false
        end
    end
    last_position = {x = position.x, y = position.y, z = position.z}
end)
