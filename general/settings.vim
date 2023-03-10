let g:mapleader = "</Space>"
let g:snipMate = { 'snippet_version' : 1 }
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

syntax enable
colorscheme tokyonight-night
set encoding=UTF-8
set background=dark
set hidden
set laststatus=0
set noshowmode
set showtabline=2
set nowrap
set cursorline
set ruler
set mouse=a
set number
set t_Co=256_
set clipboard=unnamedplus

filetype plugin on
set omnifunc=v:lua.vim.lsp.omnifunc

let g:airline_powerline_fonts=1

