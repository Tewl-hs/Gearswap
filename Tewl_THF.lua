
-- THF.lua
function get_sets()		
    send_command('input /macro book 18;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 8')
    send_command('input //equipviewer pos 1663 934')

    LockTH = false
    
    sets.MoveSpeed = { feet = "Fajin Boots",} 

    sets.TH = {
        ammo        = "Per. Lucky Egg",
        head        = "Wh. Rarab Cap +1",
        hands       = { name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
        feet        = "Skulk. Poulaines +1",
        waist       = "Chaac Belt",
    }

    sets.precast = {}
    sets.precast.JA = { }

    sets.precast.WS = {
        ammo        = "Aurgelmir Orb +1",
        head        = "Adhemar Bonnet +1",
        body        = "Adhemar Jacket +1",
        hands       = "Meg. Gloves +2",
        legs        = "Samnuha Tights",
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck		= "Fotia Gorget",
        waist		= "Fotia Belt",
        left_ear    = "Ishvara Earring",
        right_ear   = "Moonshade Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Epaminondas's Ring",
        back        = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    }
    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
        neck        = "Asn. Gorget +1",
        left_ear    = "Sherida Earring",
        waist       = "Kentarch Belt +1",
    })
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS['Evisceration'], {
        ammo        = "Yetshila +1",
        head        = "Plun. Bonnet +3",
        body        = "Pillager's Vest +3",
        hands       = "Mummu Wrists +2",
        legs        = "Zoar Subligar +1",
        feet        = "Plun. Poulaines +3",
        left_ear    = "Sherida Earring",
        right_ear   = "Mache Earring +1",
        left_ring   = "Begrudging Ring",
        right_ring  = "Mummu Ring",
        --back        = gear.THF_WS2_Cape,
    })

    sets.aftercast = { }
    sets.aftercast.Engaged = {
        ammo        = "Aurgelmir Orb +1",
        head        = "Malignance Chapeau",
        body        = "Malignance Tabard",
        --hands       = "Malignance Gloves",
        hands       = { name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
        legs        = "Malignance Tights",
        --feet        = "Malignance Boots",
        feet        = "Skulk. Poulaines +1",
        neck        = "Asn. Gorget +1",
        waist       = "Sailfi Belt +1",
        left_ear    = "Sherida Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Regal Ring",
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
    if spell.english == 'Spectral Jig' then
        send_command('cancel 71;')
    end
    
    if spell.type=="WeaponSkill" then
        if sets.precast.WS[spell.english] then            
            if LockTH ~= false then
                equip(set_combine(sets.precast.WS[spell.english],sets.TH))
            else
                equip(sets.precast.WS[spell.english])
            end
        else            
            if LockTH == true then
                equip(set_combine(sets.precast.WS,sets.TH))
            else
                equip(sets.precast.WS)
            end
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
    equip_check()
end
    
function status_change(new,old)
    equip_check()
end
    
function buff_change(status,gain_or_loss)
    --
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