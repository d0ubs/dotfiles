local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")
local keys = require("keys")

local padding_height = 448 -- To be adapted to vert. resolution. 448 for 1080

local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox_mod/icons/"

local update_taglist = function (item, tag, index)
    if tag.selected then
        item.image = beautiful.taglist_icons_focused[index]
    elseif tag.urgent then
        item.image = beautiful.taglist_icons_urgent[index]
    elseif #tag:clients() > 0 then
        item.image = beautiful.taglist_icons_occupied[index]
    else
        item.image = beautiful.taglist_icons_empty[index]
    end
end

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
  -- { "restart", awesome.restart },
   { "restart", "systemctl reboot" },
   { "quit", "systemctl poweroff"}
  -- { "quit", function() awesome.quit() end}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
systray_widget = wibox.widget {
    widget = wibox.widget.systray
}

----- CLOCK ----
mytextclock = wibox.widget{
    align  = 'center',
    valign = 'center',
    format = "%H:%M",
    refresh = 10,
    widget = wibox.widget.textclock
}
-- Tooltip
local myclock_t = awful.tooltip {
    objects        = {mytextclock},
    timer_function = function()
        return os.date('%A %d %B %Y')
    end,
}

----- BATTERY ----
local bat_widget = require("noodle.battery_widget")

---- STORAGE ----
local storage_widget = require("noodle.storage_widget")

---- WIFI ----
local wifi_widget = require("noodle.wifi_widget")

---- VOLUME ----
local volume_widget = require("noodle.volume_widget")

-- Padding ----
padding = wibox.widget {
    image = icon_path .. "padding.png",
    forced_height = padding_height,
    widget = wibox.widget.imagebox
}

awful.screen.connect_for_each_screen(function(s)
 screen_index = s.index
    --awful.tag(my_tags.tags[screen_index].names, s, my_tags.tags[screen_index].layout, my_tags.tags[screen_index].icons) 
    awful.tag.add("www", {
    layout             = awful.layout.suit.max,
    screen             = s,
    selected           = true,
})
    awful.tag.add("ranger", {
    layout             = awful.layout.suit.max,
    screen             = s,
})
    awful.tag.add("coding", {
    layout             = awful.layout.suit.fair,
    screen             = s,
})
    awful.tag.add("admin", {
    layout             = awful.layout.suit.fair,
    screen             = s,
})
    awful.tag.add("pdf", {
    layout             = awful.layout.suit.max,
    screen             = s,
})
    awful.tag.add("media", {
    layout             = awful.layout.suit.floating,
    screen             = s,
})
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.vertical,
        widget_template = {
            widget = wibox.widget.imagebox,
            -- Add support for hover colors and an index label
            create_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
        },
        buttons = keys.taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, keys.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "left", screen = s, stretch = true, width = 45, bg = beautiful.bg_normal .. "65" })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.vertical,
        { -- Left widgets
            layout = wibox.layout.fixed.vertical,
            mylauncher,
            pad, 
            s.mytaglist,
            s.mypromptbox,
            padding,
            --systray_widget, 
            storage_widget, 
            wifi_widget,
            volume_widget,
            bat_widget,
	    s.mylayoutbox,
            mytextclock,
        },
    }
end)
