local lsps = require('langconfig').lsps
local mason_lsps = require('langconfig').mason_lsps

local function setup_mason_lsp()
    if package.loaded["mason"] then return end

    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = mason_lsps,
        automatic_installation = true,
    })
end

vim.api.nvim_create_user_command('Mason', function ()
	setup_mason_lsp()
	vim.cmd('Mason')
end, { nargs = 0 })

vim.api.nvim_create_autocmd("BufReadPre", {
    once = true,
    callback = function()
		setup_mason_lsp()
        vim.lsp.enable(lsps)
    end,
})
