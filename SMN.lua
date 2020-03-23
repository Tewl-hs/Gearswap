function get_sets()

    -- Load Macros
       -- send_command('input /macro book 1;wait 0.2;input /macro set 1;')
    
    -- Augments
    
    -- Gear sets
    
        sets.precast = { }
        sets.precast.FC = {
            main        = "",
            sub         = "",
            ammo        = "",
            head        = "",
            neck        = "",
            ear1        = "",
            ear2        = "", 
            hands       = "",
            body        = "",
            ring1       = "",
            ring2       = "",
            back        = "",
            waist       = "",
            legs        = "",
            feet        = ""
        }
    
        sets.midcast = { }
        -- When you summon an avatar. Spell interruption rate down, any gear that enhances a level
        sets.midcast.SummoningMagic = {
    
        }
        -- Elemental Siphon
        sets.midcast.Siphon = {
    
        }
        -- Cure potency 
        sets.midcast.Cure = {
    
        }
        -- Cursna
        sets.midcast.Cursna = {
    
        }
        -- Enhancing spells gear: Protect, Shell, Stoneskin, Phalanx, ect...
        sets.midcast.Enhancing = {
    
        }
        -- Additional spell specific enhancing gear
        sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
            waist="Siegel Sash",
        })
    
        sets.midcast.PhysicalBP = {
    
        }
    
        sets.midcast.MagicalBP = {
    
        }
        -- Pet buffs
        sets.midcast.PetBuff = {
    
        }
    
        sets.aftercast = { }
        -- Default set to equip after spell or JA
        sets.aftercast.Idle = {  
    
        }
        sets.aftercast.Perp = set_combine(sets.aftercast.Idle, {
            waist="Siegel Sash",
        })
    
        sets.PC = { }
        sets.MC = { }
    end
    
    function precast(spell)
        if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
            return
        end
    
        equip(sets.PC)
    end
    
    function midcast(spell)
        if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
            return
        end 
        sets.midcast.MC = { }
        if (spell.type=="BloodPactWard" or spell.type=="BloodPactRage") then
            sets.midcast.MC = sets.midcast.PhysicalBP
        elseif sets.midcast[spell.english] then
            sets.midcast.MC = sets.midcast[spell.english]
        elseif spell.name=="Elemental Siphon" then
            sets.midcast.MC = sets.midcast.Siphon
        elseif spell.type=="SummonerPact" then
            sets.midcast.MC = sets.midcast.SummoningMagic
        elseif spell.type=="WhiteMagic" then
            if string.find(spell.name,"Cure") or string.find(spell.name,"Curaga") then
                sets.midcast.MC = sets.midcast.Cure
            elseif spell.english == "Cursna" then
                sets.midcast.MC = sets.midcast.Cursna
            elseif spell.skill=="Enhancing Magic" then
                sets.midcast.MC = sets.midcast.Enhancing
            else
                idle()
                return
            end
        else
            idle()
            return
        end
        
        equip(sets.MC)
    end
    
    function aftercast(spell)
        if pet_midaction() or spell.type=="Item" then
            return
        end
        if not string.find(spell.type,"BloodPact") then
            idle()
        end
    end
    
    function pet_change(pet,gain)
        idle()
    end
    
    function pet_aftercast(spell)
        idle()
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            idle()
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
    function idle()
    
    end
