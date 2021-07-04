-- Based on Lunarvim
require('default-config')
require('keymappings')
require('autocommands')
require('settings')
require('plugins')

-- Plugins configuration
require('plugins/nvim-treesitter')
require('plugins/which-key')
require('plugins/lsp-color')
require('plugins/lualine')
require('plugins/nerdtree')
require('plugins/tmux-navigator')

require('lsp')
