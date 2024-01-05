return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup({})
        wk.register({
            f = { name = "Telescope" },
            b = { name = "Buffers and Barbecue" },
            d = { name = "Dap", t = { name = "Terminate" }, v = { name = "Diffview" } },
            g = { name = "Git", s = { name = "Gitsigns" } },
            l = { name = "Symbols" },
            s = { name = "Symbols Ol" },
            r = { name = "Lsp" },
            t = { name = "treesitter" },
            x = { name = "Trouble" },
            c = { name = "Code Actions" },
            o = { name = "Oil" },
            w = { name = "Workspace" },
            u = { name = "Undo" },
        }, { prefix = "<leader>" })
    end,
    lazy = false,
}
