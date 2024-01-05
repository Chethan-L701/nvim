return {

    {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("statuscol").setup({})
        end,
        lazy = false,
    },

    require("plugins.ui.catppuccin"),
    require("plugins.ui.kanagawa"),
    require("plugins.ui.ondark"),
    require("plugins.ui.tokyonight"),
    require("plugins.ui.lualine"),
    require("plugins.ui.horizon"),
    require("plugins.ui.barbecue"),
    require("plugins.ui.bufferline"),
    require("plugins.ui.which-key"),
    require("plugins.ui.alpha"),
}
