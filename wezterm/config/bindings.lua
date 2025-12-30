local wezterm = require("wezterm")
return {
	{ key = "C", mods = "SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "V", mods = "SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "^", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
}
