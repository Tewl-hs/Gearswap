-- Luopan and Indi range overlay for GEO job files.
-- Original overlay adapted from Headtatt's GEO.lua.

local overlay = texts.new('${value}', {
	pos = {x = -24, y = 175},
	text = {font = 'Arial', size = 12},
	flags = {right = true, draggable = false},
})
overlay:bold(true)
overlay:right_justified(true)
overlay:bg_alpha(0)
overlay:stroke_width(2)
overlay:stroke_transparency(192)

local refresh_interval = 0.2
local next_refresh = 0
local aura_radius = 6
local enemy_spawn_type = 16
local colure_buff_id = 612
local last_geo, last_indi, luopan_id
local enabled = true
local zoning = false

GeoTracker = {}

local function hide_overlay()
	overlay.value = ''
	overlay:hide()
end

local function has_colure()
	local current_player = windower.ffxi.get_player()
	if current_player and current_player.buffs then
		for _, buff_id in pairs(current_player.buffs) do
			if buff_id == colure_buff_id then return true end
		end
		return false
	end
	return buffactive['Colure Active'] ~= nil
end

local function collect_target(aura, mob, battle_target)
	if not aura or mob.id == aura.center.id then return end
	if aura.debuff then
		if mob.spawn_type ~= enemy_spawn_type or mob.in_party or mob.in_alliance or mob.charmed then return end
	elseif not mob.in_party then
		return
	end

	local dx, dy = aura.center.x - mob.x, aura.center.y - mob.y
	local distance_squared = dx * dx + dy * dy
	local radius = aura_radius + mob.model_size
	if distance_squared < radius * radius then
		aura.targets[#aura.targets + 1] = {
			name = mob.name,
			id = mob.id,
			distance = math.sqrt(distance_squared),
			is_battle_target = battle_target and mob.id == battle_target.id,
		}
	end
end

local function render_aura(aura)
	table.sort(aura.targets, function(left, right)
		if left.distance == right.distance then return left.id < right.id end
		return left.distance < right.distance
	end)

	local lines = {(' %s%s%s (%d)'):format(Colors.Green, aura.name, Colors.White, #aura.targets)}
	for _, target in ipairs(aura.targets) do
		local color = target.is_battle_target and Colors.Red or Colors.White
		lines[#lines + 1] = (' %s%s %.2f%s'):format(color, target.name, target.distance, Colors.White)
	end
	return table.concat(lines, '\n')
end

function GeoTracker.refresh()
	if not enabled or zoning then return end
	local now = os.clock()
	if now < next_refresh then return end
	next_refresh = now + refresh_interval

	local geo, indi
	local luopan = windower.ffxi.get_mob_by_target('pet')
	local luopan_active = luopan and (last_geo or luopan.name == 'Luopan')
	if luopan_active then
		if luopan_id and luopan_id ~= luopan.id then
			last_geo, luopan_id = nil, nil
		end
		if last_geo and luopan.x and luopan.y then
			luopan_id = luopan.id
			geo = {name = 'Geo-'..last_geo, center = luopan, debuff = geo_debuffs:contains(last_geo), targets = {}}
		end
	end

	local indi_active = has_colure()
	local me = last_indi and indi_active and windower.ffxi.get_mob_by_target('me')
	if me and me.x and me.y then
		indi = {name = 'Indi-'..last_indi, center = me, debuff = geo_debuffs:contains(last_indi), targets = {}}
	end
	if geo or indi then
		local battle_target = windower.ffxi.get_mob_by_target('bt')
		for _, mob in pairs(windower.ffxi.get_mob_array() or {}) do
			if mob.id and mob.valid_target and mob.name and mob.name ~= '' and mob.name ~= 'Luopan'
				and mob.status ~= 2 and mob.status ~= 3 and mob.hpp ~= 0
				and mob.x and mob.y and mob.model_size and mob.model_size > 0 then
				collect_target(geo, mob, battle_target)
				if not me or mob.id ~= me.id then
					collect_target(indi, mob, battle_target)
				end
			end
		end
	end

	local sections = {}
	if geo then sections[#sections + 1] = render_aura(geo) end
	if not geo and luopan_active then sections[#sections + 1] = Colors.Green..'Geo active' end
	if indi then sections[#sections + 1] = render_aura(indi) end
	if not indi and indi_active then sections[#sections + 1] = Colors.Green..'Indi active' end
	if #sections == 0 then sections[1] = Colors.White..'GEO: No active effects' end
	overlay.value = table.concat(sections, '\n\n')
	overlay:show()
end

function GeoTracker.aftercast(spell)
	if spell.interrupted then return end
	local name = spell.english or spell.name
	if not name then return end

	local geo = name:match('^Geo%-(.+)$')
	local indi = name:match('^Indi%-(.+)$')
	if geo then
		last_geo, luopan_id = geo, nil
	elseif indi and spell.target
		and (spell.target.type == 'SELF' or (spell.target.id and spell.target.id == player.id)) then
		last_indi = indi
	end
	next_refresh = 0
end

function GeoTracker.pet_change(pet_info, gain)
	if not gain and pet_info and luopan_id and pet_info.id == luopan_id then
		last_geo, luopan_id = nil, nil
	end
	next_refresh = 0
end

function GeoTracker.buff_change(buff, gain)
	if buff:lower() == 'colure active' then
		if not gain then
			last_indi = nil
		end
		next_refresh = 0
	end
end

function GeoTracker.set_enabled(value)
	enabled = value
	next_refresh = 0
	if enabled then
		GeoTracker.refresh()
	else
		hide_overlay()
	end
end

function GeoTracker.set_zoning(value)
	zoning = value
	if zoning then
		last_geo, last_indi, luopan_id = nil, nil, nil
		hide_overlay()
	end
	next_refresh = 0
end

function GeoTracker.destroy()
	enabled = false
	overlay:destroy()
end

windower.raw_register_event('prerender', GeoTracker.refresh)
GeoTracker.refresh()
