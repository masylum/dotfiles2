local catppuccin = require("catppuccin")

catppuccin.setup({
	integrations = {
		lsp_trouble = true,
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
	},
})
