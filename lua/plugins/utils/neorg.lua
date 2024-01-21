local opts = {
    load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                    todo = "~/todo",
                },
            },
        },
    },
}
return {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function()
        require("neorg").setup(opts)
    end,
    cmd = "Neorg",
}
