local wezterm = require("wezterm")
local act = wezterm.action

return {
	{ key = "p", mods = "SUPER", action = act.ActivateCommandPalette },
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "t", mods = "SHIFT|CTRL", action = act({ SpawnTab = "CurrentPaneDomain" }) },

	{ key = "^", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
	{ key = "r", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
}
