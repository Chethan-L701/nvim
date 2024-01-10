vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", function()
    vim.cmd("w")
    local cmd = "mksession! " .. vim.fn.getcwd() .. "/session.vim"
    vim.cmd(cmd)
end, { silent = true, noremap = true })

vim.keymap.set("n", "<C-q>", ":QuitNvim<CR>", { desc = "Quit Nvim" })
vim.keymap.set("n", "!", ":!", { desc = "Shell" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>yy", '0v$"+y$', { desc = "copy to system clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>li", function()
    vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle inlay hints" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv") -- Shift visual selected line up
vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>")
