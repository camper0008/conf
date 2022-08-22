local themes_path = string.format("%s/.config/awesome/themes/gruvbox", os.getenv("HOME"))
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}

theme.wallpaper = themes_path .. "/buildings.png"
-- }}}

-- {{{ Styles
-- theme.font      = "sans 8"
-- theme.font      = "Play 9"
theme.font 	= "Red Hat Mono Medium 10"

-- {{{ Colors

theme.fg_normal                                 = "#ebdbb2"
theme.fg_focus                                  = "#ea6962"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#1d2021"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = theme.bg_normal
theme.border_width                              = dpi(0)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = theme.bg_normal
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = "#FABD2F" -- gruvbox yellow
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(0)
theme.border_normal  = "#2E3440"
theme.border_focus  = "#2E3440"
theme.border_marked  = "#2E3440"
--theme.border_normal = "#3B4252"
--theme.border_focus  = "#4C566A"
--theme.border_marked = "#D08770"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus   = "#3B4252"
theme.titlebar_bg_normal  = "#2E3440"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#D08770"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#A3BE8C"
--theme.fg_center_widget = "#8FBCBB"
--theme.fg_end_widget    = "#BF616A"
--theme.bg_widget        = "#434C5E"
--theme.border_widget    = "#3B4252"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#D08770"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "/awesome-icon.png"
-- }}}

-- {{{ batteryarc_widget
theme.widget_main_color = "#88C0D0"
theme.widget_red = "#BF616A"
theme.widget_yellow = "#EBCB8B"
theme.widget_green = "#A3BE8C"
theme.widget_black = "#000000"
theme.widget_transparent = "#00000000"
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
