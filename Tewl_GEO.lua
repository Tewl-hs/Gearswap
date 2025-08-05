--[[
	Author: Tewl / Bismark
	Files: Tewl_GEO.lua 

    Binds
    CTRL+F9     : Toggle burst mode on and off
    CTRL+F10    : Cycle Idle sets
    CTRL+F11    : Cycle Engaged sets
--]]
function get_sets()
	items = require('resources').items
	require('queues')
    
    include('FFXI-Mappings')
	
    include('FFXI-Utility')

    set_macros(20,1)
	send_command('wait 1.5;input /lockstyleset 2')
    send_command('input //equipviewer pos 1663 914')

    -- Macro binds F9-12
    send_command('bind ^f9 gs c toggle burst')
    send_command('bind ^f10 gs c cycle idle')
    send_command('bind ^f11 gs c cycle engaged')
    send_command('bind ^F12 gs c toggle luopan')

    -- Movement speed gear for auto equip when moving
    sets.MoveSpeed = { feet = "Geo. Sandals +3",}
    BurstMode = false
    LuopanDisplay = true

    CurrentWeapon = ''

    -- Augmented Capes
    Capes = {}
    Capes.PetRegen = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
    Capes.FC = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
    Capes.MagicDmg = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
    Capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +20','Pet: Damage taken -3%',}}

    -- Gear sets
    sets.luopan = {
        main        = "Idris",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        ammo        = empty,
        head        = "Azimuth Hood +3",
        neck        = "Bagua Charm +2",
        waist       = "Isa Belt",
        hands       = "Geo. Mitaines +3",
        feet        = "Bagua Sandals +3",
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = Capes.PetRegen,
    }

    sets.precast = {}
    sets.precast.FC = { -- FC 81/80
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = "Amalric Coif +1", -- 11
        body        = "Merlinic Jubbah", -- 11
        hands       = { name="Merlinic Dastanas", augments={'"Fast Cast"+6','Mag. Acc.+15','"Mag.Atk.Bns."+4',}}, -- 6
        legs        = "Geomancy Pants +3", -- 15
        feet        = { name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','"Mag.Atk.Bns."+5',}}, -- 11
        neck        = "Orunmila's Torque", -- 5
        waist       = "Embla Sash", -- 5
        left_ear    = "Genmei Earring",
        right_ear   = "Azimuth Earring +1",
        left_ring   = "Kishar Ring", -- 4
        right_ring  = "Defending Ring",
        back        = Capes.FC, -- 10
    }
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC,{main="Daybreak",sub="Ammurapi Shield"})
    sets.precast.FC.Impact = set_combine(sets.precast.FC,{head=empty,body="Twilight Cloak"})
    sets.precast.JA = {
        ['Primeval Zeal'] = { head = "Bagua Galero +3" },
        ['Full Circle'] = { head = "Azimuth Hood +3" },
        ['Bolster'] = { body = "Bagua Tunic +3" },
        ['Life Cycle'] = {
            body        = "Geomancy Tunic +3",
            back        = Capes.PetRegen
        },
        ['Curative Recantation'] = { hands = "Bagua Mitaines +3"},
        ['Mending Halation'] = { legs = "Bagua Pants +3" },
        ['Radial Arcana'] = { feet = "Bagua Sandals +3" },
    }
    sets.precast.WS = {
        head		= "Nyame Helm",
        body		= "Nyame Mail",
        hands		= "Nyame Gauntlets",
        legs		= "Nyame Flanchard",
        feet		= "Nyame Sollerets",
        waist       = "Grunfeld Rope",
        left_ear    = "Moonshade Earring",
        right_ear   = "Ishvara Earring",
        left_ring	= "Epaminondas's Ring",
        right_ring	= "Cornelia's Ring",
    }

    sets.midcast = {}
    sets.midcast['Geomancy'] = {
        main        = "Idris",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 5/18
        head        = "Azimuth Hood +3", -- 15
        body        = "Bagua Tunic +3", -- 16
        hands       = "Geo. Mitaines +3", -- 19
        legs        = "Vanya Slops",
        feet        = "Medium's Sabots",
        neck        = "Bagua Charm +2",
        waist       = "Austerity Belt +1",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        back        = Capes.GeoSkill,
    }
    sets.midcast['Geomancy'].Indi = {
        main        = { name="Gada", augments={'Indi. eff. dur. +9','MND+5','Mag. Acc.+14','DMG:+1',}},
        neck        = "Incanter's Torque",
        legs        = "Bagua Pants +3",
        feet        = "Azimuth Gaiters +3",
    }

    sets.midcast['Elemental Magic'] = {
        main        = "Bunzi's Rod",
        sub         = "Ammurapi Shield",
        ammo        = "Ghastly Tathlum +1",
        head        = "Agwu's Cap",
        body        = "Amalric Doublet +1",
        hands       = "Amalric Gages +1",
        legs        = "Agwu's Slops",
        feet        = "Agwu's Pigaches",
        neck        = "Sibyl Scarf",
        waist       = "Acuity Belt +1",
        left_ear    = "Regal Earring",
        right_ear   = "Malignance Earring",
        left_ring   = "Freke Ring",
        right_ring  = "Metamor. Ring +1",
        back        = Capes.MagicDmg,
    }

    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        head        = "Azimuth Hood +3",
        body        = "Azimuth Coat +3",
        hands       = "Agwu's Gages",
        legs        = "Azimuth Tights +3",
        feet        = "Agwu's Pigaches",
    })

    sets.midcast['Enfeebling Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield",
        head        = "Geo. Galero +3",
        body        = "Geomancy Tunic +3",
        hands       = "Regal Cuffs",
        legs        = "Geomancy Pants +3",
        feet        = "Geo. Sandals +3",
        neck        = "Bagua Charm +2",
        left_ear    = "Regal Earring", 
        right_ear   = "Malignance Earring",
        left_ring	= "Kishar Ring",
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Luminary Sash",
        back        = Capes.MagicDmg -- // Need to make a MND/MACC ambu cape
    }

    sets.midcast['Enhancing Magic'] = { -- Enhancing Duration: 70
        --main        = "Gada" -- // Enh. dur. +6%
        sub         = "Ammurapi Shield", -- 10
        head        = "Telchine Cap", --10
        body        = "Telchine Chas.", -- 10
        hands       = "Telchine Gloves", -- 10
        legs        = "Telchine Braconi", -- 10
        feet        = "Telchine Pigaches",  -- 10
        neck        = "Incanter's Torque",
        left_ear    = "Mimir Earring",
        right_ear   = "Andoaa Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Embla Sash" -- 10
    }
    sets.midcast['Enhancing Magic'].Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head        = "Amalric Coif +1",
        feet        = "Inspirited Boots",
        waist		= "Gishdubar Sash",
        back		= "Grapevine Cape"
    })

    sets.midcast['Dark Magic'] = {
        main        = "Daybreak", -- MA 40
        sub         = "Ammurapi Shield", -- MA 38
        ammo        = "Pemphredo Tathlum", -- MA 8
        head        = "Ea Hat +1", -- MA 51
        body        = "Geomancy Tunic +3", -- MA 50  / Skill 21
        hands       = "Agwu's Gages", -- MA 40 (Augment +15)
        legs        = "Azimuth Tights +3", -- MA 63 / Skill 10
        feet        = "Agwu's Pigaches", -- MA 40 (Augment +15)
        neck        = "Erra Pendant", -- MA 17 / Skill 10
        waist       = "Acuity Belt +1", -- MA +15
        left_ear    = "Digni. Earring", -- MA  10
        right_ear   = "Malignance Earring", -- MA 10
        left_ring   = "Evanescence Ring", -- MA 10
        right_ring  = "Metamor. Ring +1", -- MA 10
        back        = "Aurist's Cape +1" -- MA 33
    }
    sets.midcast['Dark Magic'].AspirDrain = set_combine(sets.midcast['Dark Magic'],{
        feet        = "Agwu's Pigaches",
        waist       = "Austertiy Belt +1",
        left_ring   = "Evanescence Ring",
    })

    sets.midcast['Healing Magic'] = {
        main        = "Daybreak",
        sub         = "Ammurapi Shield", -- 10
        range       = empty,
        ammo        = "Hydrocera",
        head        = "Vanya Hood",
        body        = "Vanya Robe",
        hands       = "Vanya Cuffs",
        legs        = "Vanya Slops",
        feet        = "Vanya Clogs" ,
        neck        = "Incanter's Torque",
        left_ear    = "Etiolation Earring",
        right_ear   = "Halasz Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Austerity Belt +1",
        back        = "Solemnity Cape",
    }

    sets.midcast['Healing Magic'].Cure = set_combine(sets.midcast['Healing Magic'],{
        body        = "Heka's Kalasiris",
        neck        = "Nodens Gorget",
        left_ear    = "Mendicant's Earring",
        left_ring   = "Naji's Loop",
        back        = "Solemnity Cape",
    })
    sets.aftercast = {}
    sets.aftercast.Idle = {
        main        = "Daybreak",
        sub         = "Genmei Shield",
        range       = { name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head        = { name="Merlinic Hood", augments={'"Counter"+3','"Drain" and "Aspir" potency +9','"Refresh"+2','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        body        = "Azimuth Coat +3",
        hands       = "Bagua Mitaines +3",
        legs        = { name="Merlinic Shalwar", augments={'"Dbl.Atk."+1','Accuracy+4','"Refresh"+2','Accuracy+15 Attack+15',}},
        feet        = "Geomancy Sandals +3",
        neck        = "Loricate Torque +1",
        left_ear    = "Etiolation Earring",
        right_ear   = "Genmei Earring",
        left_ring	= { name="Stikini Ring +1", bag="wardrobe7" },
        right_ring	= { name="Stikini Ring +1", bag="wardrobe8" },
        waist       = "Fucho-no-Obi",   
        back        = "Moonlight Cape",         
    }
    sets.aftercast.Idle.DT = set_combine(sets.aftercast.Idle, {
        range       = empty,
        ammo        = "Staunch Tathlum +1",
        head        = "Nyame Helm",
        body        = "Nyame Mail",
        legs        = "Nyame Flanchard",
        left_ear    = "Etiolation Earring",
        right_ear   = "Genmei Earring",
        right_ring   = "Defending Ring",
    })

    sets.aftercast.Engaged = {

    }

    include('FFXI-Display.lua')
end

function file_unload()  
    send_command('unbind ^F9')
    send_command('unbind ^F10')
    send_command('unbind ^F11')
    send_command('unbind ^F12')
end

function precast(spell)
    if spell.action_type == 'Magic' and sets.precast.FC then
        if spell.name:startswith('Cur') and spell.name ~= 'Cursna' then
            equip(set_combine(sets.precast.FC,{body="Heka's Kalasiris"}))
        elseif sets.precast.FC[spell.name] then
            equip(sets.precast.FC[spell.name])
        else
            equip(sets.precast.FC)
        end
    elseif spell.type == 'WeaponSkill' then
        if player.tp < 1000 then
            add_to_chat(123,'Unable to use: '..spell.name..'. Not enough TP.')
            cancel_spell()
            return
        end
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        elseif sets.precast.WS then
            equip(sets.precast.WS)
        end
    elseif spell.action_type == 'Ability' then
        if sets.precast.JA[spell.name] then
            equip(sets.precast.JA[spell.name])
        end
    end
end

function midcast(spell)
    if sets.midcast[spell.skill] then
        if spell.skill == 'Geomancy' and spell.name:startswith('Indi-') and sets.midcast[spell.skill].Indi then
            equip(sets.midcast[spell.skill].Indi)
        elseif spell.skill == 'Healing Magic' then
            if spell.name:startswith('Cur') and spell.name ~= "Cursna" and sets.midcast[spell.skill].Cure then
                equip(sets.midcast[spell.skill].Cure)
            elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Dark Magic' then
            if spell.name:startswith('Aspir') or spell.name:startswith('Drain') and sets.midcast[spell.skill].AspirDrain then
                equip(sets.midcast[spell.skill].AspirDrain)
            else
                equip(sets.midcast[spell.skill])
            end
        elseif spell.skill == 'Elemental Magic' then
            if EleDebuff:contains(spell.name) and sets.midcast[spell.skill].Debuff then
                equip(sets.midcast[spell.skill].Debuff)
            elseif sets.midcast[spell.skill].Burst and BurstMode == true then              
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst == nil then
                    equip(set_combine(sets.midcast[spell.skill].Burst,{head=empty,body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] and sets.midcast[spell.skill][spell.name].Burst then
                    equip(sets.midcast[spell.skill][spell.name].Burst)
                else
                    equip(sets.midcast[spell.skill].Burst)
                end
            else        
                if spell.name == 'Impact' and sets.midcast[spell.skill][spell.name] == nil then
                    equip(set_combine(sets.midcast[spell.skill],{head=empty,body="Twilight Cloak"}))
                elseif sets.midcast[spell.skill][spell.name] then
                    equip(sets.midcast[spell.skill][spell.name])
                else
                    equip(sets.midcast[spell.skill])
                end
            end 
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip({waist="Hachirin-no-Obi"})
            elseif spell.target.distance < (1.7 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            elseif spell.target.distance < (8 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.name == 'Dispelga' and sets.midcast[spell.skill][spell.name] == nil then
                equip(set_combine(sets.midcast[spell.skill],{main='Daybreak'}))
            elseif sets.midcast[spell.skill][spell.name] then
                equip(sets.midcast[spell.skill][spell.name])
            else
                equip(sets.midcast[spell.skill])
            end
        elseif sets.midcast[spell.skill][spell.name] then
            equip(sets.midcast[spell.skill][spell.name])
        else
            equip(sets.midcast[spell.skill])
        end
    end
end

function aftercast(spell)    
    if not spell.interrupted then
        if spell.name:startswith('Indi-') then
            if spell.target.type == 'SELF' then
                last_indi = string.sub(spell.name,6)
            end
        elseif spell.name:startswith('Geo-') or spell.name == "Mending Halation" or spell.name == "Radial Arcana" then
            if spell.name:startswith('Geo-') then
                last_geo = string.sub(spell.name,5)
            end
        end
    end    
    equip_check()
end

function pet_change()
    equip_check()
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip_check()
    end
end

function buff_change(buff,gain)
    if buff == 'silence' and gain then
        if player.inventory['Echo Drops'] then
            send_command('@input /item "Echo Drops" <me>')
        else
            add_to_chat(123,'Silenced, you are out of Echo Drops!')	
        end
    elseif buff == 'Bolster' and not gain then
        add_to_chat(123, '[Bolster] OFF')
    elseif buff == 'stun' and gain then
        equip_check()
    end
end

function equip_check()
    if player.status == 'Engaged' then
        local engagedSet = sets.aftercast.Engaged
        if egs ~= nil and sets.aftercast.Engaged[egs] then 
            engagedSet = sets.aftercast.Engaged[egs]
        else
            egs = nil
        end
        if pet.isvalid then
            equip(set_combine(engagedSet,sets.luopan))
        else
            equip(engagedSet)
        end
    else	
        local idleSet = sets.aftercast.Idle
        if ids ~= nil and sets.aftercast.Idle[ids] then 
            idleSet = sets.aftercast.Idle[ids]
        else
            ids = nil
        end
        if pet.isvalid then
            equip(set_combine(idleSet,sets.luopan))
        else
            equip(idleSet)
        end
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
        if args[2] == 'burst' then
            if BurstMode == false then
                BurstMode = true
                add_to_chat('BurstMode enabled.')
            else
                BurstMode = false
                add_to_chat('BurstMode disabled.')
            end        
        elseif args[2] == 'luopan' then
            if LuopanDisplay== false then
                LuopanDisplay = true
                add_to_chat('Luopan display enabled.')
            else
                LuopanDisplay = false
                add_to_chat('Luopan display disabled.')
            end
        end
		update_status()
    elseif args[1] == 'equip_check' then
        equip_check()
	elseif args[1] == 'update_status' then
		update_status()
    end
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

function update_status()
	local spc = '   '
    local WeaponColor = get_weapon_color(CurrentWeapon)

    local engaged_display = egs or 'Default'
    local idle_display = ids or 'Default'

	stateBox:clear()
	stateBox:append(spc)
	
	local status_text = string.format("%s%s%s", WeaponColor, CurrentWeapon, spc)

	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Engaged: ', Colors.Blue, engaged_display, spc)
	
	status_text = string.format("%s%s %s%s%s%s", status_text, Colors.White, 'Idle: ', Colors.Blue, idle_display, spc)
	
	if BurstMode == true then
		status_text = string.format("%s%s %s%s", status_text, Colors.Yellow, 'BurstMode', spc)
	end
	stateBox:append(status_text)
	stateBox:show()
end

function equip_change()
	local inventory = windower.ffxi.get_items();
	local equipment = inventory['equipment'];
	local item = windower.ffxi.get_items(equipment["main_bag"],equipment["main"])
	if item and items[item['id']] then 
		local ew = items[item['id']].name
		if ew ~= CurrentWeapon then -- If weapon changed
			if ew == 'Gil' then
				CurrentWeapon = 'Empty'
				TwoHandedWeapon = false
			else
				CurrentWeapon = ew
				if T{4,6,7,8,10,12}:contains(items[item['id']].skill) then -- GS GA Scythe Polearm GK Staff
					TwoHandedWeapon = true
				else 
					TwoHandedWeapon = false	
				end
			end	
			update_status()
		end
	end
end
--[[
        Luopan Distance Tracking
        Source: https://github.com/Headtatt/Gearswap/blob/main/data/GEO.lua
]]--

debuff_list = S{'Gravity','Paralysis','Slow','Languor','Vex','Torpor','Slip','Malaise','Fade','Frailty','Wilt','Poison'}
ignore_list = S{'SlipperySilas','HareFamiliar','SheepFamiliar','FlowerpotBill','TigerFamiliar','FlytrapFamiliar','LizardFamiliar','MayflyFamiliar','EftFamiliar','BeetleFamiliar','AntlionFamiliar',
                'CrabFamiliar','MiteFamiliar','KeenearedSteffi','LullabyMelodia','FlowerpotBen','SaberSiravarde','FunguarFamiliar','ShellbusterOrob','ColdbloodComo','CourierCarrie','Homunculus',
                'VoraciousAudrey','AmbusherAllie','PanzerGalahad','LifedrinkerLars','ChopsueyChucky','AmigoSabotender','NurseryNazuna','CraftyClyvonne','PrestoJulio','SwiftSieghard','MailbusterCetas',
                'AudaciousAnna','TurbidToloi','LuckyLulush','DipperYuly','FlowerpotMerle','DapperMac','DiscreetLouise','FatsoFargann','FaithfulFalcorr','BugeyedBroncha','BloodclawShasra','GorefangHobs',
                'GooeyGerard','CrudeRaphie','DroopyDortwin','SunburstMalfik','WarlikePatrick','ScissorlegXerin','RhymingShizuna','AttentiveIbuki','AmiableRoche','HeraldHenry','BrainyWaluis',
                'SuspiciousAlice','HeadbreakerKen','RedolentCandi','CaringKiyomaro','HurlerPercival','AnklebiterJedd','BlackbeardRandy','FleetReinhard','GenerousArthur','ThreestarLynn','BraveHeroGlenn',
                'SharpwitHermes','AlluringHoney','CursedAnnabelle','SwoopingZhivago','BouncingBertha','MosquitoFamilia','Ifrit','Shiva','Garuda','Fenrir','Carbuncle','Ramuh','Leviathan','CaitSith','Diabolos',
                'Titan','Atomos','Siren','WaterSpirit','FireSpirit','EarthSpirit','ThunderSpirit','AirSpirit','LightSpirit','DarkSpirit','IceSpirit', 'Azure','Cerulean','Rygor','Firewing','Delphyne','Ember','Rover','Max',
                'Buster','Duke','Oscar','Maggie','Jessie','Lady','Hien','Raiden','Lumiere','Eisenzahn','Pfeil','Wuffi','George','Donryu','Qiqiru','Karav-Marav','Oboro','Darug Borug','Mikan','Vhiki','Sasavi',
                'Tatang','Nanaja','Khocha','Nanaja','Khocha','Dino','Chomper','Huffy','Pouncer','Fido','Lucy','Jake','Rocky','Rex','Rusty','Himmelskralle','Gizmo','Spike','Sylvester','Milo','Tom','Toby','Felix',
                'Komet','Bo','Molly','Unryu','Daisy','Baron','Ginger','Muffin','Lumineux','Quatrevents','Toryu','Tataba','Etoilazuree','Grisnuage','Belorage','Centonnerre','Nouvellune','Missy','Amedeo','Tranchevent',
                'Soufflefeu','Etoile','Tonnerre','Nuage','Foudre','Hyuh','Orage','Lune','Astre','Waffenzahn','Soleil','Courageux','Koffla-Paffla','Venteuse','Lunaire','Tora','Celeste','Galja-Mogalja','Gaboh','Vhyun',
                'Orageuse','Stellaire','Solaire','Wirbelwind','Blutkralle','Bogen','Junker','Flink','Knirps','Bodo','Soryu','Wanaro','Totona','Levian-Movian','Kagero','Joseph','Paparaz','Coco','Ringo','Nonomi',
                'Teter','Gigima','Gogodavi','Rurumo','Tupah','Jyubih','Majha','Luron','Drille','Tournefoux','Chafouin','Plaisantin','Loustic','Histrion','Bobeche','Bougrion','Rouleteau','Allouette','Serenade',
                'Ficelette','Tocadie','Caprice','Foucade','Capillotte','Quenotte','Pacotille','Comedie','Kagekiyo','Toraoh','Genta','Kintoki','Koumei','Pamama','Lobo','Tsukushi','Oniwaka','Kenbishi','Hannya','Mashira',
                'Nadeshiko','E100','Koume','X-32','Poppo','Asuka','Sakura','Tao','Mao','Gadget','Marion','Widget','Quirk','Sprocket','Cogette','Lecter','Coppelia','Sparky','Clank','Calcobrena','Crackle','Ricochet',
                'Josette','Fritz','Skippy','Pino','Mandarin','Jackstraw','Guignol','Moppet','Nutcracker','Erwin','Otto','Gustav','Muffin','Xaver','Toni','Ina','Gerda','Petra','Verena','Rosi','Schatzi','Warashi',
                'Klingel','Clochette','Campanello','Kaiserin','Principessa','Butler','Graf','Caro','Cara','Mademoiselle','Herzog','Tramp','V-1000','Hikozaemon','Nine','Acht','Quattro','Zero','Dreizehn','Seize',
                'Fukusuke','Mataemon','Kansuke','Polichinelle','Tobisuke','Sasuke','Shijimi','Chobi','Aurelie','Magalie','Aurore','Caroline','Andrea','Machinette','Clarine','Armelle','Reinette','Dorlote','Turlupin',
                'Klaxon','Bambino','Potiron','Fustige','Amidon','Machin','Bidulon','Tandem','Prestidige','Purute-Porute','Bito-Rabito','Cocoa','Totomo','Centurion','A7V','Scipio','Sentinel','Pioneer','Seneschal',
                'Ginjin','Amagatsu','Dolly','Fantoccini','Joe','Kikizaru','Whippet','Punchinello','Charlie','Midge','Petrouchka','Schneider','Ushabti','Noel','Yajirobe','Hina','Nora','Shoki','Kobina','Kokeshi','Mame',
                'Bishop','Marvin','Dora','Data','Robin','Robby','Porlo-Moperlo','Paroko-Puronko','Pipima','Gagaja','Mobil','Donzel','Archer','Shooter','Stephen','Mk.IV','Conjurer','Footman','Tokotoko','Sancho',
                'Sarumaro','Picket','Mushroom','Shantotto','Naji','Kupipi','Excenmille','Ayame','NanaaMihgo','Curilla','Volker','Ajido-Marujido','Trion','Zeid','Lion','Tenzen','MihliAliapoh','Valaineral','Joachim',
                'NajaSalaheem','Prishe','Ulmia','ShikareeZ','Cherukiki','IronEater','Gessho','Gadalar','Rainemard','Ingrid','LehkoHabhoka','Nashmeira','Zazarg','Ovjang','Mnejing','Sakura','Luzaf','Najelith','Aldo',
                'Moogle','Fablinix','Maat','D.Shantotto','StarSibyl','Karaha-Baruha','Cid','Gilgamesh','Areuhat','SemihLafihna','Elivira','Noillurie','LhuMhakaracca','FerreousCoffin','Lilisette','Mumor','UkaTotlihn',
                'Klara','RomaaMihgo','KuyinHathdenna','Rahal','Koru-Moru','Pieuje','InvincibleShld','Apururu','JakohWahcondalo','Flaviria','Babban','Abenzio','Rughadjeen','Kukki-Chebukki','Margret','Chacharoon',
                'LheLhangavo','Arciela','Mayakov','Qultada','Adelheid','Amchuchu','Brygid','Mildaurion','Halver','Rongelouts','Leonoyne','Maximilian','Kayeel-Payeel','Robel-Akbel','Kupofried','Selh\'teus','Yoran-Oran',
                'Sylvie','Abquhbah','Balamor','August','Rosulatia','Teodor','Ullegore','Makki-Chebukki','KingOfHearts','Morimar','Darrcuiln','ArkHM','ArkEV','ArkMR','ArkTT','ArkGK','Iroha','Ygnas','Excenmille','Ayame',
                'Maat','Aldo','NajaSalaheem','Lion','Zeid','FluffyBredo'}

luopantxt = {}
luopantxt.pos = {}
luopantxt.pos.x = -200
luopantxt.pos.y = 175
luopantxt.text = {}
luopantxt.text.font = 'Arial'
luopantxt.text.size = 12
luopantxt.flags = {}
luopantxt.flags.right = true

luopan = texts.new('${value}', luopantxt)

luopan:bold(true)
luopan:bg_alpha(0)--128
luopan:stroke_width(2)
luopan:stroke_transparency(192)

bt_color = '\\cs(230,118,116)'

windower.raw_register_event('prerender', function()
    local s = windower.ffxi.get_mob_by_target('me')
    if windower.ffxi.get_mob_by_target('pet') then
        myluopan = windower.ffxi.get_mob_by_target('pet')
    else
        myluopan = nil
    end
    local luopan_txtbox = ''
    local indi_count = 0
    local geo_count = 0
    local battle_target = windower.ffxi.get_mob_by_target('bt') or false
    if myluopan and last_geo then
        luopan_txtbox = luopan_txtbox..' \\cs(0,255,0)Geo-'..last_geo..':\\cs(255,255,255)\n'
        for i,v in pairs(windower.ffxi.get_mob_array()) do
            local DistanceBetween = ((myluopan.x - v.x)*(myluopan.x-v.x) + (myluopan.y-v.y)*(myluopan.y-v.y)):sqrt()
            if DistanceBetween < (6 + v.model_size) and not (v.status == 2 or v.status == 3) and v.name and v.name ~= '' and v.name ~= "Luopan" and v.valid_target and v.model_size > 0 then
                if debuff_list:contains(last_geo) then
					if v.is_npc and not (v.in_party or ignore_list:contains(v.name)) then
						if battle_target and battle_target.id == v.id then
							luopan_txtbox = luopan_txtbox..' '..bt_color..v.name.." "..string.format("%.2f",DistanceBetween).."\\cs(255,255,255)\n"
						else
							luopan_txtbox = luopan_txtbox..' '..v.name.." "..string.format("%.2f",DistanceBetween).."\n"
						end
						geo_count = geo_count + 1
					end
                else
					if v.in_party then
						luopan_txtbox = luopan_txtbox..' '..v.name.." "..string.format("%.2f",DistanceBetween).."\n"
						geo_count = geo_count + 1
					end
                end
            end
        end
    end

    if buffactive['Colure Active'] and last_indi then
		if myluopan then
			luopan_txtbox = luopan_txtbox..'\n'
		end
		luopan_txtbox = luopan_txtbox..' \\cs(0,255,0)Indi-'..last_indi..':\\cs(255,255,255)\n'
		for i,v in pairs(windower.ffxi.get_mob_array()) do
			local DistanceBetween = ((s.x - v.x)*(s.x-v.x) + (s.y-v.y)*(s.y-v.y)):sqrt()
			if DistanceBetween < (6 + v.model_size) and (v.status == 1 or v.status == 0) and v.name and v.name ~= '' and v.name ~= "Luopan" and v.name ~= s.name and v.valid_target and v.model_size > 0 then
				if debuff_list:contains(last_indi) then
					if v.is_npc and not (v.in_party or ignore_list:contains(v.name)) then
						if battle_target and battle_target.id == v.id then
							luopan_txtbox = luopan_txtbox..' '..bt_color..v.name.." "..string.format("%.2f",DistanceBetween).."\\cs(255,255,255)\n"
						else
							luopan_txtbox = luopan_txtbox..' '..v.name.." "..string.format("%.2f",DistanceBetween).."\n"
						end
						indi_count = indi_count + 1
					end
				else
					if v.in_party then
						luopan_txtbox = luopan_txtbox..' '..v.name.." "..string.format("%.2f",DistanceBetween).."\n"
						indi_count = indi_count + 1
					end
				end
			end
		end
    end

    luopan.value = luopan_txtbox
    if ((myluopan and geo_count ~= 0) or (buffactive['Colure Active'] and indi_count ~= 0)) then
        luopan:visible(true)
    else
        luopan:visible(false)
    end

end)