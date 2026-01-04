return {
    "quarto-dev/quarto-nvim",
    lazy = true,
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
}
