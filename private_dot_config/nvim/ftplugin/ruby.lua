-- If you are using rvm, make sure to change below configuration
require'lspconfig'.solargraph.setup {
  cmd = {DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph", "stdio"},
  on_attach = require'lsp'.common_on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true,
        update_in_insert = true
      })
  },
  filetypes = {'rb', 'erb', 'rakefile', 'ruby'}
}

require('utils').define_augroups({
  _ruby_format = {
    {'BufWritePre', '*.rb', 'lua vim.lsp.buf.formatting_sync(nil,1000)'}
  }
})
