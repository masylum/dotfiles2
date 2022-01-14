-- From https://github.com/jose-elias-alvarez/dotfiles/blob/main/config/nvim/lua/lsp/init.lua
local lsp = vim.lsp
local api = vim.api
local preferred_formatting_clients = {}
local fallback_formatting_client = "null-ls"

return function()
    local bufnr = api.nvim_get_current_buf()

    local selected_client
    for _, client in ipairs(lsp.buf_get_clients(bufnr)) do
        if vim.tbl_contains(preferred_formatting_clients, client.name) then
            selected_client = client
            break
        end

        if client.name == fallback_formatting_client then
            selected_client = client
        end
    end

    if not selected_client then
        return
    end

    local params = lsp.util.make_formatting_params()
    selected_client.request("textDocument/formatting", params, function(err, res)
        if err then
            local err_msg = type(err) == "string" and err or err.message
            vim.notify("global.lsp.formatting: " .. err_msg, vim.log.levels.WARN)
            return
        end

        if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, "modified") then
            return
        end

        if res then
            lsp.util.apply_text_edits(res, bufnr)
            api.nvim_buf_call(bufnr, function()
                vim.cmd("silent noautocmd update")
            end)
        end
    end, bufnr)
end
