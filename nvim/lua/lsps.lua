local lsp_servers = require('langconfig').lsp_servers

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
})
vim.lsp.enable(lsp_servers)
