require'lspconfig'.terraformls.setup{
  cmd = { LSP_INSTALL_PATH .. "/terraform/terraform-ls", "serve" },
  on_attach = require'lsp'.common_on_attach,
  filetypes = { "tf", "terraform", "hcl" }
}
