local awful = require("awful")
local wibox = require("wibox")
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox_mod/icons/"

-- Battery icon
local battery_icon = wibox.widget.imagebox()

awesome.connect_signal("evil::battery_percent", function(charge_level)
    if charge_level >= 90 and (not plugged) then
        battery_icon.image = icon_path .. "battery_100.png"
    elseif charge_level >= 80 and (not plugged) then
        battery_icon.image = icon_path .. "battery_90.png"
    elseif charge_level >= 70 and (not plugged) then
        battery_icon.image = icon_path .. "battery_80.png"
    elseif charge_level >= 60 and (not plugged) then
        battery_icon.image = icon_path .. "battery_70.png"
    elseif charge_level >= 50 and (not plugged) then
        battery_icon.image = icon_path .. "battery_60.png"
    elseif charge_level >= 40 and (not plugged) then
        battery_icon.image = icon_path .. "battery_50.png"
    elseif charge_level >= 30 and (not plugged) then
        battery_icon.image = icon_path .. "battery_40.png"
    elseif charge_level >= 20 and (not plugged) then
        battery_icon.image = icon_path .. "battery_30.png"
    elseif charge_level >= 0 and (not plugged) then
        battery_icon.image = icon_path .. "battery_alert.png"
    end
   -- return charge_level
end)

---- Battery time
local battery_time_widget = wibox.widget {
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

awesome.connect_signal("evil::battery_percent", function(battery_percent)
    battery_time_widget.text = battery_percent .."%"
end)
--
awesome.connect_signal("evil::charger", function(plugged_)
    if plugged_ then
        battery_icon.image = icon_path .. "battery_charging.png"
        plugged = true --need another name for some reason
    else
        plugged = false
    end
    --return plugged
end)

-- Battery widget
local bat_widget = {
    battery_icon,
    battery_time_widget,
    layout = wibox.layout.fixed.vertical
}

-- Tooltip
local battery_t = awful.tooltip {
    objects = {battery_icon},
}
awesome.connect_signal("evil::battery_time", function(battery_time)
    battery_t.text = "Time left: " .. battery_time
end)

return bat_widget
