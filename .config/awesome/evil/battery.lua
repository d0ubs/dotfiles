-- Provides:
-- evil::battery_percent
--      percentage (integer)
-- evil::battery_time
--      time (string)
-- evil::charger
--      plugged (boolean)
--
-- Original code from elenapan https://github.com/elenapan/

local awful = require("awful")

local update_interval = 30

local battery_percent_script = [[
sh -c "
acpi -b | awk '{print $4}'
"]]

local battery_time_script = [[
sh -c "
acpi -b | awk '{print $5}'
"]]

-- Subscribe to power supply status changes with acpi_listen
local charger_script = [[
sh -c '
acpi_listen | grep --line-buffered ac_adapter
']]

-- Periodically get battery info
awful.widget.watch(battery_percent_script, update_interval, function(widget, stdout)
    local battery_percent = stdout:match("%d*") -- Captures numbers only 
    awesome.emit_signal("evil::battery_percent", tonumber(battery_percent))
end)

awful.widget.watch(battery_time_script, update_interval, function(widget, stdout)
    local battery_time = stdout:gsub("....$", "") -- Remove seconds
    awesome.emit_signal("evil::battery_time", battery_time)
end)

local emit_charger_info = function()
    awful.spawn.easy_async_with_shell("cat /sys/class/power_supply/*/online | awk 'NR==1{print $1}'", function (out)
        status = tonumber(out)
        if status == 1 then
            awesome.emit_signal("evil::charger", true)
        else
            awesome.emit_signal("evil::charger", false)
        end
    end)
end

-- Run once to initialize widgets
emit_charger_info(percentage)

-- Kill old acpi_listen process
awful.spawn.easy_async_with_shell("ps x | grep \"acpi_listen\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
--awful.spawn.easy_async_with_shell("ps x | grep \"acpi_listen\" | awk '{print $1}' | xargs kill", function ()
    -- Update charger status with each line printed
awful.spawn.with_line_callback(charger_script, {
        stdout = function(_) emit_charger_info() end
    })

end)
