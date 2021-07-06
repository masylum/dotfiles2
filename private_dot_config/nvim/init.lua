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

require('lsp')

-- autoformat
if O.format_on_save then
  require("utils").define_augroups {
    autoformat = {
      {
        "BufWritePre",
        "*",
        [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
      },
    },
  }
end
