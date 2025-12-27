return {
    "folke/snacks.nvim",
    opts = {
        explorer = { enabled = true },
        picker = {
            hidden = true,
            ignored = true,
            sources = {
                explorer = {
                    layout = {
                        layout = { position = "right" },
                    },
                },
            },
        },
        layout = {
            sidebar = {
                layout = {
                    layout = { position = "right" },
                },
            },
        },
    },
}
