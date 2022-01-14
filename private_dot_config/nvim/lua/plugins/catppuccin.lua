require("catppuccin").setup({
	integrations = {
		lsp_trouble = true,
		which_key = true,
		gitsigns = true,
		telescope = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
		},
	},
})
