local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- A collection of common configurations for Neovim's built-in language server client.
		"williamboman/nvim-lsp-installer", -- Provides the missing :LspInstall for nvim-lspconfig
	})

	-- Illuminate
	use({ "RRethy/vim-illuminate" }) -- Illuminates current word in the document

	-- Telescope
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Autocomplete
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "onsails/lspkind-nvim" })

	-- Autopairs
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- Snippets
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/vim-vsnip-integ" })
	use({ "rafamadriz/friendly-snippets" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	-- Neoformat
	use({ "sbdchd/neoformat" })

	-- Gitsigns
	use({ "lewis6991/gitsigns.nvim" })

	-- Whichkey
	use({ "folke/which-key.nvim" })

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Icons
	use({ "kyazdani42/nvim-web-devicons" })

	-- Matchup
	use({
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			require("plugins/matchup").config()
		end,
	})

	-- Show indent lines
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Diagnostics
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	})

	-- Better quickfix
	use({
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
	})

	-- LSP addons
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Autotags <div>|</div>
	use({
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	})

	-- Text objects using hint labels
	use({
		"mfussenegger/nvim-ts-hint-textobject",
		event = "BufRead",
	})

	-- Explorer
	use("preservim/nerdtree") -- TODO: Revisit nvim-tree if it improves

	-- Color
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Status Line and Bufferline
	use({ "hoob3rt/lualine.nvim" })

	-- Git
	use("tpope/vim-fugitive")

	-- Others
	use("tommcdo/vim-exchange") -- TODO: Practice
	use("tpope/vim-surround") -- Use more
	use("tpope/vim-repeat")
	use("christoomey/vim-tmux-navigator")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
