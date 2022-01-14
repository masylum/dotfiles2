local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
	b.diagnostics.eslint.with({
		condition = function(utils)
			return utils.root_has_file(".eslintrc.js")
		end,
		diagnostics_format = "#{m} [#{c}]",
	}),
	b.diagnostics.markdownlint,
	b.diagnostics.shellcheck.with({
		diagnostics_format = "#{m} [#{c}]",
	}),
	b.diagnostics.write_good,
	b.diagnostics.rubocop,

	b.formatting.prettier_standard,
	b.formatting.shfmt,
	b.formatting.stylua,
	b.formatting.trim_whitespace.with({ filetypes = { "tmux", "zsh" } }),
	b.formatting.rubocop,
	b.formatting.terraform_fmt,
}

local M = {}
M.setup = function(on_attach)
	null_ls.setup({
		-- debug = true,
		sources = sources,
		on_attach = on_attach,
	})
end

return M
