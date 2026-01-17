return {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "html, css" },
    opts = {
        lazy_load = true,
    },
}
