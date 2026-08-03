-- s <Tab> vim.snippet.jump if active, otherwise <Tab>
vim.api.nvim_create_autocmd('InsertEnter', { -- PERF: blink.cmp and mini.pairs will be loaded right on time
    once = true,
    callback = function()
		vim.pack.add({{src='https://github.com/Saghen/blink.cmp', version='v1'}}) -- HACK: see plugins.lua
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

        require('mini.pairs').setup()
    end,
})
