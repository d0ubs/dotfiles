-- Provides:
-- evil::storage
local awful = require("awful")

local update_interval = 60
local storage_script = [[
  sh -c "
  df -h ~/ | awk 'FNR==2 {print $4}'
  "]]

-- Periodically get storage info
awful.widget.watch(storage_script, update_interval, function(widget, stdout)
    local storage = stdout:match("%d*")
    awesome.emit_signal("evil::storage", storage)
end)
