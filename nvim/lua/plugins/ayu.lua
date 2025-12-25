return {
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        opts = {
            mirage = true,
            terminal = true,
        },
        config = function(_, opts)
            local ayu = require("ayu")
            ayu.setup(opts)
            ayu.colorscheme()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "ayu",
        },
    },
}
