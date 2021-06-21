-- If you are using rvm, make sure to change below configuration
require'lspconfig'.sorbet.setup {
  on_attach = require'lsp'.common_on_attach,
  filetypes = { 'rb', 'erb', 'rakefile' }
}
