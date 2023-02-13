return require('packer').startup(function(use)

	 use {
    		'w0rp/ale',
    		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    		cmd = 'ALEEnable',
   		config = 'vim.cmd[[ALEEnable]]'
	}
	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'mfussenegger/nvim-jdtls'
	use 'folke/tokyonight.nvim'
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-fugitive'
	use 'vim-airline/vim-airline-themes'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-lualine/lualine.nvim'
	use 'vim-airline/vim-airline'
	use 'justinmk/vim-sneak'
	use 'ryanoasis/vim-devicons'
	use 'honza/vim-snippets'
	use 'tomtom/tlib_vim'
	use 'Xuyuanp/scrollbar.nvim'
	use 'garbas/vim-snipmate'
	use 'MarcWeber/vim-addon-mw-utils'
	use 'neovim/nvim-lspconfig'
end)
