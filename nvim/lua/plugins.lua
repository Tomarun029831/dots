local plugins = {
	-- lsp and lsp-manager
	{src='https://github.com/neovim/nvim-lspconfig'},
	{src='https://github.com/mason-org/mason.nvim'},
	{src='https://github.com/mason-org/mason-lspconfig.nvim'},
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
	{src='https://github.com/kdheepak/lazygit.nvim'},
	{src='https://github.com/nvim-mini/mini.diff'},
}
vim.pack.add(plugins)
table.insert(plugins, {src='https://github.com/Saghen/blink.cmp', version='v1'}) -- auto-completion
table.insert(plugins, {src='https://github.com/nvim-treesitter/nvim-treesitter'}) -- treesitter
return plugins
