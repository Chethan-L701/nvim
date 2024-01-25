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

command("ApplyCatppuccin", function()
    vim.cmd([[colorscheme catppuccin]])
    vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "none" })
    local colors = {
        darkgray = "none",
        innerbg = nil,
        outerbg = "none",
        visual = "#8888cc",
        insert = "#98bb6c",
        normal = "#89b4fa",
        replace = "#e46876",
        command = "#e6c384",
        text = "#212121",
    }
    vim.api.nvim_set_hl(0, "lualine_a_insert", { fg = colors.insert, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_normal", { fg = colors.normal, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_visual", { fg = colors.visual, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_replace", { fg = colors.replace, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_command", { fg = colors.command, bg = "none" })
end, {})

autocmd("VimEnter", {
    pattern = "*",
    command = "ApplyCatppuccin",
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
