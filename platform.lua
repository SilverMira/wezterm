local wezterm = require("wezterm")
local M = {}

--- Delegates to wezterm.target_triple
--- Returns the target triple that was compiled to
--- @return string
M.triple = function()
	return wezterm.target_triple
end

M.current = function()
	local triple = M.triple()

	return {
		is_mac = triple == "x86_64-apple-darwin",
		is_linux = wezterm.target_triple == "x86_64-unknown-linux-gnu",
		is_win = wezterm.target_triple == "x86_64-pc-windows-msvc",
	}
end

return M
