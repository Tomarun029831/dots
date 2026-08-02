-- plugins
vim.pack.add({
	-- lsp and auto-completion
	{src='https://github.com/neovim/nvim-lspconfig'},
	{src='https://github.com/Saghen/blink.cmp', version='v1'},
	-- colorscheme
	{src='https://github.com/folke/tokyonight.nvim'}
})

vim.cmd([[
	colorscheme tokyonight-moon
	let g:loaded_node_provider = 0
	let g:loaded_perl_provider = 0
	let g:loaded_python3_provider = 0
	let g:loaded_ruby_provider = 0
]])
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = 'bold'
vim.g.mapleader = ' '

-- window movements
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- lsp and auto-completion
vim.lsp.enable({'lua_ls', 'clangd', 'nushell'})
require('blink.cmp').setup({
	keymap = {
		['<CR>'] = { 'accept', 'fallback' },
		['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' }
	},
	signature = { enabled = true },
	fuzzy = { implementation = 'prefer_rust' },
	sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
	completion = {
		menu = { draw = { treesitter = { 'lsp' } } },
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		ghost_text = { enabled = true },
	},
})

