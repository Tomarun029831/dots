local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.enable_kitty_graphics = true
config.enable_csi_u_key_encoding = true
config.unicode_version = 14

config.initial_cols = 120
config.initial_rows = 30
config.default_cwd = "~"
config.window_decorations = "TITLE | RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.line_height = 1.0
config.cell_width = 1.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.default_prog = { "nu" }
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.warn_about_missing_glyphs = false
config.font_size = 10.0

config.colors = {
	background = "#000b1e",
	foreground = "#0abdc6",
	cursor_bg = "#0abdc6",
	cursor_fg = "#000b1e",
	selection_bg = "#1c61c2",
	selection_fg = "#ffffff",

	ansi = {
		"#123e7c",
		"#ff0000",
		"#d300c4",
		"#f57800",
		"#123e7c",
		"#711c91",
		"#0abdc6",
		"#d7d7d5",
	},
	brights = {
		"#1c61c2",
		"#ff0000",
		"#d300c4",
		"#f57800",
		"#00ff00",
		"#711c91",
		"#0abdc6",
		"#d7d7d5",
	},
}

config.keys = {
	{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "^", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "/", mods = "CTRL", action = wezterm.action.SendString("\x1f") },
}

return config
