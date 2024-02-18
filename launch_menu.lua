local wezterm = require("wezterm")
local platform = require("platform")
local M = {}

M.default_prog = function()
	return { "elvish" }
end
M.launch_menu = function()
	local launch_menu = {}
	if platform.current().is_win then
		table.insert(launch_menu, {
			label = "Powershell",
			args = { "powershell.exe", "-NoLogo" },
		})

		-- Find installed visual studio version(s) and add their compilation
		-- environment command prompts to the menu
		for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20??/*", "C:/Program Files")) do
			local year = vsvers:gsub("Microsoft Visual Studio/", "")
			local vcvars64 = "C:/Program Files/" .. vsvers .. "/VC/Auxiliary/Build/vcvars64.bat"
			local init_vcvars64 = (string.gsub(vcvars64, "/", "\\"))
			table.insert(launch_menu, {
				label = "x64 Native Tools VS " .. year,
				args = {
					"cmd.exe",
					"/k",
					init_vcvars64,
				},
			})
		end
	end

	return launch_menu
end

return M
