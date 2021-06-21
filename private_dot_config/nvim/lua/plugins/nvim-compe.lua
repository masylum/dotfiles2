vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true,
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
    path = {kind = "  "},
    buffer = {kind = "  "},
    calc = {kind = "  "},
    vsnip = {kind = "  "},
    nvim_lsp = {kind = "  "},
    nvim_lua = false,
    spell = { kind = "  " },
    tags = false,
    vim_dadbod_completion = true,
    -- snippets_nvim = {kind = "  "},
    -- ultisnips = {kind = "  "},
    -- treesitter = {kind = "  "},
    emoji = {kind = " ﲃ ", filetypes={"markdown", "text"}}
    -- for emoji press : (idk if that in compe tho)
  }
}

vim.cmd('inoremap <silent><expr> <C-CR> compe#complete()')
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")
