--[[
--  CTRL+F9     Cycle burst mode on and off
--  CTRL+F10    Cycle Idle sets
--  CTRL+F11    Cycle Engaged sets
--]]
    function get_sets()

        -- Personal settings. You can remove these two lines.
        send_command('input /macro book 20;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 2')
        send_command('input //equipviewer pos 1663 912')

        send_command('bind ^f9 gs c cycle burst')
        send_command('bind ^f10 gs c cycle idle')
        send_command('bind ^f11 gs c cycle engaged')

        -- Movement speed gear for auto equip when moving
        sets.MoveSpeed = { feet = "Geo. Sandals +3",}
        
        IdleMode = {'Normal', 'DT'} -- Define idle sets
        i = 1
        EngagedMode = {'Normal','DT'}
        e = 1
        BurstMode = false
        
        -- Gear sets
        sets.luopan = { 
            main        = "Idris",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            ammo        = empty,
            head        = "Azimuth Hood +2",
            neck        = "Bagua Charm +2",
            hands       = "Geo. Mitaines +3",
            right_ring  = "Stikini Ring +1",
            back        = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
            waist       = "Isa Belt",
            feet        = "Bagua Sandals +3"
        }

        sets.precast = {}
        sets.precast.FC = { -- FC 80/80 QC: 7/10
            head        = "Amalric Coif +1", -- 11
            neck        = "Orunmila's Torque", -- 5
            left_ear    = "Malignance Earring", -- 4
            right_ear   = "Loquac. Earring", -- 2
            body        = "Merlinic Jubbah", -- 11
            left_ring   = "Kishar Ring", -- 4
            right_ring  = "Lebeche Ring", -- 0|2
            back        = { name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, -- 10
            waist       = "Witful Belt", -- 3|3
            hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}},
            legs        = "Geomancy Pants +3", -- 15
            feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}},    
        }
        sets.precast.JA = {}
        sets.precast.JA['Primeval Zeal'] = {
            head        = "Bagua Galero +3"
        }
        sets.precast.JA['Full Circle'] = {
            head        = "Azimuth Hood +2"
        }
        sets.precast.JA['Bolster'] = {
            body        = "Bagua Tunic +3"
        }
        sets.precast.JA['Life Cycle'] = {
            body        = "Geomancy Tunic +2",
            back        = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
        }
        sets.precast.JA['Curative Recantation'] = {
            hands       = "Bagua Mitaines +3"
        }
        sets.precast.JA['Mending Halation'] = {
            legs        = "Bagua Pants +3"
        }
        sets.precast.JA['Radial Arcana'] = {
            feet        = "Bagua Sandals +3"
        }
        sets.precast.WS = {
            head		= "Nyame Helm",
            body		= "Nyame Mail",
            hands		= "Nyame Gauntlets",
            legs		= "Nyame Flanchard",
            feet		= "Nyame Sollerets",
            waist       = "Grunfeld Rope",
            left_ear    = "Moonshade Earring",
            right_ear   = "Ishvara Earring",
            left_ring	= "Epaminondas's Ring",
            right_ring	= "Karieyh Ring +1",
        }
        
        sets.midcast = {}
        sets.midcast['Geomancy'] = { 
            main        = "Idris",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 5/18
            head        = "Azimuth Hood +2", -- 15
            neck        = "Bagua Charm +2",
            body        = "Bagua Tunic +3", -- 16
            hands       = "Geo. Mitaines +3", -- 19
            legs        = "Vanya Slops",   
            feet        = "Medium's Sabots",
            left_ring   = "Stikini Ring +1", -- 8/8
            right_ring  = "Stikini Ring +1", -- 8/8
            back        = { name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
            waist       = "Austerity Belt +1",
        }
        sets.midcast['Geomancy'].Indi = {
            main        = "Gada",
            neck        = "Incanter's Torque",
            legs        = "Bagua Pants +3",   
            feet        = "Azimuth Gaiters +2",
        }

        sets.midcast['Elemental Magic'] = { 
            main        = "Daybreak",
            sub         = "Ammurapi Shield",
            ammo        = "Pemphredo Tathlum",
            head        = "Jhakri Coronal +2",
            neck        = "Baetyl Pendant",
            left_ear    = "Malignance Earring",
            right_ear   = "Barkaro. Earring",
            body        = "Amalric Doublet +1", 
            hands       = "Amalric Gages +1",
            legs        = "Amalric Slops +1",
            feet        = "Amalric Nails +1",    
            left_ring   = "Freke Ring",
            right_ring  = "Shiva Ring +1",
            back        = { name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, -- 10
            waist       = "Eschan Stone",        
        } 
        sets.midcast['Elemental Magic'].Impact = set_combine(sets.midcast['Elemental Magic'], {
            head        = empty,
            body        = "Twilight Cloak"
        })

        sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
            head		= "Ea Hat +1",
            body		= "Ea Houppe. +1",
            legs		= "Ea Slops +1",
            neck		= "Mizukage-no-Kubikazari",
            waist		= "Skrymir Cord +1",
            right_ring	= "Mujin Band",
        })

        sets.midcast['Enfeebling Magic'] = {
            sub         = "Ammurapi Shield",
            neck        = "Incanter's Torque",
            body        = "Vanya Robe",
            hands       = "Azimuth Gloves +2",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
            waist       = "Luminary Sash"
        }

        sets.midcast['Dispelga'] = {
            main        = "Daybreak",
            sub         = "Ammurapi Shield",
            neck        = "Incanter's Torque",
            body        = "Vanya Robe",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
            waist       = "Luminary Sash"
        }

        sets.midcast['Enhancing Magic'] = { -- Enhancing Duration: 76
            sub         = "Ammurapi Shield", -- 10
            head        = "Telchine Cap", --10
            body        = "Telchine Chas.", -- 8
            hands       = "Telchine Gloves", -- 10
            legs        = "Telchine Braconi", -- 10
            feet        = "Telchine Pigaches",  -- 8
            neck        = "Incanter's Torque",
            right_ear   = "Augment. Earring",
            waist       = "Embla Sash" -- 10
        }

        sets.midcast['Dark Magic'] = {
            head        = "Bagua Galero +3",
            neck        = "Incanter's Torque",
            legs        = "Azimuth Tights +2",
            waist       = "Austertiy Belt +1"
        }

        sets.midcast['Healing Magic'] = {
            neck        = "Incanter's Torque"
        }

        sets.midcast.Cure = { 
            main        = "Daybreak",
            sub         = "Genmei Shield",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            neck        = "Nodens Gorget",
            left_ear    = "Mendicant's Earring",
            head        = "Yanya Hood",
            body        = "Heka's Kalasiris",
            hands       = "Vanya Cuffs",
            back        = "Altruistic Cape",
            legs        = "Vanya Slops",
            feet        = "Vanya Clogs"         
        }
        sets.aftercast = {}
        sets.aftercast.Idle = { 
            main        = "Daybreak",
            sub         = "Genmei Shield",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head        = "Befouled Crown",
            neck        = "Loricate Torque +1",
            left_ear    = "Genmei Earring",
            right_ear   = "Etiolation Earring",
            body        = "Jhakri Robe +2",
            hands       = "Bagua Mitaines +3",
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
            back        = "Moonlight Cape",
            waist       = "Fucho-no-Obi",
            legs        = "Assid. Pants +1",
            feet        = "Geomancy Sandals +3"            
        }
        sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {
            range       = empty,
            ammo        = "Staunch Tathlum +1",
            head        = "Nyame Helm",
            body        = "Nyame Mail",
            legs        = "Nyame Flanchard",
            left_ear    = "Etiolation Earring",
            right_ear   = "Genmei Earring",
            left_ring   = "Defending Ring",
        })
        sets.aftercast.Engaged = { }
        sets.aftercast.Engaged.DT = set_combine(sets.aftercast.Engaged, { })
    end

    function file_unload()  
	    send_command('unbind ^F9')
	    send_command('unbind ^F10')
	    send_command('unbind ^F11')
    end
    
    function precast(spell)
        if spell.type == 'JobAbility' then
            if sets.precast.JA[spell.english] then
                equip(sets.precast.JA[spell.english])
            end
        elseif spell.action_type == 'Magic' then
            if buffactive.Silence then
                cancel_spell()
                if player.inventory['Echo Drops'] then
                    send_command('@input /item "Echo Drops" <me>')
                else
                    add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
                end
                return
            end
            if spell.english:startswith('Cure') then
                equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
            end
            if spell.english == 'Dispelga' then
                equip(set_combine(sets.precast.FC,{main="Daybreak"}))
            elseif spell.name == 'Impact' then
                equip(sets.precast.FC,sets.midcast['Elemental Magic'].Impact)
            else
                equip(sets.precast.FC)
            end
        elseif spell.type == 'WeaponSkill' then
            if sets.precast.WS[spell.english] then
                equip(sets.precast.WS[spell.english])
            else
                equip(sets.precast.WS)
            end
        end
    end
    
    function midcast(spell)
        if spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' then
            if sets.midcast[spell.english] then
                equip(sets.midcast[spell.english])
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        end
        if sets.midcast[spell.skill] then
           if spell.skill == 'Geomancy' and spell.name:startswith('Indi-') then
                equip(sets.midcast[spell.skill].Indi)
           elseif spell.name == 'Impact' then
                equip(sets.midcast[spell.skill].Impact)
           else
                equip(sets.midcast[spell.skill])
           end
        end
    end
    
    function aftercast(spell)
        idle()
    end

    function pet_change()
        idle()
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            idle()
        end
    end
    
    function buff_change(buff,gain)
        if buff == 'silence' and gain then
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!')	
            end
        elseif buff == 'Bolster' and not gain then
            add_to_chat(123, '[Bolster] OFF') 
        end
    end

    -- Determine what idle set to equip if a luopan is out
    function idle()
	    if player.status == 'Engaged' then
            local engagedSet = sets.aftercast.Engaged
            if sets.aftercast.Engaged[EngagedMode[e]] then 
                engagedSet = sets.aftercast.Idle[EngagedMode[e]]
            end
            if pet.isvalid then
                equip(set_combine(engagedSet,sets.luopan))
            else
                equip(engagedSet)
            end
        else	
            local idleSet = sets.aftercast.Idle
            if sets.aftercast.Idle[IdleMode[i]] then 
                idleSet = sets.aftercast.Idle[IdleMode[i]]
            end
            if pet.isvalid then
                equip(set_combine(idleSet,sets.luopan))
            else
                equip(idleSet)
            end
        end
    end

    function self_command(cmd)
        local args = T(cmd:split(' '))
        if args[1] == 'cycle' and args[2] then
            if args[2] == 'idle' then
                i = i + 1 
                if (table.getn(IdleMode) < i) then i = 1 end
            elseif args[2] == 'engaged' then
                e = e + 1 
                if (table.getn(EngagedMode) < e) then e = 1 end
            elseif args[2] == 'burst' then
                if BurstMode == false then BurstMode = true
                else BurstMode = false end
            end
        elseif args[1] == 'idle' then
            idle()
        end
    end
    --- Auto equip movement speed when moving
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
					    send_command('gs c idle')
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