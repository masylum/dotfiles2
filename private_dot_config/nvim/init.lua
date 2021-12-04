-- Based on Lunarvim
require('default-config')
require('keymappings')
require('autocommands')
require('plugins')
require('settings')

-- Themes
require('onenord').setup()

-- Plugins configuration
require('plugins/nvim-treesitter')
require('plugins/which-key')
require('plugins/lualine')
require('plugins/lsp-installer')
require('plugins/nerdtree')
require('plugins/tmux-navigator')
require('plugins/nvim-comp')
require('plugins/indent-blankline')
require('plugins/gitsigns')

require('lsp')
