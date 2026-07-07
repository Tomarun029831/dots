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

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.colors = require("colors.neovim-default")
config.keys = require("config.bindings")

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"
	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end
	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)
return config
