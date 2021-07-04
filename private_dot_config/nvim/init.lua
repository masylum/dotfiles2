-- Based on Lunarvim
require('settings')
require('plugins')
require('colorscheme')
require('keymappings')
require('treesitter')
require('autocommands')
require('utils')

-- TODO is there a way to do this without vimscript
vim.cmd('source '..vim.fn.stdpath('config')..'/vimscript/functions.vim')

-- LSP
require('lsp')
require('lsp/css')
require('lsp/docker')
require('lsp/go')
require('lsp/graphql')
require('lsp/html')
require('lsp/js-ts')
require('lsp/json')
require('lsp/lua')
require('lsp/ruby')
require('lsp/terraform')

-- Plugins configuration
require('plugins/comment')
require('plugins/git-signs')
require('plugins/lsp-color')
require('plugins/lsp-install')
require('plugins/lspsaga')
require('plugins/lualine')
require('plugins/matchup')
require('plugins/nerdtree')
require('plugins/nvim-compe')
require('plugins/telescope')
require('plugins/tmux-navigator')
require('plugins/which-key')
require('plugins/spectre')
