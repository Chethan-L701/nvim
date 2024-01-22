local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command
command("QuitNvim", function()
    vim.cmd([[wall!]])
    local sscmd = "mksession! " .. vim.fn.getcwd() .. "/session.vim"
    vim.cmd(sscmd)
    vim.cmd("qa!")
end, {})

autocmd("VimLeavePre", {
    pattern = "*",
    command = "QuitNvim",
})

command("LspFormat", function()
    vim.lsp.buf.format()
end, {})

autocmd("BufWrite", {
    pattern = "*",
    command = "LspFormat",
})

command("LoadAllColorSchemes", function()
    vim.cmd([[Lazy load catppuccin kanagawa.nvim onedark.nvim tokyonight.nvim]])
end, {})
