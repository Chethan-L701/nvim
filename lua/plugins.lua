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
