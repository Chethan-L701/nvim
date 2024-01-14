return {
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
        "tpope/vim-commentary",
        lazy = true,
        cmd = "Commentary",
        keys = {
            { "gcc", desc = "comment current line" },
            { "gc",  desc = "comment the selected lines" },
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
