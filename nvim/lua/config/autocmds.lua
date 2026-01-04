-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.cmd("colorscheme tokyonight-night")

-- INFO: LSP LOG
-- vim.lsp.set_log_level("ERROR")
local log_path = vim.lsp.get_log_path()
local max_size = 1024 * 1024 -- 1 MB
local stat = vim.uv.fs_stat(log_path)
if stat and stat.size > max_size then
    os.remove(log_path)
    vim.notify("LSP log file was too large and has been cleared.", vim.log.levels.INFO)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "quarto" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})
