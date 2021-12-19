local null_ls = require("null-ls")
local b = null_ls.builtins

local eslint_opts = {
	condition = function(utils)
		return utils.root_has_file(".eslintrc.js")
	end,
	diagnostics_format = "#{m} [#{c}]",
}

local sources = {
	b.code_actions.gitrebase,
	b.code_actions.gitsigns,

	b.diagnostics.eslint.with(eslint_opts),
	b.diagnostics.markdownlint,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	b.diagnostics.write_good,
	b.diagnostics.rubocop,

	b.formatting.eslint.with(eslint_opts),
	b.formatting.prettier,
	b.formatting.shfmt,
	b.formatting.stylua,
	b.formatting.trim_whitespace.with({ filetypes = { "tmux", "zsh" } }),
	b.formatting.rubocop,
	b.formatting.terraform_fmt,

	b.hover.dictionary,
}

local M = {}

M.setup = function(on_attach)
	null_ls.setup({
		debug = false,
		sources = sources,
		on_attach = on_attach,
	})
end

return M
