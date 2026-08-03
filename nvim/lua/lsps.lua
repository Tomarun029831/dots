local lsp_servers = require('langconfig').lsp_servers
local function setup_lsp_env()
    if package.loaded["mason"] then return end

    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = lsp_servers,
        automatic_installation = true,
    })
end

vim.api.nvim_create_user_command('Mason', function () -- PERF: mason will be loaded right on time
	setup_lsp_env()
	vim.cmd('Mason')
end , {nargs=0})

vim.api.nvim_create_autocmd("BufReadPre", { -- PERF: mason and lsp will be loaded right on time
    once = true,
    callback = function()
		setup_lsp_env()
        vim.lsp.enable(lsp_servers)
    end,
})

