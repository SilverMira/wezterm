local wezterm = require("wezterm")
local config = {}

-- Appearance
local appearance = require("appearance")
config.color_scheme = appearance.color_scheme.dark()
appearance.font.apply(config)
appearance.render.apply(config)

-- Launch menu
local launch_menu = require("launch_menu")
config.launch_menu = launch_menu.launch_menu()
config.default_prog = launch_menu.default_prog()

-- Keys
local keymaps = require("keymaps")
keymaps.apply(config)
local smart_splits = require("smart-splits")
smart_splits.apply(config)

return config
