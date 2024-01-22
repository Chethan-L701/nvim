return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local nu = Terminal:new({ cmd = "nu", hidden = true })

        function nu_term()
            nu:toggle()
        end

        require("toggleterm").setup()
    end,
    lazy = true,
    keys = {

        { "<C-\\>", "<Cmd>lua nu_term()<cr>",              desc = "horizontal Toggle Term" },
        {
            "<C-\\>",
            function()
                if vim.loop.os_uname().sysname == "Windows_NT" then
                    nu_term()
                else
                    vim.cmd([[ToggleTerm direction=horizontal]])
                end
            end,
            mode = "t",
            desc = "horizontal Toggle Term",
        },
        { "<M-\\>", "<Cmd>ToggleTerm direction=float<CR>", desc = "Float Toggle Term" },
    },
}
