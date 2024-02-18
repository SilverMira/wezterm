local wezterm = require("wezterm")
local M = {}

-- Color scheme
M.color_scheme = {}
M.color_scheme.dark = function()
	return "Catppuccin Frappe"
end
M.color_scheme.light = function()
	return "Catppuccin Latte"
end
M.color_scheme.auto = function()
	local appearance = wezterm.gui.get_appearance()
	if appearance:find("Dark") then
		return M.color_scheme.dark()
	else
		return M.color_scheme.light()
	end
end

-- Font
M.font = {}
M.font.family = function()
	return wezterm.font_with_fallback({
		"Iosevka NF",
	})
end
M.font.size = function()
	return 14.0
end
M.font.freetype = function()
	return {
		interpreter = 40,
		load_flags = "DEFAULT",
		load_target = "Light",
		render_target = "Light",
	}
end
M.font.apply = function(config)
	config.font = M.font.family()
	config.font_size = M.font.size()
	local freetype = M.font.freetype()
	config.freetype_interpreter_version = freetype.interpreter
	config.freetype_load_flags = freetype.load_flags
	config.freetype_load_target = freetype.load_target
	config.freetype_render_target = freetype.render_target
end

-- Render
M.render = {}
M.render.frontend = function()
	return "WebGpu"
end
M.render.webgpu_options = function()
	local options = {}
	options.webgpu_power_preference = "HighPerformance"
	for _, adapter in ipairs(wezterm.gui.enumerate_gpus()) do
		if adapter.backend == "Vulkan" and adapter.device_type == "DiscreteGpu" then
			options.webgpu_preferred_adapter = adapter
			break
		end
	end

	return options
end
M.render.apply = function(config)
	config.front_end = M.render.frontend()
	local webgpu_options = M.render.webgpu_options()
	for k, v in pairs(webgpu_options) do
		config[k] = v
	end
end

return M
