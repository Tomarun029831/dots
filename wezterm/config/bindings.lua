local wezterm = require("wezterm")
return {
	{ key = "C", mods = "SHIFT|ALT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "V", mods = "SHIFT|ALT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "^", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
}
