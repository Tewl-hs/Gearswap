--[[
	Author: Tewl / Bismark
	Files: RUN.lua 

	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.

	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
--]]
function get_sets()		      
    include('Modes.lua') -- Using Motes meta tables for modes

    
	send_command('bind ^f9 gs c cycle')

    -- Personal settings: Load macros and set equipviewer position
    send_command('input /macro book 12;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 20')
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

    -- Variables for auto-skill chain. Only edit AutoWS 
    AutoWS = 'Hard Slash'
    WeaponSkills = T{'Ground Strike','Ground Strike'}
    ws_order = 1

    sets.MoveSpeed = { legs = "Carmine Cuisses +1",} 

    EnmitySpells = T{'Foil', 'Flash', 'Stun', 'Geist Wall', 'Sheep Song', 'Soporific', 'Blank Gaze', 'Jettatura'}
    
    -- Augmented Gear
    Capes = {}
    Capes.Enmity = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}

    sets.Enmity = {
        neck        = "Moonbeam Necklace",
        body        = "",
        hands       = "Futhark Mitons +1",
        legs        = "Eri. Leg Guards +1",
        feet        = "Erilaz Greaves +1",
        left_ring   = "Moonlight Ring",
        right_ring  = "Eihwaz Ring",
        back        = Capes.Enmity
    }
    
    -- Precast sets: Job Abilities, Fastcast, Weaponskills 
    sets.precast = {}
    sets.precast.FC = {
        ammo        = "Sapience Orb",
        head        = "Carmine Mask +1", 
        body        = "Vrikodara Jupon",  -- 9/9
        hands       = "Leyline Gloves",  -- 5/5
        legs        = "Aya. Cosciales +2",  -- 7/7
        feet        = "Carmine Greaves +1",  -- 4/4
        neck		= "Orunmila's Torque", -- 6/6
        waist		= "Flume Belt +1", -- 6/6
		left_ear    = "Etiolation Earring",
		right_ear   = "Loquac. Earring",
		left_ring   = "Kishar Ring",
		right_ring  = "Moonlight Ring",
        back		= Capes.Enmity
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +1"})

    sets.precast.JA = {
        ['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +1"},
        ['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +2",legs="Futhark Trousers +1"}),
        ['Valiance'] = set_combine(sets.Enmity,{body="Runeist's Coat +2",legs="Futhark Trousers +1"}),
        ['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +2"}),
        ['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"}),
        ['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"}),
        ['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +2"}),
        ['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"}),
        ['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"}),
        ['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"}),
        ['Embolden'] = set_combine(sets.Enmity,{}),
        ['One For All'] = set_combine(sets.Enmity,{}),
        ['Provoke'] = set_combine(sets.Enmity, {}),
        ['Warcry'] = set_combine(sets.Enmity, {}),
        ['Defender'] = set_combine(sets.Enmity, {}),
        ['Berserk'] = set_combine(sets.Enmity, {}),
        ['Last Resort'] = set_combine(sets.Enmity, {}),
        ['Aggressor'] = set_combine(sets.Enmity, {}),
        ['Animated Flourish'] = set_combine(sets.Enmity, {}),
    
        ['Lunge'] = { }
    }
    sets.precast.WS = {

    }
    sets.precast.WS["Ground Strike"] = set_combine(sets.precast.WS,{
    
    })
    sets.precast.WS["Resolution"] = {

    }
    
    -- Aftercast sets: TP, Idle
    sets.aftercast = {}
    sets.aftercast.TP = { }
    sets.aftercast.TP.Normal = {

    }
    sets.aftercast.TP.DT = {

    }
    sets.aftercast.TP.Hybrid = {
    
    }
    sets.aftercast.Idle = {
        ammo		= "Staunch Tathlum +1", -- 3/3
        head        = "Fu. Bandeau +1",  -- 6/6
        body        = "Runeist's Coat +2",  -- 9/9
        hands       = "Runeist's Mitons +2",  -- 5/5
        legs        = "Eri. Leg Guards +1",  -- 7/7
        feet        = "Erilaz Greaves +1",  -- 4/4
        neck		= "Futhark Torque +2", -- 6/6
        waist		= "Flume Belt +1", -- 6/6
        left_ear	= "Genmei Earring", -- 2/0
        right_ear	= "Odnowa Earring +1", -- 0/2
        left_ring	= "Defending Ring", -- 10/10
        right_ring	= "Gelatinous Ring +1",
        back		= Capes.Enmity
    }
    sets.aftercast.Engaged = {
        
    }
end
    

function file_unload()     
	send_command('unbind ^F9')
end
    
function precast(spell,action)    
    Mob_ID = player.target.id
	if Mob_ID ~= Old_Mob_ID then
	    ws_order = 1
	    Old_Mob_ID = Mob_ID
    end
    
    if sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
    end

    if spell.type == 'WeaponSkill' then
	    if spell.name == AutoWS then
		    cancel_spell()
		    send_command('@input /ws "'..WeaponSkills[ws_order]..'" '..spell.target.raw)
		    ws_order = ws_order + 1
		    if ws_order > table.getn(WeaponSkills) then
			    ws_order = 1
		    end
		    return
	    end
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        else
            equip(sets.precast.WS)
        end
    end

    if spell.action_type == 'Ability' then
        equip(sets.Enmity.HP)
        equip(sets.precast.JA[currentSpell])
    end

    if spell.action_type == 'Magic' then
        equip(sets.precast.FC)
    end
end
    
function midcast(spell,action)
    if spell.action_type == 'Magic' then
        if EnmitySpells:contains(spell.english) then
        equip(sets.Enmity)
        elseif spell.skill == 'Enhancing Magic' then
        --equip(sets.midcast.EnhancingDuration)
        end
    end
end
    
function aftercast(spell,action)
    if player.status == 'Engaged' then
        sets.aftercast.Engaged = get_engaged_set()
        equip(sets.aftercast.Engaged)
    else
        equip(sets.aftercast.Idle)
    end
end
    
function status_change(new,old)

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
    return sets.aftercast.TP[EngagedMode.value] or sets.aftercast.TP.Normal
end

function SwapGear()
    if player.status == 'Engaged' then
        equip(sets.aftercast.Engaged)
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