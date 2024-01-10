return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    lazy = true,
    keys = {
        {
            "<C-\\>",
            "<Cmd>ToggleTerm<CR>",
            mode = "t",
            desc = "Toggle Term",
        },
        { "<C-\\>", "<Cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal Toggle Ter" },
        { "<M-\\>", "<Cmd>ToggleTerm direction=float<CR>",      desc = "Float Toggle Term" },
    },
}
