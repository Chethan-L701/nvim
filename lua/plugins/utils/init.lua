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
    require("plugins.utils.format"),
    require("plugins.utils.oil"),
    require("plugins.utils.neorg"),
    require("plugins.utils.ufo"),
    require("plugins.utils.colorizer"),
    require("plugins.utils.telescope"),
    require("plugins.utils.symbolsoutline"),
    require("plugins.utils.neotree"),
    require("plugins.utils.toggleterm"),
}
