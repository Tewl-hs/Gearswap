--[[
	Author: Tewl / Bismark
	Files: Tewl_RDM.lua 

    Binds
    CTRL+F9     : Toggle burst mode on and off
    CTRL+F10    : Cycle Idle sets
    CTRL+F11    : Cycle Engaged sets
--]]
function get_sets()	
    items = require('resources').items
    require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')
    -- Personal settings. You can remove these two lines.
    set_macros(14,1)
    send_command('wait 1;input /lockstyleset 10')
	send_command('input //equipviewer pos 1663 935') 

    send_command('bind ^f9 gs c toggle burst')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c cycle engaged')

    sets.MoveSpeed = { legs = "Carmine Cuisses +1",} 
    BurstMode = false
    CurrentWeapon = 'Crocea Mors'

    Capes = {}
    Capes.DW = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
    Capes.WSD = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    Capes.MND = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}}
    Capes.INT = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
                
    sets.Enmity = {
        main		= { name="Crocea Mors", augments={'Path: C',}},
        sub			= "Genmei Shield",
        ammo		= "Staunch Tathlum +1",
        head		= "Leth. Chappel +2",
        body		= "Lethargy Sayon +3",
        hands		= "Leth. Ganth. +3",
        legs		= { name="Nyame Flanchard", augments={'Path: B',}},
        feet		= { name="Nyame Sollerets", augments={'Path: B',}},
        neck		= "Unmoving Collar +1",
        waist		= "Kasiri Belt",
        left_ear	= "Cryptic Earring",
        right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring	= "Supershear Ring",
        right_ring	= "Eihwaz Ring",
        back		= { name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Mag. Evasion+15',}},
    }
    sets.precast = {}
    sets.precast.FC = { -- 106
        ammo		= "Sapience Orb", -- 2
        head		= "Atrophy Chapeau +3", -- 16
        body		= "Viti. Tabard +3", -- 15
        hands		= "Leyline Gloves", -- 5
        legs		= "Psycloth Lappas", -- 7
        feet		= { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        waist		= "Embla Sash", -- 5
        left_ear	= "Malignance earring", -- 4
        right_ear	= "Leth. Earring +1", -- 7
        left_ring   = "Kishar Ring",
        right_ring	= "Lebeche Ring", -- 0|2
        back		= Capes.MND -- 10
    }
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"})
    sets.precast.FC.Impact = set_combine(sets.precast.FC,{head=empty,body="Twilight Cloak"})
    sets.precast.JA = {
        ['Composure'] = { },
        ['Saboteur'] = {hands="Leth. Ganth. +3",},
        ['Chainspell'] = {body="Viti. Tabard +3"},
        ['Vallation'] = sets.Enmity,
        ['Valiance'] = sets.Enmity
    }
    sets.precast.WS = {
        ammo		= "Coiste Bodhar",
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Nyame Gauntlets",
        legs		= "Nyame Flanchard",
        feet		= "Nyame Sollerets",
        neck		= "Fotia Gorget",
        left_ear	= "Ishvara Earring",
        right_ear	= "Moonshade Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring	= "Karieyh Ring +1",
        waist		= "Fotia Belt",
        waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
        back		= Capes.WSD,
    }
    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS,{
        hands		= "Jhakri Cuffs +2",
        feet		= "Leth. Houseaux +3",
        neck		= "Dls. Torque +2",
        left_ear	= "Sherida Earring",
        right_ear	= "Regal Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring	= "Metamor. Ring +1",

    })
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS,{
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Nyame Gauntlets",
        legs		= "Nyame Flanchard",
        feet		= "Nyame Sollerets",
        neck        = "Anu Torque",
        left_ear    = "Moonshade Earring",
        right_ear   = "Ishvara Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring	= "Karieyh Ring +1",
        waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
        back		= Capes.WSD,
    })

    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, { 
        ammo		= "Sroda Tathlum",
        head		= "Pixie Hairpin +1",
        body		= "Nyame Mail",
        hands		= "Jhakri Cuffs +2",
        legs		= "Nyame Flanchard",
        feet		= "Nyame Sollerets",
        neck		= "Sibyl Scarf",
        left_ear	= "Malignance Earring",
        right_ear	= "Regal Earring",
        left_ring	= "Archon Ring",
        right_ring	= "Epaminondas's Ring",
        waist		= "Orpheus's Sash",
        back		= Capes.INT
    })
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Sanguine Blade'], {
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Jhakri Cuffs +2",
        legs		= "Leth. Fuseau +3",
        feet		= "Leth. Houseaux +3",
        right_ear	= "Moonshade Earring",
        left_ring	= "Epaminondas's Ring",
        right_ring	= "Karieyh Ring +1",
    })
    sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Jhakri Cuffs +2",
        legs		= "Leth. Fuseau +3",
        feet		= "Leth. Houseaux +3",
        right_ear	= "Moonshade Earring",
        left_ring	= "Epaminondas's Ring",
        right_ring	= "Karieyh Ring +1",
    })

    sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS, { 
        ammo		= "Coiste Bodhar",
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Nyame Gauntlets",
        legs		= "Nyame Flanchard",
        feet		= "Nyame Sollerets",
        neck		= "Rep. Plat. Medal",
        left_ear	= "Regal Earring",
        right_ear	= "Moonshade Earring",
        left_ring	= "Metamor. Ring +1",
        right_ring	= "Epaminondas's Ring",
        waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
        back		= Capes.INT
    })

    sets.midcast = {}	
    sets.midcast['Healing Magic'] = {
        head		= "Kaykaus Mitra +1",
        body		= "Kaykaus Bliaut +1",
        hands		= "Kaykaus Cuffs +1",
        legs		= "Kaykaus Tights +1",
        feet		= "Kaykaus Boots +1",
        neck		= "Incanter's Torque",
        waist		= "Luminary Sash",
        left_ear	= "Malignance Earring",
        right_ear	= "Mendicant's Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        back		= Capes.MND
    }
    sets.midcast['Healing Magic'].Cursna = set_combine(sets.midcast['Healing Magic'], {
        feet        = "Gende. Galosh. +1",
        left_ring   = "Haoma's Ring",
        right_ring  = "Menelaus's Ring"
    })
    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'], {	
        neck		= "Nodens Gorget",
        left_ear	= "Malignance Earring",
        right_ear	= "Mendicant's Earring",
        left_ring	= { name="Naji's Loop", bag="wardrobe7" },
        right_ring   = "Menelaus's Ring",
    })
    sets.midcast['Divine Magic'] = {

    }
    sets.midcast['Divine Magic'].Flash = set_combine(sets.midcast['Divine Magic'], {
        main		= { name="Crocea Mors", augments={'Path: C',}},
        sub			= "Genmei Shield",
        ammo		= "Staunch Tathlum +1",
        head		= "Leth. Chappel +2",
        body		= "Lethargy Sayon +3",
        hands		= "Leth. Ganth. +3",
        legs		= { name="Nyame Flanchard", augments={'Path: B',}},
        feet		= { name="Nyame Sollerets", augments={'Path: B',}},
        neck		= "Unmoving Collar +1",
        waist		= "Kasiri Belt",
        left_ear	= "Cryptic Earring",
        right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring	= "Supershear Ring",
        right_ring	= "Eihwaz Ring",
        back		= { name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Mag. Evasion+15',}},
    })
    sets.midcast['Enfeebling Magic'] = {
        main        = { name="Contemplator +1", augments={'Path: A',}},
        sub         = "Enki Strap",
       -- main		= { name="Crocea Mors", augments={'Path: C',}},
        --sub         = "Ammurapi Shield",
        ammo		= "Regal Gem",
        head		= "Viti. Chapeau +3",
        body		= "Atrophy Tabard +3",
        hands		= "Leth. Ganth. +3",
        legs		= { name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Enmity-4','MND+9','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
        feet		= "Vitiation Boots +3",
        neck		= "Dls. Torque +2",
        left_ear	= "Regal Earring",
        right_ear	= "Snotra Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        waist		= "Obstin. Sash",
        back		= Capes.MND
    }
    sets.midcast['Enfeebling Magic'].MND = set_combine(sets.midcast['Enfeebling Magic'], { 
        back		= "Aurist's Cape +1",
    })
    sets.midcast['Enfeebling Magic'].INT = set_combine(sets.midcast['Enfeebling Magic'], { 
        back		= Capes.INT
    })
    sets.midcast['Enfeebling Magic'].Dispel = set_combine(sets.midcast['Enfeebling Magic'].INT, {
        neck		= "Dls. Torque +2",
        left_ring	= "Kishar Ring",
    })
    sets.midcast['Enfeebling Magic'].Sleep = set_combine(sets.midcast['Enfeebling Magic'].INT, {
        neck		= "Dls. Torque +2",
        left_ring	= "Kishar Ring",
    })
    sets.midcast['Enhancing Magic'] = {	
        main        = { name="Sakpata's Sword", augments={'Path: A',}},
        sub         = "Forfend +1",
        ammo		= "Staunch Tathlum +1",
        head		= "Telchine Cap",
        body		= "Viti. Tabard +3",
        hands       = "Atrophy Gloves +3", -- 10
        legs		= "Telchine Braconi",
        feet        = "Leth. Houseaux +3",  -- 30%
        neck		= "Incanter's Torque",
        left_ear	= "Mimir Earring",
        right_ear	= "Leth. Earring +1",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        waist		= "Embla Sash",
        back		= Capes.MND,
    }
    sets.midcast['Enhancing Magic'].SelfDuration = set_combine(sets.midcast['Enhancing Magic'], {
        sub         = "Ammurapi Shield",
        body        = "Lethargy Sayon +3",
        neck		= "Dls. Torque +2",
        left_ear	= "Malignance Earring",
        left_ring   = "Kishar Ring",
    })
    sets.midcast['Enhancing Magic'].Composure = set_combine(sets.midcast['Enhancing Magic'], {
        sub         = "Ammurapi Shield",
        head        = "Leth. Chappel +3",
        body        = "Lethargy Sayon +3",
        legs        = "Leth. Fuseau +3",   
        neck		= "Dls. Torque +2",
        left_ear	= "Malignance Earring",
        left_ring   = "Kishar Ring",
        right_ring  = "Rahab Ring",
        -- back     = "Ghostfyre Cape"
    })
    sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], { 
        head		= "Amalric Coif +1",
        body		= "Atrophy Tabard +3",
        legs		= "Leth. Fuseau +3",
        neck		= "Dls. Torque +2",
        waist		= "Gishdubar Sash",
    })
    sets.midcast['Enhancing Magic'].Phalanx = set_combine(sets.midcast['Enhancing Magic'], { 
        main        = { name="Sakpata's Sword", augments={'Path: A',}},
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
        hands       = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
        legs        = { name="Taeon Tights", augments={'"Fast Cast"+3','Phalanx +3',}},
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}},
        neck		= "Dls. Torque +2",
    })
    sets.midcast['Enhancing Magic'].Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main        = { name="Sakpata's Sword", augments={'Path: A',}},
        sub         = "Ammurapi Shield",
        head		= "Amalric Coif +1",
        --hands		= "Regal Cuffs",
        legs        = "Shedir Seraweels",
        neck		= "Dls. Torque +2",
        left_ear	= "Magnetic Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        waist		= "Emphatikos Rope",
    })
    sets.midcast['Enhancing Magic'].Stoneskin = set_combine(sets.midcast['Enhancing Magic'].Duration, {
        main        = { name="Sakpata's Sword", augments={'Path: A',}},
        sub         = "Ammurapi Shield",
        head        = "Leth. Chappel +3",
        body		= "Lethargy Sayon +3",
        legs        = "Shedir Seraweels",
        neck		= "Nodens Gorget",
        waist		= "Siegel Sash",
    })
    sets.midcast['Elemental Magic'] = {
        main		= "Bunzi's Rod",
        sub         = "Ammurapi Shield",
        ammo		= "Ghastly Tathlum +1",
        head        = "Leth. Chappel +3",
        body		= "Amalric Doublet +1",
        hands		= "Amalric Gages +1",
        legs		= "Amalric Slops +1",
        feet		= "Amalric Nails +1",
        neck		= "Sibyl Scarf",
        left_ear	= "Malignance Earring",
        right_ear	= "Regal Earring",
        left_ring	= "Freke Ring",
        right_ring	= "Metamor. Ring +1",
        waist		= "Refoccilation Stone",
        back		= Capes.INT
    }
    sets.midcast['Elemental Magic'].Debuff = set_combine(sets.midcast['Elemental Magic'], { })
    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        head		= "Ea Hat +1",
        body		= "Ea Houppe. +1",
        legs		= "Ea Slops +1",
        right_ring	= "Mujin Band",      
    })
    sets.midcast['Dark Magic'] =  {
        back		= Capes.INT
    }
    sets.midcast['Dark Magic'] =  set_combine(sets.midcast['Dark Magic'], { })
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        main        = "Maxentius",
        sub			= "Genmei Shield",
        ammo		= "Aurgelmir Orb +1",
        head		= "Malignance Chapeau",
        body		= "Malignance Tabard",
        hands		= "Bunzi's Gloves",
        legs		= "Malignance Tights",
        feet		= "Malignance Boots",
        neck		= "Anu Torque",
        left_ear	= "Sherida Earring",
        right_ear	= "Telos Earring",
        left_ring	= "Ilabrat Ring",
        right_ring	= "Chirich Ring +1",
        waist		= "Sailfi Belt +1",
        back		= Capes.DW
    }
    sets.aftercast.Idle = {
        main        = { name="Sakpata's Sword", augments={'Path: A',}},
        sub         = "Genmei Shield",
        ammo		= "Homiliary",
        head		= "Viti. Chapeau +3",
        body		= "Jhakri Robe +2",
        hands		= { name="Merlinic Dastanas", augments={'Pet: AGI+2','"Store TP"+4','"Refresh"+2','Accuracy+20 Attack+20',}},
        legs		= { name="Chironic Hose", augments={'"Mag.Atk.Bns."+11','STR+12','"Refresh"+2','Accuracy+15 Attack+15',}},
        feet        = { name="Merlinic Crackows", augments={'Accuracy+7','Pet: "Dbl. Atk."+1','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        neck		= "Loricate Torque +1",
        waist		= "Fucho-no-obi",
        left_ear	= "Etiolation Earring",
        right_ear	= "Genmei Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        back        = "Moonlight Cape",
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {	
        main        = { name="Sakpata's Sword", augments={'Path: A',}},
        sub         = "Genmei Shield",
        ammo		= "Staunch Tathlum +1",
        head		= "Leth. Chappel +3",
        body		= "Lethargy Sayon +3",
        hands		= "Leth. Ganth. +3",
        legs		= { name="Nyame Flanchard", augments={'Path: B',}},
        feet		= { name="Nyame Sollerets", augments={'Path: B',}},
        neck		= "Warder's Charm +1",
        waist		= "Slipor Sash",
        left_ear	= "Eabani Earring",
        right_ear	= { name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring	= "Shadow Ring",
        right_ring	= "Stikini Ring +1",
        back        = "Moonlight Cape",
    })
    include('FFXI-Display.lua')	
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
end

function precast(spell)
	if spell.interrupted == true or (spell.target.hpp == 0  and not spell.name:startswith("Raise")) or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end
    if spell.action_type == 'Magic' and sets.precast.FC then
        if spell.name:startswith('Cur') and spell.name ~= 'Cursna' then
            equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
        elseif sets.precast.FC[spell.name] then
            equip(sets.precast.FC[spell.name])
        else
            equip(sets.precast.FC)
        end
    elseif spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123,'Unable to use: '..spell.name..'. Not enough TP.')
            cancel_spell()
            return
        end
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        elseif sets.precast.WS then
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end
    end
end
	
function midcast(spell,action)	
    if sets.midcast[spell.skill] then
        if spell.skill == 'Healing Magic' then
            if spell.name:startswith('Cur') and spell.name ~= "Cursna" and sets.midcast[spell.skill].Cure then
                equip(sets.midcast[spell.skill].Cure)
            elseif sets.midcast[spell.skill][spell.name] then
                equip(sets.midcast[spell.skill][spell.name])
            else
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Dark Magic' then
            if spell.name:startswith('Aspir') or spell.name:startswith('Drain') and sets.midcast[spell.skill].AspirDrain then
                equip(sets.midcast[spell.skill].AspirDrain)
            elseif sets.midcast[spell.skill][spell.name] then
                equip(sets.midcast[spell.skill][spell.name])
            else
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Elemental Magic' then
            if EleDebuff:contains(spell.name) and sets.midcast[spell.skill].Debuff then
                equip(sets.midcast[spell.skill].Debuff)
            elseif sets.midcast[spell.skill].Burst and BurstMode == true then               
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst == nil then
                    equip(set_combine(sets.midcast[spell.skill].Burst,{head=empty,body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst then
                    equip(sets.midcast[spell.skill][spell.name].Burst)
                else
                    equip(sets.midcast[spell.skill].Burst)
                end
            else        
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] == nil then
                    equip(set_combine(sets.midcast[spell.skill],{head=empty,body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] then
                    equip(sets.midcast[spell.skill][spell.name])
                else
                    equip(sets.midcast[spell.skill])
                end
            end 
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip({waist="Hachirin-no-Obi"})
            elseif spell.target.distance < (1.7 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            elseif spell.target.distance < (8 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.name == 'Dispelga' and sets.midcast[spell.skill][spell.name] == nil then
                equip(set_combine(sets.midcast[spell.skill],{main='Daybreak'}))
			elseif spell.name:startswith('Sleep') and sets.midcast[spell.skill].Sleep then
					equip(sets.midcast[spell.skill].Sleep)
			elseif IntEnf:contains(spell.name) then
				if sets.midcast[spell.skill].INT[spell.name] then
					equip(sets.midcast[spell.skill].INT[spell.name])
				elseif sets.midcast[spell.skill].INT then
					equip(sets.midcast[spell.skill].INT)
				else
					equip(sets.midcast[spell.skill])
				end
			elseif MndEnf:contains(spell.name) then
				if sets.midcast[spell.skill].MND[spell.name] then
					equip(sets.midcast[spell.skill].MND[spell.name])
				elseif sets.midcast[spell.skill].MND then
					equip(sets.midcast[spell.skill].MND)
				else
					equip(sets.midcast[spell.skill])
				end
			else
				if sets.midcast[spell.skill][spell.name] then
					equip(sets.midcast[spell.skill][spell.name])
				else
					equip(sets.midcast[spell.skill])
				end
            end
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name:startswith('Refresh') and spell.target.type == 'SELF' and sets.midcast[spell.skill].Refresh then
				equip(sets.midcast[spell.skill].Refresh)
			elseif spell.name:startswith('Phalanx') and spell.target.type == 'SELF' and sets.midcast[spell.skill].Phalanx then
				equip(sets.midcast[spell.skill].Phalanx)
            elseif spell.target.type == 'SELF' then
                equip(sets.midcast[spell.skill].SelfDuration)
			elseif sets.midcast[spell.skill][spell.name] then
				equip(sets.midcast[spell.skill][spell.name])
            elseif spell.target.type ~= 'SELF' and buffactive['Composure'] then
                equip(sets.midcast[spell.skill].Composure)
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
	if name == "silence" and gain then
		if player.inventory['Echo Drops'] then
			send_command('@input /item "Echo Drops" <me>')
		else
			add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
		end
    elseif buff == 'stun' and gain then
        equip_check()
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
            equip(sets.aftercast.Idle[ids])
        else
            ids = nil
            equip(sets.aftercast.Idle)
        end
    end
	update_status()
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
            if last_egs == egs then egs = nil end
            if egs == nil then 
                add_to_chat('Engaged mode set to: Default')
            else
                add_to_chat('Engaged mode set to: '..egs)
            end
            equip_check()
        end
		update_status()
    elseif args[1] == 'toggle' and args[2] then
        if args[2] == 'burst' then
            if BurstMode == false then
                BurstMode = true
                add_to_chat('BurstMode enabled.')
            else
                BurstMode = false
                add_to_chat('BurstMode disabled.')
            end
        end
		update_status()
    elseif args[1] == 'equip_check' then
        equip_check()
	elseif args[1] == 'update_status' then
		update_status()
    end
end

windower.raw_register_event('outgoing chunk', function(id, data)
	if id == 0x00D and stateBox then
		stateBox:hide()
	end
end)

windower.raw_register_event('incoming chunk', function(id, data)
	if id == 0x00A and stateBox then
		stateBox:show()
	end
	if id == 0x050 then
		equip_change()
	end
end)

function update_status()
	local spc = '   '
    local WeaponColor = get_weapon_color(CurrentWeapon)

    local engaged_display = egs or 'Default'
    local idle_display = ids or 'Default'

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)
	
	if BurstMode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'BurstMode', spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	if item and items[item['id']] then 
		local ew = items[item['id']].name
		if ew ~= CurrentWeapon then -- If weapon changed
			if ew == 'Gil' then
				CurrentWeapon = 'Empty'
				TwoHandedWeapon = false
				if auto_hasso == true then auto_hasso = false update_status() end
			else
				CurrentWeapon = ew
				if T{4,6,7,8,10,12}:contains(items[item['id']].skill) then -- GS GA Scythe Polearm GK Staff
					TwoHandedWeapon = true
				else 
					TwoHandedWeapon = false	
					if auto_hasso == true then auto_hasso = false update_status() end
				end
			end	
			update_status()
		end
	end
end