local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font('FiraCode Nerd Font', {weight = 'Medium'})
config.font_size = 14
config.line_height = 1.05

config.audible_bell = 'Disabled'
config.allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace'

config.enable_tab_bar = false
config.enable_scroll_bar = false

config.window_decorations = 'RESIZE'
config.window_padding = {left = 8, right = 8, top = 8, bottom = 8}

config.initial_cols = 256
config.initial_rows = 64

config.scrollback_lines = 10000

return config
