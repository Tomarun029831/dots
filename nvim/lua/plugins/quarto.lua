return {
    "quarto-dev/quarto-nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    ft = { "quarto" },
    dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
        "benlubas/molten-nvim",
    },
    opts = {
        lspFeatures = {
            enabled = true,
            languages = { "python" },
        },
        codeRunner = {
            enabled = true,
            default_method = "molten",
        },
    },
    keys = {
        {
            "<localleader>rc",
            function()
                require("quarto.runner").run_cell()
            end,
            desc = "Run cell",
            silent = true,
        },
        {
            "<localleader>ra",
            function()
                require("quarto.runner").run_above()
            end,
            desc = "Run cell + above",
            silent = true,
        },
        {
            "<localleader>rA",
            function()
                require("quarto.runner").run_all(true)
            end,
            desc = "Run all cells",
            silent = true,
        },
        {
            "<localleader>rl",
            function()
                require("quarto.runner").run_line()
            end,
            desc = "Run line",
            silent = true,
        },
        {
            "<localleader>r",
            function()
                require("quarto.runner").run_range()
            end,
            desc = "Run range",
            silent = true,
            mode = "v",
        },
    },
}
