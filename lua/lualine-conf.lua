local color = require("catppuccin.palettes").get_palette("mocha")
if color == nil then
	color = {}
end
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 60
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = "catppuccin",
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = color.red }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})
--   
ins_left({
	-- mode component
	function()
		return " "
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = color.red,
			i = color.green,
			v = color.blue,
			[""] = color.blue,
			V = color.blue,
			c = color.mauve,
			no = color.red,
			s = color.peach,
			S = color.peach,
			[""] = color.peach,
			ic = color.yellow,
			R = color.lavender,
			Rv = color.lavender,
			cv = color.red,
			ce = color.red,
			r = color.teal,
			rm = color.teal,
			["r?"] = color.teal,
			["!"] = color.red,
			t = color.red,
		}
		return { fg = mode_color[vim.fn.mode()], gui = "bold" }
	end,
	padding = { right = 1 },
	on_click = function()
		vim.cmd([[SymbolsOutline]])
	end,
})

ins_left({
	"filesize",
	cond = conditions.buffer_not_empty,
	color = { fg = color.overlay0, gui = "bold" },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = color.mauve, gui = "bold" },
	on_click = function()
		vim.cmd([[Neotree]])
	end,
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = color.red },
		color_warn = { fg = color.yellow },
		color_info = { fg = color.blue },
	},
	on_click = function()
		vim.cmd([[Trouble]])
	end,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_left({
	function()
		return "%="
	end,
})

ins_right({
	-- Lsp server name .
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
	color = { fg = color.pink, gui = "bold" },
	on_click = function()
		vim.cmd([[LspInfo]])
	end,
})

-- Add components to right sections
--    ins_right({
--       "o:encoding", -- option component same as &encoding in viml
--        fmt = string.upper, -- I'm not sure why it's upper case either ;)
--       cond = conditions.hide_in_width,
--       color = { fg = colors.green, gui = "bold" },
--  })

--ins_right({
--	"fileformat",
--	fmt = string.upper,
--	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--	color = { fg = colors.green, gui = "bold" },
--})

ins_right({
	"branch",
	icon = "",
	color = { fg = color.lavender, gui = "bold" },
	on_click = function()
		vim.cmd([[Neogit]])
	end,
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = color.green },
		modified = { fg = color.yellow },
		removed = { fg = color.red },
	},
	-- cond = conditions.hide_in_width,
	on_click = function()
		vim.cmd([[DiffviewOpen]])
	end,
})
ins_right({ "progress", color = { fg = color.blue, gui = "bold" } })

ins_right({ "location", color = { fg = color.lavender, gui = "italic" } })
ins_right({
	-- Neorg Notes icons
	function()
		return ""
	end,
	color = { fg = color.mauve, gui = "bold" },
	on_click = function()
		vim.cmd([[Neorg workspace todo]])
	end,
})
ins_right({
	function()
		return "▊"
	end,
	color = { fg = color.red },
	padding = { left = 1 },
})

-- Now don't forget to initialize lualine
return config
