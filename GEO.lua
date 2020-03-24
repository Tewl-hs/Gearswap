function get_sets()

    -- Load Macros
        send_command('input /macro book 20;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 2')
    
    -- Gear sets
        sets.idle = { 
            main        = "Daybreak",
            sub         = { name="Genbu's Shield", augments={'"Cure" potency +3%','Mag. Acc.+5','HP+24',}},
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head        = "Befouled Crown",
            neck        = "Twilight Torque",
            left_ear    = "Malignance Earring",
            right_ear   = "Colossus's Earring",
            body        = "Jhakri Robe +2",
            hands       = "Bagua Mitaines +1",
            left_ring   = "Defending Ring",
            right_ring  = "Gelatinous Ring +1",
            back        = "Moonbeam Cape",
            waist       = "Fucho-no-Obi",
            legs        = "Assid. Pants +1",
            feet        = "Geomancy Sandals +1"            
        }

        sets.luopan = { 
            main        = "Solstice",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head        = "Azimuth Hood +1",
            hands       = "Geomancy Mitaines +2",
            back        = "Nantosuelta's Cape",
            waist       = "Isa Belt",
            feet        = "Bagua Sandals +3"            
        }

        sets.precast = {}
        sets.precast.fastcast = { 
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head        = "Vanya Hood",
            neck        = "Orunmila's Torque",
            left_ear    = "Malignance Earring",
            right_ear   = "Loquac. Earring",
            body        = "Heka's Kalasiris",
            left_ring   = "Kishar Ring",
            right_ring  = "Prolix Ring",
            back        = "Lifestream Cape",
            waist       = "Witful Belt",
            legs        = "Geomancy Pants +1",
            feet        = "Merlinic Crackows"            
        }
    
        sets.midcast = {}
        sets.midcast['Geomancy'] = { 
            main        = "Solstice",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head        = "Azimuth Hood +1",
            neck        = "Incanter's Torque",
            body        = "Bagua Tunic +1",
            hands       = "Geomancy Mitaines +2",
            left_ring   = "Stikini Ring",
            back        = "Lifestream Cape",
            waist       = "Austertiy Belt +1",
            legs        = "Azimuth Tights +1",   
            feet        = "Medium's Sabots"  
        }


        sets.midcast['Elemental Magic'] = { 
            main        = "Daybreak",
            sub         = "Ammurapi Shield",
            range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head        = "Nares Cap",
            neck        = "Eddy Necklace",
            left_ear    = "Malignance Earring",
            right_ear   = "Friomisi Earring",
            body        = "Jhakri Robe +2",
            hands       = "Jhakri Cuffs +2",
            left_ring   = "Kishar Ring",
            right_ring  = "Prolix Ring",
            waist       = "Othila Sash",
            legs        = "Azimuth Tights +1",
            feet        = "Jhakri Pigaches +2"            
        } 

        sets.midcast['Enfeebling Magic'] = {
            sub         = "Ammurapi Shield",
            neck        = "Incanter's Torque",
            body        = "Vanya Robe"
        }

        sets.midcast['Enhancing Magic'] = {
            sub         = "Ammurapi Shield",
            neck        = "Incanter's Torque",
            right_ear   = "Augment. Earring",
            waist       = "Siegel Sash"
        }

        sets.midcast['Healing Magic'] = {
            neck        = "Incanter's Torque"
        }

        sets.midcast.Cure = { 
            main        = "Daybreak",
            sub         = { name="Genbu's Shield", augments={'"Cure" potency +3%','Mag. Acc.+5','HP+24',}},
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
    end
    
    function precast(spell)
        if spell.type=="Item" then
            return
        end
        if spell.english:startswith('Cure') then
            equip(set_combine(sets.precast.fastcast,{body="Heka's Kalasiris"}))
        else
          equip(sets.precast.fastcast)
        end
    end
    
    function midcast(spell)
        if spell.english:startswith('Cure') then
            equip(set_combine(sets.fastcast,{body="Heka's Kalasiris"}))
        elseif sets.midcast[spell.skill] then
            equip (sets.midcast[spell.skill])
        elseif spell.type ~= 'JobAbility' then
            add_to_chat(123,'[Unsupported Spell] '..spell.type)
        end
    end
    
    function aftercast(spell)
        if pet.isvalid then
            equip(set_combine(sets.idle,sets.luopan))
          else
            equip(sets.idle)
        end
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            if pet.isvalid then
                equip(set_combine(sets.idle,sets.luopan))
              else
                equip(sets.idle)
            end
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
    