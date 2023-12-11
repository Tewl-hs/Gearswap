Colors = {
    Yellow = '\\cs(255,192,0)',
    Red = '\\cs(255,80,80)',
    Green = '\\cs(110,255,110)',
    Blue = '\\cs(140,160,255)',
    Gray = '\\cs(96,96,96)',
    White = '\\cs(255,255,255)',
    Purple = '\\cs(180,0,255)'
}

function get_weapon_color(weapon)
    if weapon == 'Empty' then return Colors.Gray end
    if mythic_weapons:contains(weapon) then return Colors.Blue end
    if relic_weapons:contains(weapon) then return Colors.Yellow end
    if aeonic_weapons:contains(weapon) then return Colors.Green end
    if empyrean_weapons:contains(weapon) then return Colors.Red end
    if prime_weapons:contains(weapon) then return Colors.Purple end
    return Colors.White
end

texts = require('texts')
if stateBox then stateBox:destroy() end

local settings = windower.get_windower_settings()
local x,y

-- Adjust for screen resolution and positon of text on screen
if settings["ui_x_res"] == 1920 and settings["ui_y_res"] == 1080 then
    x,y = settings["ui_x_res"]-1917, settings["ui_y_res"]-18 -- -285, -18
else
    x,y = 3, settings["ui_y_res"]-18 -- -285, -18
end

stateBox = texts.new({flags = {draggable=false}})
stateBox:pos(x,y)
stateBox:font('Arial')
stateBox:size(12)
stateBox:bold(true)
stateBox:bg_alpha(0)--128
stateBox:right_justified(false)
stateBox:stroke_width(2)
stateBox:stroke_transparency(192)

if update_status then update_status() end

if equip_change then equip_change() end