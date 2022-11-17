  function get_sets()  
    -- Start of Personal Settings --  
    Macro_Book = '17'
    Macro_Page = T{
        ['Ramuh']       = '1',
        ['Garuda']      = '1',
        ['Titan']       = '1',
        ['Ifrit']       = '1',
        ['Leviathan']   = '1',
        ['Shiva']       = '1',
        ['Siren']       = '1',
        ['Fenrir']   	= '1',
        ['Diabolos']    = '1',
        ['Cait Sith']   = '1',
	    ['Carbuncle']   = '1',
    }
    LockStyle = 12
    send_command('input /macro book '..Macro_Book..';wait 1;input /lockstyleset '..LockStyle)
    send_command('input //equipviewer pos 1663 912')
    -- End of Personal Settings --

    -- Tables
    MagicalBloodPactRage = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
        'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
        'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Sonic Buffet', 'Tornado II'}

    DebuffBloodPactWard = S{'Diamond Storm','Sleepga','Slowga','Tidal Roar','Shock Squall','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar','Bitter Elegy','Lunatic Voice'}
    DurationBuffBPWard = T{
        ['Shining Ruby']='Carbuncle',['Glittering Ruby']='Carbuncle',['Soothing Current']='Carbuncle',['Dream Shroud']='Diabolos',['Noctoshield']='Diabolos',
        ['Ecliptic Growl']='Fenrir',['Ecliptic Howl']='Fenrir',['Heavenward Howl']='Fenrir',['Aerial Armor']='Garuda',['Hastega']='Garuda',['Fleet Wind']='Garuda',
        ['Hastega II']='Garuda',['Inferno Howl']='Ifrit',['Crimson Howl']='Ifrit',['Rolling Thunder']='Ramuh',['Lightning Armor']='Ramuh',['Crystal Blessing']='Shiva',
        ['Frost Armor']='Shiva',['Earthen Ward']='Titan',['Earthen Armor']='Titan',
    }
    -- Gear sets
    sets.MoveSpeed = { feet = "Herald's Gaiters",}

    sets.precast = { }
    sets.precast.JA = {
        ['Astral Flow'] = {head="Glyphic Horn +3"},
        ['Elemental Siphon'] = {
            main        = { name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
            sub         = "Vox Grip",
            ammo        = "Esper Stone +1",
            --head        = "Telchine Cap", -- "Elemental Siphon"
            --body        = "Telchine Chasuble", -- "Elemental Siphon"
            hands       = "Baayami Cuffs",
            --legs        = "Telchine Braconi", -- "Elemental Siphon"
            feet        = "Beck. Pigaches +2",
            neck        = "Incanter's Torque",
            left_ear    = "Lodurr Earring",
            right_ear   = "Gifted Earring",
            left_ring   = "Evoker's Ring",
            right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
            waist       = "Kobo Obi",
            back        = "Conveyance Cape",
        },
        ['Mana Cede'] = {hands="Beck. Bracers +2"},
    }

    sets.precast.FC = { -- 80
        ammo        = "Epitaph",
        head        = "Bunzi's Hat", -- 10
        body        = "Inyanga Jubbah +2", -- 14
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, -- 7
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        left_ear    = "Malignance Earring", -- 4
        right_ear   = "Loquacious Earring", -- 2
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Prolix Ring", -- 2
        waist       = "Embla Sash", -- 5
        back        = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','"Fast Cast"+10','Pet: "Regen"+5',}}, -- 10
    }
    sets.precast.BloodPact = { -- Skill 206/BPD I 15/BPD II 9
        main        = { name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}, -- 15/0/2
        sub         = "Vox Grip", -- 3/0/0
        ammo        = "Epitaph", -- 0/0/5
        head        = "Beckoner's Horn +2", -- 18/0/0
        body        = "Baayami Robe", -- 32/0/0
        hands       = "Glyphic Bracers +3",	-- 23/8/0
        legs        = "Baayami Slops", -- 30/7/0
        feet        = "Baayami Sabots +1", -- 29/0/0
        neck        = "Incanter's Torque", -- 10/0/0
        left_ear    = "Lodurr Earring", -- 5/0/0
        right_ear   = "Beck. Earring", -- 5/0/0
        left_ring   = "Evoker's Ring", -- 10/0/0
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1}, -- 8/0/0
        waist       = "Kobo Obi", -- 8/0/0
        back        = { name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+13','Blood Pact Dmg.+3','Blood Pact ab. del. II -2',}}, -- 10/0/2
    }
    sets.precast.WS = {}
    sets.precast.WS['Garland of Bliss'] = {
        ammo        = "Pemphredo Tathlum",
        head        = { name="Nyame Helm", augments={'Path: B',}},
        body        = { name="Nyame Mail", augments={'Path: B',}},
        hands       = { name="Nyame Gauntlets", augments={'Path: B',}},
        legs        = { name="Nyame Flanchard", augments={'Path: B',}},
        feet        = { name="Nyame Sollerets", augments={'Path: B',}},
        neck        = "Sanctity Necklace",
        waist       = "Orpheus's Sash",
        left_ear    = "Malignance Earring",
        right_ear   = "Friomisi Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Karieyh Ring +1",
        back        = "Moonlight Cape",
    }

    sets.midcast = { }
    -- When you summon an avatar. Spell interruption rate down, any gear that enhances a level
    sets.midcast.SummoningMagic = {
        body        = "Baayami Robe",
    }
    -- Cure potency 
    sets.midcast.Cure = {
        ammo        = "Hydrocera",
        head        = "Vanya Hood",
        neck        = "Nodens Gorget",
        left_ear    = "Roundel Earring",
        right_ear   = "Mendi. Earring",
        body        = "Inyanga Jubbah +2",
        hands       = "Vanya Cuffs",
        left_ring   = "Lebeche Ring",
        right_ring  = "Naji's Loop",
        back        = "Altruistic Cape",
        waist       = "Austerity Belt +1",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs",   
    }
    -- Cursna
    sets.midcast.Cursna = {

    }
    -- Enhancing spells gear: Protect, Shell, Stoneskin, Phalanx, ect...
    sets.midcast.Enhancing = {
        head        = "Telchine Cap", --10
        body        = "Telchine Chas.", -- 8
        hands       = "Telchine Gloves", -- 10
        legs        = "Telchine Braconi", -- 10
        feet        = "Telchine Pigaches",  -- 8
        neck        = "Incanter's Torque",
        waist       = "Embla Sash", -- 10
    }
    -- Additional spell specific enhancing gear
    sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
        waist       = "Siegel Sash",
    })

    sets.midcast.PhysicalBP = {
        main        = "Nirvana",
        sub         = "Elan Strap +1",
        ammo        = "Epitaph",
        head        = { name="Apogee Crown +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
        body        = "Glyphic Doublet +3",
        hands       = { name="Merlinic Dastanas", augments={'Pet: Accuracy+15 Pet: Rng. Acc.+15','Blood Pact Dmg.+10','Pet: STR+7','Pet: Mag. Acc.+10',}},
        legs        = { name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
        feet        = "Convo. Pigaches +3",
        neck        = { name="Smn. Collar +2", augments={'Path: A',}},
        waist       = "Incarnation Sash",
        left_ear    = "Lugalbanda Earring",
        right_ear   = "Beck. Earring",
        left_ring   = "Cath Palug Ring",
        right_ring  = "Varar Ring +1",
        back        = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: "Regen"+5',}},
    }
    sets.midcast.PhysicalBP.AM3 = set_combine(sets.midcast.PhysicalBP, {
        body        = "Con. Doublet +3",
        left_ring   = "Varar Ring +1",
        right_ear   = "Beck. Earring",
        feet        = { name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
    })

    sets.midcast.MagicalBP = {
        main        = { name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: VIT+6','Pet: Mag. Acc.+22','Pet: "Mag.Atk.Bns."+13','DMG:+15',}},
        sub         = "Elan Strap +1",
        ammo        = "Epitaph",
        head        = { name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        body        = { name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        hands       = { name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+16 Pet: "Mag.Atk.Bns."+16','Blood Pact Dmg.+10','Pet: INT+5','Pet: Mag. Acc.+14','Pet: "Mag.Atk.Bns."+10',}},
        legs        = { name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        feet        = { name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        neck        = { name="Smn. Collar +2", augments={'Path: A',}},
        waist       = "Regal Belt",
        left_ear    = "Lugalbanda Earring",
        right_ear   = "Beck. Earring",
        left_ring   = "Varar Ring +1",
        right_ring  = "Varar Ring +1",
        back        = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','"Fast Cast"+10','Pet: "Regen"+5',}},
    }
    
    sets.midcast.PetBuff = {
        main        = { name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
        sub         = "Vox Grip",
        ammo        = "Epitaph",
        head        = "Beckoner's Horn +2",
        body        = "Beckoner's Doublet +2",
        hands       = "Baayami Cuffs",
        legs        = "Baayami Slops",
        feet        = "Baayami Sabots +1",
        neck        = "Incanter's Torque",
        waist       = "Kobo Obi",
        left_ear    = "Andoaa Earring",
        right_ear   = "Beck. Earring",
        left_ring   = "Evoker's Ring",
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        back        = { name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+13','Blood Pact Dmg.+3','Blood Pact ab. del. II -2',}},
    }

    sets.midcast.PetDebuff = {
        main        = { name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
        sub         = "Vox Grip",
        ammo        = "Epitaph",
        head        = "Beckoner's Horn +2",
        body        = "Beckoner's Doublet +2",
        hands       = { name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+9','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}},
        legs        = "Baayami Slops",
        feet        = "Baayami Sabots +1",
        neck        = { name="Smn. Collar +2", augments={'Path: A',}},
        waist       = "Kobo Obi",
        left_ear    = "Enmerkar Earring",
        right_ear   = "Beck. Earring",
        left_ring   = "Evoker's Ring",
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        back        = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','"Fast Cast"+10','Pet: "Regen"+5',}},
    }

    sets.aftercast = { }
    sets.aftercast.Idle = {  
        main        = "Nirvana",
        sub         = "Oneiros Grip",
        ammo        = "Epitaph",
        head        = "Convoker's Horn +3",
    	body		= { name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        hands       = { name="Merlinic Dastanas", augments={'Pet: AGI+2','"Store TP"+4','"Refresh"+2','Accuracy+20 Attack+20',}},
        legs        = "Assid. Pants +1",
    	feet		= "Baaya. Sabots +1",
        neck        = "Smn. Collar +2",
        waist       = "Fucho-no-Obi",
        left_ear    = "C. Palug Earring",
        right_ear   = "Beck. Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},        
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        back        = "Moonlight Cape",
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle,{  
        head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
        left_ring	= "Defending Ring",
    })
    sets.aftercast.Avatar = {
        main        = "Nirvana",
    	sub		    = "Elan Strap +1",
        ammo        = "Epitaph",
    	head		= "Glyphic Horn +3",
    	body		= { name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    	hands		= { name="Merlinic Dastanas", augments={'Pet: AGI+2','"Store TP"+4','"Refresh"+2','Accuracy+20 Attack+20',}},
    	legs		= "Assid. Pants +1",
    	feet        = { name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    	neck		= "Caller's Pendant",
    	waist		= "Regal Belt",
    	left_ear	= "C. Palug Earring",
    	right_ear	= "Beck. Earring",
    	left_ring	= "Evoker's Ring",        
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
    	back		= { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: "Regen"+5',}},
    }
    sets.aftercast.Avatar.DT =  set_combine(sets.aftercast.Avatar,{
        head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
        left_ring	= "Defending Ring",
    })
    sets.aftercast.Avatar.Engaged = set_combine(sets.aftercast.Avatar,{
        neck        = "Shulmanu Collar",
    	waist		= "Klouskap Sash +1",
    })
    sets.aftercast.Avatar.Engaged.DT = set_combine(sets.aftercast.Avatar.DT,{
        neck        = "Shulmanu Collar",
    })

    sets.Engaged = {
        main        = "Nirvana",
    	sub		    = "Elan Strap +1",
        ammo        = "Epitaph",
        head        = "Bunzi's Hat",
        body        = "Bunzi's Robe",
        hands       = "Bunzi's Gloves",
        legs        = "Bunzi's Pants",
        feet        = "Bunzi's Sabots",
        neck        = "Sanctity Necklace",
        waist       = "Grunfeld Rope",
        left_ear    = "Telos Earring",
        right_ear   = "Dedition Earring",
        left_ring   = "Chirich Ring +1",
        right_ring  = "Chirich Ring +1",
        back        = "Moonlight Cape",
    }
    end
    
    function precast(spell)
        if (pet.isvalid and pet_midaction() and not spell.type=="SummonerPact") or spell.type=="Item" then
            return
        end
        if spell.type == "BloodPactWard" or spell.type == "BloodPactRage" then
            if buffactive['Astral Conduit'] then
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
                        if buffactive["Aftermath: Lv.3"] then
                            equip(sets.midcast.PhysicalBP.AM3)
                        else
                            equip(sets.midcast.PhysicalBP)
                        end
                    end
                end
            else
                equip(sets.precast.BloodPact)
            end
        elseif spell.type == 'WeaponSkill' then
            if sets.precast.WS[spell.name] then
                equip(sets.precast.WS[spell.name])
            else
                equip(sets.precast.WS)
            end
        elseif spell.action_type == 'Ability' then
            if sets.precast.JA[spell.name] then
                equip(sets.precast.JA[spell.name])
            end
        elseif spell.action_type == "Magic" then     
            if spell.name=="Stoneskin" then
                equip(sets.precast.FC,{waist="Siegel Sash"})
            else
                equip(sets.precast.FC)
            end
        end
    end
    
    function midcast(spell)
        if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
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
        if pet_midaction() or spell.type=="Item" then
            return
        end
        if spell and string.find(spell.type,'BloodPact') and not spell.interrupted then
            pet_midcast(spell)
        else
            equip_aftercast()
        end
    end
    
    function pet_change(pet,gain)
        if gain == true then
            if Macro_Page[pet.name] then send_command('input /macro book '..Macro_Book..';wait 0.2;input /macro set '..Macro_Page[pet.name]) end
            if not buffactive["Avatar's Favor"] then send_command('wait 2;input /pet "Avatar\'s Favor" <me>') end
        else
            add_to_chat(8,pet.name..' has been released or died.')
        end
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
                if buffactive["Aftermath: Lv.3"] then
                    equip(sets.midcast.PhysicalBP.AM3)
                else
                    equip(sets.midcast.PhysicalBP)
                end
            end
        end
    end
    
    function pet_aftercast(spell)
        equip_aftercast()
        --windower.add_to_chat(8,'Pet finished ability: '..spell.name) 
    end

    function pet_status_change(old,new)
        if pet.isvalid and not pet_midaction() and (new == 'Engaged' or old == 'Engaged') then
            equip_aftercast()
        end
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
    
    function equip_aftercast()
        sets.AC = sets.aftercast.Idle
        if pet.isvalid then
            if sets.aftercast.Avatar[pet.name] then
                if pet.status == 'Engaged' and sets.aftercast.Avatar[pet.name].Engaged then
                    sets.AC = sets.aftercast.Avatar[pet.name].Engaged
                else
                    sets.AC = sets.aftercast.Avatar[pet.name]
                end
            else
                if pet.status == 'Engaged' then
                    sets.AC = sets.aftercast.Avatar.Engaged
                else
                    sets.AC = sets.aftercast.Avatar.DT
                end
            end
        end
        equip(sets.AC)
    end

    function self_command(commandArgs)
        if commandArgs == 'idle' then
            equip_aftercast()
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