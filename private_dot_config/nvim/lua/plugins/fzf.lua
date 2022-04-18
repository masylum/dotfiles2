require("fzf-lua").setup({
	winopts = {
		height = 0.3,
		width = 1,
		row = 1,
		col = 0,
		preview = {
			layout = "horizontal",
		},
	},
	previewers = {
		bat = {
			theme = "Catppuccin",
		},
	},
})
