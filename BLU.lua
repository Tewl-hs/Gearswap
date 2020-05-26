

function get_sets()



    -- Load Macros
        send_command('input /macro book 4;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 5')
        send_command('input //equipviewer pos 1663 934')
    
        sets.MoveSpeed = { legs = "Carmine Cuisses +1",}    --auto swaps when moving

    
        sets.precast = { -- Fast Cast Current: 79% 
            ammo        = "Sapience Orb", -- 2
            head        = "Carmine Mask +1", -- 9
            body        = "Pinga Tunic", -- 13 Option: Pinga Tunic +1 (15%)
            hands       = "Leyline Gloves", -- 6 / Option: (8%)
            legs        = "Pinga Pants", -- 11 Option: Pinga Pants +1 (13%)
            feet        = "Carmine Greaves +1", -- 8
            neck        = "Orunmila's Torque", -- 5
            waist       = "Witful Belt", -- 5
            left_ear    = "Loquacious Earring", -- 2
            right_ear   = "Etiolation Earring", -- 1 Option: Enchanter's Earring (+2%)
            right_ring  = "Kishar Ring", -- 4 
            left_ring   = "Prolix Ring", -- 2
            back        = { name="Rosmerta's Cape", augments={'HP+60','Accuracy+20 Attack+20','"Fast Cast"+10',}}, -- 10
        }
    
        sets.midcast = { -- Focus Cleaving 
            ammo        = "Pemphredo Tathlum",
            head        = "Jhakri Coronal +2",
            body        = "Amalric Doublet +1",
            hands       = "Amalric Gages +1",
            legs        = "Amalric Slops +1",
            feet        = "Amalric Nails +1",
            neck        = "Baetyl Pendant",
            waist       = "Eschan Stone", -- Want: Orpheus Sash
            left_ear    = "Friomisi Earring",
            right_ear   = "Regal Earring",
            left_ring   = "Metamor. Ring +1", --"Shiva Ring +1",
            right_ring  = "Shiva Ring +1",
            back        = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
         }

         sets.midcast['Carcharian Verve'] = set_combine(sets.midcast,{
             head       = "Amalric Coif +1"
         })
         sets.midcast['Battery Charge'] = set_combine(sets.midcast,{
            head        = "Amalric Coif +1"
        })

         sets.midcast.MACC = { 
            ammo        = "Hydrocera",
            neck        = "Incanter's Torque",
            waist       = "Luminary Sash",
            back        = "Rosmerta's Cape",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1"
         }

    
        sets.aftercast = { }
        sets.aftercast.Idle = { 
            ammo        = "Staunch Tathlum +1",
            head        = "Aya. Zucchetto +2",
            body        = "Malignance Tabard",
            hands       = "Malignance Gloves",
            legs        = "Malignance Tights",
            feet        = "Aya. Gambieras +2",
            neck        = "Loricate Torque +1",
            waist       = "Flume Belt +1",
            left_ear    = "Genmei Earring",
            right_ear   = "Etiolation Earring",
            left_ring   = "Defending Ring",
            right_ring  = "Gelatinous Ring +1",
            back        = "Moonlight Cape"
        }

        sets.aftercast.Refresh = set_combine(sets.aftercast.Idle,{
            body        = "Jhakri Robe +2",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
        })
        
        sets.aftercast.Engaged = {
            ammo        = "Ginsen",  
            neck        = "Asperity Necklace",
            body        = "Jhakri Robe +2",
            waist       = "Sailfi Belt +1",
            left_ear    = "Moonshade Earring",
            right_ear   = "Cessance Earring",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
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
                equip(set_combine(sets.midcast,{right_ear="Etiolation Earring",back="Moonlight Cape"})) -- equip HP+ gear for full heal
            elseif spell.english == 'Dream Flower' then
                equip(set_combine(sets.midcast,sets.midcast.MACC))
            elseif sets.midcast[spell.name] then                
                equip(sets.midcast[spell.name])
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

    function goIdle()
        equip(sets.aftercast.Idle)
    end

    function self_command(commandArgs)
        local originalCommand = commandArgs
        if type(commandArgs) == 'string' then
            commandArgs = T(commandArgs:split(' '))
            if #commandArgs == 0 then
                return
            end
        end
        if commandArgs[1] == 'goIdle' then
            goIdle()
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
                    send_command('gs c goIdle')
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