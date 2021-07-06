require('utils').define_augroups({
    _general_settings = {
        {
            'TextYankPost', '*',
            'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'
        },
        {
            'BufWinEnter', '*',
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
        },
        {
            'BufRead', '*',
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
        },
        {
            'BufNewFile', '*',
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
        },
        {'VimLeavePre', '*', 'set title set titleold='}
    },
    _markdown = {
        {'FileType', 'markdown', 'setlocal wrap'},
        {'FileType', 'markdown', 'setlocal spell'}
    },
    _buffer_bindings = {
        {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'}
    },
    _auto_resize = {
        -- will cause split windows to be resized evenly if main window is resized
        {'VimResized ', '*', 'wincmd ='},
    }
})
