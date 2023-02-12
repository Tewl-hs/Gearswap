--[[
	Author: Tewl / Bismarck
	Files: MNK.lua 
--]]
function get_sets()		      
    items = require('resources').items
    require('queues')
    
    include('FFXI-Mappings')
    
    include('FFXI-Utility')
    send_command('bind ^f9 gs c cycle engaged')
    send_command('bind ^f10 gs c cycle idle')

	send_command('bind !f10 gs c toggle autosc') 
    
    set_macros(9,1)
    send_command('wait 1.5;input /lockstyleset 4')
    send_command('input //equipviewer pos 1663 935') 

    MainWeapon = ''

    AutoSC = false
	ascWS = 'One Inch Punch'
	AutoSkillChain = T{'Asuran Fists','Victory Smite','Shijin Spiral', 'Victory Smite'}
	asc_order = 1
	last_target = nil

    buffs = {}
    buffs.Boost = buffactive["Boost"] or false
    buffs.Impetus = buffactive["Impetus"] or false

    sets.MoveSpeed = { feet = "Herald's Gaiters"} 

    -- Augmented Gear
    Capes = {}
    Capes.TP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Capes.WS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    Capes.WSCrit = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
    Capes.WSD = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

    -- Precast sets: Job Abilities, Fastcast, Weaponskills 
    sets.precast = {}
    sets.precast.JA = {
        ["Hundred Fists"] = {
            legs    = "Hesychast's Hose +3"
        },
        ["Impetus"] = {
            body    = "Bhikku Cyclas +3"
        },
        ["Dodge"] = {
            feet    = "Anchorite's Gaiters +3"
        },
        ["Focus"] = {},
        ["Footwork"] = {},
        ["Counterstance"] = {},
        ["Chi Blast"] = {
            head    = "Hesychast's Crown +3"
        },
        ["Chakra"] = {
            body    = "Anchorite's Cyclas +2",
            hands   = "Hesychast's Gloves +1"
        },
        ["Formless Strikes"] = {
            body    = "Hesychast's Cyclas +3"
        },
        ["Mantra"] = {
            feet    = "Hesychast's Gaiters +1"
        },
        ["Boost"] = {
            waist   = "Ask Sash",
            hands   = "Anchor. Gloves +3"
        }
    }
    sets.precast.WS = { -- Raging Fists
        ammo        = "Knobkierrie",
        head        = "Ken. Jinpachi +1",
        body        = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands       = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs        = { name="Mpaca's Hose", augments={'Path: A',}},
        feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
        neck        = "Fotia Gorget",
        waist       = "Moonbow Belt +1",
        left_ear    = "Sherida Earring",
        right_ear   = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring   = "Gere Ring",
        right_ring  = "Niqmaddu Ring",
        back		= Capes.WS
    }
    sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS,{
        body        = "Ken. Samue +1",
        hands       = { name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
        feet        = { name="Herculean Boots", augments={'Crit. hit damage +3%','STR+12','Accuracy+5','Attack+7',}},
        right_ear   = "Odr Earring",
        back        = Capes.WSCrit
    })
    sets.precast.WS["Victory Smite"].Impetus = set_combine(sets.precast.WS["Victory Smite"],{
        ammo        = { name="Coiste Bodhar", augments={'Path: A',}},
        body        = "Bhikku Cyclas +3",
        right_ear   = { name="Schere Earring", augments={'Path: A',}},
        back        = Capes.WS
    })
    sets.precast.WS["Howling Fist"] = set_combine(sets.precast.WS,{
        head		= { name="Mpaca's Cap", augments={'Path: A',}}, 
        body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
        hands		= { name="Tatena. Gote +1", augments={'Path: A',}},
        left_ear    = { name="Schere Earring", augments={'Path: A',}},
        back        = Capes.WS
    })
    sets.precast.WS["Shijin Spiral"] = set_combine(sets.precast.WS,{
        ammo		= "Aurgelmir Orb +1",
        body        = "Malignance Tabard", 
        hands       = "Malignance Gloves",
        right_ear   = "Mache Earring +1",
        back        = Capes.TP
    })
    sets.precast.WS["Tornado Kick"] = set_combine(sets.precast.WS,{
        ammo        = { name="Coiste Bodhar", augments={'Path: A',}},
        head		= { name="Mpaca's Cap", augments={'Path: A',}}, 
        body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
        feet        = "Anch. Gaiters +3",
        hands		= { name="Tatena. Gote +1", augments={'Path: A',}},
        neck        = { name="Mnk. Nodowa +2", augments={'Path: A',}},
    })
    sets.midcast = {}

    -- Aftercast sets: TP, Idle
    sets.aftercast = {}
    sets.aftercast.Engaged = {
        ammo        = { name="Coiste Bodhar", augments={'Path: A',}},
        head        = { name="Adhemar Bonnet +1", augments={'HP+105','Attack+13','Phys. dmg. taken -4',}},
        body        = { name="Mpaca's Doublet", augments={'Path: A',}},
        hands       = { name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs        = "Bhikku Hose +3",
        feet        = "Anch. Gaiters +3",
        neck        = { name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist       = "Moonbow Belt +1",
        left_ear    = "Sherida Earring",
        right_ear   = { name="Schere Earring", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Niqmaddu Ring",
        back		= Capes.TP
    }
    sets.aftercast.Engaged.DT = {
        ammo		= "Staunch Tathlum +1", -- 3/3
        head        = "Malignance Chapeau",  -- 6/6
        body        = "Malignance Tabard",  -- 9/9
        hands       = "Malignance Gloves",  -- 5/5
        legs        = "Malignance Tights",  -- 7/7
        feet        = "Malignance Boots",  -- 4/4
        neck		= "Mnk. Nodowa +2",
        waist		= "Moonbow Belt +1",
        left_ear	= "Sherida Earring",
        right_ear   = "Telos Earring",
        left_ring	= "Gere Ring",
        right_ring	= "Niqmaddu Ring",
        back		= Capes.TP
    }
    sets.aftercast.Engaged.Hybrid = {
        ammo        = { name="Coiste Bodhar", augments={'Path: A',}},
        head        = { name="Adhemar Bonnet +1", augments={'HP+105','Attack+13','Phys. dmg. taken -4',}},
        body        = { name="Mpaca's Doublet", augments={'Path: A',}},
        hands       = "Malignance Gloves",
        legs        = "Bhikku Hose +3",
        feet        = "Malignance Boots",
        neck        = { name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist       = "Moonbow Belt +1",
        left_ear    = "Sherida Earring",
        right_ear   = { name="Schere Earring", augments={'Path: A',}},
        left_ring   = "Gere Ring",
        right_ring  = "Niqmaddu Ring",
        back		= Capes.TP
    }
    sets.aftercast.Idle = {
        ammo        = "Staunch Tathlum +1", -- 3/3
        head		= "Mpaca's Cap",
        body		= "Mpaca's Doublet",
        hands		= "Mpaca's Gloves",
        legs        = "Mpaca's Hose", 
        feet        = "Mpaca's Boots", 
        neck		= "Loricate Torque +1", -- 6/6
        waist		= "Moonbow Belt +1", -- 6/6
        left_ear	= "Genmei Earring", -- 2/0
        right_ear	= "Odnowa Earring +1", -- 0/2
        left_ring	= "Defending Ring", -- 10/10
        right_ring	= "Karieyh Ring +1",
        back		= "Moonlight Cape" -- 6/6
    }
    include('FFXI-Display.lua')	
    equip_change()
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
end

function precast(spell,action)         
    if spell.interrupted == true or (spell.target.hpp == 0  and not spell.name:startswith("Raise")) or can_do(spell.action_type) == false then
        cancel_spell()
        return
    end

    if spell.name == 'Spectral Jig' then
        send_command('cancel 71;')
    end
    
    local target = player.target.id
    if target ~= last_target then
        ws_order = 1
        last_target = target
    end

    if spell.type == 'WeaponSkill' then
        if (spell.target.model_size + spell.range * range_mult[spell.range]) < spell.target.distance then
            add_to_chat(123,'['..spell.name..'] Target out of range.')
            cancel_spell()
            return
        end
        if spell.name == ascWS and AutoSC == true then
            cancel_spell()
            send_command('@input /ws "'..AutoSkillChain[asc_order]..'" '..spell.target.raw)
            asc_order = asc_order + 1
            if asc_order > table.getn(AutoSkillChain) then
                asc_order = 1
            end
            return
        end
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        else
            equip(sets.precast.WS)
        end
        if spell.english == 'Victory Smite' and buffactive['Impetus'] then
            equip(sets.precast.WS["Victory Smite"].Impetus)
        end
    elseif spell.action_type == 'Ability' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            cancel_spell()
            return
        end
        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end    
    elseif spell.action_type == 'Magic' then
        local spellCost = actual_cost(spell)
        if player.mp < spellCost then
            add_to_chat(123,'Unable to cast: Not enough MP. ('..player.mp..'/'..spellCost..')')
            cancel_spell()
            return
        end
        local spell_recasts = windower.ffxi.get_spell_recasts()
        local sr = math.floor(spell_recasts[spell.recast_id]/60)
        if sr > 0 then
            cancel_spell()
            add_to_chat(123,'['..spell.name..'] '..disp_time(sr))
            return
        end
        if sets.precast.FC and sets.precast.FC[spell.name] then
            equip(sets.precast.FC[spell.name])
        elseif sets.precast.FC and sets.precast.FC[spell.skill] then
            equip(sets.precast.FC[spell.skill])
        elseif sets.precast.FC then
            equip(sets.precast.FC)
        end
    end
end

function midcast(spell,action)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
        send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
    elseif spell.english == 'Monomi: Ichi' and buffactive['Sneak'] then
        send_command('@wait 1.0; cancel 71')
    elseif sets.midcast[spell.skill] and sets.midcast[spell.skill][spell.name] then
        equip(sets.midcast[spell.skill][spell.name])
    elseif sets.midcast[spell.skill] then
        equip(sets.midcast[spell.skill])
    end
end

function aftercast(spell,action)
    if action ~= 'Boost' and not buffactive["Boost"] then
        buffs.Boost = false
    end
    if action ~= 'Impetus' and not buffactive["Impetus"] then
        buffs.Impetus = false
    end    
    equip_check()
end

function status_change(new,old)
    if T{'Idle','Resting','Engaged'}:contains(new) then
        equip_check()
    end
end

function buff_change(buff,gain)
    if buff == 'Boost' then
        buffs.Boost = gain
        equip_check()
    elseif buff == 'Impetus' then
        buffs.Impetus = gain
        equip_check()
    elseif buff == 'stun' and gain then
        equip_check()
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
        equip(eq,{main=CurrentWeapon},buffs.Impetus and {body="Bhikku Cyclas +3"} or {})
    else
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            eq = sets.aftercast.Idle[ids]
        else
            ids = nil
            eq = sets.aftercast.Idle
        end
        equip(eq,{main=CurrentWeapon},buffs.Boost and {waist = "Ask Sash"} or {})
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
        if args[2] == 'autosc' then
			if AutoSC == false then
				AutoSC = true
			else
				AutoSC = false
			end
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
            update_status()
        end
    end
end

function update_status()
    local spc = '   '
    local WeaponColor = get_weapon_color(MainWeapon)

    local engaged_display = egs or 'Default'
    local idle_display = ids or 'Default'

    stateBox:clear()
    stateBox:append(spc)

    local status_text = string.format("%s%s%s", WeaponColor, MainWeapon, spc)

    status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)
    
    status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)

    
	if AutoSC == true then
		status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'AutoSC: ', Colors.Yellow, ascWS, spc)
	end
    
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