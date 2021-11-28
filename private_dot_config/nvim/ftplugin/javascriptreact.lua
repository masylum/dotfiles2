local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").tsserver.setup {
  cmd = {
    DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
    "--stdio",
  },
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  on_attach = require("lsp").tsserver_on_attach,
  -- This makes sure tsserver is not used for formatting (I prefer prettier)
  -- on_attach = require'lsp'.common_on_attach,
  root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  settings = { documentFormatting = false },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = O.lang.tsserver.diagnostics.virtual_text,
      signs = O.lang.tsserver.diagnostics.signs,
      underline = O.lang.tsserver.diagnostics.underline,
      update_in_insert = true,
    }),
  },
}
require("lsp.ts-fmt-lint").setup()
vim.cmd "setl ts=2 sw=2"
