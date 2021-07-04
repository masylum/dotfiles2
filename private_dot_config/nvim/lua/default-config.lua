CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
TERMINAL = vim.fn.expand('$TERMINAL')

O = {
  auto_complete = true,
  colorscheme = 'dracula',
  hidden_files = true,
  wrap_lines = false,
  number = true,
  relative_number = false,
  cursorline = true,
  timeoutlen = 100,
  ignore_case = true,
  smart_case = true,
  hl_search = true,
  leader_key = "space";
  vnsip_dir = vim.fn.stdpath('config') .. "/snippets",

  -- @usage pass a table with your desired languages
  treesitter = {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {enabled = true},
  },

  lang = {
    lua = {
      -- @usage can be 'lua-format'
      formatter = '',
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    tsserver = {
      -- @usage can be 'eslint'
      linter = '',
      -- @usage can be 'prettier'
      formatter = '',
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    json = {
      -- @usage can be 'prettier'
      formatter = '',
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    ruby = {
      diagnostics = {
        virtualtext = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      },
      filetypes = {'rb', 'erb', 'rakefile', 'ruby'}
    },
    go = {},
    vim = {},
    yaml = {},
    terraform = {},
    html = {},
    graphql = {},
    docker = {},
    css = {
      formatter = '',
      autoformat = false,
      virtual_text = true
    }
  }
}
