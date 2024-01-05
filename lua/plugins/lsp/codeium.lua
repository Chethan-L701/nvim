return {
    "Exafunction/codeium.vim",
    config = function()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set("i", "<C-g>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true })
        vim.keymap.set("i", "<c-;>", function()
            return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true })
        vim.keymap.set("i", "<c-,>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true })
        vim.keymap.set("i", "<c-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true })
    end,
    lazy = true,
    keys = {
        { "<leader>ce", "<cmd>CodeiumEnable<cr>",  desc = "Enable Codeium" },
        { "<leader>cx", "<cmd>CodeiumDisable<cr>", desc = "Disable Codeium" },
    },
}
