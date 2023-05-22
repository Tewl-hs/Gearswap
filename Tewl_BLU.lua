--[[
	Author: Tewl / Bismark
	Files: BLU.lua 

	I only use BLU for cleaving so this is very basic. 
--]]

function get_sets()
    items = require('resources').items
    require('queues')

    include('FFXI-Mappings')

    include('FFXI-Utility')
    -- Personal settings. You can remove these two lines.
    set_macros(4,1)
    send_command('wait 1;input /lockstyleset 6')
	send_command('input //equipviewer pos 1663 935') 

    send_command('bind ^f9 gs c cycle idle')
    send_command('bind ^f10 gs c cycle engaged')

    BlueNukeSet = T{'Delta Thrust', 'Barbed Crescent', 'Memento Mori', 'Reactor Cool', 'Spectral Floe', 'Subduction', 'Erratic Flutter', 'Barrier Tusk', 'Entomb', 'Anvil Lightning', 'Magic Fruit',
            'Magic Hammer', 'Dream Flower', 'Tenebral Crush', 'Eyes on Me', 'Cursed Sphere', 'Battery Charge', 'Cocoon'}

    BlueSets = { ['BLM'] = BlueNukeSet, ['RDM'] = BlueNukeSet }

    MainWeapon = ''
    SubWeapon = ''

    res = require('resources')

    current_sj = player.sub_job or nil

    
    sets.MoveSpeed = { legs = "Carmine Cuisses +1", }

    sets.precast = {}

    sets.precast.JA = {}

    sets.precast.FC = { 
        ammo        = "Sapience Orb",
        head        = "Carmine Mask +1",
        body        = "Pinga Tunic", 
        hands       = "Leyline Gloves", 
        legs        = "Pinga Pants",
        feet        = "Carmine Greaves +1",
        neck        = "Orunmila's Torque", 
        waist       = "Witful Belt",
        left_ear    = "Loquacious Earring",
        right_ear   = "Enchanter's Earring",
        right_ring  = "Kishar Ring",
        left_ring   = "Prolix Ring", 
        back        = { name="Rosmerta's Cape", augments={'HP+60','Accuracy+20 Attack+20','"Fast Cast"+10',}}, -- 10
    }
    sets.precast.WS = {
        ammo		= "Aurgelmir Orb +1",
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        neck        = "Fotia Gorget", 
        waist		= { name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear    = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear   = "Regal Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Karieyh Ring +1",
        back        = { name="Rosmerta's Cape", augments={'HP+60','Accuracy+20 Attack+20','"Fast Cast"+10',}}, -- 10
    }
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo        = "Oshasha's Treatise",
		head        = "Hashishin Kavuk +3",
		--neck        = { name="Mirage Stole +2", augments={'Path: A',}},
		right_ear   = "Ishvara Earring",
        left_ring   = "Sroda Ring",
		--back      = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    })
    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {
		head        = "Hashishin Kavuk +3",
		--neck        = { name="Mirage Stole +2", augments={'Path: A',}},
		right_ear   = "Regal Earring",
		--left_ring   = "Rufescent Ring",
		--back        = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    })

    sets.midcast = { }
    sets.midcast['Blue Magic'] = {
        ammo        = "Ghastly Tathlum +1",
		head        = "Hashishin Kavuk +3",
		body        = "Hashishin Mintan +3",
		hands       = "Hashi. Bazu. +3",
		legs        = "Hashishin Tayt +3",	
		feet        = "Hashi. Basmak +3",
		neck        = "Sibyl Scarf",
        waist       = "Orpheus's Sash",
        left_ear    = "Friomisi Earring",
        right_ear   = "Regal Earring",
        left_ring   = "Metamor. Ring +1",
        right_ring  = "Shiva Ring +1",
        back        = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast['Blue Magic']['Dream Flower'] = set_combine(sets.midcast['Blue Magic'], { 
        ammo        = "Hydrocera",
        neck        = "Incanter's Torque",
        waist       = "Luminary Sash",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
    })

    sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'],{
        head        = "Amalric Coif +1",
        legs        = "Shedir Seraweels",
    })
         
    sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'],{
        head        = "Amalric Coif +1",
        waist		= "Gishdubar Sash",
        back        = "Grapevine Cape",
    })
    
    sets.aftercast = { }
    sets.aftercast.Idle = { 
        ammo        = "Staunch Tathlum +1",
		head        = "Hashishin Kavuk +3",
		body        = "Hashishin Mintan +3",
		hands       = "Hashi. Bazu. +3",
		legs        = "Hashishin Tayt +3",	
		feet        = "Hashi. Basmak +3",
        neck        = "Loricate Torque +1",
        waist       = "Flume Belt +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring   = "Defending Ring",
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = "Moonlight Cape"
    }

    sets.aftercast.Idle.Refresh = set_combine(sets.aftercast.Idle,{
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
    })

    sets.aftercast.Engaged = {
        ammo        = "Aurgelmir Orb +1",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck        = "Sanctity Necklace",
        waist       = { name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear    = "Suppanomimi",
        right_ear   = "Telos Earring",
        left_ring   = "Ilabrat Ring",
        right_ring  = "Epona's Ring",
        back        = { name="Rosmerta's Cape", augments={'HP+60','Accuracy+20 Attack+20','"Fast Cast"+10',}},
    }

    check_spells()
    
    include('FFXI-Display.lua')	
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
end

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
        if sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
            equip(sets.midcast[spell.skill])
        end
    end
end

function aftercast(spell,action)
    equip_check()
end

function status_change(new,old)
	if T{'Idle','Resting','Engaged'}:contains(new) then
		equip_check()
	end
end

function buff_change(buff,gain)
    if name == "silence" and gain == "True" then
        add_to_chat(123,'Silenced')	
    end
end

function equip_check()
    local eq = {}
    if player.status == 'Engaged' then
        if egs ~= nil and sets.aftercast.Engaged[egs] then 
            eq = sets.aftercast.Engaged[egs]
        else
            egs = nil
            eq = sets.aftercast.Engaged
        end
    else
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            eq = sets.aftercast.Idle[ids]
        else
            ids = nil
            eq = sets.aftercast.Idle
        end
    end
    equip(set_combine(eq,{main=MainWeapon,sub=SubWeapon}))
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
    elseif args[1] == 'equip_check' then
        equip_check()
	elseif args[1] == 'update_status' then
		update_status()
    end
end

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	local sitem = windower.ffxi.get_items(equipment["sub_bag"],equipment["sub"])
	if (item and items[item['id']]) and (sitem and items[sitem['id']]) then 
		local mw = items[item['id']].name
        local sw = items[sitem['id']].name
		if mw ~= MainWeapon then 
			if mw == 'Gil' then -- No idea why? 
				MainWeapon = 'Empty'
				TwoHandedWeapon = false
			else
                if T{4,6,7,8,10,12}:contains(items[item['id']].skill) then -- GS GA Scythe Polearm GK Staff
					TwoHandedWeapon = true
				else 
					TwoHandedWeapon = false	
                end
				MainWeapon = mw
			end	
		end
        if sw ~= SubWeapon then 
			if sw == 'Gil' then -- No idea why? 
				SubWeapon = 'Empty'
			else
				SubWeapon = sw
			end	
		end
        update_status()
	end
end

function update_status()
	local spc = '   '
    local WeaponColor = get_weapon_color(MainWeapon)
    local SubColor = get_weapon_color(SubWeapon)

    local engaged_display = egs or 'Default'
    local idle_display = ids or 'Default'

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s%s%s%s%s", WeaponColor, MainWeapon, Colors.White,' / ',SubColor,SubWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)
    
	stateBox:append(status_text)
	stateBox:show()
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