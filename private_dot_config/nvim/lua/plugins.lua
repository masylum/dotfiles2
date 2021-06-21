local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
  local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

  local plugin_path = plugin_prefix .. plugin .. "/"
  --	print('test '..plugin_path)
  local ok, err, code = os.rename(plugin_path, plugin_path)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  --	print(ok, err, code)
  if ok then vim.cmd("packadd " .. plugin) end
  return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use { "neovim/nvim-lspconfig", opt = true }     -- A collection of common configurations for Neovim's built-in language server client.
  use { "glepnir/lspsaga.nvim", opt = true }      -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
  use { "kabouzeid/nvim-lspinstall", opt = true } -- Provides the missing :LspInstall for nvim-lspconfig
  use { "folke/trouble.nvim", opt = true }        -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  use 'folke/lsp-colors.nvim'

  -- Telescope
  use { "nvim-lua/popup.nvim", opt = true }       -- Telescope dependency for showing popups
  use { "nvim-lua/plenary.nvim", opt = true }     -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  use { "nvim-telescope/telescope.nvim", opt = true }
  use { "nvim-telescope/telescope-fzy-native.nvim", opt = true }
  use { "nvim-telescope/telescope-project.nvim", opt = true }

  -- Autocomplete
  use { "hrsh7th/nvim-compe", opt = true }
  use { "hrsh7th/vim-vsnip", opt = true }
  use { "rafamadriz/friendly-snippets", opt = true }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "windwp/nvim-ts-autotag", opt = true }
  use { 'andymass/vim-matchup', opt = true }

  -- Explorer
  use 'preservim/nerdtree' -- TODO: Revisit nvim-tree if it improves

  use {'lukas-reineke/indent-blankline.nvim', opt = true, branch = 'lua'}
  use {"lewis6991/gitsigns.nvim", opt = true}
  use {"kevinhwang91/nvim-bqf", opt = true}      -- Better quickfix

  -- Shortcuts
  use {"folke/which-key.nvim", opt = true}

  -- Comments
  use { 'terrortylor/nvim-comment', opt = true }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', opt = true }

  -- Color
  --use { "christianchiarulli/nvcode-color-schemes.vim", opt = true }
  use { 'dracula/vim', as = 'dracula' }

  -- Icons
  use { "kyazdani42/nvim-web-devicons", opt = true }

  -- Status Line and Bufferline
  use { "hoob3rt/lualine.nvim", opt = true }

  -- Git
  use 'tpope/vim-fugitive'

  -- Others
  use 'tommcdo/vim-exchange' -- TODO: Practice
  use 'tpope/vim-surround' -- Use more
  use 'tpope/vim-repeat'
  use 'christoomey/vim-tmux-navigator'

  require_plugin("nvim-lspconfig")
  require_plugin("lspsaga.nvim")
  require_plugin("nvim-lspinstall")
  require_plugin('trouble.nvim')
  require_plugin("friendly-snippets")
  require_plugin("popup.nvim")
  require_plugin("plenary.nvim")
  require_plugin("telescope.nvim")
  require_plugin('telescope-project.nvim')
  require_plugin("nvim-dap")
  require_plugin("nvim-compe")
  require_plugin("vim-vsnip")
  require_plugin("nvim-treesitter")
  require_plugin("nvim-ts-autotag")
  require_plugin('vim-matchup')
  require_plugin("gitsigns.nvim")
  require_plugin("git-blame.nvim")
  require_plugin("nvim-autopairs")
  require_plugin("nvim-comment")
  require_plugin("nvim-bqf")
  require_plugin("nvcode-color-schemes.vim")
  require_plugin("nvim-web-devicons")
  require_plugin("lualine.nvim")
  require_plugin("barbar.nvim")
  require_plugin('lsp-rooter.nvim')
  require_plugin("nvim-ts-context-commentstring")
  require_plugin("which-key.nvim")
end)
