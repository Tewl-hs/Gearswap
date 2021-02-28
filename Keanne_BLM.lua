-- Testing Motes, work in progress
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    send_command('input //equipviewer pos 1022 575')
end

function user_setup()
    state.CastingMode:options('Default', 'MagicBurst')
    state.IdleMode:options('Normal','PDT')
end

	
function init_gear_sets()
    
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

    sets.MoveSpeed = { feet = "Herald's Gaiters", } 

    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Mana Wall'] = { }
	
	sets.precast.FC = { -- 85
        main        = "Gada", -- 5
        sub         = "Ammurapi Shield",
        ammo        = "Sapience Orb", -- 2
        head        = "Nahtirah Hat", -- 11
        body        = { name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5','MND+8','Mag. Acc.+10',}}, --11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, -- 7
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Voltsurge Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Loquacious Earring", -- 2
        right_ear   = "Malignance Earring", -- 4
        right_ring  = "Kishar Ring", -- 4 
        left_ring   = "Prolix Ring", -- 2
        back        = { name="Taranus's Cape", augments={'MP+60','"Fast Cast"+10',}}, -- 10
    }
    sets.precast.Stoneskin = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
	
    sets.midcast = {}
    sets.midcast['Elemental Magic'] = {
		main		= "Laevateinn",
		sub		= "Enki Strap",
		ammo		= "Pemphredo Tathlum",
		head		= "Archmage's Petasos +3",
		body		= "Amalric Doublet +1",
		hands		= "Amalric Gages +1", 
		legs		= "Amalric Slops +1",
		feet		= "Amalric Nails +1",
		neck		= "Saevus Pendant +1",
		waist		= "Fucho-no-obi",
		left_ear	= "Friomisi Earring",
		right_ear	= "Malignance earring",
		left_ring	= "Freke Ring",
		right_ring	= "Shiva Ring +1",
		back		= { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
     }
	sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        head        = "Ea Hat",
        body        = "Ea Houppelande",
        legs        = "Ea Slops",
        --neck        = "Mizu. Kubikazari",
        --feet        = "Ea Pigaches +1",
        left_ring   = "Mujin Band"
    })
	
    sets.midcast['Dark Magic'] = {  }  
    sets.midcast['Enfeebling Magic'] = { }
	sets.midcast['Healing Magic'] = { }
    sets.midcast['Enhancing Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield", -- 10
        ammo        = "Impatiens",
        head        = "Telchine Cap", --10
        body        = "Telchine Chas.", -- 8
        hands       = "Telchine Gloves", -- 10
        legs        = "Telchine Braconi", -- 10
        feet        = "Telchine Pigaches",  -- 8
        neck        = "Incanter's Torque",
        waist       = "Embla Sash", -- 10
    }
	sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        feet        = "Inspirited Boots"
    })
    
    sets.idle = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        ammo        = "Staunch Tathlum +1",
        head        = "Befouled Crown",
        body        = "Jhakri Robe +2",
        hands       = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs        = "Assid. Pants +1",
        feet        = "Inspirited Boots",
        neck        = "Loricate Torque +1",
        waist       = "Fucho-no-obi",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring   = "Stikini Ring +1",
        right_ring  = "Stikini Ring +1",
        back        = "Moonlight Cape"
    }
end

function job_pretarget(spell)

end

function job_precast(spell)

end

function job_post_precast(spell, action, spellMap, eventArgs)

end

function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)

end        

function job_aftercast(spell)
    
end

function job_aftercast(spell, action, spellMap, eventArgs)

end

function status_change(new,old)
    
end

function job_state_change(stateField, newValue, oldValue)
    update_status()
end

function equip_aftercast()
    equip(sets.idle)
end

function job_self_command(cmdParams, eventArgs)
	if cmdParams[1] == 'idle' then
		equip_aftercast()
	end
end

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

    local info = {}
    local orig = {}
	local spc = '    '
	
	local labels = {
		Weapons = "Weapons",
        OffenseMode = "Offense",
		RangedMode = "Ranged",
        DefenseMode = "Defense",
        HybridMode = "Hybrid",
        IdleMode = "Idle",
    }

    stateBox:clear()
	stateBox:append('   ')
	stateBox:append(string.format("%sMode: %s%s", clr.w, clr.h, state.CastingMode.value))
	stateBox:append(spc)

    stateBox:update(info)
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
                send_command('gs c idle')
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