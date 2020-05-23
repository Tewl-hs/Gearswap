
--[[
	Author: Tewl / Bismark
	Files: MNK.lua 

	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.

	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
-]]
    function get_sets()		
        -- Load Macros
        send_command('input /macro book 9;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 4')
        send_command('input //equipviewer pos 1663 934')

        -- Variables for auto-skill chain. Only edit AutoWS 
        AutoWS = 'One Inch Punch'
        WeaponSkills = T{'Shijin Spiral','Victory Smite','Shijin Spiral'}
        ws_order = 1
    
        sets.MoveSpeed = { feet = "Hermes' Sandals",} 
    
        -- Augmented Gear
        Capes = {}
        Capes.TP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
        Capes.WS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    
        -- JA Sets
        sets.precast = {}
        sets.precast.JA = { }

        -- WS Sets
        sets.WS = {
            ammo        = "Knobkierrie",
            neck		= "Fotia Gorget",
            waist		= "Moonbow Belt +1",
            left_ear	= "Moonshade Earring",
            right_ear	= "Sherida Earring",
            left_ring	= "Epona's Ring",
            right_ring	= "Niqmaddu Ring",
            back		= Capes.WS
        }
    
        -- TP Sets
        sets.TP = {
            ammo        = "Ginsen",
            head		= "Ken. Jinpachi +1",
            body		= "Ken. Samue +1", 
            hands		= "Hizamaru Kote +2",
            legs		= "Ken. Hakama +1",
            feet		= "Ken. Sune-Ate +1",
            neck		= "Moonbeam Nodowa",
            waist		= "Moonbow Belt +1",
            left_ear	= "Telos Earring",
            right_ear	= "Sherida Earring",
            left_ring	= "Epona's Ring",
            right_ring	= "Niqmaddu Ring",
            back		= Capes.TP
        }
        
        -- Aftercast/Idle Sets
        sets.aftercast = {}
        sets.aftercast.Idle = {
            ammo		= "Staunch Tathlum +1",
            head		= "Ken. Jinpachi +1",
            body		= "Ken. Samue +1", 
            hands		= "Hizamaru Kote +2",
            legs		= "Ken. Hakama +1",
            feet		= "Ken. Sune-Ate +1",
            neck		= "Loricate Torque +1",
            waist		= "Black Belt",
            left_ear	= "Genmei Earring",
            right_ear	= "Odnowa Earring +1",
            left_ring	= "Defending Ring",
            right_ring	= "Gelatinous Ring +1",
            back		= Capes.TP
        }
    end
    
    -- Precast/Midcast/Aftercast Functions
    function precast(spell,action)
        if spell.english == 'Spectral Jig' then
            send_command('cancel 71;')
        end
        
        Mob_ID = player.target.id
	    if Mob_ID ~= Old_Mob_ID then
	        ws_order = 1
	        Old_Mob_ID = Mob_ID
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
            if sets.WS[spell.english] then
                equip(sets.WS[spell.english])
            else
                equip(sets.WS)
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
            equip(sets.TP)
        else
            equip(sets.aftercast.Idle)
        end
    end
    
    -- Status change (spells, songs, etc.)
    function status_change(new,old)
        if T{'Idle','Resting'}:contains(new) then
            equip(sets.aftercast.Idle)
        elseif new == 'Engaged' then
            equip(sets.TP)
        end
    end
    
    function buff_change(status,gain_or_loss)
        --
    end
    
    -- Self commands 
    function self_command(command)
        -- 
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
                        send_command('gs equip sets.aftercast.Idle')
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