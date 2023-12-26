local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_user_command("QuitNvim", function()
    vim.cmd[[wall!]]
    local sscmd = "mksession! ".. vim.fn.getcwd() .. "/session.nvim"
    vim.cmd(sscmd)
    vim.cmd("qa!")
end,{})

autocmd("VimLeavePre",{
    pattern = "*",
    command = "QuitNvim"
})
