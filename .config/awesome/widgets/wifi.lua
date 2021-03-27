local wibox = require("wibox")
local awful = require("awful")

local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox_mod/icons/"

-- Wifi icon
local wifi_icon = wibox.widget.imagebox()

awesome.connect_signal("evil::wifi_strength", function(strength)
    if strength == nil then
        wifi_icon.image = icon_path .. "wifi_disconnected.svg"
    elseif strength < -70 then
        wifi_icon.image = icon_path .. "wifi_connected_low.png"
    elseif strength < -67 then
        wifi_icon.image = icon_path .. "wifi_connected_middle.png"
    else
        wifi_icon.image = icon_path .. "wifi_connected_full.svg"
    end
end)

local wifi_widget = {
    wifi_icon,
    layout = wibox.layout.fixed.vertical
}

-- Tooltip
local wifi_t = awful.tooltip {
    objects = {wifi_icon},
}

awesome.connect_signal("evil::wifi_ssid", function(ssid)
    if ssid == '' then
        wifi_t.text = "Not connected"
    else
        wifi_t.text = ssid
    end
end)

return wifi_widget
