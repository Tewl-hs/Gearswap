--[[
	Author: Tewl / Bismark
	Files: Tewl_BLM.lua 

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

    send_command('bind ^f9 gs c toggle burst')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c cycle engaged')

    set_macros(3,1)
	send_command('wait 1.5;input /lockstyleset 5')

    sets.MoveSpeed = { feet = "Herald's Gaiters",}
	BurstMode = false
    RecoverMode = false

    CurrentWeapon = ''

    -- Gearsets
    sets.precast = {}
    sets.precast.WS = { }
    sets.precast.FC = { -- 80%
        ammo        = "Sapience Orb", -- 2
        head        = "Amalric Coif +1", -- 11
        body        = { name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5','MND+8','Mag. Acc.+10',}}, --11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = "Agwu's Slops", -- 7
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Loquacious Earring", -- 2
        right_ear   = "Malignance Earring", -- 4
        right_ring  = "Kishar Ring", -- 4 
        left_ring   = "Prolix Ring", -- 2
        back        = { name="Taranus's Cape", augments={'MP+60','"Fast Cast"+10',}}, -- 10
    }
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"})
    sets.precast.FC.Impact = set_combine(sets.precast.FC,{head=empty,body="Twilight Cloak"})

    sets.precast.JA = {
        ['Mana Wall'] = { feet = "Wicce Sabots +3", },
        ['Manafont'] = { 
            --body = "Archmage's Coat +3",
         },
        ['Elemental Seal'] = { },
        ['Cascade'] = { },
        ['Manawell'] = { },
        ['Subtle Sorcery'] = { },
    }

    sets.midcast = {}
    sets.midcast['Elemental Magic'] = {
        main        = "Bunzi's Rod",
        sub         = "Ammurapi Shield",
        ammo        = "Sroda Tathlum",
        head        = "Wicce Petasos +3",
        body        = "Wicce Coat +3",
        hands       = "Wicce Gloves +3",
        legs        = "Wicce Chausses +3",
        feet        = "Wicce Sabots +3",
        neck		= "Src. Stole +2",
        waist       = "Acuity Belt +1",
        left_ear    = "Regal Earring",
        right_ear   = "Malignance Earring",
        left_ring   = "Metamor. Ring +1",
        right_ring  = "Freke Ring",
        back        = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }
    sets.midcast['Elemental Magic'].Impact =  set_combine(sets.midcast['Elemental Magic'], {
        head        = empty,
        body        = "Twilight Cloak",
    })
    sets.midcast['Elemental Magic'].RecoverMode = set_combine(sets.midcast['Elemental Magic'], {
        body        = "Spaekona's Coat +3",
    })

    sets.midcast['Elemental Magic'].Debuff = set_combine(sets.midcast['Elemental Magic'], {
        ammo        = "Pemphredo Tathlum",
        body        = "Spaekona's Coat +3",
        hands       = "Spae. Gloves +3",
        legs        = "Arch. Tonban +3",
        feet        = "Arch. Sabots +3",
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = "Aurist's Cape +1"
    })
    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        ammo        = "Ghastly Tathlum +1",
        head		= "Ea Hat +1",
        body        = "Wicce Coat +3",
        hands       = "Agwu's Gages",
        legs        = "Wicce Chausses +3",
        feet        = "Agwu's Pigaches",
    })
    sets.midcast['Elemental Magic'].RecoverMode.Burst = set_combine(sets.midcast['Elemental Magic'].Burst, { 
        body        = "Spaekona's Coat +3",
    })
    sets.midcast['Enfeebling Magic'] = {
        main        = "Contemplator +1",
        sub         = "Khonsu",
        ammo        = "Pemphredo Tathlum",
        head        = "Wicce Petasos +3",
        body        = "Wicce Coat +3",
        hands       = "Wicce Gloves +3",
        legs        = "Wicce Chausses +3",
        feet        = "Wicce Sabots +3",
        neck		= "Src. Stole +2",
        waist       = "Acuity Belt +1",
        left_ear    = "Regal Earring",
        right_ear   = "Malignance Earring",
        left_ring   = "Metamor. Ring +1",
        right_ring  = "Kishar Ring",
        back        = "Aurist's Cape +1",
    }
    sets.midcast['Enfeebling Magic'].Dispelga = set_combine(sets.midcast['Enfeebling Magic'],sets.Dispelga)

    sets.midcast['Dark Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Pemphredo Tathlum",
        head        = "Agwu's Cap",
        body        = "Agwu's Robe",
        hands       = "Agwu's Gages",
        legs        = "Agwu's Slops",
        feet        = "Agwu's Pigaches",
        neck        = "Erra Pendant",
        waist       = "Luminary Sash",
        left_ear    = "Digni. Earring",
        right_ear   = "Crep. Earring",
        left_ring   = "Evanescence Ring",
        right_ring  = "Archon Ring",
        back        = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }
    sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
        head        = "Pixie Hairpin +1",
        waist       = "Fucho-no-Obi",
    })
    sets.midcast['Healing Magic'] = { 
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Staunch Tathlum +1",
        head        = "Vanya Hood",
        body        = "Vanya Robe",
        hands       = "Wicce Gloves +3",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs" ,
        neck        = "Incanter's Torque",
        left_ear    = "Etiolation Earring",
        right_ear   = "Halasz Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Austerity Belt +1",
        back        = "Solemnity Cape",
    }
    sets.midcast['Healing Magic'].Cursna = set_combine(sets.midcast['Healing Magic'], {
        left_ring   = "Menelaus's Ring",
        waist       = "Luminary Sash",
    })
    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'], {
        left_ear    = "Mendi. Earring",
        right_ring  = "Naji's Loop",
        left_ring   = "Menelaus's Ring",
    })
    sets.midcast['Enhancing Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Impatiens",
        head        = "Telchine Cap",
        body        = "Telchine Chas.",
        hands       = "Telchine Gloves", 
        legs        = "Telchine Braconi", 
        feet        = "Telchine Pigaches", 
        neck        = "Incanter's Torque",
        waist       = "Embla Sash", 
    }
    sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head        = "Amalric Coif +1",
        feet        = "Inspirited Boots",
        waist		= "Gishdubar Sash",
        --back		= "Grapevine Cape"
    })
    sets.midcast['Enhancing Magic'].Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        legs        = "Shedir Seraweels",
        neck		= "Nodens Gorget",
        waist		= "Siegel Sash",
    })
    sets.midcast['Enhancing Magic'].Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        head        = "Amalric Coif +1",
        legs        = "Shedir Seraweels",
    })
    sets.aftercast = { }
    sets.aftercast.Idle = {
        main        = "Mpaca's Staff",
        sub         = "Khonsu",
        ammo        = "Staunch Tathlum +1",
        head        = { name="Merlinic Hood", augments={'"Counter"+3','"Drain" and "Aspir" potency +9','"Refresh"+2','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        body        = "Jhakri Robe +2",
    	hands		= { name="Merlinic Dastanas", augments={'Pet: AGI+2','"Store TP"+4','"Refresh"+2','Accuracy+20 Attack+20',}},
        legs        = { name="Merlinic Shalwar", augments={'"Dbl.Atk."+1','Accuracy+4','"Refresh"+2','Accuracy+15 Attack+15',}},
        feet        = { name="Merlinic Crackows", augments={'Accuracy+7','Pet: "Dbl. Atk."+1','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        neck        = "Loricate Torque +1",
        waist       = "Fucho-no-obi",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = "Moonlight Cape"
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {
        head        = "Wicce Petasos +3",
        body        = "Wicce Coat +3",
        hands       = "Wicce Gloves +3",
        legs        = "Wicce Chausses +3",
        feet        = "Wicce Sabots +3",
    })
    sets.aftercast.Engaged = {
        ammo        = "Staunch Tathlum +1",
		head		= "Nyame Helm",
		body		= "Nyame Mail",
		hands		= "Nyame Gauntlets",
		legs		= "Nyame Flanchard",
		feet		= "Nyame Sollerets",
        neck        = "Loricate Torque +1",
        waist       = "Fucho-no-obi",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = "Moonlight Cape"
     }

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
        if sets.precast.FC[spell.name] then
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

function midcast(spell)
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
            elseif spell.name == 'Impact' then
                equip(sets.midcast[spell.skill].Impact)
            elseif sets.midcast[spell.skill].Burst and BurstMode == true then                
                if sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst then
                    equip(sets.midcast[spell.skill][spell.name].Burst)
                else
                    if player.mpp < 50 then
                        equip(sets.midcast[spell.skill].RecoverMode.Burst)
                    else
                        equip(sets.midcast[spell.skill].Burst)
                    end
                end
            else        
                if sets.midcast[spell.skill][spell.name] then
                    equip(sets.midcast[spell.skill][spell.name])
                else
                    if player.mpp < 50 then
                        equip(sets.midcast[spell.skill].RecoverMode)
                    else
                        equip(sets.midcast[spell.skill])
                    end
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
                equip(set_combine(sets.midcast[spell.skill],{main='Daybreak',sub='Ammurapi Shield'}))
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