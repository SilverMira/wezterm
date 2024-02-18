local wezterm = require("wezterm")
local act = wezterm.action

local M = {}
M.leader = { key = "w", mods = "ALT", timeout_milliseconds = 300 }
M.keys = {
	{
		key = "F11",
		mods = "LEADER",
		action = act.ToggleFullScreen,
	},
	{
		key = "F12",
		mods = "LEADER",
		action = act.ShowDebugOverlay,
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateCommandPalette,
	},
	{
		key = "f",
		mods = "LEADER",
		action = act.PaneSelect({
			mode = "Activate",
		}),
	},
	{
		key = "a",
		mods = "LEADER",
		action = act.PaneSelect({
			mode = "SwapWithActiveKeepFocus",
		}),
	},
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	{
		key = "t",
		mods = "LEADER",
		action = act.ShowTabNavigator,
	},
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "C",
		mods = "LEADER",
		action = act.ShowLauncher,
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "Q",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "{",
		mods = "SHIFT|ALT",
		action = act.ActivateTabRelativeNoWrap(-1),
	},
	{
		key = "}",
		mods = "SHIFT|ALT",
		action = act.ActivateTabRelativeNoWrap(1),
	},
}
M.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}
M.apply = function(config)
	config.disable_default_key_bindings = true
	config.leader = M.leader
	config.keys = M.keys
	config.mouse_bindings = M.mouse_bindings
end

return M
