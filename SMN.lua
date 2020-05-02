function get_sets()
        sets.MoveSpeed = { feet = "Herald's Gaiters",}  --auto swaps when moving
    
    -- Variables
        MagicalBloodPactRage = T{
            'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
            'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
            'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
            'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
            'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
            'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Sonic Buffet', 'Tornado II'}

        DebuffBloodPactWard = T{'Diamond Storm','Sleepga','Slowga','Tidal Roar','Shock Squall','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar','Bitter Elegy','Lunatic Voice'}
    
    -- Gear sets
        sets.precast = { }
        sets.precast.FC = {
            main        = "Grioavolr",
            sub         = "Clerisy Strap +1",
            ammo        = "Sancus Sachet +1",
            head        = "Nahtirah Hat",
            neck        = "Voltsurge Torque",
            left_ear    = "Malignance Earring",
            right_ear   = "Loquacious Earring", 
            hands       = "Inyanga Dastanas +2",
            body        = "Inyanga Jubbah +2",
            left_ring   = "Kishar Ring",
            right_ring  = "Prolix Ring",
            back        = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','"Fast Cast"+10','Pet: "Regen"+5',}},
            waist       = "Embla Sash",
            legs        = { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
            feet        = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+7','CHR+8',}},
        }

        sets.precast.BloodPact = {
            main        = "Nirvana",
            sub         = "Elan Strap +1",
            ammo        = "Sancus Sachet +1",
            head        = "Beckoner's Horn +1",
            neck        = "Caller's Pendant",
            left_ear    = "Evan's Earring",
            right_ear   = "Andoaa Earring",
            body        = "Convoker's Doublet +3",
            hands       = "Glyphic Bracers +3",
            left_ring   = "Evoker's Ring",
            right_ring  = "Stikini Ring +1",
            waist       = "Lucidity Sash",		
	        back        = "Conveyance Cape",		
            legs        = "Baayami Slops",
            feet        = "Baayami Sabots +1"
        }
    
        sets.midcast = { }
        -- When you summon an avatar. Spell interruption rate down, any gear that enhances a level
        sets.midcast.SummoningMagic = { }
        -- Cure potency 
        sets.midcast.Cure = {
            main        = "Daybreak",
            ammo        = "Hydrocera",
            head        = "Vanya Hood",
            neck        = "Henic Earring",
            left_ear    = "Roundel Earring",
            right_ear   = "Meili Earring",
            body        = "Inyanga Jubbah +2",
            hands       = "Bokwus Gloves",
            left_ring   = "Janniston Ring",
            right_ring  = "Menelaus's Ring",
            back        = "Altruistic Cape",
            waist       = "Austerity Belt",
            legs        = "Inyanga Shalwar +2",
            feet        = { name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},    
        }
        -- Cursna
        sets.midcast.Cursna = {
    
        }
        -- Enhancing spells gear: Protect, Shell, Stoneskin, Phalanx, ect...
        sets.midcast.Enhancing = {
    
        }
        -- Spell specific midcast 
        sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
            waist="Siegel Sash",
        })
    
        sets.midcast.PhysicalBP = { -- HP: -110, +85, +9, -110, -90, +50 (-166)
            main        = "Nirvana",
            sub         = "Elan Strap +1",
            ammo        = "Sancus Sachet +1",
            head        = { name="Apogee Crown +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
            body        = "Con. Doublet +3",
            hands       = "Merlinic Dastanas",
            legs        = { name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
            feet        = { name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
            neck        = { name="Smn. Collar +2", augments={'Path: A',}},
            waist       = "Incarnation Sash",
            left_ear    = "Lugalbanda Earring",
            right_ear   = "Gelos Earring",
            left_ring   = "Varar Ring +1",
            right_ring  = "Varar Ring +1",
            back        = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: "Regen"+5',}},
        }
    
        sets.midcast.MagicalBP = { -- HP: -110, -160, +9, -110, -90, +50, +88 (-323)
            main        = "Grioavolr",
            sub         = "Elan Strap +1",
            ammo        = "Sancus Sachet +1",
            head        = { name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
            body        = { name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
            hands       = "Merlinic Dastanas",
            legs        = { name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
            feet        = { name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
            neck        = { name="Smn. Collar +2", augments={'Path: A',}},
            waist       = "Regal Belt",
            left_ear    = "Lugalbanda Earring",
            right_ear   = "Gelos Earring",
            left_ring   = "Varar Ring +1",
            right_ring  = "Varar Ring +1",
            back        = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','"Fast Cast"+10','Pet: "Regen"+5',}},
        }
        -- Pet buffs
        sets.midcast.PetBuff = {
    
        }

        sets.midcast.PetDebuff = {

        }
    
        sets.aftercast = { }
        -- Default set to equip after spell or JA
        sets.aftercast.Idle = {  
            main        = "Daybreak",
            ammo        = "Hydrocera",
            head        = "Convoker's Horn +2",
            body        = { name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
            hands       = "Inyanga Dastanas +2",
            legs        = "Assiduity Pants +1",
            feet        = "Baayami Sabots +1",
            neck        = "Henic Torque",
            left_ear    = { name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
            right_ear   = "Novia Earring",    
            left_ring   = "Stikini Ring +1",
            right_ring  = "Stikini Ring +1",
            waist       = "Fucho-no-obi",
            back        = "Altruistic Cape",
        }

        sets.aftercast.Avatar = {
            head        = "Convoker's Horn +2",
            body        = { name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
            hands       = "Inyanga Dastanas +2",
            legs        = "Assiduity Pants +1",
            feet        = "Baayami Sabots +1",
            right_ear   = "Novia Earring",    
            right_ring  = "Stikini Ring +1",
            waist       = "Fucho-no-obi",
            main        = "Nirvana",
            sub         = "Elan Strap +1",
            ammo        = "Sancus Sachet +1",
            neck        = "Caller's Pendant",
            left_ear    = "Evan's Earring",
            left_ring   = "Evoker's Ring",
            back        = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: "Regen"+5',}},
        }

        -- If you want certain gear equiped for a specific avatar use this template
        sets.aftercast.Avatar['Insert Avatar Name Here'] = set_combine(sets.aftercast.Avatar, {
            main        = "", 
        })

         -- Gear you want locked when engaged
        sets.Engaged = {
            main        = "Nirvana",
            sub         = "Elan Strap +1"
        }
    end
    
    function precast(spell)
        if (pet.isvalid and pet_midaction()) or spell.type == "Item" then
            return
        end

        if spell.type == "BloodPactWard" or spell.type == "BloodPactRage" then
            equip(sets.precast.BloodPact)
        elseif spell.action_type == "Magic" then            
            equip(sets.precast.FC)
        elseif spell.precast[spell.name] then
            equip(sets.precast[spell.name])
        end
    end
    
    function midcast(spell)
        if (pet.isvalid and pet_midaction()) or spell.type == "Item" then
            return
        end 
        if spell.type == "BloodPactWard" or spell.type == "BloodPactRage" then
            -- Do nothing
        elseif sets.midcast[spell.english] then
            equip(sets.midcast[spell.english])
        elseif spell.type=="WhiteMagic" then
            if string.find(spell.name,"Cure") or string.find(spell.name,"Curaga") then
                equip(sets.midcast.Cure)
            elseif spell.english == "Cursna" then
                equip(sets.midcast.Cursna)
            elseif spell.skill=="Enhancing Magic" then
                equip(sets.midcast.Enhancing)
            end
        end
    end
    
    function aftercast(spell)
        if pet_midaction() or spell.type == "Item" then
            return
        elseif spell and string.find(spell.type,'BloodPact') and not spell.interrupted then
            pet_midcast(spell)
        else
            equip_aftercast()
        end
    end
    
    function pet_change(pet,gain)
        equip_aftercast()
    end

    function pet_midcast(spell)
        if spell.type == "BloodPactWard" then
            if DebuffBloodPactWard:contains(spell.name) then
                equip(sets.midcast.PetDebuff)
            else
                equip(sets.midcast.PetBuff)
            end
        elseif spell.type == "BloodPactRage" then
            if MagicalBloodPactRage:contains(spell.name) then
                equip(sets.midcast.MagicalBP)
            else
                equip(sets.midcast.PhysicalBP)
            end
        end
    end
    
    function pet_aftercast(spell)
        equip_aftercast()
    end

    function pet_status_change(a,b)
        windower.add_to_chat(8,'Pet status change: '..tostring(a)..' '..tostring(b)) -- Useful for knowing when you got aggroed
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            equip_aftercast()
        end
    end
    
    function buff_change(buff,gain)
        if buff == 'silence' and gain then
            if player.inventory['Echo Drops'] or player.satchel['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
        end
    end
    
    -- This function will equip your aftercast/idle set
    function equip_aftercast()
        sets.AC = sets.aftercast.Idle
        if pet.isvalid then
            if sets.aftercast.Avatar[pet.name] then
                sets.AC = sets.aftercast.Avatar[pet.name]
            else
                sets.AC = sets.aftercast.Avatar
            end
        end
        if player.status == "Engaged" then
            sets.AC = set_combine(sets.AC,sets.Engaged)
        end
        equip(sets.AC)
    end

    function self_command(commandArgs)
        if commandArgs == 'idle' then
            equip_aftercast()
        end
    end

    -- Code to Swap to movement speed equipment while moving
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
                    send_command('gs c idle')
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
