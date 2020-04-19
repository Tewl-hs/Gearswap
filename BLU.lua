 function get_sets()

    -- Load Macros
        send_command('input /macro book 4;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 5')
    
        sets.MoveSpeed = { legs = "Carmine Cuisses +1",}    --auto swaps when moving
    
        sets.precast = { -- Fast Cast Current: 53% Target: 79% Cap: 80%
            ammo        = "Sapience Orb", -- 2
            head        = "Carmine Mask +1", -- 9
            body        = "Jhakri Robe +2", -- Need: Pinga Tunic +1 (15%)
            hands       = "Leyline Gloves", -- 6 / Could get 2 more
            legs        = "Aya. Cosciales +2", -- 6 Need: Pinga Pants +1 (13%)
            feet        = "Carmine Greaves +1", -- 8
            neck        = "Orunmila's Torque", -- 5
            waist       = "Witful Belt", -- 5
            left_ear    = "Halasz Earring", -- Need: Enchanter's Earring (+2%)
            right_ear   = "Loquacious Earring", -- 2
            right_ring  = "Kishar Ring", -- 4 
            left_ring   = "Prolix Ring", -- 2
            back        = "Swith Cape +1" -- 4
        }
    
        sets.midcast = { -- Focus Cleaving 
            ammo        = "Ghastly Tathlum +1",
            head        = "Jhakri Coronal +2",
            body        = "Jhakri Robe +2", -- Need: Amalric Doublet +1
            hands       = "Jhakri Cuffs +2", -- Need: Amalric Gages +1
            legs        = "Jhakri Slops +2", -- Need: Amalric Slops +1
            feet        = "Jhakri Pigaches +2", -- Need: Amalric Nails +1
            neck        = "Baetyl Pendant",
            waist       = "Eschan Stone", -- Need: Orpheus Sash
            left_ear    = "Friomisi Earring",
            right_ear   = "Regal Earring",
            right_ring  = "Shiva Ring +1",
            left_ring   = "Shiva Ring +1",
            back        = "Rosmerta's Cape"
         }
         sets.midcast.MACC = { 
            neck        = "Incanter's Torque",
            waist       = "Luminary Sash",
            right_ring  = "Stikini Ring +1",
            left_ring   = "Stikini Ring +1"
         }
    
        sets.aftercast = { }
        sets.aftercast.Idle = {        
            ammo        = "Staunch Tathlum +1",
            head        = "Aya. Zucchetto +2",
            body        = "Jhakri Robe +2",
            hands       = "Aya. Manopolas +2",
            legs        = "Aya. Cosciales +2",
            feet        = "Aya. Gambieras +2",
            neck        = "Loricate Torque +1",
            waist       = "Flume Belt +1",
            left_ear    = "Genmei Earring",
            right_ear   = "Odnowa Earring +1", -- Need: Etiolation Earring
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
            back        = "Moonbeam Cape"
        }
    end
    
    function precast(spell)
        if spell.type=="Item" then
            return
        end
        if string.find(spell.type,'Magic') then
            if buffactive.Silence then
                cancel_spell()
                if player.inventory['Echo Drops'] then
                    send_command('@input /item "Echo Drops" <me>')
                else
                    add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
                end
                return
            end
            equip(sets.precast)    
        end
    end
    
    function midcast(spell)
        if spell.skill == 'Blue Magic' then 
            if spell.english == 'Magic Fruit' then

            elseif spell.english == 'Dream Flower' then
                equip(set_combine(sets.midcast,sets.midcast.MACC))
            else
                equip(sets.midcast)
            end
        end
    end
    
    function aftercast(spell)
        equip(sets.aftercast.Idle)
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            equip(sets.aftercast.Idle)
        end
    end
    
    function buff_change(buff,gain)
        if buff == 'silence' and gain then
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
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
                    send_command('gs equip sets.MoveSpeed')
                    moving = true
                elseif dist < 1 and moving then
                    send_command('gs equip sets.aftercast.Idle')
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