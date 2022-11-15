--[[
	Author: Tewl / Bismark
	Files: Tewl_RUN.lua 
--]]

function get_sets()		      
    include('Modes.lua') -- Using Motes meta tables for modes

    send_command('bind ^f9 gs c cycle')
    
    res = require('resources')
	items = require('resources').items

    -- Personal settings: Load macros and set equipviewer position
    send_command('input /macro book 12;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 13')
    send_command('input //equipviewer pos 1663 934')

    EngagedMode = M{['description'] = 'Engaged Mode', 'Normal', 'DT', 'Hybrid'} 
    
    --  NOT MY CODE! Testing content for displaying text under chat
    texts = require('texts')
    if stateBox then stateBox:destroy() end

    local settings = windower.get_windower_settings()
    local x,y

    if settings["ui_x_res"] == 1920 and settings["ui_y_res"] == 1080 then
        x,y = settings["ui_x_res"]-1917, settings["ui_y_res"]-18 -- -285, -18
    else
        x,y = 0, settings["ui_y_res"]-17 -- -285, -18
    end

    if displayx then x = displayx end
    if displayy then y = displayy end

    local font = displayfont or 'Arial'
    local size = displaysize or 12
    local bold = displaybold or true
    local bg = displaybg or 0
    local strokewidth = displaystroke or 2
    local stroketransparancy = displaytransparancy or 192

    stateBox = texts.new()
    stateBox:pos(x,y)
    stateBox:font(font)--Arial
    stateBox:size(size)
    stateBox:bold(bold)
    stateBox:bg_alpha(bg)--128
    stateBox:right_justified(false)
    stateBox:stroke_width(strokewidth)
    stateBox:stroke_transparency(stroketransparancy)

    update_status()
    -- End of display code

    sets.MoveSpeed = { legs = "Carmine Cuisses +1",} 

    -- Blue spells
    BlueSpells = T{'Grand Slam', 'Terror Touch', 'Healing Breeze', 'Cocoon', 'Pollen', 'Wild Carrot', 'Blank Gaze', 'Geist Wall', 'Soporific', 'Jettatura', 'Sheep Song', 'Metallic Body'}

    EnmitySpells = T{'Foil', 'Flash', 'Stun'}
    
    -- Augmented Gear
    Capes = {}
    Capes.Enmity = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
    Capes.SIRD = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    Capes.DA = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}

    sets.Enmity = {
        head        = "Halitus Helm",
        body        = "Emet Harness +1",
        hands       = "Kurys Gloves",
        legs        = "Eri. Leg Guards +2",
        feet        = "Erilaz Greaves +2",
        neck        = "Moonlight Necklace",
        waist       = "Kasiri Belt",
        left_ear    = "Cryptic Earring",
        right_ear   = "Trux Earring",
        left_ring   = "Eihwaz Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    }
    sets.Enmity['Foil'] = set_combine(sets.Enmity, {        
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
    })
    sets.Enmity.SIRD = { -- 105%
        ammo        = "Staunch Tathlum +1", -- 11
        head        = { name="Taeon Chapeau", augments={'DEF+11','Spell interruption rate down -10%','HP+35',}}, -- 10
        body        = { name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands       = "Rawhide Gloves", -- 15
        legs        = "Carmine Cuisses +1", -- 20
        feet        = { name="Taeon Boots", augments={'DEF+12','Spell interruption rate down -9%','HP+36',}}, -- 9
        neck        = "Moonlight Necklace", --15
        waist       = "Audumbla Sash", -- 10
        left_ear    = "Halasz Earring", -- 5
        right_ear   = "Trux Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD -- 10
    }
    
    sets.precast = {}
    sets.precast.FC = { -- 73%
        ammo        = "Sapience Orb", -- 2
        head        = "Carmine Mask +1", -- 14
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}}, -- 9
        hands       = "Leyline Gloves", -- 7
        legs        = "Aya. Cosciales +2", -- 6
        feet        = "Carmine Greaves +1",  -- 8
        neck        = "Orunmila's Torque", -- 5
        waist       = "Audumbla Sash", 
        left_ear    = "Enchntr. Earring +1", -- 2
        right_ear   = "Loquac. Earring", -- 2
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD -- 10
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})

    sets.precast.JA = {
        ['Vivacious Pulse'] = {head="Erilaz Galea +2",neck="Incanter's Torque",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Rune. Trousers +1"},
        ['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +3"}),
        ['Valiance'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +3"}),
        ['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +3"}),
        ['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"}),
        ['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"}),
        ['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +3"}),
        ['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +3"}),
        ['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"}),
        ['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +3"}),
        ['Embolden'] = set_combine(sets.Enmity,{}),
        ['One For All'] = set_combine(sets.Enmity,{}),
        ['Provoke'] = set_combine(sets.Enmity, {}),
        ['Warcry'] = set_combine(sets.Enmity, {}),
        ['Animated Flourish'] = set_combine(sets.Enmity, {}),    
        ['Swipe'] = { 
            ammo        = "Seeth. Bomblet +1",
            head        = "Agwu's Cap",
            body        = "Samnuha Coat",
            hands       = "Agwu's Gages",
            legs        = "Agwu's Slops",
            feet        = "Agwu's Pigaches",
            neck        = "Baetyl Pendant",
            waist       = "Orpheus's Sash",
            left_ear    = "Friomisi Earring",
            right_ear   = "Hermetic Earring",
            left_ring   = "Mujin Band",
            right_ring  = "Locus Ring",
            --back        = Capes.MAB
        },
        ['Lunge'] = { 
            ammo        = "Seeth. Bomblet +1",
            head        = "Agwu's Cap",
            body        = "Samnuha Coat",
            hands       = "Agwu's Gages",
            legs        = "Agwu's Slops",
            feet        = "Agwu's Pigaches",
            neck        = "Baetyl Pendant",
            waist       = "Orpheus's Sash",
            left_ear    = "Friomisi Earring",
            right_ear   = "Hermetic Earring",
            left_ring   = "Mujin Band",
            right_ring  = "Locus Ring",
            --back        = Capes.MAB
        },   
    }
    sets.precast.WS = {
        ammo        = "Knobkierrie",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Sherida Earring",
        left_ring   = "Ilabrat Ring",
        right_ring  = "Karieyh Ring +1",
        back        = Capes.DA
    }
    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		ammo        = "Knobkierrie",
		head        = "Nyame Helm",
		body        = "Nyame Mail",
		hands       = "Nyame Gauntlets",
		legs        = "Nyame Flanchard",
		feet        = "Nyame Sollerets",
		right_ring  = "Niqmaddu Ring",
		waist       = "Sailfi Belt +1",
		--back      = Capes.WSD,
    })
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
        ammo        = "Seeth. Bomblet +1",
        head        = { name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        body        = { name="Lustr. Harness +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = "Meg. Chausses +2",
        feet        = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Niqmaddu Ring",
        back        = Capes.DA
    })
    sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS,{
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        waist       = "Kentarch Belt +1",
        left_ear    = "Telos Earring",
        right_ear   = "Digni. Earring",
    })
    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS,{
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        waist       = "Kentarch Belt +1",
        left_ear    = "Telos Earring",
        right_ear   = "Digni. Earring",
    })
    sets.midcast = {}
    sets.midcast['Enhancing Magic'] = {
        head        = "Erilaz Galea +2",
        hands       = "Regal Gauntlets",
        legs        = "Futhark Trousers +3",
    }
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
        ammo        = "Staunch Tathlum +1",
        head        = { name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
        hands       = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
        legs        = { name="Taeon Tights", augments={'"Fast Cast"+3','Phalanx +3',}},
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}},
        neck        = { name="Futhark Torque +2", augments={'Path: A',}},
        waist       = "Audumbla Sash",
        left_ear    = "Tuisto Earring",
        right_ear   = "Odnowa Earring +1",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD
    })
    
    sets.aftercast = {}
    sets.aftercast.Engaged = { }
    sets.aftercast.Engaged.Normal = { -- DT (52) PDT (29) MDT (2)
        ammo        = "Staunch Tathlum +1", -- 3 0 0
        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        -- Ongo cahnges
        --neck        = "Warder's Charm +1",
        --waist       = "Ioskeha Belt +1",
        --left_ear    = "Brutal Earring",
        --back        = Capes.DA,
        -- Normal equipment
        neck        = "Futhark torque +2", -- 7 0 0
        waist       = "Engraved Belt",
        left_ear    = "Eabani Earring",
        right_ear   = "Odnowa Earring +1", -- 3 0 2
        left_ring   = "Shadow Ring",
        --left_ring   = "Defending Ring", -- 10 0 0
        right_ring  = "Moonlight Ring", -- 5 0 0
        back        = Capes.Enmity -- 5 0 0
    }
    sets.aftercast.Engaged.DTLite = {
        ammo        = "Yamarang",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs        = "Meg. Chausses +2",
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
		neck        = "Futhark Torque +2",
		waist       = "Ioskeha Belt +1",
		left_ear    = "Telos Earring",
		right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.DA
    }
    sets.aftercast.Engaged.Hybrid = { -- DT 33 PDT 25
        ammo        = "Staunch Tathlum +1", -- 3 0 0

        head        = "Nyame Helm", -- 7 0 0 "Turms Cap +1",
        body        = "Nyame Mail", -- 9 0 0 "Runeist's Coat +3",
        hands       = "Nyame Gauntlets", -- 7 0 0 "Turms Mittens +1", 
        legs        = "Nyame Flanchard", -- 8 0 0
        feet        = "Nyame Sollerets", -- 7 0 0
        neck        = "Anu Torque",

        --head        = "Turms Cap +1",
        --body        = "Runeist's Coat +3",
        --hands       = "Turms Mittens +1",
        --legs        = "Nyame Flanchard", -- 8 0 0
        --feet        = "Turms Leggings +1", 
        --neck        = "Futhark torque +2", -- 7 0 0
		waist       = "Ioskeha Belt +1",
		left_ear    = "Telos Earring",
		right_ear   = "Sherida Earring",
        left_ring   = "Regal Ring", -- 10 0 0
        right_ring  = "Niqmaddu Ring",
        back        = Capes.DA -- 5 0 0
    }
    sets.aftercast.Idle = { -- DT 55 PDT 29 MDT 2
        ammo        = "Staunch Tathlum +1", -- 3 0 0
        head        = "Turms Cap +1", 
        body        = "Runeist's Coat +3", 
        hands       = "Turms Mittens +1", 
        --hands       = "Nyame Gauntlets", -- 7 0 0 
        legs        = "Eri. Leg Guards +2",
        feet        = "Erilaz Greaves +2",
        --legs        = "Nyame Flanchard", -- 8 0 0
        --feet        = "Nyame Sollerets", -- 7 0 0
        neck        = "Futhark Torque +2", -- 7 0 0
        waist       = "Engraved Belt",
        left_ear    = "Eabani Earring", 
        right_ear   = "Odnowa Earring +1", -- 3 0 2
        left_ring   = "Defending Ring", -- 10 0 0
        right_ring  = "Moonlight Ring", -- 5 0 0
        back        = Capes.Enmity -- 5 0 0
    }

    check_spells()
end
-- 
function job_sub_job_change(new, old)
    if new == 'BLU' then
        coroutine.schedule(function() check_spells() end,2)
    end
end

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
    
function precast(spell,action)        
    if spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
			cancel_spell()
            return
        end
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] and abil_recasts[spell.recast_id] > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..disp_time(abil_recasts[spell.recast_id]))
			return
		end

        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end    
    elseif spell.action_type == 'Magic' then
        local spell_recasts = windower.ffxi.get_spell_recasts()
        local sr = math.floor(spell_recasts[spell.recast_id]/60)
        if sr > 0 then
			cancel_spell()
			add_to_chat(121,'['..spell.name..'] '..disp_time(sr))
            return
        end
        if sets.precast.FC[spell.skill] then
            equip(sets.precast.FC[spell.skill])
        else
            equip(sets.precast.FC)
        end
    end
end
    
function midcast(spell,action)
    if spell.action_type == 'Magic' then
        if sets.Enmity[spell.name] then
            equip(sets.Enmity[spell.name])
        elseif EnmitySpells:contains(spell.name) then
            equip(sets.Enmity)
        elseif BlueSpells:contains(spell.name) then
            equip(sets.Enmity.SIRD)            
        elseif sets.midcast[spell.name] then
            equip(sets.midcast[spell.name])
        end
    end
end
    
function aftercast(spell,action)
	if spell.name == 'Rayke' then
		windower.send_command('@timers c "Rayke" 35 up')
	end
	if spell.name == 'Gambit' then
		windower.send_command('@timers c "Gambit" 76 up')
	end
    if player.status == 'Engaged' then
        equip(get_engaged_set())
    else
        equip(sets.aftercast.Idle)
    end
end
    
function status_change(new,old)
    if player.status == 'Engaged' then
        equip(get_engaged_set())
    else
        equip(sets.aftercast.Idle)
    end
end
    
function buff_change(buff,gain)
    
end
    
function self_command(commandArgs)
    local originalCommand = commandArgs
    if type(commandArgs) == 'string' then
        commandArgs = T(commandArgs:split(' '))
        if #commandArgs == 0 then
        return
        end
    end
    if commandArgs[1] == 'SwapGear' then
        SwapGear()
    elseif commandArgs[1] == 'cycle' then
        EngagedMode:cycle()
        SwapGear()
    end
end

function get_engaged_set()
    return sets.aftercast.Engaged[EngagedMode.value] or sets.aftercast.Engaged.Normal
end

function file_unload()     
    send_command('unbind ^F9')
end

function SwapGear()
    if player.status == 'Engaged' then
        equip(get_engaged_set())
    else
        equip(sets.aftercast.Idle)
    end
    update_status()
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
                if player.status ~= 'Engaged' then
                    send_command('gs equip sets.MoveSpeed')
                end
                moving = true
            elseif dist < 1 and moving then
                if player.status ~= 'Engaged' then
                    send_command('gs c SwapGear')
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

 -- More code for displaying text -- Not finished 
function update_status()
    local clr = {
        h='\\cs(255,192,0)', -- Yellow for active booleans and non-default modals
        w='\\cs(255,255,255)', -- White for labels and default modals
        n='\\cs(192,192,192)', -- White for labels and default modals
        s='\\cs(96,96,96)', -- Gray for inactive booleans
        Fire='\\cs(255,80,80)', -- Red For Fire Element
        Ice='\\cs(140,160,255)', -- Light Blue For Ice Element
        Wind='\\cs(110,255,110)', -- Light Green For Wind Element
        Earth='\\cs(220,214,110)', -- Brown/Yellow For Earth Element
        Lightning='\\cs(190,90,190)', -- Purple For Lightning Element
        Water='\\cs(110,110,255)', -- Blue For Water Element
        Light='\\cs(255,255,155)', -- Light Yellow For Light Element
        Dark='\\cs(90,90,90)', -- Dark Grey For Dark Element
    }

    local spc = '    '

    stateBox:clear()
    stateBox:append('   ')
    local status_text = ''
    
    status_text = string.format("%sEngaged: %s%s%s", clr.w, clr.h, EngagedMode.value, spc)
    stateBox:append(status_text)
    stateBox:show()
end

function clear_job_states()
    if stateBox then stateBox:destroy() end
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
end)
-- End of Display Code

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