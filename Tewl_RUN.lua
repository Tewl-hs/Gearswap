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

    -- Personal settings: Load macros and set equipviewer position
    send_command('input /macro book 12;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 20')
    send_command('input //equipviewer pos 1663 934')

    EngagedMode = M{['description'] = 'Engaged Mode', 'Normal', 'DT', 'Hybrid'}

    sets.MoveSpeed = { legs = "Carmine Cuisses +1",} 

    BlueSpells = T{'Geist Wall', 'Sheep Song', 'Soporific', 'Blank Gaze', 'Jettatura', 'Healing Breeze'}
    EnmitySpells = T{'Foil', 'Flash', 'Stun'}
    
    -- Augmented Gear
    Capes = {}
    Capes.Enmity = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
    Capes.SIRD = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}

    sets.Enmity = {
        head        = "Halitus Helm",
        body        = "Emet Harness +1",
        hands       = "Kurys Gloves",
        legs        = "Eri. Leg Guards +1",
        feet        = "Erilaz Greaves +1", -- "Ahosi Leggings" -- Schah
        neck        = "Moonlight Necklace",
        -- left_ear    = "Cryptic Earring", -- Vagary
        -- right_ear   = "Trux Earring", -- HTB DM2
        left_ring   = "Eihwaz Ring",
        right_ring  = "Moonlight Ring",
        back        = Capes.Enmity
    }
    sets.Enmity.SIRD = { -- 110%
        ammo        = "Staunch Tathlum +1", -- 11
        head        = { name="Taeon Chapeau", augments={'DEF+11','Spell interruption rate down -10%','HP+35',}}, -- 10
        body        = { name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands       = "Rawhide Gloves", -- 15
        legs        = "Carmine Cuisses +1", -- 20
        feet        = { name="Taeon Boots", augments={'DEF+12','Spell interruption rate down -9%','HP+36',}}, -- 9
        neck        = "Moonlight Necklace", --15
        waist       = "Audumbla Sash", -- 10
        --left_ear    = "Cryptic Earring", -- Vagary
        right_ear   = "Halasz Earring", -- 5
        left_ring   = "Evanescence Ring", --5
        right_ring  = "Moonlight Ring",
        back        = Capes.SIRD -- 10
    }
    
    sets.precast = {}
    sets.precast.FC = { -- 72%
        ammo        = "Sapience Orb", -- 2
        head        = "Carmine Mask +1", -- 14
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}}, -- 9
        hands       = "Leyline Gloves", -- 7
        legs        = "Aya. Cosciales +2", -- 6
        feet        = "Carmine Greaves +1",  -- 8
        neck		= "Orunmila's Torque", -- 5
        waist       = "Audumbla Sash", 
        left_ear    = "Etiolation Earring", -- 1
        right_ear   = "Loquac. Earring", -- 2
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Moonlight Ring",
        back		= Capes.SIRD -- 10
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})

    sets.precast.JA = {
        ['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +1"},
        ['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +2",legs="Futhark Trousers +3"}),
        ['Valiance'] = set_combine(sets.Enmity,{body="Runeist's Coat +2",legs="Futhark Trousers +3"}),
        ['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +2"}),
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
        ['Defender'] = set_combine(sets.Enmity, {}),
        ['Berserk'] = set_combine(sets.Enmity, {}),
        ['Last Resort'] = set_combine(sets.Enmity, {}),
        ['Aggressor'] = set_combine(sets.Enmity, {}),
        ['Animated Flourish'] = set_combine(sets.Enmity, {}),
    
        ['Lunge'] = { }
    }
    sets.precast.WS = {
        ammo        = "Knobkierrie",
        head        = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body        = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Attack+20',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = { name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Brutal Earring",
        left_ring   = "Epona's Ring",
        right_ring  = "Karieyh Ring",
    }
    sets.midcast = {}
    sets.midcast['Enhancing Magic'] = {}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
        ammo        = "Staunch Tathlum +1",
        head        = { name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
        body        = { name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
        hands       = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
        legs        = { name="Taeon Tights", augments={'"Fast Cast"+3','Phalanx +3',}},
        feet        = { name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +3',}},
        neck        = { name="Futhark Torque +2", augments={'Path: A',}},
        waist       = "Audumbla Sash",
        -- left_ear    = "Tuisto Earring", -- 1k DI
        right_ear   = "Odnowa Earring +1",
        left_ring   = "Defending Ring",
        right_ring  = "Moonlight Ring",
        back        = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
    })
    
    -- Aftercast sets: TP, Idle
    sets.aftercast = {}
    sets.aftercast.Engaged = { }
    sets.aftercast.Engaged.Normal = {
        ammo="Staunch Tathlum +1",
        head="Turms Cap +1",
        body="Runeist's Coat +2",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +1",
        feet="Turms Leggings +1",
        neck="Futhark torque +2",
        waist="Flume belt +1",
        left_ear="Genmei Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
    }
    sets.aftercast.Engaged.DT = {

    }
    sets.aftercast.Engaged.Hybrid = {
    
    }
    sets.aftercast.Idle = {
        ammo		= "Staunch Tathlum +1", 
        head        = "Turms Cap +1", 
        body        = "Runeist's Coat +2", 
        hands       = "Turms Mittens +1", 
        legs        = "Eri. Leg Guards +1",
        feet        = "Turms Leggings +1",  
        neck		= "Futhark Torque +2", 
        waist		= "Flume Belt +1", 
        left_ear	= "Genmei Earring", 
        right_ear	= "Odnowa Earring +1",
        left_ring	= "Defending Ring", 
        right_ring	= "Moonlight Ring",
        back		= Capes.Enmity
    }
end
    
function precast(spell,action)        
    if spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    end

    if spell.action_type == 'Ability' then
        equip(sets.Enmity)
        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end    
    end

    if spell.action_type == 'Magic' then
        if sets.precast.FC[spell.skill] then
            equip(sets.precast.FC[spell.skill])
        else
            equip(sets.precast.FC)
        end
    end
end
    
function midcast(spell,action)
    if spell.action_type == 'Magic' then
        if EnmitySpells:contains(spell.name) then
            equip(sets.Enmity)
        elseif BlueSpells:contains(spell.name) then
            equip(sets.Enmity.SIRD)
        elseif sets.midcast[spell.name] then
            equip(sets.midcast[spell.name])
        end
    end
end
    
function aftercast(spell,action)
    if player.status == 'Engaged' then
        equip(get_engaged_set())
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
    return sets.aftercast.Engaged[EngagedMode.value] or sets.aftercast.Engaged.Normal
end

function SwapGear()
    if player.status == 'Engaged' then
        equip(get_engaged_set())
    else
        equip(sets.aftercast.Idle)
    end
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