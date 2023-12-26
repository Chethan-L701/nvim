require("mason").setup()
require("mason-lspconfig").setup()
local vim = vim
local lspconfig = require("lspconfig")
require("lspconfig").lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server awre of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})

lspconfig.tsserver.setup({})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.gopls.setup({})
lspconfig.cssmodules_ls.setup({})
lspconfig.cssls.setup({})
-- lspconfig.pylyzer.setup({})
lspconfig.pyright.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.jsonls.setup({})
lspconfig.clangd.setup({})
lspconfig.tailwindcss.setup({})
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic Float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto Previous Error" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto Next Error" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Set Loclist" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = opts.buffer, desc = "GOTO Declaration" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = opts.buffer, desc = "GOTO definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = opts.buffer, desc = "Lsp Hover" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = opts.buffer, desc = "GOTO Implementation" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = opts.buffer, desc = "SIgnature Help" })
		vim.keymap.set(
			"n",
			"<space>wa",
			vim.lsp.buf.add_workspace_folder,
			{ buffer = opts.buffer, desc = "Add Workspace" }
		)
		vim.keymap.set(
			"n",
			"<space>wr",
			vim.lsp.buf.remove_workspace_folder,
			{ buffer = opts.buffer, desc = "Remove Workspace" }
		)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = opts.buffer, desc = "Type defination" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = opts.buffer, desc = "Rename" })
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ buffer = opts.buffer, desc = "Code Actions" }
		)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = opts.buffer, desc = "References" })
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

local signs = { Error = " ", Warn = " ", Info = " ", Hint = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("lspconfig.ui.windows").default_options.border = "double"
