local wezterm = require("wezterm")
local M = {}
M.apply = function(config)
	local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
	smart_splits.apply_to_config(config, {
		modifiers = {
			move = "CTRL",
			resize = "ALT|SHIFT",
		},
	})
end

return M
