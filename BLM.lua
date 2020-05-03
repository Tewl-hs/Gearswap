-- Blank Template. Need to buy gear and job master
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

function user_setup()
    state.CastingMode:options('Default', 'MACC','MagicBurst')
    state.IdleMode:options('Default','PDT')
end

	
function init_gear_sets()
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Mana Wall'] = { }
	
	sets.precast.FastCast = { }
    sets.precast.Stoneskin = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
	
    sets.midcast = {}
    sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Default = { }
	sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'].Default, {

    })
	
    sets.midcast['Dark Magic'] = {  }  
    sets.midcast['Enfeebling Magic'] = { }
	sets.midcast['Healing Magic'] = { }
    sets.midcast['Enhancing Magic'] = {  }
    
    sets.Idle = {}
	sets.Idle.Default = { }
	sets.Idle.PDT = { }
end

function job_pretarget(spell)

end

function job_precast(spell)

end


function job_post_midcast(spell)

end        

function job_aftercast(spell)

end

function status_change(new,tab)

end


function job_state_change(stateField, newValue, oldValue)

end

function job_self_command(command)

end