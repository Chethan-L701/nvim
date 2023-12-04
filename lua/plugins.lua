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
		colorscheme = { "catppuccin" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		config = function()
			local opts = require("treesitter")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
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
		"folke/tokyonight.nvim",
		lazy = false,
		opts = require("themes.tokyonight-theme"),
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			require("statuscol").setup({})
		end,
		lazy = false,
	},
	{ "chentoast/marks.nvim" , config = function ()
	   require("marks").setup();
	end},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		keys = {
			{ "<leader>tc", "<cmd>TSContextToggle<cr>", desc = "Toggle context" },
		},
	},
	{
		"nvim-treesitter/playground",
		lazy = true,
		keys = {
			{ "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", desc = "Toggle playground" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		config = function()
			local opts = require("treesitter-text")
			require("treesitter-context").setup(opts)
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		lazy = false,
		keys = {},
		config = function()
			require("nvim-ufo-conf")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			local opts = require("themes.catppuccin-theme")
			require("catppuccin").setup(opts)
		end,
		priority = 1000,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local opts = require("bufferline-conf")
			require("bufferline").setup(opts)
		end,
		keys = {
			{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<leader>bd", "<cmd>BufferLinePickClose<cr>", desc = "Close Buffer" },
			{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
			{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", mode = "v", desc = "Pick Buffer" },
			{ "<leader>bst", "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by Tabs" },
			{ "<leader>bsd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by Directory" },
			{ "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by Extension" },
			{ "<leader>bx", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer" },

			{ "<M-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
			{ "<M-2>", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
			{ "<M-3>", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
			{ "<M-4>", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
			{ "<M-5>", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
			{ "<M-6>", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
			{ "<M-7>", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
			{ "<M-8>", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
			{ "<M-9>", "<cmd>BufferLineGoToBuffer 10<cr>", desc = "Buffer 9" },
		},
		lazy = false,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		lazy = true,
		config = function()
			local opts = require("neotree-conf")
			require("neo-tree").setup(opts)
		end,
		keys = {
			{ "<leader>ex", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
		},
		cmd = "Neotree",
	},
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			local opts = require("lualine-conf")
			require("lualine").setup(opts)
		end,
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		opts = require("themes.ondark-conf"),
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local opts = require("telescope-conf")
			require("telescope").setup(opts)
		end,
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
			{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
			{ "<leader>fs", "<cmd>Telescope git_stash<cr>", desc = "Git Stashes" },
			-- lsp
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
			{ "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		},
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
		"mg979/vim-visual-multi",
		lazy = true,
		key = {
			{ "<C-n>", mode = { "n", "x", "v" } },
		},
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
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"NvChad/nvim-colorizer.lua",
		lazy = true,
		config = function()
			local opts = require("colorizer-conf")
			require("colorizer").setup(opts)
		end,
		keys = {
			{ "<leader>cz", "<cmd>ColorizerToggle<cr>", desc = "Toggle NvChad colorizer" },
		},
	},
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
			{ "<leader>gs", desc = "Gitsigns" },
			{ "<leader>gse", "<cmd> Gitsigns toggle_signs<cr>", desc = "Toggle Git Signs" },
			{ "<leader>gsb", "<cmd> Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Current Line Blame" },
			{ "<leader>gss", "<cmd> Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
			{ "<leader>gsr", "<cmd> Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
			{ "<leader>gsu", "<cmd> Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
			{ "<leader>gsp", "<cmd> Gitsigns prev_hunk<cr>", desc = "Preview Hunk" },
			{ "<leader>gsn", "<cmd> Gitsigns next_hunk<cr>", desc = "Next Hunk" },
		},
	},
	{ "tpope/vim-fugitive", lazy = true, cmd = "Git" },
	{ "tpope/vim-commentary", lazy = false },
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
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Workspace Diagnostics" },
			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Document Diagnostics" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle Location List" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Quickfix" },
			{ "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Toggle Trouble Lsp Refereeences" },
		},
		cmd = "TroubleToggle",
	},
	{
		"mhartington/formatter.nvim",
		lazy = true,
		config = function()
			require("format")
		end,
		keys = {
			{ "<leader>fm", "<cmd>FormatWrite<cr>", desc = "Format" },
			{ "<leader>fm", "<cmd>FormatWrite<cr>", mode = "v", desc = "Format" },
		},
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
			{ "<C-\\>", "<Cmd>ToggleTerm<CR>", mode = "t", desc = "Toggle Term" },
			{ "<C-\\>", "<Cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal Toggle Ter" },
			{ "<M-\\>", "<Cmd>ToggleTerm direction=float<CR>", desc = "Float Toggle Term" },
		},
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		config = function()
			local opts = require("neorg-conf")
			require("neorg").setup(opts)
		end,
		cmd = "Neorg",
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmd = "DiffviewOpen",
		keys = {
			{ "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Open Split Diff view" },
			{ "<leader>dvc", "<cmd>DiffviewClose", desc = "Close Split Diff view" },
			{ "<leader>dvl", "<cmd>DiffviewLog<cr>", desc = "Open Log Diff view" },
			{ "<leader>dvr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diff view" },
			{ "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "Open File History Diff view" },
		},
	},
	{
		"simrat39/symbols-outline.nvim",
		lazy = true,
		config = function()
			local opts = require("symbolsout-conf")
			require("symbols-outline").setup(opts)
		end,
		keys = {
			{ "<leader>so", "<cmd>SymbolsOutline<cr>", desc = "Toggle Symbols Outline" },
		},
		cmd = "SymbolsOutline",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		lazy = false,
		config = function()
			local highlight = {
				"IblRed",
				"IblYellow",
				"IblBlue",
				"IblOrange",
				"IblGreen",
				"IblViolet",
				"IblCyan",
			}

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
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			local opts = require("barbecue-conf")
			require("barbecue").setup(opts)
			require("barbecue.theme.catppuccin")
		end,
		keys = {
			{ "<leader>b", desc = "Buffer" },
			{
				"<leader>be",
				function()
					require("barbecue.ui").toggle()
				end,
				desc = "Toggle Barbecue UI",
			},
		},
		lazy = false,
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
			{ "<leader>ce", "<cmd>CodeiumEnable<cr>", desc = "Enable Codeium" },
			{ "<leader>cx", "<cmd>CodeiumDisable<cr>", desc = "Disable Codeium" },
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
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
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		config = function()
			local opts = require("oil-conf")
			require("oil").setup(opts)
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		keys = {
			{ "<leader>oo", "<cmd>Oil<cr>", desc = "Open Oil Nvim" },
		},
		lazy = true,
	},
	{ "rebelot/kanagawa.nvim", lazy = false, opts = require("themes.kanagawa-conf") },
})
