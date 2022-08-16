function get_sets()			
	sets.MoveSpeed = { legs = "Carmine Cuisses +1",}    --auto swaps when moving

    Macro_Book = '14'
    Macro_Page = '1'
	send_command('input /macro book '..Macro_Book..';wait 0.2;input /macro set '..Macro_Page..';wait 1;input /lockstyleset 10')
    send_command('input //equipviewer pos 1663 933')

	-- Any enfeebles not listed below should use default set which should be focused on enfeebling skill+
	IntEnf = T{'Blind', 'Blind II', 'Bind', 'Distract', 'Distract II', 'Distract III', 'Poison', 'Poisonm II', 'Poisonga'}
	MndEnf = T{'Silence', 'Paralyze', 'Paralyze II', 'Slow', 'Slow II', 'Addle', 'Addle II', 'Dia', 'Dia II', 'Dia III', 'Frazzle', 'Frazzle II', 'Frazzle III',}

	Capes = {}
	Capes.DW = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	Capes.WSD = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Capes.MND = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}}
	Capes.INT = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
				
	sets.precast = {}
	sets.precast.FastCast = { -- 101
		ammo		= "Sapience Orb", -- 2
		head		= "Atrophy Chapeau +3", -- 16
		body		= "Viti, Tabard +3", -- 15
		hands		= "Leyline Gloves", -- 5
		legs		= "Psycloth Lappas", -- 7
		feet		= { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
		waist		= "Embla Sash", -- 5
		left_ear	= "Malignance earring", -- 4
		right_ear	= "Loquac. Earring", -- 2
        left_ring   = "Kishar Ring",
		right_ring	= "Lebeche Ring", -- 0|2
		back		= Capes.MND -- 10
	}
	sets.precast.JA = {
        ['Composure'] = { },
		['Saboteur'] = {hands = "Leth. Gantherots +1",},
		['Chainspell'] = {body="Viti. Tabard +3"}
	}
	sets.precast.WS = {
		neck		= "Fotia Gorget",
        left_ear	= "Ishvara Earring",
        right_ear	= "Moonshade Earring",
        left_ring	= "Karieyh Ring +1",
        right_ring	= "Epaminondas's Ring",
        waist		= "Fotia Belt",
	}
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
		ammo		= "Pemphredo Tathlum",
        head		= "Pixie Hairpin +1",
		body		= "Nyame Mail",
        hands		= "Jhakri Cuffs +2",
        legs		= "Amalric Slops +1",
		feet		= "Nyame Sollerets",
        neck		= "Sibyl Scarf",
        left_ear	= "Malignance Earring",
        right_ear	= "Regal Earring",
        left_ring	= "Archon Ring",
        right_ring	= "Metamor. Ring +1",
        waist		= "Orpheus's Sash",
		back		= Capes.INT
	})

	sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS, { 
		ammo		= "Coiste Bodhar",
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
        neck		= "Rep. Plat, Medal",
        left_ear	= "Regal Earring",
        right_ear	= "Moonshade Earring",
        left_ring	= "Metamor. Ring +1",
        right_ring	= "Epaminondas's Ring",
		waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
		back		= Capes.INT
	})
	
	sets.midcast = {}	
	sets.midcast.Cursna = {

	}	
	sets.midcast.Cure = {	
		head		= "Vanya Hood",
		body		= "Heka's Kalasiris",
		hands		= "Vanya Cuffs",
		legs		= "Atrophy Tights +3",
		feet		= "Vanya Clogs",
		neck		= "Nodens Gorget",
		waist		= "Othila Sash",
		left_ear	= "Malignance Earring",
		right_ear	= "Mendicant's Earring",
		left_ring	= { "Naji's Loop", bag="wardrobe4" },
		right_ring	= { "Lebeche Ring", bag="wardrobe4" },
		back		= Capes.MND
	}
	sets.midcast.Healing = {

	}
	sets.midcast.Enfeebling = {
        ammo		= "Regal Gem",
        head		= "Viti. Chapeau +3",
        body		= "Atrophy Tabard +3",
        hands		= "Leth. Gantherots +1",
        legs		= { name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Enmity-4','MND+9','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
        feet		= "Vitiation Boots +3",
        neck		= "Incanter's Torque",
        left_ear	= "Regal Earring",
        right_ear	= "Snotra Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
		waist		= "Obstin. Sash",
		back		= Capes.MND
	}
	sets.midcast.Enfeebling.Dispel = set_combine(sets.midcast.IntEnfeeblesAcc, {
        neck		= "Dls. Torque +2",
        left_ring	= "Kishar Ring",
    })
	sets.midcast.Enfeebling.MND = set_combine(sets.midcast.Enfeebling, { 
		back		= "Aurist's Cape +1",
	})
	sets.midcast.Enfeebling.INT = set_combine(sets.midcast.Enfeebling, { 
		back		= Capes.INT
	})
	sets.midcast.Enfeebling.Sleep = set_combine(sets.midcast.IntEnfeeblesAcc, {
        neck		= "Dls. Torque +2",
        left_ring	= "Kishar Ring",
    })
	sets.midcast.Enhancing = {	
        head		= "Telchine Cap",
        body		= "Viti. Tabard +3",
        hands       = "Atrophy Gloves +3", -- 10
        legs		= "Telchine Braconi",
        feet        = "Leth. Houseaux +1",  -- 30%
        neck		= "Incanter's Torque",
        left_ear	= "Mimir Earring",
        right_ear	= "Andoaa Earring",
        left_ring   = { name="Stikini Ring +1", bag="wardrobe7", priority=2},
        right_ring  = { name="Stikini Ring +1", bag="wardrobe8", priority=1},
        --back		= "Ghostfyre Cape",
		back		= Capes.MND,
        waist		= "Embla Sash",
	}
	sets.midcast.Enhancing.Refresh = set_combine(sets.midcast.Enhancing, { 
		head		= "Amalric Coif +1",
		body		= "Atrophy Tabard +3",
		legs		= "Leth. Fuseau +1",
		waist		= "Gishdubar Sash",
        back		= "Grapevine Cape"
	})
	sets.midcast.Enhancing.Phalanx = set_combine(sets.midcast.Enhancing, { 
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
        hands       = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
        legs        = { name="Taeon Tights", augments={'"Fast Cast"+3','Phalanx +3',}},
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}},
	})
	sets.midcast.Enhancing.Aquaveil = set_combine(sets.midcast.Enhancing, {
        ammo		= "Staunch Tathlum +1",
        head		= "Amalric Coif +1",
        --hands		= "Regal Cuffs",
        left_ear	= "Halasz Earring",
        left_ring	= "Freke Ring",
        right_ring	= "Evanescence Ring",
        --waist		= "Emphatikos Rope",
    })
	sets.midcast.Enhancing.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        neck		= "Nodens Gorget",
        waist		= "Siegel Sash",
    })
	sets.midcast.Elemental = {
		ammo		= "Ghastly Tathlum +1",
        head        = "Jhakri Coronal +2",
        body		= "Amalric Doublet +1",
        hands		= "Amalric Gages +1",
        legs		= "Amalric Slops +1",
        feet		= "Amalric Nails +1",
        neck		= "Baetyl Pendant",
        left_ear	= "Malignance Earring",
        right_ear	= "Regal Earring",
        left_ring	= "Freke Ring",
        right_ring	= "Metamor. Ring +1",
        waist		= "Refoccilation Stone",
		back		= Capes.INT
	}
	sets.midcast.Dark =  { -- Bio, Drain, Aspir, Stun
		back		= Capes.INT
	}
	sets.midcast.Divine = { -- Banish, Flash, Repose
		back		= Capes.MND
	}
	sets.aftercast = {}
	sets.aftercast.Engaged = {
        ammo		= "Aurgelmir Orb +1",
        head		= "Malignance Chapeau",
        body		= "Malignance Tabard",
        hands		= "Malignance Gloves",
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
		main		= "Crocea Mors",
		sub			= "Ammurapi Shield",
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
		back		= "Solemnity Cape"
	}
	sets.aftercast.DT = set_combine(sets.aftercast.Idle, {		
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
	})
