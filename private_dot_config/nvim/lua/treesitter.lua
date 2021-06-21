require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { 'haskell' },
  highlight = { enable = true },
  matchup = { enable = true },
  context_commentstring = {
    enable = true,
    config = { css = '// %s' }
  },
  -- TODO seems to be broken
  indent = { enable = { 'javascriptreact' } },
  autotag = { enable = true },
}
