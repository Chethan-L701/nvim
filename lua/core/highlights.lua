-- custom highlights groups
local M = {}
function M.set_highlights()
    vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitsignsCurrentLineBlame", { fg = "#555555" })
    vim.api.nvim_set_hl(0, "FidgetTitle", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "FidgetTask", { link = "NormalFloat" })
    -- signs
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
end

return M
