local M = {}
local lspconfig = require("lspconfig")

M.setup = function(on_attach, capabilities)
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
        diagnostics = {
          globals = {
            "global",
            "vim",
            "use",
            "describe",
            "it",
            "assert",
            "exepath",
            "before_each",
            "after_each",
          },
        },
      },
    },
  })
end

return M
