ApplyColorscheme(defscheme)

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "DiagnosticHint" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "DiagnosticWarn" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { link = "DiagnosticOk" })

vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = nil })
vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { bg = nil })
