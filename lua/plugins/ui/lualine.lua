return {
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		-- Lsp server name .
		require("lualine").setup({
			options = {
				theme = "horizon",
			},
			sections = {
				lualine_a = {
					{ "mode", icon = " " },
				},
				lualine_x = {
					{
						function()
							local msg = ""
							local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_active_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return msg
						end,
						icon = " ",
						on_click = function()
							vim.cmd([[LspInfo]])
						end,
					},
					{ "encoding" },
					{
						"fileformat",
						on_click = function()
							if vim.o.fileformat == "dos" then
								vim.cmd([[set fileformat=unix]])
							else
								vim.cmd([[set fileformat=dos]])
							end
						end,
					},

					"filetype",
				},
				lualine_z = {
					"location",
					"os.date('%a %H:%M:%S')",
				},
			},
		})
	end,
	lazy = false,
}
