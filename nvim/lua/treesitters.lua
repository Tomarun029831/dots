local filetypes = require('langconfig').filetypes

require('nvim-treesitter').install(filetypes)
vim.api.nvim_create_autocmd('FileType', {
		pattern = filetypes,
		callback = function()
				vim.treesitter.start()
				vim.wo.foldenable = false
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
})
