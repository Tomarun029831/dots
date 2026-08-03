local treesitters = require('langconfig').treesitters
local filetypes = require('langconfig').filetypes

vim.api.nvim_create_autocmd('FileType', {
	pattern = filetypes,
	callback = function()
		vim.pack.add({{src='https://github.com/nvim-treesitter/nvim-treesitter'}}) -- HACK: see plugins.lua
		require('nvim-treesitter').install(treesitters)
		vim.treesitter.start()
		vim.wo.foldenable = false
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
