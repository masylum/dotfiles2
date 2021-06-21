-- Force lsp colors while the theme does not support it
-- Hardcoded from the dracula palete
-- TODO: It does not work for whatever reason
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
