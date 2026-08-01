vim.o.number=true
vim.o.relativenumber=true
vim.o.wrap=false
vim.o.tabstop=4
vim.o.swapfile=false
vim.o.winborder="rounded"
vim.g.mapleader=" "

-- window movements
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- plugins
vim.pack.add({
		{src='https://github.com/neovim/nvim-lspconfig'},
		{src='https://github.com/Saghen/blink.cmp', version='v1'}
})

-- lsp
vim.lsp.enable({'lua_ls', 'clangd'})

-- auto-completion
require('blink.cmp').setup({
		keymap = { preset = 'default' }, -- Tab / Shift-Tab / Enter / C-n / C-p
		sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
				ghost_text = { enabled = true },
		},
})


