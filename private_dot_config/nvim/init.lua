-- Based on Lunarvim
require('default-config')
require('keymappings')
require('autocommands')
require('settings')
require('plugins')

-- Plugins configuration
require('plugins/nvim-treesitter')
require('plugins/which-key')
require('plugins/lualine')
require('plugins/nerdtree')
require('plugins/tmux-navigator')
require('plugins/nvim-comp')
require('plugins/indent-blankline')
require('plugins/gitsigns')

require('lsp')
