local treesitters = require('langconfig').treesitters
local filetypes = require('langconfig').filetypes

require('nvim-treesitter').install(treesitters)
vim.api.nvim_create_autocmd('FileType', {
	pattern = filetypes,
	callback = function()
		vim.treesitter.start()
		vim.wo.foldenable = false
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
