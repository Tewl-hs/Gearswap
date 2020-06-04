
-- MNK.lua
--
function get_sets()			

    -- Load Macros
    send_command('input /macro book 18;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 6')
    send_command('input //equipviewer pos 1663 934')
    
        sets.MoveSpeed = { feet = "Fajin Boots",} 
    
    -- Augmented Gear
        Capes = {}
    
    -- JA Sets
        sets.precast = {}
        sets.precast.JA = { }

    -- WS Sets
        sets.WS = {
            neck		= "Fotia Gorget",
            waist		= "Fotia Belt",
            hands       = "Malignance Gloves",
            legs        = "Samnuha Tights",
            feet        = "Mummu Gamash. +1"
        }
    
    -- TP Sets
        sets.TP = {
            ammo        = "Ginsen",
            head        = "Whirlpool Mask",
            body        = "Malignance Tabard",
            hands       = { name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
            legs        = "Malignance Tights",
            feet        = "Skulk. Poulaines +1",
            neck        = "Asn. Gorget +1",
            waist       = "Twilight Belt",
            left_ear    = "Sherida Earring",
            right_ear   = "Telos Earring",
            left_ring   = "Regal Ring",
            right_ring  = "Epona's Ring",
            back        = "Atheling Mantle",
        }
        
    -- Aftercast/Idle Sets
        sets.aftercast = {}
    end
    
    -- Precast/Midcast/Aftercast Functions
    function precast(spell,action)
        if spell.english == 'Spectral Jig' then
            send_command('cancel 71;')
        end
    
        if spell.type=="WeaponSkill" then
            if sets.WS[spell.english] then
                equip(sets.WS[spell.english])
            else
                equip(sets.WS)
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
            equip(sets.TP)
        else
            equip(sets.aftercast.Idle)
        end
    end
    
    -- Status change (spells, songs, etc.)
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            equip(sets.aftercast.Idle)
        elseif new == 'Engaged' then
            equip(sets.TP)
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
                    send_command('gs equip sets.MoveSpeed')
                    moving = true
                elseif dist < 1 and moving then
                    send_command('gs equip sets.TP')
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