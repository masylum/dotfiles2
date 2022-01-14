local lsp_installer = require("nvim-lsp-installer")
local u = require("utils")
local lsp = vim.lsp

local border_opts = { border = "single", focusable = false, scope = "line" }

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = false,
	signs = { active = signs },
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = border_opts,
})

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

global.lsp = {
	border_opts = border_opts,
	formatting = require("lsp.formatting"),
}

local on_attach = function(client, bufnr)
	u.lua_command("LspHover", "vim.lsp.buf.hover()")
	u.lua_command("LspRename", "vim.lsp.buf.rename()")
	u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
	u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
	u.lua_command("LspDiagLine", "vim.diagnostic.open_float(nil, global.lsp.border_opts)")

	u.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
	u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
	u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
	u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")

	if client.supports_method("textDocument/formatting") then
		vim.cmd([[
        augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePost <buffer> lua global.lsp.formatting()
        augroup END
        ]])
	end

	require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
	local opts = { capabilities = capabilities }
	local client_ops = {}

	local status_ok, config = pcall(require, "lsp.clients." .. server.name)
	if status_ok then
		client_ops = config.get_ops()
	end

	server:setup(vim.tbl_deep_extend("force", opts, client_ops))
end)

require("lsp.null-ls").setup(on_attach)
