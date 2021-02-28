--[[
	Author: Tewl / Bismark
	Files: BLU.lua 

	I only use BLU for cleaving so this is very basic. 
--]]

function get_sets()
        send_command('input /macro book 4;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 6')
        send_command('input //equipviewer pos 1663 934')

        BlueNukeSet = T{'Delta Thrust', 'Barbed Crescent', 'Memento Mori', 'Reactor Cool', 'Spectral Floe', 'Subduction', 'Erratic Flutter', 'Barrier Tusk', 'Entomb', 'Anvil Lightning', 'Magic Fruit',
        'Magic Hammer', 'Dream Flower', 'Tenebral Crush', 'Eyes on Me', 'Cursed Sphere', 'Battery Charge', 'Cocoon'}

        BlueSets = {
            ['BLM'] = BlueNukeSet,
            ['RDM'] = BlueNukeSet
        }

        res = require('resources')

        current_sj = player.sub_job or nil

        sets.precast = { -- Fast Cast Current: 80% 
            ammo        = "Sapience Orb", -- 2
            head        = "Carmine Mask +1", -- 9
            body        = "Pinga Tunic", -- 13 Option: Pinga Tunic +1 (15%)
            hands       = "Leyline Gloves", -- 6 / Option: (8%)
            legs        = "Pinga Pants", -- 11 Option: Pinga Pants +1 (13%)
            feet        = "Carmine Greaves +1", -- 8
            neck        = "Orunmila's Torque", -- 5
            waist       = "Witful Belt", -- 5
            left_ear    = "Loquacious Earring", -- 2
            right_ear   = "Enchanter's Earring", -- 2
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
            waist       = "Eschan Stone",
            left_ear    = "Friomisi Earring",
            right_ear   = "Regal Earring",
            left_ring   = "Metamor. Ring +1", -- "Shiva Ring +1",
            right_ring  = "Shiva Ring +1",
            back        = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
         }

         sets.midcast['Carcharian Verve'] = set_combine(sets.midcast,{
            head        = "Amalric Coif +1"
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
            ammo        = "Staunch Tathlum +1", -- 3/3
            head        = "Malignance Chapeau",  -- 6/6
            body        = "Malignance Tabard",  -- 9/9
            hands       = "Malignance Gloves",  -- 5/5
            legs        = "Carmine Cuisses +1",  --
            feet        = "Malignance Boots",  -- 4/4
            neck        = "Loricate Torque +1", -- 6/6
            waist       = "Flume Belt +1",      -- 4/0
            left_ear    = "Genmei Earring",     -- 2/0
            right_ear   = "Etiolation Earring", -- 0/3
            left_ring   = "Defending Ring",     -- 10/10
            right_ring  = "Gelatinous Ring +1", -- 7/-1
            back        = "Moonlight Cape"      -- 6/6
        }

        sets.aftercast.Refresh = set_combine(sets.aftercast.Idle,{
            body        = "Jhakri Robe +2",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
        })

        check_spells()
    end
    -- 
    function sub_job_change(new, old)
        current_sj = new
        coroutine.schedule(function() check_spells() end,2)
    end

    function check_spells()
        if windower.ffxi.get_player().main_job_id ~= 16 then return nil end
        current_sj = player.sub_job
        if BlueSets[current_sj] then
            if S(BlueSets[current_sj]):map(string.lower) == S(get_current_spellset()) then
                windower.add_to_chat(8,'[Blue Spells Equipped]')
            else
                windower.add_to_chat(8,'[Equipping Blue Spells]')
                clear_spells()
            end
        end
    end

    function clear_spells()
        windower.ffxi.reset_blue_magic_spells()
        set_spells()
    end

    function set_spells()
        if BlueSets[current_sj] then
            local sj = current_sj
            local delay = 0.65
            local i = 0
            for k,v in pairs(BlueSets[sj]) do
                if v ~= nil then
                    local spellID = find_spell_id_by_name(v)
                    if spellID ~= nil then
                        i = i + 1
                        x = delay * i
                        set_spell:schedule(x, spellID, i, sj)
                    end
                end
            end
        end
    end

    function set_spell(id, slot, sj)
        if sj ~= current_sj then return nil end
        windower.ffxi.set_blue_magic_spell(id, tonumber(slot))
        if tonumber(slot) == table.getn(BlueSets[current_sj]) then
            windower.add_to_chat(8, '[Finished equipping spells.]')
            windower.send_command('@timers c "Blue Magic Cooldown" 60 up')
        end
    end

    function find_spell_id_by_name(spellname)
        spells = res.spells:type('BlueMagic')

        for spell in spells:it() do
            if spell['english']:lower() == spellname:lower() then
                return spell['id']
            end
        end
        return nil
    end

    function get_current_spellset()
        spells = res.spells:type('BlueMagic')
        return T(windower.ffxi.get_mjob_data().spells)
        -- Returns all values but 512
        :filter(function(id) return id ~= 512 end)
        -- Transforms them from IDs to lowercase English names
        :map(function(id) return spells[id].english:lower() end)
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
            local spellType = job_get_spell_map(spell)
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
        equip(sets.aftercast.Refresh)
    end
    
    function status_change(new,old)
        if new == 'Idle' then
            equip(sets.aftercast.Refresh)
        elseif new == 'Resting' then
            equip(sets.aftercast.Refresh)
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