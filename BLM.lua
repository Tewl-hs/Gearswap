-- Testing Motes, work in progress
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

function user_setup()
    state.CastingMode:options('Default', 'MACC','MagicBurst')
    state.IdleMode:options('Normal','PDT')
end

	
function init_gear_sets()
    sets.MoveSpeed = { feet = "Herald's Gaiters", } 

    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Mana Wall'] = { }
	
	sets.precast.FastCast = { -- 82
        main        = "Sucellus", -- 5
        sub         = "Genbu's Shield",
        ammo        = "Sapience Orb", -- 2
        head        = "Amalric Coif +1", -- 11
        body        = { name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5','MND+8','Mag. Acc.+10',}}, --11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, -- 7
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        waist       = "Witful Belt", -- 5
        left_ear    = "Loquacious Earring", -- 2
        right_ear   = "Etiolation Earring", -- 1
        right_ring  = "Kishar Ring", -- 4 
        left_ring   = "Prolix Ring", -- 2
        back        = { name="Taranus's Cape", augments={'MP+60','"Fast Cast"+10',}}, -- 10
    }
    sets.precast.Stoneskin = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
	
    sets.midcast = {}
    sets.midcast['Elemental Magic'] = {
        main        = { name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
        sub         = "Willpower Grip",
        ammo        = "Pemphredo Tathlum",
        head        = "Jhakri Coronal +2",
        body        = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands       = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs        = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet        = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck        = "Baetyl Pendant",
        waist       = "Eschan Stone",
        left_ear    = "Regal Earring",
        right_ear   = "Barkaro. Earring",
        left_ring   = "Shiva Ring +1",
        right_ring  = "Shiva Ring +1",
        back        = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
     }
	sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'], {

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
        head        = "Amalric Coif +1",
        feet        = "Inspirited Boots"
    })
    
    sets.idle = {
        main        = { name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
        sub         = "Willpower Grip",
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
    if spell.action_type == 'Magic' then
        equip(sets.precast.FastCast)
    end
end


function job_post_midcast(spell)
    if spell.skill == 'Elemental Magic' then
        equip(sets.midcast['Elemental Magic'])
    elseif spell.skill == 'Enhancing Magic' then
        if spell.name == 'Refresh' then
            equip(sets.midcast[spell.skill].Refresh)
        else
            equip(sets.midcast[spell.skill])
        end
    end
end        

function job_aftercast(spell)
    equip_aftercast()
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip_aftercast()
    end
end

function job_state_change(stateField, newValue, oldValue)

end

function equip_aftercast()
    equip(sets.idle)
end

function job_self_command(cmdParams, eventArgs)
	if cmdParams[1] == 'idle' then
		equip_aftercast()
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