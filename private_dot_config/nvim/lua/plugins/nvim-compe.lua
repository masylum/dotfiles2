local M = {}

vim.g.vsnip_snippet_dir = O.vnsip_dir

M.config = function()
    opt = {
        enabled = O.auto_complete,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = {
            path = {kind = "   (Path)"},
            buffer = {kind = "   (Buffer)"},
            calc = {kind = "   (Calc)"},
            vsnip = {kind = "   (Snippet)"},
            nvim_lsp = {kind = "   (LSP)"},
            nvim_lua = false,
            spell = {kind = "   (Spell)"},
            tags = false,
            emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
        }
    }

    require'compe'.setup(opt)

    vim.api.nvim_set_keymap("i", "<C-CR>", "compe#complete()", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})
end

return M
