local null_ls = require("null-ls")
local b = null_ls.builtins

-- TODO: Only enable `/.nvim` if available
local sources = {
	b.diagnostics.eslint_d.with({
		command = ".nvim/eslint_d",
		args = { "$FILENAME" },
	}),
	b.diagnostics.shellcheck.with({
		command = ".nvim/shellcheck",
		args = { "$FILENAME" },
	}),
	b.diagnostics.semgrep.with({
		command = ".nvim/semgrep",
	}),
	b.diagnostics.markdownlint,
	b.diagnostics.write_good,
	b.diagnostics.rubocop,

	b.formatting.eslint_d,
	b.formatting.shfmt,
	b.formatting.stylua,
	b.formatting.trim_whitespace.with({
		filetypes = { "tmux", "zsh" },
	}),
	-- b.formatting.rubocop,
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
