local color = require("catppuccin.palettes").get_palette("mocha")
if color == nil then
	color = {}
end
local opts = {
	kinds = {
		Folder = "󰉋",
		File = "",
		Module = "",
		Namespace = " ",
		Package = "󰏓",
		--󰠱
		Class = "",
		Method = "",
		Property = "󰜢",
		Field = "",
		Constructor = "",
		Enum = "",
		Interface = "",
		Function = "󰊕",
		Variable = "",
		Constant = "󰏿",
		String = "",
		Number = "",
		Boolean = "",
		Array = "",
		Object = "",
		Key = "",
		Null = "",
		EnumMember = "",
		Struct = "",
		Event = "",
		Operator = "󰆕 ",
		TypeParameter = " ",
	},
	attach_navic = true,
	symbols = {
		separator = "",
	},
}
return opts
