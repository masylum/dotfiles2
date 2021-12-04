local fn = vim.fn
local cmd = vim.cmd
local lsp = vim.lsp
local lspconfig = require('lspconfig')

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
    vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
    vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
    vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
    vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
    vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
    vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
    vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
    vim.cmd('command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()')
    vim.cmd('command! LspDiagNext lua vim.lsp.diagnostic.goto_next()')
    vim.cmd('command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()')
    vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')

    buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
    buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
    buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
    buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
    buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
    buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
    buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
    buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
    buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')

    if client.resolved_capabilities.document_formatting then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

require('null-ls').config({})
lspconfig['null-ls'].setup({ on_attach = on_attach })

fn.sign_define(
    'LspDiagnosticsSignError',
    {
        texthl = 'LspDiagnosticsSignError',
        text = '✖︎',
        numhl = 'LspDiagnosticsSignError'
    }
)
fn.sign_define(
    'LspDiagnosticsSignWarning',
    {
        texthl = 'LspDiagnosticsSignWarning',
        text = '▶︎',
        numhl = 'LspDiagnosticsSignWarning'
    }
)
fn.sign_define(
    'LspDiagnosticsSignHint',
    {
        texthl = 'LspDiagnosticsSignHint',
        text = '●',
        numhl = 'LspDiagnosticsSignHint'
    }
)
fn.sign_define(
    'LspDiagnosticsSignInformation',
    {
        texthl = 'LspDiagnosticsSignInformation',
        text = '○',
        numhl = 'LspDiagnosticsSignInformation'
    }
)

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = '⎨',
            spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = true,
    }
)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = 'single'
    }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = 'single'
    }
)

-- Symbols for autocomplete
lsp.protocol.CompletionItemKind = {
    '   (Text) ',
    '   (Method)',
    '   (Function)',
    '   (Constructor)',
    ' ﴲ  (Field)',
    '[] (Variable)',
    '   (Class)',
    ' ﰮ  (Interface)',
    '   (Module)',
    ' 襁 (Property)',
    '   (Unit)',
    '   (Value)',
    ' 練 (Enum)',
    '   (Keyword)',
    '   (Snippet)',
    '   (Color)',
    '   (File)',
    '   (Reference)',
    '   (Folder)',
    '   (EnumMember)',
    ' ﲀ  (Constant)',
    ' ﳤ  (Struct)',
    '   (Event)',
    '   (Operator)',
    '   (TypeParameter)'
}

-- Language specific configurations
lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require('nvim-lsp-ts-utils')
        ts_utils.setup({
            eslint_bin = 'eslint',
            eslint_enable_diagnostics = true,
            eslint_enable_code_actions = true,
            enable_formatting = true,
            formatter = 'prettier',
        })
        ts_utils.setup_client(client)

        buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
        buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
        buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')
        on_attach(client, bufnr)
    end,
    filetypes = {
        'typescript',
        'typescriptreact',
        'typescript.jsx',
    },
})

lspconfig.flow.setup{
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
    end,
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
    },
}
