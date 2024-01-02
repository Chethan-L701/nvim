-- custom highlights groups
local M = {}
function M.set_highlights()
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })
end

return M
