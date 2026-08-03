local filetypes = require('langconfig').filetypes

require('nvim-treesitter').install(filetypes)
vim.api.nvim_create_autocmd('FileType', {
		pattern = filetypes,
		callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.wo.foldmethod = 'expr'
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
})
