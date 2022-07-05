--[[
	Author: Tewl / Bismark
	Files: MNK.lua 

	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.

	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
--]]
    function get_sets()		      
        include('Modes.lua') -- Using Motes meta tables for modes
        
	    send_command('bind ^f9 gs c cycle')

        -- Personal settings: Load macros and set equipviewer position
        send_command('input /macro book 9;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 4')
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
        AutoWS = 'One Inch Punch'
        WeaponSkills = T{'Shijin Spiral','Victory Smite','Shijin Spiral'}
        ws_order = 1
    
        buffs = {}
        buffs.Boost = buffactive["Boost"] or false
        buffs.Impetus = buffactive["Impetus"] or false

        sets.MoveSpeed = { feet = "Hermes' Sandals",} 
    
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
                body    = "Bhikku Cyclas +1"
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
            body        = "Adhemar Jacket +1",
            hands       = "Adhemar Wrist. +1",
            legs		= "Mpaca's Hose",
            feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
            neck		= "Mnk. Nodowa +2",
            waist		= "Moonbow Belt +1",
            left_ear	= "Sherida Earring",
            right_ear	= "Moonshade Earring",
            left_ring	= "Gere Ring",
            right_ring	= "Niqmaddu Ring",
            back		= Capes.WS
        }
        sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS,{
            head        = "Adhemar Bonnet +1",
            body        = "Ken. Samue +1",
            hands       = { name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
            feet        = { name="Herculean Boots", augments={'Crit. hit damage +3%','STR+12','Accuracy+5','Attack+7',}},
            right_ear   = "Odr Earring",
            back        = Capes.WSCrit
        })
        sets.precast.WS["Victory Smite"].Impetus = set_combine(sets.precast.WS["Victory Smite"],{
            body        = "Bhikku Cyclas +1",
            back        = Capes.WS
        })
        sets.precast.WS["Howling Fist"] = set_combine(sets.precast.WS,{
            head        = "Hesychast's Crown +3",
            body		= { name="Tatena. Harama. +1", augments={'Path: A',}},
            hands       = "Anchor. Gloves +3",
            feet        = { name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+2','STR+14','Accuracy+5','Attack+4',}},
            back        = Capes.WSD
        })
        sets.precast.WS["Shijin Spiral"] = set_combine(sets.precast.WS,{
            ammo		= "Aurgelmir Orb +1", -- { name="Coiste Bodhar", augments={'Path: A',}},
            body        = "Malignance Tabard",  -- 9/9
            hands       = "Malignance Gloves",  -- 5/5
            neck        = "Fotia Gorget",
            right_ear   = "Mache Earring +1",
            back        = Capes.TP
        })
    
        -- Aftercast sets: TP, Idle
        sets.aftercast = {}
        sets.aftercast.TP = { }
        sets.aftercast.TP.Normal = {
            ammo		= "Aurgelmir Orb +1",
            head		= "Ken. Jinpachi +1",
            body		= "Ken. Samue +1", 
            hands		= "Adhemar Wrist. +1",
            legs		= "Hes. Hose +3",
            feet		= "Anchorite's Gaiters +3",
            neck		= "Mnk. Nodowa +2",
            waist		= "Moonbow Belt +1",
            left_ear	= "Sherida Earring",
            right_ear   = "Telos Earring",
            left_ring	= "Gere Ring",
            right_ring	= "Niqmaddu Ring",
            back		= Capes.TP
        }
        sets.aftercast.TP.DT = {
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
        sets.aftercast.TP.Hybrid = {
            ammo		= { name="Coiste Bodhar", augments={'Path: A',}},
            head		= "Mpaca's Cap",
            body		= "Mpaca's Doublet",
            hands		= "Mpaca's Gloves",
            legs        = "Mpaca's Hose", 
            feet        = "Malignance Boots", 
            neck		= "Mnk. Nodowa +2",
            waist		= "Moonbow Belt +1",
            left_ear	= "Sherida Earring",
            right_ear   = "Schere Earring",
            left_ring	= "Gere Ring",
            right_ring	= "Niqmaddu Ring",
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
        sets.aftercast.Engaged = {}
    end
    

    function file_unload()     
	    send_command('unbind ^F9')
    end
    
    function precast(spell,action)
        if spell.english == 'Spectral Jig' then
            send_command('cancel 71;')
        end
        
        Mob_ID = player.target.id
	    if Mob_ID ~= Old_Mob_ID then
	        ws_order = 1
	        Old_Mob_ID = Mob_ID
        end
        
        if sets.precast.JA[spell.english] then
            equip(sets.precast.JA[spell.english])
            if spell.english == 'Boost' then
                buffs.Boost = true
            end
            if spell.english == 'Impetus' then
                buffs.Impetus = true
            end
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
            if spell.english == 'Victory Smite' and buffactive['Impetus'] then
                equip(sets.precast.WS["Victory Smite"].Impetus)
            end
        end
    end
    
    function midcast(spell,action)
        if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
            send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
        elseif spell.english == 'Monomi: Ichi' and buffactive['Sneak'] then
            send_command('@wait 1.0; cancel 71')
        end
    end
    
    function aftercast(spell,action)
        if player.status == 'Engaged' then
            sets.aftercast.Engaged = get_engaged_set()
            equip(sets.aftercast.Engaged,(buffs.Impetus or buffactive["Impetus"]) and {body="Bhikku Cyclas +1"} or {})
        else
            equip(sets.aftercast.Idle,(buffs.Boost or buffactive["Boost"]) and {waist = "Ask Sash"} or {})
        end
        if not buffactive["Boost"] then
          buffs.Boost = false
        end
        if not buffactive["Impetus"] then
          buffs.Impetus = false
        end
    end
    
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            equip(sets.aftercast.Idle,buffactive["Boost"] and {waist = "Ask Sash"} or {})
        elseif new == 'Engaged' then
            sets.aftercast.Engaged = get_engaged_set()
            equip(sets.aftercast.Engaged,buffactive["Impetus"] and {body="Bhikku Cyclas +1"} or {})
        end
    end
    
    function buff_change(buff,gain)
        if not gain then
            if buff == 'Boost' then
                buffs.Boost = false
                SwapGear()
            end
            if buff == 'Impetus' then
                buffs.Impetus = false
                SwapGear()
            end
        end
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
            sets.aftercast.Engaged = get_engaged_set()
            equip(sets.aftercast.Engaged,buffactive["Impetus"] and {body="Bhikku Cyclas +1"} or {})
        else
            equip(sets.aftercast.Idle,buffactive["Boost"] and {waist = "Ask Sash"} or {})
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