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

ApplyColorscheme = function(scheme)
    local cmd = "colorscheme " .. scheme
    vim.cmd(cmd)
    local colors = {
        darkgray = "none",
        text0 = "#bbbbff",
        innerbg = nil,
        outerbg = "none",
        normal = "#7198fa",
        insert = "#aaffaa",
        visual = "#8888ff",
        replace = "#e46876",
        command = "#ddcc88",
        text = "#212121",
    }
    vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "lualine_a_insert", { fg = colors.insert, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_normal", { fg = colors.normal, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_visual", { fg = colors.visual, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_replace", { fg = colors.replace, bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_a_command", { fg = colors.command, bg = "none" })
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
end

command("ApplyColorscheme", function()
    local scheme = vim.fn.input("ColorScheme : ", "")
    if scheme == "" then
        scheme = "kanagawa"
    end
    ApplyColorscheme(scheme)
end, {})

autocmd("VimEnter", {
    pattern = "*",
    command = "lua ApplyColorscheme('kanagawa')",
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
