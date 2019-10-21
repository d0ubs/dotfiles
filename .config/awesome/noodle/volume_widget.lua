local wibox = require("wibox")
local menubar = require("menubar")
local keys = require("keys")
local awful = require("awful")
local beautiful = require("beautiful")
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox_mod/icons/"

-- Volume icon
local volume_icon = wibox.widget.imagebox()

awesome.connect_signal("evil::volume", function(volume, muted)
    if muted then
        volume_icon.image = icon_path .. "volume_muted.png"
    else
        volume_icon.image = icon_path .. "volume.png"
    end
end)

local volume_widget = {
    volume_icon,
    layout = wibox.layout.fixed.vertical
}

-- Tooltip
local volume_t = awful.tooltip {
    objects = {volume_icon},
}
awesome.connect_signal("evil::volume", function(volume, muted)
    volume_t.text = "Sound volume: " .. volume .. "%"
end)

-- Mouse action
--volume_widget:awesome.connect_signal("mouse::press", function(button)
awesome.connect_signal("mouse::press", function(button)
    if button == 1 then
        awful.spawn("pactl set-sink-mute 0 toggle", false)
    end
end)

return volume_widget
