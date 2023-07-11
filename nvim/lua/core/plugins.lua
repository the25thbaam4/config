local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- plugin manager
  use 'nvim-tree/nvim-tree.lua' 
  use 'nvim-tree/nvim-web-devicons' -- icons 
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-commentary' --gcc for commentary
  -- LSP 
  use {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets",
    'tc50cal/vim-terminal',
    -- 'mfussenegger/nvim-dap',
    'mfussenegger/nvim-jdtls'
  }
  use 'preservim/tagbar'
  use 'windwp/nvim-autopairs' -- autopairs for () {} etc.

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
    }

--themes
  use{
     "catppuccin/nvim", as = "catppuccin", 
     'ellisonleao/gruvbox.nvim'
  }


  use 'mbbill/undotree' --undo history


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
