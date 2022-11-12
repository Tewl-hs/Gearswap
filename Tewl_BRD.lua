--[[
    Author: Tewl / Bismark
    Files: Tewl_BRD.lua 

    Binds
    CTRL+F9    : Cycle Idle sets
    CTRL+F10    : Cycle Engaged sets
--]]
function get_sets()
    items = require('resources').items
    require('queues')
    
    include('FFXI-Mappings')
	
    include('FFXI-Utility')

    send_command('bind ^f9 gs c cycle idle')
    send_command('bind ^f10 gs c cycle engaged')

    set_macros(1,1)
    send_command('wait 1;input /lockstyleset 3')
    send_command('input //equipviewer pos 1663 934')

    sets.MoveSpeed = { feet = "Fili cothurnes +2",} 

    -- Augments
    Kali = {}
    Kali.Skill      = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',} }
    Kali.MACC       = { name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',} }

    Offhand = { sub = "Ternion Dagger +1" }

    -- DummySongs
    DummySongs = T{'Knight\'s Minne', 'Knight\'s Minne II'}

    -- Gear sets
    sets.precast = { }
    sets.precast.FC = { -- Current: 80% 
        range       = { name="Linos", augments={'"Fast Cast"+5',}}, -- 5
        head        = "Bunzi's Hat", -- 10
        body        = "Inyanga Jubbah +2", -- 14
        hands       = "Leyline Gloves", -- 8
        legs        = "Aya. Cosciales +2", -- 6
        feet        = "Chironic Slippers", -- 7 
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Loquacious Earring", -- 2
        right_ear   = "Enchntr. Earring +1", -- 2
        left_ring   = "Prolix Ring", -- 2
        right_ring  = "Kishar Ring", -- 4 
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} -- 10
    }
    sets.precast.FC['Singing'] = set_combine(sets.precast.FC,{
        head        = "Fili Calot +2",
        body        = "Brioso Justau. +3",
        feet        = "Bihu Slippers +3",
        left_ear    = "Genmei Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Gelatinous Ring +1",
    })
    sets.precast.FC['Singing'].DummySong = set_combine(sets.precast.FC,{ 
        range       = "Daurdabla",
    })
    sets.precast.FC['Singing']['Honor March'] = set_combine(sets.precast.FC['Singing'],{
        range       = "Marsyas",
    })
    sets.precast.JA = {
        ['Nightingale'] = { feet = "Bihu Slippers +3" },
        ['Troubadour'] = { body = "Bihu Jstcorps. +3" },
        ['Soul Voice'] = { legs = "Bihu Cannions +3" },
    }
    sets.precast.WS = {
        range       = { name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+2','CHR+8',}},
        head        = "Bihu Roundlet +3",
        body        = "Bihu Jstcorps. +3",
        hands       = "Bihu Cuffs +3",
        legs        = "Bihu Cannions +3",
        feet        = "Bihu Slippers +3",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Brutal Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Ilabrat Ring",
        back        = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS,{
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
        neck        = "Bard's Charm +2",
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear   = "Ishvara Earring",
		right_ring	= "Karieyh Ring +1",
    })
    sets.precast.WS["Mordant Rime"] = {
        range       = { name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+2','CHR+8',}},
        head        = "Bihu Roundlet +3",
        body        = "Bihu Jstcorps. +3",
        hands       = "Bihu Cuffs +3",
        legs        = "Bihu Cannions +3",
        feet        = "Bihu Slippers +3",
        neck        = "Bard's Charm +2",
        waist       = { name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear    = "Regal Earring",
        right_ear   = "Ishvara Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Metamor. Ring +1",
        back        = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}},
    }
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{
        head        = { name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        feet        = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        neck        = "Bard's Charm +2",
        waist       = { name="Kentarch Belt +1", augments={'Path: A',}},
        right_ear   = "Ishvara Earring",
    })

    sets.midcast = { }
    sets.midcast['Healing Magic'] = {
        head		= "Kaykaus Mitra +1",
        body		= "Kaykaus Bliaut +1",
        hands		= "Kaykaus Cuffs +1",
        legs		= "Kaykaus Tights +1",
        feet		= "Kaykaus Boots +1",
        neck		= "Nodens Gorget",
        waist		= "Othila Sash",
        left_ear	= "Malignance Earring",
        right_ear	= "Mendicant's Earring",
        left_ring	= { "Naji's Loop", bag="wardrobe4" },
        right_ring	= { "Lebeche Ring", bag="wardrobe4" },
        back		= "Solemnity Cape"
    }
    sets.midcast['Healing Magic'].Cursna = set_combine(sets.midcast['Healing Magic'], {

    })
    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'], {	
        head		= "Kaykaus Mitra +1",
        body		= "Kaykaus Bliaut +1",
        hands		= "Kaykaus Cuffs +1",
        legs		= "Kaykaus Tights +1",
        neck		= "Nodens Gorget",
        waist		= "Othila Sash",
        left_ear	= "Malignance Earring",
        right_ear	= "Mendicant's Earring",
        left_ring	= { "Naji's Loop", bag="wardrobe4" },
        right_ring	= { "Lebeche Ring", bag="wardrobe4" },
        back		= "Solemnity Cape"
    })
    sets.midcast['Singing'] = {        
        main        = "Carnwenhan", 
        sub         = "Genmei Shield",
        range       = "Gjallarhorn",
        head        = "Fili Calot +2",
        body        = "Fili Hongreline +2",
        hands       = "Fili Manchettes +2",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +3",
        neck        = "Moonbow Whistle +1",
        waist       = "Flume Belt +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring	= "Gelatinous Ring",
        right_ring  = "Defending Ring",
        right_ring	= { name="Stikini Ring +1", bag="wardrobe4" },
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
    }
    sets.midcast['Singing'].Debuff = set_combine(sets.midcast['Singing'],{
        sub         = "Ammurapi Shield", 
        head        = "Bihu Roundlet +3",
        hands       = "Inyanga Dastanas +2",
        legs        = "Brioso Cannions +3",
        left_ear    = "Regal Earring",
        right_ear   = "Digni. Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe1" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe4" },
        waist       = "Luminary Sash",
    })
    sets.midcast['Singing'].Scherzo = set_combine(sets.midcast['Singing'],{
        feet        = "Fili Cothurnes +2"
    })
    sets.midcast['Singing'].Carol = set_combine(sets.midcast['Singing'],{
        hands       = "Mousai Gages +1"
    })
    sets.midcast['Singing'].Minne = set_combine(sets.midcast['Singing'],{
        legs        = "Mous. Seraweels +1"
    })
    sets.midcast['Singing'].Etude = set_combine(sets.midcast['Singing'],{
        head        = "Mousai Turban +1"
    })
    sets.midcast['Singing'].Mambo = set_combine(sets.midcast['Singing'],{
        feet        = "Mou. Crackows +1"
    })
    sets.midcast['Singing'].Ballad = set_combine(sets.midcast['Singing'],{
        legs        = "Fili Rhingrave +2"
    })
    sets.midcast['Singing'].Minuet = set_combine(sets.midcast['Singing'],{
        body        = "Fili Hongreline +2"
    })
    sets.midcast['Singing'].March = set_combine(sets.midcast['Singing'],{
        hands       = "Fili Manchettes +2"
    })
    sets.midcast['Singing'].Madrigal = set_combine(sets.midcast['Singing'],{
        head        = "Fili Calot +2"
    })
    sets.midcast['Singing'].Paeon = set_combine(sets.midcast['Singing'],{
        head       = "Brioso Roundlet +3"
    })
    sets.midcast['Singing'].Lullaby = set_combine(sets.midcast['Singing'].Debuff,{
        body        = "Fili Hongreline +2",
        hands       = "Brioso Cuffs +3",
        legs        = "Inyanga Shalwar +2",
    })
    sets.midcast['Singing'].Horde = set_combine(sets.midcast['Singing'].Debuff,{
        range       = "Duradabla",
        legs        = "Inyanga Shalwar +2",
        waist       = "Harfener's Sash",
    })
    sets.midcast['Singing'].Threnody = set_combine(sets.midcast['Singing'].Debuff,{
        body        = "Mous. Manteel +1",
    })

    sets.aftercast = { }
    sets.aftercast.Idle = {    -- DT 60    
        main        = "Carnwenhan",
        sub         = "Ammurapi Shield", 
        range       = "Gjallarhorn",
        head        = "Bunzi's Hat", -- 7
        body        = "Bunzi's Robe", -- 10
        hands       = "Bunzi's Gloves", -- 8
        legs        = "Bunzi's Pants", -- 9
        feet        = "Bunzi's Sabots", -- 6
        neck        = "Warder's Charm +1", -- 6
        waist       = "Slipor Sash", 
        left_ear    = "Hearty Earring",
        right_ear   = "Odnowa Earring +1", -- 3
        left_ring   = "Moonlight Ring", -- 5
        right_ring  = "Shadow Ring",
        back        = "Moonlight Cape" -- 6
    }
    sets.aftercast.Engaged = {
        main        = "Carnwenhan",
        sub         = "Genmei Shield", 
        range       = { name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+2','CHR+8',}},
        head        = "Bunzi's Hat",
		body		= "Nyame Mail",
        hands       = "Bunzi's Gloves",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
        neck        = "Bard's Charm +2",
        waist       = "Sailfi Belt +1",
        left_ear    = "Crep. Earring",
        right_ear   = "Telos Earring",
        left_ring   = "Moonlight Ring", 
        right_ring  = "Chirich Ring +1", 
        back        = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
end

function precast(spell)
    if spell.interrupted == true or spell.target.hpp == 0 or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end
    if spell.action_type == 'Magic' then        
        if spell.skill == 'Singing' and sets.precast.FC[spell.skill] then 
            if DummySongs:contains(spell.name) then
                equip(sets.precast.FC[spell.skill].DummySong)
            elseif sets.precast.FC[spell.skill][spell.name] then
                equip(sets.precast.FC[spell.skill][spell.name])
            else
                equip(sets.precast.FC[spell.skill])
            end
        elseif sets.precast.FC then
            if spell.english == 'Dispelga' then
                equip(set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"}))
            else
                equip(sets.precast.FC)
            end
        end
    elseif spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123,'Unable to use: '..spell.english..'. Not enough TP.')
            cancel_spell()
            return
        end
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        elseif sets.precast.WS then
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
        if sets.precast.JA[spell.english] then
            equip(sets.precast.JA[spell.english])
        end
    end
end

function midcast(spell)
    if spell.skill == 'Singing' then 
        if DummySongs:contains(spell.name) then
            return
        end
        
        if string.find(spell.name,'Ballad') and sets.midcast[spell.skill].Ballad then
            equip(sets.midcast['Singing'].Ballad)
        elseif string.find(spell.name,'Carol') and sets.midcast[spell.skill].Carol then
            equip(sets.midcast[spell.skill].Carol)
        elseif string.find(spell.name,'Minne') and sets.midcast[spell.skill].Minne then
            equip(sets.midcast[spell.skill].Minne)
        elseif string.find(spell.name,'Threnody') and sets.midcast[spell.skill].Threnody then
            equip(sets.midcast[spell.skill].Threnody)
        elseif string.find(spell.name,'Mambo') and sets.midcast[spell.skill].Mambo then
            equip(sets.midcast[spell.skill].Mambo)
        elseif string.find(spell.name,'Etude') and sets.midcast[spell.skill].Etude then
            equip(sets.midcast[spell.skill].Etude)
        elseif string.find(spell.name,'Minuet') and sets.midcast[spell.skill].Minuet then
            equip(sets.midcast[spell.skill].Minuet)
        elseif string.find(spell.name,'Paeon') and sets.midcast[spell.skill].Paeon then
            equip(sets.midcast[spell.skill].Paeon)
        elseif string.find(spell.name,'Scherzo') and sets.midcast[spell.skill].Scherzo then
            equip(sets.midcast[spell.skill].Scherzo)
        elseif string.find(spell.name,'March') and sets.midcast[spell.skill].March then
            if spell.name == 'Honor March' then
                equip(set_combine(sets.midcast[spell.skill].March, {range="Marsyas"}))
            else
                equip(sets.midcast[spell.skill].March)
            end
        elseif string.find(spell.name,'Madrigal') and sets.midcast[spell.skill].Madrigal then
            equip(sets.midcast[spell.skill].Madrigal)
        elseif string.find(spell.name,'Lullaby') then
            if spell.name:startswith('Horde') and sets.midcast[spell.skill].Horde then
                equip(sets.midcast[spell.skill].Horde)
            elseif sets.midcast[spell.skill].Lullaby then
                equip(sets.midcast[spell.skill].Lullaby)
            end
        end
    elseif sets.midcast[spell.skill] then
        if spell.skill == 'Healing Magic' then
            if spell.name:startswith('Cur') and spell.name ~= "Cursna" and sets.midcast[spell.skill].Cure then
                equip(sets.midcast[spell.skill].Cure)
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.name == 'Dispelga' and sets.midcast[spell.skill][spell.name] == nil then
                equip(set_combine(sets.midcast[spell.skill],{main='Daybreak'}))
            elseif sets.midcast[spell.skill][spell.name] then
                equip(sets.midcast[spell.skill][spell.name])
            else
                equip(sets.midcast[spell.skill])
            end
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
            equip(sets.midcast[spell.skill])
        end
    end
end

function aftercast(spell)
	equip_check()
end

function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
end

function buff_change(buff,gain)
    if buff == 'silence' and gain then
        if player.inventory['Echo Drops'] then
            send_command('@input /item "Echo Drops" <me>')
        else
            add_to_chat(123,'Silenced, you are out of Echo Drops!')	
        end
    end    
end

function equip_check()
    if player.status == 'Engaged' then
        if egs ~= nil and sets.aftercast.Engaged[egs] then 
            equip(sets.aftercast.Engaged[egs])
        else
            egs = nil
            equip(sets.aftercast.Engaged)
        end
    else
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            equip(aftercast.Idle[ids])
        else
            ids = nil
            equip(sets.aftercast.Idle)
        end
    end
end

function self_command(cmd)
    local args = T(cmd:split(' '))
    if args[1] == 'cycle' and args[2] then
        if args[2] == 'idle' then
            local last_ids = ids 
            for k,v in pairs(sets.aftercast.Idle) do
                if slot_names:contains(k) then
                    -- do nothing
                elseif ids == nil then
                    ids = k
                    break
                elseif ids == k then
                    ids = nil
                end
            end
            if last_ids == ids then ids = nil end
            if ids == nil then 
                add_to_chat('Idle mode set to: Default')
            else
                add_to_chat('Idle mode set to: '..ids)
            end
            equip_check()
        elseif args[2] == 'engaged' then
            local last_egs = egs 
            for k,v in pairs(sets.aftercast.Engaged) do
                if slot_names:contains(k) then
                    -- do nothing
                elseif egs == nil then
                    egs = k
                    break
                elseif egs == k then
                    egs = nil
                end
            end
            if last_egs == eds then egs = nil end
            if egs == nil then 
                add_to_chat('Engaged mode set to: Default')
            else
                add_to_chat('Engaged mode set to: '..egs)
            end
            equip_check()
        end
    elseif args[1] == 'equip_check' then
        equip_check()
    end
end