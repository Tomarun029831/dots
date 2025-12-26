local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function apply_config(module_name)
	local success, module = pcall(require, module_name)
	if success then
		for key, value in pairs(module) do
			config[key] = value
		end
	else
		wezterm.log_error("Failed to load module: " .. module_name)
		wezterm.log_error(module)
	end
end

apply_config("config.general")
apply_config("config.appearance")

config.colors = require("colors.ayu-mirage")
config.keys = require("config.bindings")

return config
