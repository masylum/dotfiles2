CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
TERMINAL = vim.fn.expand('$TERMINAL')

O = {
    format_on_save = true,
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
        ignore_install = { "haskell" },
        highlight = { enabled = true },
        -- The below are for treesitter-textobjects plugin
        textobj_prefixes = {
            goto_next = "]", -- Go to next
            goto_previous = "[", -- Go to previous
            inner = "i", -- Select inside
            outer = "a", -- Selct around
            swap = "<leader>a", -- Swap with next
        },
        textobj_suffixes = {
            -- Start and End respectively for the goto keys
            -- for other keys it only uses the first
            ["function"] = { "f", "F" },
            ["class"] = { "m", "M" },
            ["parameter"] = { "a", "A" },
            ["block"] = { "k", "K" },
            ["conditional"] = { "i", "I" },
            ["call"] = { "c", "C" },
            ["loop"] = { "l", "L" },
            ["statement"] = { "s", "S" },
            ["comment"] = { "/", "?" },
        },
        -- The below is for treesitter hint textobjects plugin
        hint_labels = { "h", "j", "f", "d", "n", "v", "s", "l", "a" },
    },

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
