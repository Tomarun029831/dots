local wezterm = require("wezterm")
return {
	{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "^", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "/", mods = "CTRL", action = wezterm.action.SendString("\x1f") },
}
