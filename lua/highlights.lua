-- custom highlights groups
local M = {}
function M.set_highlights()
	local colors = require("catppuccin.palettes").get_palette("mocha")
	if colors ~= nil then
		-- Telescope
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.mantle })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = colors.text })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.red })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.flamingo })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.base, bg = colors.red })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.mantle, bg = colors.lavender })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.lavender })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.mauve })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.flamingo, bg = colors.none })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.mauve })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.mantle, bg = colors.mauve })
		-- Diagnostics
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.lavender })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
		vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.lavender })
		-- Bufferline
		vim.api.nvim_set_hl(0, "BufferLineWarning", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "BufferLineWarningSign", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "BufferLineWarningDiagnostic", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "BufferLineWarningSelected", { fg = colors.yellow })
		vim.cmd[[highlight BufferLineWarningSelected gui=bold,italic]]
		vim.api.nvim_set_hl(0, "BufferLineWarningDiagnosticSelected", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "BufferLineError", { fg = colors.red })
		vim.api.nvim_set_hl(0, "BufferLineErrorSelected", { fg = colors.red })
		vim.cmd[[highlight BufferLineErrorSelected gui=bold,italic]]
		vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", { fg = colors.red })
		vim.api.nvim_set_hl(0, "BufferLineErrorDiagnosticSelected", { fg = colors.red })
		vim.api.nvim_set_hl(0, "BufferLineInfo", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "BufferLineInfoSelected", { fg = colors.blue })
		vim.cmd[[highlight BufferLineInfoSelected gui=bold,italic]]
		vim.api.nvim_set_hl(0, "BufferLineInfoDiagnostic", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "BufferLineInfoDiagnosticSelected", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "BufferLineHint", { fg = colors.lavender })
		vim.api.nvim_set_hl(0, "BufferLineHintSelected", { fg = colors.lavender })
		vim.cmd[[highlight BufferLineHintSelected gui=bold,italic]]
		vim.api.nvim_set_hl(0, "BufferLineHintDiagnostic", { fg = colors.lavender })
		vim.api.nvim_set_hl(0, "BufferLineHintDiagnosticSelected", { fg = colors.lavender })
		vim.api.nvim_set_hl(0, "BufferlineBuffer", { fg = colors.overlay0 })
		vim.api.nvim_set_hl(0, "BufferlineBufferVisible", { fg = colors.overlay0 })
		vim.api.nvim_set_hl(0, "BufferLineFill", { fg = colors.overlay0 })
		vim.api.nvim_set_hl(0, "BufferLineNumberVisible", { fg = colors.overlay0 })
		vim.api.nvim_set_hl(0, "BufferLineNumbers", { fg = colors.overlay0 })
		vim.api.nvim_set_hl(0, "BufferlineBackground", { fg = colors.overlay0 })
	end
end
return M
