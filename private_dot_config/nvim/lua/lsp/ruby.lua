-- If you are using rvm, make sure to change below configuration
require'lspconfig'.solargraph.setup {
  on_attach = require'lsp'.common_on_attach,
  cmd = { LSP_INSTALL_PATH .. "/ruby/solargraph/solargraph", "--stdio" },
  filetypes = { 'rb', 'erb', 'rakefile', 'ruby' }
}
