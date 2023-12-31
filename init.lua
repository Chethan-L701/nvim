-- default
local vim = vim
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.wrap = false
vim.opt.cursorline = true
vim.wo.fillchars = "eob: "
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 15

vim.opt.termguicolors = true
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 200 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 100
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

require("lazy-plugins")
require("core.keymaps")
require("core.autocmds")
vim.cmd[[colorscheme horizon]]
-- require("highlights").set_highlights()
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
