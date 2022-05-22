local null_ls = require("null-ls")
local b = null_ls.builtins

local with_root_file = function(...)
	local files = { ... }
	return function(utils)
		return utils.root_has_file(files)
	end
end

local sources = {
	b.diagnostics.shellcheck.with({
		command = ".nvim/shellcheck",
		args = { "$FILENAME" },
	}),
	b.diagnostics.semgrep.with({
		command = ".nvim/semgrep",
		condition = with_root_file(".semgrep.yml"),
		args = { "$FILENAME" },
	}),
	b.diagnostics.markdownlint,
	b.diagnostics.write_good,
	b.diagnostics.rubocop,

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
