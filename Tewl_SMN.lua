include('organizer-lib')

function get_sets()

    -- Phyiscal BP Toggle Boolean
    UseDefaultPhysBP = true

    sets.TH = {
		head="Wh. Rarab Cap +1",
		hands={ name="Merlinic Dastanas", augments={'Crit.hit rate+1','MND+5','"Treasure Hunter"+1',}},
        legs={ name="Merlinic Shalwar", augments={'Pet: Accuracy+16 Pet: Rng. Acc.+16','Pet: Haste+1','"Treasure Hunter"+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',},hp=29,mp=44},
        waist="Chaac Belt",
    }
    send_command('input /macro book 2;wait .1;input /macro set 1')
    -- Precast Sets
    sets.precast = {}
    
    sets.precast.FC = {	
	 --   main="Daybreak",
  --  sub="Genmei Shield",	
	--	main="Nirvana",
	--	sub="Elan Strap +1",
		ammo="Impatiens",
		head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},   
		body="Baayami Robe +1",
		hands="Volte Gloves",		
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+4','INT+3','Mag. Acc.+11',}},
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Ogapepo Cape",
    }
    -- 15+13+7+7+12+5+3+2+6+1+10 = 81% FC
    -- 2+3+4+2 = 11% Quickens
    sets.precast['Astral Flow'] = {
    head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
        }
    
    -- Midcast sets
				sets.midcast = {}

				sets.midcast['Ifrit'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Fenrir'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Titan'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Carbuncle'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Shiva'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Garuda'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Ramuh'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Diabolos'] = {
		 body="Baayami Robe +1",
		 }
		 	  sets.midcast['Leviathan'] = {
		 body="Baayami Robe +1",
		 }
			  sets.midcast['Cait Sith'] = {
		 body="Baayami Robe +1",
		 }

    -- this is the BP delay gear--
	    sets.midcast.BP = { -- -10 from Gifts			
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Baayami Robe +1",
    hands="Baayami Cuffs +1",
    legs="Baayami Slops +1",
    feet="Baayami Sabots",
    neck="Incanter's Torque",
    waist="Kobo Obi",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Evoker's Ring",
    right_ring="Stikini Ring +1",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Blood Pact Dmg.+1',}},
	}

    
    sets.midcast['Mana Cede'] = {hands="Beckoner's Bracers +1"}
    sets.precast['Dispelga'] = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Sancus Sachet +1",
	head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},   
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},    hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Globidonta Ring",
    right_ring="Persis Ring",
    back="Ogapepo Cape",

	}
	sets.midcast['Dispelga'] = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Sancus Sachet +1",
	head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},   
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Globidonta Ring",
    right_ring="Persis Ring",
    back="Ogapepo Cape",
}

	sets.midcast['Dispel'] = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Sancus Sachet +1",
	head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},   
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Globidonta Ring",
    right_ring="Persis Ring",
    back="Ogapepo Cape",
}
	
    sets.midcast['Elemental Siphon'] = {
		ammo="Esper Stone +1",
		head="Con. Horn +1",
		body="Baayami Robe +1",
		hands="Lamassu Mitts",
		legs="Beckoner's Spats +1",
		feet="Beck. Pigaches +1",
		neck="Incanter's Torque",
		waist="Ligeia Sash",
		left_ear="Gifted Earring",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Globidonta Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +3','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
        }
                    
    sets.midcast.Cur = {		
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body="Vrikodara Jupon",
hands="Volte Gloves",		legs="Gyve Trousers",
		feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Roundel Earring",
		right_ear="Mendi. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Ogapepo Cape",
        }
        
    sets.midcast.Stoneskin = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Impatiens",
		head={ name="Psycloth Tiara", augments={'Mag. Acc.+20','"Fast Cast"+10','INT+7',}},
		body="Baayami Robe +1",
		hands="Tali'ah Gages +1",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+4','INT+3','Mag. Acc.+11',}},
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Ogapepo Cape",
		neck="Stone Gorget",
		waist="Siegel Sash",
        }
    
    sets.midcast.Cursna = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Impatiens",
		head={ name="Psycloth Tiara", augments={'Mag. Acc.+20','"Fast Cast"+10','INT+7',}},
		body="Baayami Robe +1",
		hands="Tali'ah Gages +1",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+4','INT+3','Mag. Acc.+11',}},
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Ogapepo Cape",
    }
    
    sets.midcast.EnhancingDuration = {

    }
    
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{
		head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},   

    })
    
    sets.midcast['Diaga'] = sets.TH
    sets.midcast['Dia'] = sets.TH
    sets.midcast['Dia II'] = sets.TH
    sets.midcast['Swipe'] = sets.TH
    sets.midcast['Lunge'] = sets.TH

    -- Pet Midcast Sets
    sets.pet_midcast = {}
    
    sets.BP_Base = {
		    main="Nirvana",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
--			head={ name="Helios Band", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
		--	body="Con. Doublet +3",
			body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
			hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Blood Pact Dmg.+9','Pet: STR+6','Pet: Mag. Acc.+5',}},
			legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
			feet={ name="Helios Boots", augments={'Pet: Attack+29 Pet: Rng.Atk.+29','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
			neck="Shulmanu Collar",
			waist="Incarnation Sash",
			left_ear="Gelos Earring",
			Right_ear="Lugalbanda Earring",
			left_ring="Varar Ring +1",
			right_ring="Varar Ring +1",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
    --all regular physical bloodpacts put them in a /consol exec physical.txt macro ill send to you the file to put in windower>scripts
    sets.pet_midcast.Phys_BP = set_combine(sets.BP_Base,{
		    body = "Inyanga Jubbah +2"
    })
    --
    sets.pet_midcast.Phys_BP3 = set_combine(sets.BP_Base,{
		    body = "Telchine Chas."
    })
    --
 ---hybrid swap for Flaming crush-----
	sets.pet_midcast.Phys_BP2 = set_combine(sets.BP_Base,{	
				main="Nirvana",
				sub="Elan Strap +1",
				ammo="Sancus Sachet +1",
				head="C. Palug Crown",	
				body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
				hands={ name="Merlinic Dastanas", augments={'Pet: Attack+24 Pet: Rng.Atk.+24','Blood Pact Dmg.+10','Pet: DEX+9','Pet: Mag. Acc.+6','Pet: "Mag.Atk.Bns."+9',}},
				legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
				feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},			
				neck="Smn. Collar +2",
				waist="Regal Belt",
				left_ear="Kyrene's Earring",
				right_ear="Lugalbanda Earring",
				left_ring="Varar Ring +1",
				right_ring="C. Palug Ring",
				back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
				--	feet="Convo. Pigaches +3",
				--	legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
				--	body="Con. Doublet +3",
				--  head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},

	})
        ---All heaviest magic bloodpacts same multi macro /consol exec rage.txt ---
    sets.pet_midcast.MAB_BP = set_combine(sets.BP_Base,{
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+20','Pet: "Mag.Atk.Bns."+16',}},
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="C. Palug Crown",
		    body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+26','Blood Pact Dmg.+10','Pet: INT+8','Pet: Mag. Acc.+6',}},
			legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			neck="Smn. Collar +2",
			waist="Regal Belt",
			left_ear="Gelos Earring",
			Right_ear="Lugalbanda Earring",
			left_ring="Varar Ring +1",
			right_ring="Varar Ring +1",
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
			--	legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
			--	legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+13 Pet: Rng. Acc.+13','Pet: Mag. Acc.+14','Pet: Damage taken -4%',}},
			--  legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Dbl. Atk."+5','Blood Pact Dmg.+6',}},
			--	body="Udug Jacket",
			--	head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			--head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
})
        
    sets.pet_midcast.MAB_Spell = set_combine(sets.BP_Base,{
    main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+20','Pet: "Mag.Atk.Bns."+16',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
    body="Udug Jacket",
    hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+26','Blood Pact Dmg.+10','Pet: INT+8','Pet: Mag. Acc.+6',}},
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Regal Belt",
    left_ear="Kyrene's Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Speaker's Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
 })
        
    sets.pet_midcast.MAcc_BP = set_combine(sets.BP_Base,{
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body="Con. Doublet +3",
    hands="Convo. Bracers +2",
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Convo. Pigaches +3",
    neck="Adad Amulet",
    waist="Regal Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Kyrene's Earring",
    left_ring="Evoker's Ring",
    right_ring="Globidonta Ring",
 back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},	})
    
    sets.pet_midcast.Buff_BP = set_combine(sets.BP_Base,{ -- Did not check
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Baayami Robe +1",
		hands="Lamassu Mitts +1",
		legs="Beckoner's Spats +1",
		feet="Baayami Sabots",
		neck="Incanter's Torque",
		waist="kobo obi",
		left_ear="C. Palug Earring",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Globidonta Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +3','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
		})
    
    sets.pet_midcast['Shock Squall'] = {
  --  main={ name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: VIT+13','Pet: Mag. Acc.+3','Pet: "Mag.Atk.Bns."+21','DMG:+5',}},
	--	sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Tali'ah Turban +1",
		body="Con. Doublet +3",
		hands="Tali'ah Gages +1",
		legs="Tali'ah Sera. +2",
		feet="Tali'ah Crackows +1",
		neck="Adad amulet",
		waist="Cimmerian Sash",
		left_ear="Kyrene's Earring",
		left_ear="Lugalbanda Earring",
		left_ring="Evoker's Ring",
		right_ring="Globidonta Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +3','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}}, }
    
    --Aftercast Sets
	 aftercast_Set_Names = {"DT"}
    sets.aftercast = {}
   
	
	
	sets.aftercast['DT'] = {
			main="Nirvana",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head={ name="Selenian Cap", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
			body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
			hands={ name="Artsieq Cuffs", augments={'MP+18','Pet: Attack+14','Pet: Accuracy+14',}},
			legs="Tali'ah Sera. +2",
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			neck="Empath Necklace",
			waist="Isa Belt",
			left_ear="Handler's Earring +1",
			right_ear="Hypaspist Earring",
			left_ring="Evoker's Ring",
			right_ring="Karieyh Ring",
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
			}
			
	sets.aftercast['phaste'] = {
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Helios Band", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Helios Boots", augments={'Pet: Attack+24 Pet: Rng.Atk.+24','Pet: "Regen"+3','Pet: Haste+4',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="C. Palug Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

sets.aftercast['Nono'] = {
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Staunch Tathlum",
    head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
    body="Onca Suit",
    neck="Warder's Charm",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},


}

	sets.aftercast['PDT'] = {
    main="Malignance Pole",
    sub="Khonsu",
    ammo="Sancus Sachet +1",
    head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
    body="Udug Jacket",
    hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Hippo. Socks +1",
    neck="Loricate Torque +1",
    waist="Regal Belt",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="C. Palug Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	
	
    sets.aftercast.None = {
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
	head="Convoker's Horn +3",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet="Herald's Gaiters",
    neck="Smn. Collar +2",
    waist="Fucho-no-Obi",
    left_ear="C. Palug Earring",
    right_ear="Enmerkar Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +3','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
 }
		
		    
    -- Including Auto-Refresh II, unaffected by Avatar's Favor:
    -- Carbuncle: 11MP/tick : 10 Perp- + Refresh ideal (4 + Mitts + Refresh)
    -- Diabolos/Celestials: 15MP/tick : 14 Perp- + Refresh ideal
    -- Fenrir: 13MP/tick : 12 Perp- + Refresh ideal
    -- Spirit: 7MP/tick : 6 Perp- + Refresh ideal (Beckoner's Doublet +1)
    
    sets.aftercast.Avatar = {}
    sets.aftercast.Avatar.Carbuncle = {
			main="Nirvana",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Beckoner's Horn +1",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
	hands="Asteria Mitts +1",
			legs="Assid. Pants +1",
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			neck="Caller's Pendant",
			waist="Isa Belt",
    left_ear="C. Palug Earring",
    right_ear="Enmerkar Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+8','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
    
    sets.aftercast.Avatar.Garuda = { -- 16 MP/tick, currently negated at -15 Perp with 512 skill
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Isa Belt",
    left_ear="C. Palug Earring",
    right_ear="Enmerkar Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
} -- Celestials
    
    sets.aftercast.Avatar.Ifrit = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Shiva = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Ramuh = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Leviathan = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Titan = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Diabolos = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Siren = sets.aftercast.Avatar.Garuda
    sets.aftercast.Avatar.Siren = sets.aftercast.Avatar.Garuda 
    sets.aftercast.Avatar.Fenrir = {				
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Isa Belt",
    left_ear="C. Palug Earring",
    right_ear="Enmerkar Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
} -- Fenrir
    sets.aftercast.Avatar['Cait Sith'] = set_combine(sets.aftercast.Avatar.Fenrir,{
        hands={name="Lamassu mitts +1",hp=18,mp=44},
        })
    
    sets.aftercast.Avatar.Spirit = {
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body="Baayami Robe +1",
    hands="Baayami Cuffs +1",
    legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Baayami Sabots",
    neck="Incanter's Torque",
    waist="Kobo Obi",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Evoker's Ring",
    right_ring="Stikini Ring +1",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Blood Pact Dmg.+1',}},
} -- Spirits
                
    sets.aftercast.Resting = {
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet="Baayami Sabots",
    neck="Smn. Collar +2",
    waist="Fucho-no-Obi",
    left_ear="C. Palug Earring",
    right_ear="Enmerkar Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +3','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
   }
    
    sets.aftercast.Idle = sets.aftercast.None
   
    
    sets.aftercast.Engaged ={    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Blistering Sallet +1",
    body="Tali'ah Manteel +2",
    hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Querkening Brais",
    feet="Tali'ah Crackows +2",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Pernicious Ring",
    right_ring="Petrov Ring",
    back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
	
	

        --[[{
		{
	    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    hands="Convo. Bracers +2",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},

			--[{main="Nirvana",
			sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
			head="Blistering Sallet +1",
			body="Udug Jacket",
			body="Tali'ah Manteel +2",
			hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
			legs="Querkening Brais",
			legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
			feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
			neck="Shulmanu Collar",
			waist="Windbuffet Belt +1",
			left_ear="Cessance Earring",
			right_ear="Brutal Earring",
			left_ring="Pernicious Ring",
			right_ring="Petrov Ring",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
			}]
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    hands="Convo. Bracers +2",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},

    }]]
    
    sets.midcast['Garland of Bliss'] = {

    ammo="pemphredo tathlum",
    head="C. Palug Crown",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Toro Cape",
    }
    sets.midcast['Shattersoul'] = {
			main="Nirvana",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head={ name="Glyphic Horn +3", augments={'Enhances "Astral Flow" effect',}},
			body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
			hands={ name="Glyphic Bracers +3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
			legs={ name="Glyphic Spats +3", augments={'Increases Sp. "Blood Pact" accuracy',}},
			feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
			neck="Shulmanu Collar",
			waist="Fotia Belt",
			left_ear="Strophadic Earring",
			right_ear="Ishvara Earring",
			left_ring="Epaminondas's Ring",
			right_ring="Aife's Annulet",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','Pet: "Regen"+5',}},

	}
    sets.midcast['Elemental Magic'] ={
    main="Daybreak",
    sub="Culminus",
    ammo="Impatiens",
    head="C. Palug Crown",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Toro Cape",
    }
    
    --sets.midcast.Myrkr={
      --  ammo={name="pemphredo tathlum",mp=35},
      --  head={name= "Beckoner's Horn +1",hp=31,mp=134},
     --   body={name="Beckoner's Doublet +1",hp=54,mp=151},
      --  hands={ name="Amalric Gages +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',},hp=13,mp=106},
    --    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',},mp=109,hp=43},
    -- -   feet={name="Apogee Pumps +1",hp=-90,mp=121},
     --   neck={name="Sanctity Necklace",hp=35,mp=35},
     --   waist={name="Mujin Obi",mp=60},
     --   left_ear={name="Etiolation Earring",hp=50,mp=50},
     --   right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
     --   left_ring={name="Lebeche Ring",mp=40},
     --   right_ring={name="Sangoma Ring",mp=70},
     --   back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+15','Blood Pact Dmg.+4',},mp=100},
  --  }
    
    -- Variables and notes to myself
    Debuff_BPs = T{'Diamond Storm','Sleepga','Slowga','Tidal Roar','Shock Squall','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar'}
    Magical_BPs = T{'Heavenly Strike','Wind Blade','Holy Mist','Night Terror','Thunderstorm','Geocrush','Meteor Strike','Grand Fall','Lunar Bay','Thunderspark','Nether Blast',
        'Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Sonic Buffet','Tornado II'}
    Additional_effect_BPs = T{'Rock Throw'}    
    AvatarList = S{'Shiva','Ramuh','Garuda','Leviathan','Diabolos','Titan','Fenrir','Ifrit','Carbuncle',
        'Fire Spirit','Air Spirit','Ice Spirit','Thunder Spirit','Light Spirit','Dark Spirit','Earth Spirit','Water Spirit',
        'Cait Sith','Alexander','Odin','Atomos'}
    --send_command('input /macro book 1')
end

function pet_change(pet,gain)
    equip_aftercast(player.status,pet)
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function pet_status_change(a,b)
    windower.add_to_chat(8,'Pet status change: '..tostring(a)..' '..tostring(b)) -- Useful for knowing when you got aggroed
end

function precast(spell)
    if spell.action_type == 'Magic' then
        equip(sets.precast.FC)
    end
    
    if sets.precast.FC[spell.element] then equip(sets.precast.FC[spell.element]) end
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function midcast(spell)
    if pet_midaction() then
        return
    end
    equip_aftercast(player.status,pet) -- Put DT gear on
    if string.find(spell.type,'BloodPact') then
        if buffactive['Astral Conduit'] then
            pet_midcast(spell)
        else
            equip(sets.midcast.BP)
        end
    elseif string.find(spell.english,'Cur') then
        equip(sets.midcast.Cur)
    elseif sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
        if spell.english == 'Elemental Siphon' then
            if pet.element and pet.element == world.day_element and world.day_element ~= "Light" and world.day_element ~= 'Dark' then
                equip(sets.midcast['Elemental Siphon'].day) -- Zodiac Ring affects Siphon, but only on Fires-Lightningsday
            end
        end
    elseif spell.skill == 'Elemental Magic' then
        equip(sets.midcast['Elemental Magic'])
        if sets.midcast['Elemental Magic'][spell.element] then
            equip(sets.midcast['Elemental Magic'][spell.element])
        end
        if world.day_element == spell.element or world.weather_element == spell.element then
            equip({waist="Hachirin-no-Obi"})
        end
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
    end
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function aftercast(spell)
    if pet_midaction() then
        return
    elseif spell and string.find(spell.type,'BloodPact') and not spell.interrupted then
        pet_midcast(spell)
    else
        -- Don't want to swap away too quickly if I'm about to put BP damage gear on
        -- Need to wait 1 in order to allow pet information to update on Release.
        equip_aftercast(player.status,pet)
    end
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function status_change(new,old)
    equip_aftercast(new,pet)
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function pet_midcast(spell)
    if spell.name == 'Perfect Defense' then
        equip(sets.midcast['Elemental Siphon'],{feet="Marduk's Crackows +1"})
	
    elseif spell.type=='BloodPactWard' then
        if Debuff_BPs:contains(spell.name) then
            equip(sets.pet_midcast.MAcc_BP)
        else
            equip(sets.pet_midcast.Buff_BP)
        end
    elseif spell.type=='BloodPactRage' then
        if Magical_BPs:contains(spell.name) or string.find(spell.name,' II') or string.find(spell.name,' IV') then
            equip(sets.pet_midcast.MAB_BP)
		elseif spell.name == 'Flaming Crush' then
		equip(sets.pet_midcast.Phys_BP2)				
        elseif Additional_effect_BPs:contains(spell.name) then -- for BPs where the additional effect matters more than the damage
            equip(sets.pet_midcast.MAcc_BP)
        else
            if UseDefaultPhysBP ~= false then
                windower.add_to_chat(8,'Equiping default set')
                equip(sets.pet_midcast.Phys_BP)
            else
                windower.add_to_chat(8,'Equiping alternate set')
                equip(sets.pet_midcast.Phys_BP3)
            end
        end
    elseif spell.type=='BlackMagic' then
        equip(sets.pet_midcast.MAB_Spell)
    end
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function pet_aftercast(spell)
    windower.add_to_chat(8,'pet_aftercast: '..tostring(spell.name))
    equip_aftercast(player.status,pet)
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
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
	if commandArgs[1] == 'DT'	then
	    equip_aftercast ('DT')
	end	
    if commandArgs[1] == 'Idle' then
        equip_aftercast('Idle',pet)
    end
    if commandArgs[1] == 'toggle' then
        if #commandArgs < 2 then
            add_to_chat(123,'ERROR: Missing parameter in toggle command!')
            return
        end
        if commandArgs[2] == 'pbp' then
            if UseDefaultPhysBP == true then
                UseDefaultPhysBP = false
                windower.add_to_chat(8,'Using Alternate Phyiscal BP set')
            else
                UseDefaultPhysBP = true
                windower.add_to_chat(8,'Using Default Phyiscal BP set')
            end
        end
    end
    
    if player.mpp > 80 then
        set_priorities('mp','hp')
    else
        set_priorities('hp','mp')
    end
end

function equip_aftercast(status,pet)
    if sets.aftercast[status] then
        equip(sets.aftercast[status])
    end
    if pet.isvalid then
        if string.find(pet.name,'Spirit') then
            equip(sets.aftercast.Avatar.Spirit)
        elseif sets.aftercast.Avatar[pet.name] then
            equip(sets.aftercast.Avatar[pet.name])
        end
    end
    if status == "Engaged" then
        equip(sets.aftercast[status])
    end
end


	

function set_priorities(key1,key2)
    local future,current = gearswap.equip_list,gearswap.equip_list_history
    function get_val(piece,key)
        if piece and type(piece)=='table' and piece[key] and type(piece[key])=='number' then
            return piece[key]
        end
        return 0
    end
    local diff = {}
    for i,v in pairs(future) do
        local priority = get_val(future[i],key1) - get_val(current[i],key1) + (get_val(future[i],key2) - get_val(current[i],key2))
        if type(v) == 'table' then
            future[i].priority = priority
        else
            future[i] = {name=v,priority=priority}
        end
    end
end