local colors = require("catppuccin.palettes").get_palette()
vim.cmd("highlight NvimTreeGitNew gui=NONE guifg=" .. colors.green .. " guibg=NONE")

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end


    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 'p', api.node.navigate.parent, opts('Parent Directory'))
end

require("nvim-tree").setup({
    on_attach = on_attach,
})
