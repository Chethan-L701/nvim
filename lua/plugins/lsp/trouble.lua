return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    lazy = true,
    config = true,
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>",          desc = "Toggle Trouble" },
        {
            "<leader>xw",
            "<cmd>TroubleToggle workspace_diagnostics<cr>",
            desc = "Toggle Workspace Diagnostics",
        },
        {
            "<leader>xd",
            "<cmd>TroubleToggle document_diagnostics<cr>",
            desc = "Toggle Document Diagnostics",
        },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",  desc = "Toggle Location List" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Quickfix" },
        {
            "<leader>xr",
            "<cmd>TroubleToggle lsp_references<cr>",
            desc = "Toggle Trouble Lsp Refereeences",
        },
    },
    cmd = "TroubleToggle",
}
