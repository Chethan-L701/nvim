require("core.options")
require("core.keymaps")
require("core.autocmds")
require("plugins.lazy")
vim.cmd [[colorscheme catppuccin]]
require("core.highlights").set_highlights()
