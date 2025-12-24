return {
    "RaafatTurki/hex.nvim",
    lazy = false,
    -- commit = "dc51e5d67fc994380b7c7a518b6b625cde4b3062", -- stable
    config = function()
        require("hex").setup({
            dump_cmd = "xxd -g 1",
            assemble_cmd = "xxd -r",
        })
    end,
}
