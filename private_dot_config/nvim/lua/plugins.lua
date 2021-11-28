local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
    use { 'wbthomason/packer.nvim' }

    -- LSP
    use { "neovim/nvim-lspconfig" }                           -- A collection of common configurations for Neovim's built-in language server client.
    use { "kabouzeid/nvim-lspinstall", event = "BufRead" }    -- Provides the missing :LspInstall for nvim-lspconfig

    -- Telescope
    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use {
        "nvim-telescope/telescope.nvim",
        config = [[require('plugins/telescope')]],
        event = "BufEnter",
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'onsails/lspkind-nvim' }

    -- Snippets
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/vim-vsnip-integ' }
    use { 'rafamadriz/friendly-snippets' }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "RRethy/nvim-treesitter-textsubjects" }

    -- Neoformat
    use { "sbdchd/neoformat" }

    -- Gitsigns
    use { 'lewis6991/gitsigns.nvim' }

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
    use { 'lukas-reineke/indent-blankline.nvim' }

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

    -- LANGUAGE SPECIFIC GOES HERE
    use {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
    }

    -- Autotags <div>|</div>
    use {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter"
    }

    -- Text objects using hint labels
    use {
        "mfussenegger/nvim-ts-hint-textobject",
        event = "BufRead"
    }

    -- My Plugins --
    ----------------

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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
