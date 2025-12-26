local wezterm = require("wezterm")

return {
	-- Font Type
	unicode_version = 14,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" }),
	warn_about_missing_glyphs = false,

	-- Font Size & Layout
	font_size = 9.5,
	line_height = 1.0,
	cell_width = 1.0,

	-- Window Decorations
	window_decorations = "TITLE | RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
}