end

function precast(spell)
    if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.english] then
			equip(sets.precast.JA[spell.english])
		end
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
	elseif spell.action_type == 'Magic' then
        if buffactive.Silence then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
                add_to_chat(123,'You were silenced try recasting!')	
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
		end
		equip(sets.precast.FastCast)
	end
end
	
function midcast(spell,action)	
	if spell.action_type == 'Magic' then
		if spell.skill == 'Healing Magic' then
			if spell.english == 'Cursna' then
				equip(sets.midcast.Cursna)
			elseif spell.english:startswith('Cur') then
				equip(sets.midcast.Cure)
			else
				if sets.midcast.Healing[spell.name] then
					equip(sets.midcast.Healing[spell.name])
				else
					equip(sets.midcast.Healing)
				end
			end
		elseif spell.skill == 'Enfeebling Magic' then
			if spell.name:startswith('Sleep') then
				equip(sets.midcast.Enfeebling.Sleep)
			elseif spell.name:startswith('Dispel') then
				equip(sets.midcast.Enfeebling.Dispel)
			elseif IntEnf:contains(spell.name) then
				if sets.midcast.Enfeebling.INT[spell.name] then
					equip(sets.midcast.Enfeebling.INT[spell.name])
				else
					equip(sets.midcast.Enfeebling.INT)
				end
			elseif MndEnf:contains(spell.name) then
				if sets.midcast.Enfeebling.MND[spell.name] then
					equip(sets.midcast.Enfeebling.MND[spell.name])
				else
					equip(sets.midcast.Enfeebling.MND)
				end
			else
				if sets.midcast.Enfeebling[spell.name] then
					equip(sets.midcast.Enfeebling[spell.name])
				else
					equip(sets.midcast.Enfeebling)
				end
			end
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name:startswith('Refresh') and spell.target.type == 'SELF' then
				equip(sets.midcast.Enhancing.Refresh)
			elseif spell.name:startswith('Phalanx') and spell.target.type == 'SELF' then
				equip(sets.midcast.Enhancing.Phalanx)
			elseif sets.midcast.Enhancing[spell.name] then
				equip(sets.midcast.Enhancing[spell.name])
			else
				equip(sets.midcast.Enhancing)
			end
		elseif spell.skill == 'Elemental Magic' then
			if sets.midcast.Elemental[spell.name] then
				equip(sets.midcast.Elemental[spell.name])
			else
				equip(sets.midcast.Elemental)
			end
		elseif spell.skill == 'Dark Magic' then
			if sets.midcast.Dark[spell.name] then
				equip(sets.midcast.Dark[spell.name])
			else
				equip(sets.midcast.Dark)
			end
		elseif spell.skill == 'Divine Magic' then
			if sets.midcast.Divine[spell.name] then
				equip(sets.midcast.Divine[spell.name])
			else
				equip(sets.midcast.Divine)
			end
		end
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.aftercast.Engaged)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)
	if T{'Idle','Resting', 'Engaged'}:contains(new) then
		if player.status == 'Engaged' then
			equip(sets.aftercast.Engaged)
		else
			equip(sets.aftercast.Idle)
		end
	end
end

function buff_change(buff,gain)
	if name == "silence" and gain =="True" then
		if player.inventory['Echo Drops'] then
			send_command('@input /item "Echo Drops" <me>')
		else
			add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
		end
	end
end

function self_command(command)
	if command == 'swapgear' then
		if player.status == 'Engaged' then
			equip(sets.aftercast.Engaged)
		else
			equip(sets.aftercast.Idle)
		end
	end
end

--- Detecting Movement 
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
                send_command('gs c swapgear')
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