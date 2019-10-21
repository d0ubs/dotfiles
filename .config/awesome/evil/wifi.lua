local awful = require("awful")

local update_interval = 30

local wifi_ssid_script = [[
sh -c "
iw dev wlp2s0 info | grep ssid | awk '{print $2}'
"]]

local wifi_strength_script = [[
sh -c "
iw dev wlp2s0 link | grep signal | awk '{print $2}'
"]]

-- Periodically get ssid info
awful.widget.watch(wifi_ssid_script, update_interval, function(widget, stdout)
    local wifi_ssid = stdout:match(".*")
    awesome.emit_signal("evil::wifi_ssid", wifi_ssid)
end)

-- Periodically get signal strength info
awful.widget.watch(wifi_strength_script, update_interval, function(widget, stdout)
    local wifi_strength = stdout:match(".*")
    awesome.emit_signal("evil::wifi_strength", tonumber(wifi_strength))
end)
