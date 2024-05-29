local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.color_scheme = 'OneDarkCool'
config.font = wezterm.font('FiraCode Nerd Font', {weight = 'Medium'})
config.font_size = 14
config.line_height = 1.05

config.allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace'

config.enable_tab_bar = false
config.enable_scroll_bar = false

config.window_decorations = 'RESIZE'
config.window_padding = {left = 8, right = 8, top = 8, bottom = 8}

config.initial_cols = 256
config.initial_rows = 64

config.scrollback_lines = 10000

local onedarkcool_bg = '#242b38'
local onedarkcool_fg = '#a5b0c5'
local onedarkcool_black = '#151820'
local onedarkcool_red = '#ef5f6b'
local onedarkcool_green = '#97ca72'
local onedarkcool_yellow = '#ebc275'
local onedarkcool_blue = '#5ab0f6'
local onedarkcool_magenta = '#ca72e4'
local onedarkcool_cyan = '#4dbdcb'
local onedarkcool_grey = '#546178'
local onedarkcool_light_grey = '#7d899f'
local onedarkcool_white = '#fafafa'

config.color_schemes = {
  ['OneDarkCool'] = {
    background = onedarkcool_bg,
    foreground = onedarkcool_fg,

    cursor_bg = onedarkcool_white,
    cursor_fg = onedarkcool_black,
    cursor_border = onedarkcool_white,
    selection_fg = onedarkcool_black,
    selection_bg = onedarkcool_light_grey,

    ansi = {
      onedarkcool_black,
      onedarkcool_red,
      onedarkcool_green,
      onedarkcool_yellow,
      onedarkcool_blue,
      onedarkcool_magenta,
      onedarkcool_cyan,
      onedarkcool_fg
    },

    brights = {
      onedarkcool_grey,
      onedarkcool_red,
      onedarkcool_green,
      onedarkcool_yellow,
      onedarkcool_blue,
      onedarkcool_magenta,
      onedarkcool_cyan,
      onedarkcool_white
    }
  }
}

return config
