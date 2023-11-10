local opts = {
	options = {
		highlight = {},
		groups = {
			items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "󰈸" })
            },
		},
		themable = true,
		max_name_length = 25,
		truncate_names = false, -- whether or not tab names should be truncated
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local str = " "
			for i, n in pairs(diagnostics_dict) do
				local icon = (i == "error" and "") or (i == "warning" and "" or "")
				str = str .. n .. " " .. icon .. " "
			end
			return str
		end,
		color_icons = true,
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		separator_style = "thin",
		numbers = function(opts)
			return string.format("%s·", opts.ordinal)
		end,
	},
}
return opts
