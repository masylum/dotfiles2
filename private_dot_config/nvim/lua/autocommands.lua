-- TODO: Make them work
local auto_formatters = {}

-- local javascript_autoformat = {
--   'BufWritePre',
--   '*.js',
--   'lua vim.lsp.buf.formatting_sync(nil, 1000)'
-- }

-- local javascriptreact_autoformat = {
--   'BufWritePre',
--   '*.jsx',
--   'lua vim.lsp.buf.formatting_sync(nil, 1000)'
-- }

-- local typescript_autoformat = {
--   'BufWritePre',
--   '*.ts',
--   'lua vim.lsp.buf.formatting_sync(nil, 1000)'
-- }

-- local typescriptreact_autoformat = {
--   'BufWritePre',
--   '*.tsx',
--   'lua vim.lsp.buf.formatting_sync(nil, 1000)'
-- }

-- table.insert(auto_formatters, javascript_autoformat)
-- table.insert(auto_formatters, javascriptreact_autoformat)
-- table.insert(auto_formatters, typescript_autoformat)
-- table.insert(auto_formatters, typescriptreact_autoformat)

-- local lua_format = {
--   'BufWritePre',
--   '*.lua',
--   'lua vim.lsp.buf.formatting_sync(nil, 1000)'
-- }
-- table.insert(auto_formatters, lua_format)

-- local json_format = {
--   'BufWritePre',
--   '*.json',
--   'lua vim.lsp.buf.formatting_sync(nil, 1000)'
-- }
-- table.insert(auto_formatters, json_format)

-- local ruby_format = {
--   'BufWritePre',
--   '*.rb',
--   'lua vim.lsp.buf.formatting_sync(nil,1000)'
-- }
-- table.insert(auto_formatters, ruby_format)

-- local go_format = {
--   'BufWritePre',
--   '*.go',
--   'lua vim.lsp.buf.formatting_sync(nil,1000)'
-- }
-- table.insert(auto_formatters, go_format)

-- Create autocommand groups based on the passed definitions
--
-- The key will be the name of the group, and each definition
-- within the group should have:
--    1. Trigger
--    2. Pattern
--    3. Text
-- just like how they would normally be defined from Vim itself
local definitions = {
    _general_settings = {
        { 'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({ higroup = \'Search\', timeout = 200 })' },
        { 'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' }, -- Disable automatic comment insertion
        { 'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' }, -- Disable automatic comment insertion
        { 'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' }, -- Disable automatic comment insertion
        { 'VimLeavePre', '*', 'set title set titleold=' },
        { 'FileType', 'qf', 'set nobuflisted' },
        { 'VimResized', '*', ':wincmd =' }, -- automatically rebalance windows on vim resize (added because tmux)
    },
    _go = {
        -- Go generally requires Tabs instead of spaces.
        {'FileType', 'go', 'setlocal tabstop=4'},
        {'FileType', 'go', 'setlocal shiftwidth=4'},
        {'FileType', 'go', 'setlocal softtabstop=4'},
        {'FileType', 'go', 'setlocal noexpandtab'},
    },
    _markdown = {{ 'FileType', 'markdown', 'setlocal wrap' }, { 'FileType', 'markdown', 'setlocal spell' }},
    _buffer_bindings = {
        { 'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>' }, -- Use q to close lsp windows
    { 'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>' }, -- Use q to close lsp windows
    },
    _auto_formatters = auto_formatters
}

for group_name, definition in pairs(definitions) do
  vim.cmd('augroup ' .. group_name)
  vim.cmd('autocmd!')

  for _, def in pairs(definition) do
    local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
    vim.cmd(command)
  end

  vim.cmd('augroup END')
end
