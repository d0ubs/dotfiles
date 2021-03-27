local wibox = require("wibox")
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox_mod/icons/"

-- Storage icon
local storage_icon = wibox.widget.imagebox(icon_path .. "storage.svg")

local storage_remain = wibox.widget {
    align  = 'center',
    valign = 'top',
    widget = wibox.widget.textbox
}

awesome.connect_signal("evil::storage", function(storage)
    storage_remain.text = storage .. " G"
end)

-- Storage widget
storage_widget = {
    storage_icon,
    storage_remain,
    layout = wibox.layout.fixed.vertical
}

return storage_widget
