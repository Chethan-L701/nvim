return {
    { "folke/neodev.nvim", opts = {} },
    {
        "chentoast/marks.nvim",
        config = function()
            require("marks").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        config = function()
            require("ibl").setup({ scope = { enabled = false } })
        end,
    },
    {
        "mbbill/undotree",
        lazy = true,
        keys = {
            { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
        },
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
        keys = {
            { "gcc", desc = "comment current line" },
            { "gbc", desc = "comment the selected lines" },
        },

    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        lazy = true,
        cmd = "MarkdownPreview",
    },
}
