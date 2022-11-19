--[[
	Functions used across multiple luas
]]
require('vectors')
res = require('resources')
items = require('resources').items

range_mult = {
      [0] = 0,
      [2] = 1.70,
      [3] = 1.490909,
      [4] = 1.44,
      [5] = 1.377778,
      [6] = 1.30,
      [7] = 1.20,
      [8] = 1.30,
      [9] = 1.377778,
      [10] = 1.45,
      [11] = 1.490909,
      [12] = 1.70,
}

function set_macros(book, page)
    send_command('input /macro book '..book..';wait 0.2;input /macro set '..page)
end

function disp_time(time)
	local hours = math.floor(math.mod(time, 86400)/3600)
	local minutes = math.floor(math.mod(time,3600)/60)
	local seconds = math.floor(math.mod(time,60))
	if hours > 0 then
		return string.format("%02d:%02d:%02d",hours,minutes,seconds)
	else
		return string.format("%02d:%02d",minutes,seconds)
	end
end

function get_weather_intensity()
    return gearswap.res.weather[world.weather_id].intensity
end

function item_available(item)
	if player.inventory[item] or player.wardrobe[item] or player.wardrobe2[item] or player.wardrobe3[item] or player.wardrobe4[item] or player.wardrobe5[item] or player.wardrobe6[item] or player.wardrobe7[item] or player.wardrobe8[item] or player.satchel[item] then
		return true
	else
		return false
	end
end

function count_available_ammo(ammo_name)
	local ammo_count = 0
	
    for _,n in pairs({"inventory","wardrobe","wardrobe2","wardrobe3","wardrobe4","wardrobe5","wardrobe6","wardrobe7","wardrobe8","satchel"}) do
		if player[n][ammo_name] then
			ammo_count = ammo_count + player[n][ammo_name].count
		end
    end

	return ammo_count
end

function check_facing()
    local target = windower.ffxi.get_mob_by_target('t')
	if target == nil then return nil end
    local player = windower.ffxi.get_mob_by_target('me')
    local dir_target = V{player.x, player.y} - V{target.x, target.y}
    local dir_player = V{target.x, target.y} - V{player.x, player.y}
    local player_heading = V{}.from_radian(player.facing)
    local target_heading = V{}.from_radian(target.facing)
    local player_angle = V{}.angle(dir_player, player_heading):degree():abs()
    local target_angle = V{}.angle(dir_target, target_heading):degree():abs()
    if player_angle < 45 and target_angle < 45 then
        return true
    end
    return false
end

function actual_cost(spell)
    local cost = spell.mp_cost
	if spell.type=="WhiteMagic" then
        if buffactive["Penury"] then
            return cost*.5
        elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
            return cost*.9
        elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            return cost*1.1
        end
    elseif spell.type=="BlackMagic" then
        if buffactive["Parsimony"] then
            return cost*.5
        elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            return cost*.9
        elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
            return cost*1.1
        end
    end
    return cost
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
				if player.status ~= 'Engaged' then -- When not engaged and moving equip movement speed
					if sets.MoveSpeed then send_command('gs equip sets.MoveSpeed') end
				end
				moving = true
			elseif dist < 1 and moving then -- When stopping and not engaged, equip idle set
				if player.status ~= 'Engaged' then
					if equip_check then send_command('gs c equip_check') end -- Custom command for changing gear.
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

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return index
        end
    end
    return table.getn(tab)
end

function standardize_set(set)
	local standardized_set = {}
	
    for slot, inner in pairs(set) do
		if slot_names:contains(slot) then
			if type(inner) == 'table' then
				standardized_set[slot] = inner.name
			else
				standardized_set[slot] = inner
			end
		end
    end

	standardized_set.ear1 = standardized_set.ear1 or standardized_set.left_ear or standardized_set.lear or ''
	standardized_set.ear2 = standardized_set.ear2 or standardized_set.right_ear or standardized_set.rear or ''
	standardized_set.ring1 = standardized_set.ring1 or standardized_set.left_ring or standardized_set.lring or ''
	standardized_set.ring2 = standardized_set.ring2 or standardized_set.right_ring or standardized_set.rring or ''
	standardized_set.range = standardized_set.range or standardized_set.ranged or ''
	
	return standardized_set
end

function can_do(act)
	if buffactive.terror then
        add_to_chat(123,'Unable to perform action: [Terrorized]')
        return false
	elseif buffactive.stun then
        add_to_chat(123,'Unable to perform action: [Stunned]')
        return false
	elseif buffactive.petrification then
        add_to_chat(123,'Unable to perform action: [Petrified]')
        return false
	elseif buffactive.sleep or buffactive.Lullaby then
        add_to_chat(123,'Unable to perform action: [Asleep]')
        return false
    end
	if act == 'Magic' then
        if buffactive.silence then
            add_to_chat(123,'Unable to cast: [Silenced]')
            return false
		elseif buffactive.mute then
            add_to_chat(123,'Unable to cast: [Mute]')
            return false
		elseif buffactive.Omerta then
            add_to_chat(123,'Unable to cast: [Omerta]')
            return false
        end
	end
	if act == 'Ability' then
		if buffactive.amnesia then
            add_to_chat(123,'Unable to perform action: [Amnesia]')
            return false
		elseif buffactive.impairment then			
			add_to_chat(123,'Unable to perform action: [Impairment]')
			return false
        end
	end
	return true
end

-- Functions for loading blu spells

function check_spells()
    if windower.ffxi.get_player().sub_job_id ~= 16 then return nil end
    if S(BlueSpells):map(string.lower) == S(get_current_spellset()) then
        windower.add_to_chat(8,'[Blue Spells Equipped]')
    else
        windower.add_to_chat(8,'[Equipping Blue Spells]')
        clear_spells()
    end
end

function clear_spells()
    windower.ffxi.reset_blue_magic_spells()
    set_spells()
end

function set_spells()
    local delay = 0.65
    local i = 0
    for k,v in pairs(BlueSpells) do
        if v ~= nil then
            local spellID = find_spell_id_by_name(v)
            if spellID ~= nil then
                i = i + 1
                x = delay * i
                set_spell:schedule(x, spellID, i)
            end
        end
    end
end

function set_spell(id, slot)
    windower.ffxi.set_blue_magic_spell(id, tonumber(slot))
    if tonumber(slot) == table.getn(BlueSpells) then
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
    return T(windower.ffxi.get_sjob_data().spells)
    -- Returns all values but 512
    :filter(function(id) return id ~= 512 end)
    -- Transforms them from IDs to lowercase English names
    :map(function(id) return spells[id].english:lower() end)
    -- Transform the keys from numeric x or xx to string 'slot0x' or 'slotxx'
    :key_map(function(slot) return 'slot%02u':format(slot) end)
end

windower.raw_register_event('add item', function(bag, index, id, count)
	if id == 4146 and world.area == "Ghoyu's Reverie" then --4146 Revitalizer ID
        windower.chat.input('/item Revitalizer <me>')
	end
end)