
--[[
	Author: Tewl / Bismark
	Files: MNK.lua 

	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.

	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
--]]
    function get_sets()		
        -- Personal settings: Load macros and set equipviewer position
        send_command('input /macro book 9;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 4')
        send_command('input //equipviewer pos 1663 934')

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
        Capes.WS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    
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
                feet    = "Anchorite's Gaiters +2"
            },
            ["Focus"] = {},
            ["Footwork"] = {},
            ["Counterstance"] = {},
            ["Chi Blast"] = {
                head    = "Hesychast's Crown +1"
            },
            ["Chakra"] = {
                body    = "Anchorite's Cyclas +1",
                hands   = "Hesychast's Gloves +1"
            },
            ["Formless Strikes"] = {
                body    = "Hesychast's Cyclas +1"
            },
            ["Mantra"] = {
                feet    = "Hesychast's Gaiters +1"
            },
            ["Boost"] = {
                waist   = "Ask Sash",
                hands   = "Anchorite's Gloves +1"
            }
        }
        sets.precast.WS = {
            ammo        = "Knobkierrie",
            head        = "Adhemar Bonnet +1",
            hands       = "Adhemar Wrist. +1",
            legs		= "Ken. Hakama +1",
            feet		= "Ken. Sune-Ate +1",
            neck		= "Fotia Gorget",
            waist		= "Moonbow Belt +1",
            left_ear	= "Moonshade Earring",
            right_ear	= "Sherida Earring",
            left_ring	= "Epona's Ring",
            right_ring	= "Niqmaddu Ring",
            back		= Capes.WS
        }
        sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS,{
            feet        = { name="Herculean Boots", augments={'Crit. hit damage +3%','STR+12','Accuracy+5','Attack+7',}},
            right_ear   = "Brutal Earring",
        })
        sets.precast.WS["Shijin Spiral"] = set_combine(sets.precast.WS,{
            body        = "Adhemar Jacket +1",
        })
    
        -- Aftercast sets: TP, Idle
        sets.aftercast = {}
        sets.aftercast.TP = {
            ammo        = "Ginsen",
            head		= "Ken. Jinpachi +1",
            body		= "Ken. Samue +1", 
            hands		= "Adhemar Wrist. +1",
            legs		= "Hes. Hose +3",
            feet		= "Anchorite's Gaiters +2",
            neck		= "Mnk. Nodowa +2",
            waist		= "Moonbow Belt +1",
            left_ear	= "Telos Earring",
            right_ear	= "Sherida Earring",
            left_ring	= "Epona's Ring",
            right_ring	= "Niqmaddu Ring",
            back		= Capes.TP
        }
        sets.aftercast.Idle = {
            ammo		= "Staunch Tathlum +1", -- 3/3
            head        = "Malignance Chapeau",  -- 6/6
            body        = "Malignance Tabard",  -- 9/9
            hands       = "Malignance Gloves",  -- 5/5
            legs        = "Malignance Tights",  -- 7/7
            feet        = "Malignance Boots",  -- 4/4
            neck		= "Loricate Torque +1", -- 6/6
            waist		= "Moonbow Belt +1", -- 6/6
            left_ear	= "Genmei Earring", -- 2/0
            right_ear	= "Odnowa Earring +1", -- 0/2
            left_ring	= "Defending Ring", -- 10/10
            right_ring	= "Gelatinous Ring +1", -- 7/-1
            back		= "Moonlight Cape" -- 6/6
        }
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
                equip(sets.precast.JA['Impetus'])
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
            equip(sets.aftercast.TP,(buffs.Impetus or buffactive["Impetus"]) and {body="Bhikku Cyclas +1"} or {})
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
            equip(sets.aftercast.TP,buffactive["Impetus"] and {body="Bhikku Cyclas +1"} or {})
        end
    end
    
    function buff_change(buff,gain)
        if not gain then
            if buff == 'Boost' then
                buffs.Boost = false
            end
            if buff == 'Impetus' then
                buffs.Impetus = false
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
        end
    end

    function SwapGear()
        if player.status == 'Engaged' then
            equip(sets.aftercast.TP,buffactive["Impetus"] and {body="Bhikku Cyclas +1"} or {})
        else
            equip(sets.aftercast.Idle,buffactive["Boost"] and {waist = "Ask Sash"} or {})
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