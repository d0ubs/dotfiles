local wibox = require("wibox")
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox_mod/icons/"

-- Brightness icon
local brightness_icon = wibox.widget.imagebox()

local brightness_level = wibox.widget {
    align  = 'center',
    valign = 'top',
    widget = wibox.widget.textbox
}

awesome.connect_signal("evil::brightness", function(brightness)
    brightness_level.text = brightness .. "%"
    if brightness > 65 then
        brightness_icon.image = icon_path .. "brightness_high.svg"
    elseif brightness > 35 then
        brightness_icon.image = icon_path .. "brightness_medium.svg"
    else
        brightness_icon.image = icon_path .. "brightness_low.svg"
    end
end)

-- Brightness widget
brightness_widget = {
    brightness_icon,
    brightness_level,
    layout = wibox.layout.fixed.vertical
}

return brightness_widget
