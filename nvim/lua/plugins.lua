local plugins = {
	-- lsp and auto-completion
	{src='https://github.com/neovim/nvim-lspconfig'},
	{src='https://github.com/mason-org/mason.nvim'},
	{src='https://github.com/Saghen/blink.cmp', version='v1'},
	-- colorscheme
	{src='https://github.com/folke/tokyonight.nvim'},
	{src='https://github.com/nvim-mini/mini.indentscope', version='stable'},
	{src='https://github.com/nvim-mini/mini.tabline', version='stable'},
	-- highlight comments
	{src='https://github.com/folke/todo-comments.nvim'},
	{src='https://github.com/nvim-lua/plenary.nvim'}, -- the dependency of todo-comments
	-- utility editing
	{src='https://github.com/nvim-mini/mini.pairs', version='stable'},
	{src='https://github.com/nvim-mini/mini.surround', version='stable'},
	-- file explore
	{src='https://github.com/nvim-mini/mini.files', version='stable'},
	{src='https://github.com/nvim-mini/mini.pick', version='stable'},
	-- git integration
	{src='https://github.com/kdheepak/lazygit.nvim'}
}
vim.pack.add(plugins)
return plugins
