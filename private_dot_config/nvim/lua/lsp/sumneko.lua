local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig")["sumneko_lua"].setup({
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT", path = runtime_path },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                diagnostics = {
                    globals = {
                        "global",
                        "vim",
                        "use",
                        "describe",
                        "it",
                        "assert",
                        "before_each",
                        "after_each",
                    },
                },
                completion = {
                    showWord = "Disable",
                },
            },
        },
    })
end

return M
