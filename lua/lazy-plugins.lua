local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    install = {
        missing = true,
        colorscheme = { "horizon" },
    },
    ui = {
        border = "double",
        size = {
            width = 0.8,
            height = 0.8,
        },
    },
    require("plugins.themes"),
    require("plugins.treesitter"),
    require("plugins.utils"),
    {
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
    },
    {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("statuscol").setup({})
        end,
        lazy = false,
    },
    {
        "chentoast/marks.nvim",
        config = function()
            require("marks").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim", -- optional
        },
        config = true,
        lazy = true,
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
        },
        cmd = "Neogit",
    },
    {
        "mfussenegger/nvim-dap",
    },
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "honza/vim-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    },
    { "saadparwaiz1/cmp_luasnip" },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
    {
        "mbbill/undotree",
        lazy = true,
        keys = {
            { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        lazy = false,
        keys = {
            { "<leader>gs",  desc = "Gitsigns" },
            { "<leader>gse", "<cmd> Gitsigns toggle_signs<cr>",              desc = "Toggle Git Signs" },
            { "<leader>gsb", "<cmd> Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Current Line Blame" },
            { "<leader>gss", "<cmd> Gitsigns stage_hunk<cr>",                desc = "Stage Hunk" },
            { "<leader>gsr", "<cmd> Gitsigns reset_hunk<cr>",                desc = "Reset Hunk" },
            { "<leader>gsu", "<cmd> Gitsigns undo_stage_hunk<cr>",           desc = "Undo Stage Hunk" },
            { "<leader>gsp", "<cmd> Gitsigns prev_hunk<cr>",                 desc = "Preview Hunk" },
            { "<leader>gsn", "<cmd> Gitsigns next_hunk<cr>",                 desc = "Next Hunk" },
        },
    },
    { "tpope/vim-fugitive",      lazy = true, cmd = "Git" },
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
            { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Toggle Trouble" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Workspace Diagnostics" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Toggle Document Diagnostics" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Toggle Location List" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Toggle Quickfix" },
            { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",        desc = "Toggle Trouble Lsp Refereeences" },
        },
        cmd = "TroubleToggle",
    },

    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        lazy = true,
        cmd = "MarkdownPreview",
    },
    {
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
    },

    {
        "sindrets/diffview.nvim",
        lazy = true,
        cmd = "DiffviewOpen",
        keys = {
            { "<leader>dvo", "<cmd>DiffviewOpen<cr>",        desc = "Open Split Diff view" },
            { "<leader>dvc", "<cmd>DiffviewClose<cr>",       desc = "Close Split Diff view" },
            { "<leader>dvl", "<cmd>DiffviewLog<cr>",         desc = "Open Log Diff view" },
            { "<leader>dvr", "<cmd>DiffviewRefresh<cr>",     desc = "Refresh Diff view" },
            { "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "Open File History Diff view" },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        config = function()
            local hooks = require("ibl.hooks")
            local colors = require("catppuccin.palettes").get_palette("mocha")
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "IblRed", { fg = colors.red })
                vim.api.nvim_set_hl(0, "IblYellow", { fg = colors.yellow })
                vim.api.nvim_set_hl(0, "IblBlue", { fg = colors.blue })
                vim.api.nvim_set_hl(0, "IblOrange", { fg = colors.peach })
                vim.api.nvim_set_hl(0, "IblGreen", { fg = colors.green })
                vim.api.nvim_set_hl(0, "IblViolet", { fg = colors.lavender })
                vim.api.nvim_set_hl(0, "IblCyan", { fg = colors.mauve })
            end)

            require("ibl").setup({ scope = { enabled = false } })
        end,
    },

    {
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
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.startify")

            dashboard.section.header.val = {
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
            }

            alpha.setup(dashboard.opts)
        end,
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
        config = function()
            require("fidget").setup()
        end,
        lazy = false,
    },
})
