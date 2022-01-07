local u = require("utils")
local lsp = vim.lsp
local border_opts = {
	focusable = false,
	style = "minimal",
	border = "rounded",
	source = "always",
	header = "",
	prefix = "",
}

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = border_opts,
})

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

local on_attach = function(client, bufnr)
	-- commands
	u.lua_command("LspHover", "vim.lsp.buf.hover()")
	u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
	u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
	u.lua_command("LspDiagLine", "vim.diagnostic.open_float(nil, border_opts)")
	u.lua_command("LspDiagQuickfix", "vim.diagnostic.setqflist()")

	-- bindings
	-- TODO: Move to whichkey
	u.buf_map("n", "K", ":LspHover<CR>", nil, bufnr)
	u.buf_map("n", "[a", ":LspDiagPrev<CR>", nil, bufnr)
	u.buf_map("n", "]a", ":LspDiagNext<CR>", nil, bufnr)

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("lsp.tsserver").setup(on_attach, capabilities)
require("lsp.sumneko").setup(on_attach, capabilities)
require("lsp.jsonls").setup(on_attach, capabilities)
require("lsp.bashls").setup(on_attach, capabilities)
require("lsp.sorbet").setup(on_attach, capabilities)
require("lsp.null-ls").setup(on_attach)
