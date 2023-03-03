source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/keymappings.vim
lua require('nvimtree')
lua require('plugins')
lua require('config')
lua require('nvimlsp')
lua require('lualinecon')
:map \ <leader>
lua<<EOF
vim.opt.termguicolors = true
require("bufferline").setup{}
require('telescope').setup{}
local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { 'ï ', 'ï¼' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "file", hl = "@text.uri" },
    Module = { icon = "Module", hl = "@namespace" },
    Namespace = { icon = "Namespace", hl = "@namespace" },
    Package = { icon = "package", hl = "@namespace" },
    Class = { icon = "class", hl = "@type" },
    Method = { icon = "method", hl = "@method" },
    Property = { icon = "prop", hl = "@method" },
    Field = { icon = "field", hl = "@field" },
    Constructor = { icon = "constrct", hl = "@constructor" },
    Enum = { icon = "enum", hl = "@type" },
    Interface = { icon = "interface", hl = "@type" },
    Function = { icon = "func", hl = "@function" },
    Variable = { icon = "var", hl = "@constant" },
    Constant = { icon = "const", hl = "@constant" },
    String = { icon = "string", hl = "@string" },
    Number = { icon = "num", hl = "@number" },
    Boolean = { icon = "bool¨", hl = "@boolean" },
    Array = { icon = "array", hl = "@constant" },
    Object = { icon = "object", hl = "@type" },
    Key = { icon = "key", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "enumnum", hl = "@field" },
    Struct = { icon = "struct", hl = "@type" },
    Event = { icon = "event", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "typepara", hl = "@parameter" },
    Component = { icon = "compo", hl = "@function" },
    Fragment = { icon = "frag³", hl = "@constant" },
  },
}

    
require("symbols-outline").setup(opts)
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c","lua","vim","help","java","r","python","html","css","javascript","cpp","markdown","bash" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require("tokyonight").setup({
	transparent=false,
	styles={
		sidebars="transparent",
		floats="transparent",
	}
})
EOF
colorscheme tokyonight-night
source $HOME/.config/nvim/lua/scrollbar.vim

