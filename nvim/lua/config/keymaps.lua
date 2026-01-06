-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Handle the width of windows
vim.keymap.set("n", "<M-.>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<M-,>", "<C-w><", { desc = "Decrease window width" })

vim.keymap.set("n", "gj", "/^```{<CR>", { desc = "Next cell", silent = true })
vim.keymap.set("n", "gk", "?^```{<CR>", { desc = "Previous cell", silent = true })

local function export_ipynb(execute)
    local cmd = "quarto convert % --to ipynb"
    if execute then
        cmd = cmd .. " --execute"
    end
    vim.cmd("!" .. cmd)
end
vim.keymap.set("n", "<localleader>qe", function()
    export_ipynb(false)
end, { desc = "Export to ipynb" })
vim.keymap.set("n", "<localleader>qE", function()
    export_ipynb(true)
end, { desc = "Export & Execute ipynb" })

vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.files({
        finder = "files",
        format = "file",
        show_empty = true,
        hidden = true,
        ignored = true,
        cwd = LazyVim.root(),
    })
end, { desc = "Find Files (Root Dir, No Ignore)" })
