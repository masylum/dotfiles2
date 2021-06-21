require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true -- bindings for prefixed with g
    }
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+" -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 } -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 70 }, -- min and max width of the columns
    spacing = 5, -- spacing between columns
  },
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
}

-- TODO create entire treesitter section

-- Comment
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<Leader>c", ":BufferClose<CR>", {noremap = true, silent = true})

-- NerdTree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>f', ':NERDTreeFind<CR>', {noremap = true, silent = true})

-- No Highlight
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

local mappings = {
  ["/"] = "Comment",
  ["c"] = "Close Buffer",
  ["n"] = "Tree",
  ["f"] = "Tree file",
  ["h"] = "No Highlight",
  l = {
    name = "+LSP",
    a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
    A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
    f = {"<cmd>LspFormatting<cr>", "Format"},
    i = {"<cmd>LspInfo<cr>", "Info"},
    l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
    L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
    p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
    q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
    r = {"<cmd>Lspsaga rename<cr>", "Rename"},
    t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
    x = {"<cmd>cclose<cr>", "Close Quickfix"},
    s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
    S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
    d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
    D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
  },
  g = {
    name = "+Git",
    j = {"<cmd>NextHunk<cr>", "Next Hunk"},
    k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
    p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
    r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
    R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
    s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
    b = {"<cmd>BlameLine<cr>", "Blame"},
    u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"}
  },
  s = {
    name = "+Search",
    s = {"<cmd>Telescope git_status<cr>", "Open changed file"},
    c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
    b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
    f = {"<cmd>Telescope find_files<cr>", "Find File"},
    m = {"<cmd>Telescope marks<cr>", "Marks"},
    M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
    r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
    R = {"<cmd>Telescope registers<cr>", "Registers"},
    t = {"<cmd>Telescope live_grep<cr>", "Text"}
  },
}

local wk = require("which-key")
wk.register(mappings, opts)
