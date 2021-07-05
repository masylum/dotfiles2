local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..  install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

packer.init {
    compile_path = require("packer.util").join_paths(fn.stdpath('config'), 'plugin', 'packer_compiled.vim'),
    git = { clone_timeout = 300 },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end
    }
}

cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use {"neovim/nvim-lspconfig"}                           -- A collection of common configurations for Neovim's built-in language server client.
    use {"glepnir/lspsaga.nvim", cmd = "Lspsaga"}           -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
    use {"kabouzeid/nvim-lspinstall", cmd = "LspInstall"}   -- Provides the missing :LspInstall for nvim-lspconfig

    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"tjdevries/astronauta.nvim"}
    use {
        "nvim-telescope/telescope.nvim",
        config = [[require('plugins/telescope')]],
        cmd = "Telescope"
    }

    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plugins/nvim-compe").config()
        end
    }

    -- Snippets
    use {"hrsh7th/vim-vsnip", event = "InsertEnter"}
    use {"rafamadriz/friendly-snippets", event = "InsertEnter"}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}


    -- Gitsigns
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins/gitsigns").config()
        end,
        event = "BufRead"
    }

    -- Whichkey
    use {"folke/which-key.nvim"}

    -- Comments
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require('plugins/nvim-comment').setup()
        end
    }

    -- Icons
    use {"kyazdani42/nvim-web-devicons"}

    -- Matchup
    use {
        'andymass/vim-matchup',
        event = "CursorMoved",
        config = function()
            require('plugins/matchup').config()
        end
    }

    -- Show indent lines
    -- TODO: nvim has a bug with virtual text and horizontal scrolling
    -- use {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "BufRead",
    --     setup = function()
    --         vim.g.indentLine_enabled = 1
    --         vim.g.indent_blankline_char = "▏"
    --         vim.g.indent_blankline_filetype_exclude = {
    --             "help", "terminal"
    --         }
    --         vim.g.indent_blankline_buftype_exclude = {"terminal"}
    --         vim.g.indent_blankline_show_trailing_blankline_indent = false
    --         vim.g.indent_blankline_show_first_indent_level = true
    --     end
    -- }

    -- Comments in context
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        event = "BufRead"
    }

    -- Diagnostics
    use {
        "folke/trouble.nvim",
        cmd = 'TroubleToggle'
    }

    -- Better quickfix
    use {
        "kevinhwang91/nvim-bqf",
        event = "BufRead"
    }

    -- Floating terminal
    use {
        'numToStr/FTerm.nvim',
        event = "BufRead",
        config = function()
            require('FTerm').setup({
                dimensions = {height = 0.8, width = 0.8, x = 0.5, y = 0.5},
                border = 'single' -- or 'double'
            })
        end
    }

    -- Search & Replace
    use {
        'windwp/nvim-spectre',
        event = "BufRead",
        config = function()
            require('spectre').setup()
        end
    }

    -- Use fzy for telescope
    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        event = "BufRead"
    }

    -- LSP Colors
    use { "folke/lsp-colors.nvim" }

    -- Lazygit
    use {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit"
    }

    -- Explorer
    use 'preservim/nerdtree' -- TODO: Revisit nvim-tree if it improves

    -- Color
    use { 'dracula/vim', as = 'dracula' }

    -- Status Line and Bufferline
    use { "hoob3rt/lualine.nvim" }

    -- Git
    use 'tpope/vim-fugitive'

    -- Others
    use 'tommcdo/vim-exchange' -- TODO: Practice
    use 'tpope/vim-surround' -- Use more
    use 'tpope/vim-repeat'
    use 'christoomey/vim-tmux-navigator'
end)
