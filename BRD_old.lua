function get_sets()

sets.TPSet = {}
sets.TPSet.index = { 'DD', 'NIN' }
TPSet_ind = 1

sets.TPSet.DD = {
    main="Tauret",
    sub="Blurred Knife +1",
    range="Linos",   
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Asperity Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10'}}}

sets.TPSet.NIN = {
    main="Tauret",
    sub="Blurred Knife +1",
    range="Linos",   
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Asperity Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10'}}}

sets.Weapon = {}
sets.Weapon.index = { 'Gjallarhorn', 'Daurdabla', 'Marsyas'}
Weapon_ind = 1

sets.Weapon.Gjallarhorn = {main="Kali", range="Gjallarhorn"}
sets.Weapon.Daurdabla = {main="Kali", range="Daurdabla"}
sets.Weapon.Marsyas = {main="Kali", range="Marsyas"}

sets.precast = {
    main="Kali", 
    sub="Kali", 
    head="Nahtirah Hat",
    body="Inyanga Jubbah +1",
    hands="Gende. Gages +1",
    legs="Aya. Cosciales +2",
    feet="Regal Pumps +1",
    neck="Aoidos' matinee",
    waist="Channeler's Stone",
    left_ear="Etiolation Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Rehab Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}

sets.precast.Cure = {
    main="Kali", 
    sub="Kali", 
    range="Gjallarhorn",
    head="Fili Calot",
    body="Inyanga Jubbah +1",
    hands="Gende. Gages +1",
    legs="Aya. Cosciales +2",
    feet="Telchine Pigaches",
    neck="Aoidos' matinee",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Rehab Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}

sets.precast.BardSong = {
    main="Kali", 
    sub="Kali", 
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Aya. Cosciales +2",
    feet="Telchine Pigaches",
    neck="Aoidos' matinee",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Rehab Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}

sets.precast['Honor March'] = {
	main="Kali", 
    sub="Kali", 
    range="Marsyas",
    head="Fili Calot",
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Aya. Cosciales +2",
    feet="Telchine Pigaches",
    neck="Aoidos' matinee",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Rehab Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}
}


sets.precast.DummySong = {
    main="Kali",
    sub="Kali", 
    range="Daurdabla",
    head="Fili Calot +1",
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Aya. Cosciales +2",
    feet="Telchine Pigaches",
    neck="Aoidos' matinee",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Rehab Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}

sets.precast.WS = {
    head="Lustratio cap +1",
    body="Bihu Jstcorps. +3",
    hands="Lustr. mittens +1",
    legs="Lustr. subligar +1",
    feet="Lustra. leggings +1",
    neck="Caro necklace",
    waist="Grunfield rope",
    left_ear="Ishvara earring",
    right_ear="Moonshade earring",
    left_ring= "Ramuh ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10'}}}
    
sets.precast.Rudra = {
    head="Lustratio cap +1",
    body="Bihu Jstcorps. +3",
    hands="Lustr. mittens +1",
    legs="Lustr. subligar +1",
    feet="Lustra. leggings +1",
    neck="Caro necklace",
    waist="Grunfield rope",
    left_ear="Ishvara earring",
    right_ear="Moonshade earring",
    left_ring= "Ramuh ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10'}}}

sets.precast.Exten = {
    head="Lustratio cap +1",
    body="Bihu Jstcorps. +3",
    hands="Lustr. mittens +1",
    legs="Lustr. subligar +1",
    feet="Lustra. leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Moonshade earring",
    left_ring= "Begrudging ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10'}}}

sets.precast.Evis = {
    head="Lustratio cap +1",
    body="Bihu Jstcorps. +3",
    hands="Lustr. mittens +1",
    legs="Lustr. subligar +1",
    feet="Lustra. leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Moonshade earring",
    left_ring= "Begrudging ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10'}}}

sets.precast.AE = {
    head="Chironic hat",
    body="Kaykaus Bliaut",
    hands="Leyline gloves",
    legs="Kaykaus tights",
    feet="Brioso slippers +3",
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Icesoul Ring",
    right_ring="Icesoul Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10'}}}

sets.precast.Waltz = {
    head="Fili calot",
    body="Inyanga jubbah +",
    hands="Fili manchettes +1",
    legs="Dashing subligar",
    feet="Brioso slippers +3",
    neck="Mnbw. whistle +1",
    waist="Shetal stone",
    left_ear="Cessance Earring",
    right_ear="Suppanomimi",
    left_ring= "Asklepian ring",
    right_ring="Defending Ring",
    back="Kayapa cape"}


sets.precast.Nightingale = {feet="Bihu Slippers +3"}
sets.precast.Troubadour = {body="Bihu Jstcorps. +3"}
sets.precast.SoulVoice = {legs="Bihu Cannions +3"}

sets.midcast = {neck="Incanter's Torque"}

sets.midcast.BardSong = {
    main="Carnwenhan",
    sub="Kali",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Inyanga crackows +1",
    neck="Mnbw. Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back="Intarabus's Cape"
}
    
sets.midcast['Honor March'] = {
        main="Carnwenhan",
		sub="Kali", 
		range="Marsyas",
        ammo=empty,
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Aoidos' Belt",
		left_ear="Aoidos' Earring",
		right_ear="Loquacious Earring",
		left_ring="Archon Ring",
		right_ring="Defending Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}
        }
		
sets.midcast.lullaby =  {
    main="Carnwenhan",
    sub="Kali",
    range="Gjallarhorn",
    head="Aya. Zucchetto +2",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands="Aya. Manopolas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Salire Belt",
    left_ear="Aoidos' Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Prolix Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}}
    

sets.midcast.BardSong.Ballad = {
    main="Carnwenhan",
    sub="Kali",
    range="Gjallarhorn",
	head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Fili Rhingrave +1",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}
sets.midcast.BardSong.Minuet = {
	main="Carnwenhan",
    sub="Kali",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}
sets.midcast.BardSong.March = {
	main="Carnwenhan",
    sub="Kali",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}
sets.midcast.BardSong.Madrigal = {
	main="Carnwenhan",
    sub="Kali",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Aoidos' Earring",
    right_ear="Loquacious Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}

sets.midcast.Cure = {
    main="Daybreak",}

sets.midcast.DummySong = {
    main="Kali",
    sub="Kali",
    range="Daurdabla",
    head="Fili Calot +1",
    body="Inyanga Jubbah +1",
    hands="Inyanga Dastanas +1",
    legs="Aya. Cosciales +2",
    feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}},
    neck="Twilight Torque",
    waist="Aoidos\' Belt",
    left_ear="Aoidos\' Earring",
    right_ear="Liminus Earring",
    left_ring="Inyanga Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}}}

sets.aftercast = {}

sets.aftercast.Idle = {
    main="Tauret",
    sub="Blurred Knife +1",
    range="Linos",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +1",
    neck="Sanctity necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10'}}    }

sets.aftercast.TP = {
    main="Tauret",
    sub="Blurred Knife +1",
    range="Linos",   
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Asperity Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10'}}}

end




function precast(spell)
if sets.precast[spell.english] then
equip(sets.precast[spell.english])
elseif spell.type=="WeaponSkill" and spell.name=="Aeolian Edge" then
equip(sets.precast.AE)
elseif spell.type=="WeaponSkill" and spell.name=="Rudra\'s Storm" then
equip(sets.precast.Rudra)
elseif spell.type=="WeaponSkill" and spell.name=="Evisceration" then
equip(sets.precast.Evis)
elseif spell.type=="WeaponSkill" and spell.name=="Extenterator" then
equip(sets.precast.Exten)
elseif string.find(spell.english,'Waltz') then
equip(sets.precast.Waltz)
elseif spell.type=="BardSong" then
equip(sets.precast.BardSong)
elseif spell.english == "Knight's Minne" then
equip(sets.precast.DummySong)
elseif spell.english == "Knight's Minne I" then
equip(sets.precast.DummySong)
elseif spell.type=="BardSong" and spell.name=="Honor March" then
equip(sets.precast['Honor March'])
elseif string.find(spell.english,'Cure') then
equip(sets.precast.Cure)
else
equip(sets.precast)
end

end

function midcast(spell)

if spell.type=="BardSong" and spell.name ~= "Light Carol I/I"  and spell.name ~= "Knight's Minne II" and spell.name ~= "Knight's Minne" and spell.name then
equip(sets.midcast.BardSong)
elseif spell.name == "Light Carol II" or spell.name == "Knight's Minne II" or spell.name == "Knight's Minne" then
equip(sets.midcast.DummySong)
send_command('@input /echo <----- Dummy Song Playing ----->')
end

if string.find(spell.english,'Cure') then
      equip(sets.midcast.Cure)
end

if string.find(spell.english,'Ballad') then
equip(sets.midcast.BardSong.Ballad)
end

if string.find(spell.english,'Minuet') then
equip(sets.midcast.BardSong.Minuet)
end

if string.find(spell.english,'Honor March') then
equip(sets.midcast['Honor March'])
end

if string.find(spell.english,'March') then
equip(sets.midcast.BardSong.March)

end

if string.find(spell.english,'Madrigal') then
equip(sets.midcast.BardSong.Madrigal)
end

if string.find(spell.english,'Lullaby') then
equip(sets.midcast.lullaby)
end

end

function aftercast(spell)
if player.status =='Engaged' then
equip(sets.aftercast.TP)
else
equip(sets.aftercast.Idle)
end
end

function status_change(new,old)
if T{'Idle','Resting'}:contains(new) then
equip(sets.aftercast.Idle)
elseif new == 'Engaged' then
equip(sets.aftercast.TP)
end
end

function buff_change(status,gain_or_loss)
end

function self_command(command)

if command == 'toggle TPSet set' then
TPSet_ind = TPSet_ind + 1
if TPSet_ind > #sets.TPSet.index then TPSet_ind = 1 end
ChangeGear(sets.TPSet[sets.TPSet.index[TPSet_ind]])
sets.aftercast.TP = sets.TPSet[sets.TPSet.index[TPSet_ind]]
send_command('@input /echo <----- TPSet Set changed to ' .. sets.TPSet.index[TPSet_ind] .. ' ----->')
end

if command == 'Use Harp' then

ChangeGear(sets.Weapon.Daurdabla)
send_command('@input /echo <----- Intrument Set changed to Harp ----->')
end



if command == 'Use Horn' then
ChangeGear(sets.Weapon.Gjallarhorn)
send_command('@input /echo <----- Intrument Set changed to Horn ----->')
end


end

function ChangeGear(GearSet)

equipSet = GearSet
equip(GearSet)
end



function msg(str)
send_command('@input /echo <----- ' .. str .. ' ----->')
end
