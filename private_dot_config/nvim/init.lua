-- Based on Lunarvim
require('default-config')
require('autocommands')
require('settings')
require('plugins')
vim.g.colors_name = 'dracula'
vim.g.syntax = true
require('keymappings')

-- Plugins configuration
require('plugins/nvim-treesitter')
require('plugins/which-key')
require('plugins/lsp-color')
require('plugins/lualine')
require('plugins/nerdtree')
require('plugins/tmux-navigator')

require('lsp')
