return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local pwsh = Terminal:new({ cmd = "pwsh", hidden = true })

        function pwsh_term()
            pwsh:toggle()
        end

        require("toggleterm").setup()
    end,
    lazy = true,
    keys = {

        {
            "<C-\\>",
            function()
                if vim.loop.os_uname().sysname == "Windows_NT" then
                    pwsh_term()
                else
                    vim.cmd([[ToggleTerm direction=horizontal]])
                end
            end,
            desc = "horizontal Toggle Term",
        },
        {
            "<C-\\>",
            function()
                if vim.loop.os_uname().sysname == "Windows_NT" then
                    pwsh_term()
                else
                    vim.cmd([[ToggleTerm direction=horizontal]])
                end
            end,
            desc = "horizontal Toggle Term",
            mode = "t"
        },
        { "<M-\\>", "<Cmd>ToggleTerm direction=float<CR>", desc = "Float Toggle Term" },
    },
}
