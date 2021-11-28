local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')

require('telescope').load_extension('fzf')

-- Global remapping
------------------------------
require('telescope').setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.75,
            prompt_position = "bottom",
            preview_cutoff = 120,
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        file_ignore_patterns = {},
        path_display = { shorten = 5 },
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        pickers = {
            find_files = {
                find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
                theme = "ivy",
            },
            live_grep = {
                --@usage don't include the filename in the search results
                only_sort_text = true,
            },
        },
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        buffer_previewer_maker = previewers.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-c>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<CR>"] = actions.select_default + actions.center
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        }
    }
}
