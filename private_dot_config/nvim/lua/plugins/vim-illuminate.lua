-- This is not working
require("utils").define_augroups({
	_illuminateWord = {
		{
			"VimEnter",
			"*",
			"hi illuminatedWord cterm=underline gui=underline",
		},
	},
})
