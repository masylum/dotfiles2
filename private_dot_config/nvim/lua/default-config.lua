CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
TERMINAL = vim.fn.expand('$TERMINAL')

O = {
    format_on_save = true,
    auto_complete = true,
    wrap_lines = false,
    number = true,
    relative_number = false,
    cursorline = true,
    timeoutlen = 100,
    ignore_case = true,
    smart_case = true,
    hl_search = true,
    leader_key = "space",

    lsp = {
        popup_border = "single",
    },

    user_autocommands = {
        { "FileType", "qf", "set nobuflisted" },
    },

    lang = {
        lua = {
            diagnostics = {
                virtual_text = {spacing = 0, prefix = "⎨"},
                signs = true,
                underline = true
            }
        },
        tsserver = {
            linter = 'eslint',
            diagnostics = {
                virtual_text = {spacing = 0, prefix = "⎨"},
                signs = true,
                underline = true
            }
        },
        json = {
            diagnostics = {
                virtual_text = {spacing = 0, prefix = "⎨"},
                signs = true,
                underline = true
            }
        },
        ruby = {
            diagnostics = {
                virtualtext = {spacing = 0, prefix = "⎨"},
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
            virtual_text = true
        }
    }
}
