local color = require("catppuccin.palettes").get_palette("mocha")
if color == nil then
    color = {}
end
local opts = {
	kinds = {
        Folder = "",
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = "󰠱 ",
		Method = " ",
		Property = "󰜢 ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = "󰊕 ",
		Variable = " ",
		Constant = "󰏿 ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = "󰆕 ",
		TypeParameter = " ",
	},
	attach_navic = true,

	theme = {
		-- this highlight is used to override other highlights
		-- you can take advantage of its `bg` and set a background throughout your winbar
		-- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })

		-- these highlights correspond to symbols table from config

		-- these highlights represent the _text_ of three main parts of barbecue
		basename = { bold = true },
		context = { fg = color.lavender, italic = true },
		separator = { fg = color.red, bold = true },
		separator_active = { fg = color.teal, bold = true },
		normal = { fg = color.blue },
		dirname = { fg = color.pink, bold = true },

		-- these highlights are used for context/navic icons
		context_file = { fg = color.mauve },
		context_module = { fg = color.mauve },
		context_namespace = { fg = color.mauve },
		context_package = { fg = color.mauve },
		context_class = { fg = color.mauve },
		context_method = { fg = color.mauve },
		context_property = { fg = color.mauve },
		context_field = { fg = color.mauve },
		context_constructor = { fg = color.mauve },
		context_enum = { fg = color.mauve },
		context_interface = { fg = color.mauve },
		context_function = { fg = color.mauve },
		context_variable = { fg = color.mauve },
		context_constant = { fg = color.mauve },
		context_string = { fg = color.mauve },
		context_number = { fg = color.mauve },
		context_boolean = { fg = color.mauve },
		context_array = { fg = color.mauve },
		context_object = { fg = color.mauve },
		context_key = { fg = color.mauve },
		context_null = { fg = color.mauve },
		context_enum_member = { fg = color.mauve },
		context_struct = { fg = color.mauve },
		context_event = { fg = color.mauve },
		context_operator = { fg = color.mauve },
		context_type_parameter = { fg = color.mauve },
	},
    symbols = {
        separator = "",
    },
}
return opts
