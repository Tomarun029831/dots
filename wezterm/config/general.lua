return {
	-- Render method
	front_end = "WebGpu",
	enable_kitty_graphics = true,

	-- Window Dimensions
	initial_cols = 120,
	initial_rows = 30,

	-- Environment
	default_cwd = "~",
	default_prog = { "nu" }, -- Shell

	-- Text Control
	enable_csi_u_key_encoding = false,
}
