source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/keymappings.vim
lua require('nvimtree')
lua require('plugins')
lua require('config')
lua require('nvimlsp')
lua require('lualinecon')
source $HOME/.config/nvim/lua/scrollbar.vim

