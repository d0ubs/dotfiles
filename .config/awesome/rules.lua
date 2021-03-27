local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("keys")

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
				     size_hints_honor = true 
     }
    },



    -- Floating clients.

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set applications to specific tags
     { rule = { class = "firefox" },
       properties = { screen = 1, tag = "www" } },
     { rule = { class = "Brave" },
       properties = { screen = 1, tag = "www" } },
     { rule = { class = "idea" },
       properties = { screen = 1, tag = "coding" } },
     { rule = { class = "Zathura" },
       properties = { screen = 1, tag = "doc" , switchtotag = true } },
     { rule = { class = "Teams" },
       properties = { screen = 1, tag = "com" } },
     { rule = { class = "Discord" },
       properties = { screen = 1, tag = "com" } },
     { rule = { class = "mpv" },
       properties = { screen = 1, tag = "media", switchtotag = true } },
     { rule = { instance = "mkvtoolnix-gui" },
       properties = { tag  = "media", switchtotag = true } },
}
