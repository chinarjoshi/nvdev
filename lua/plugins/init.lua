require('plugins.packer').startup(function(use)
  -------------------------------- Base
  use {
    'wbthomason/packer.nvim',
    cmd = { 'PackerSync', 'PackerStatus' },
    config = function()
      require 'plugins'
    end,
  }

  use 'lewis6991/impatient.nvim'

  use {
    'nvim-lua/plenary.nvim',
    module = 'plenary',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    module = 'nvim-treesitter',
    setup = function()
      require('core.lazy_load').on_file_open 'nvim-treesitter'
    end,
    cmd = require('core.lazy_load').treesitter_cmds,
    run = ':TSUpdate',
    config = function()
      require 'plugins.configs.treesitter'
    end,
  }

  use {
    'folke/which-key.nvim',
    module = 'which-key',
    keys = { '<leader>', '"', '\'', '`' },
    config = function()
      require 'plugins.configs.whichkey'
    end,
  }

  -------------------------------- LSP,
  use {
    'neovim/nvim-lspconfig',
    opt = true,
    setup = function()
      require('core.lazy_load').on_file_open 'nvim-lspconfig'
    end,
    config = function()
      require 'plugins.configs.lspconfig'
    end,
  }

  use {
    'mfussenegger/nvim-dap',
    cmd = 'Debug',
    config = function()
      print 'ASDF'
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    opt = true,
    setup = function()
      require('core.lazy_load').on_file_open 'null-ls.nvim'
    end,
    config = function() end,
  }

  use {
    'williamboman/mason.nvim',
    cmd = require('core.lazy_load').mason_cmds,
    config = function()
      require 'plugins.configs.mason'
    end,
  }

  use { 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim', }
  use { 'jayp0521/mason-nvim-dap.nvim', after = 'mason-lspconfig.nvim', }
  use { 'jayp0521/mason-null-ls.nvim', after = 'mason-nvim-dap.nvim', }
  use { 'RubixDev/mason-update-all', cmd = 'MasonUpdateAll' }

  -------------------------------- Completion
  use {
    'rafamadriz/friendly-snippets',
    module = { 'cmp', 'cmp_nvim_lsp' },
    event = 'InsertEnter',
  }

  use {
    'github/copilot.vim',
    after = 'friendly-snippets',
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require 'plugins.configs.cmp'
    end,
  }

  use {
    'L3MON4D3/LuaSnip',
    wants = 'friendly-snippets',
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.others').luasnip()
    end,
  }

  use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'LuaSnip' }
  use { 'hrsh7th/cmp-path', after = 'cmp-nvim-lsp' }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.others').autopairs()
    end,
  }

  --------------------------------- Aesthetic

  use {
    'marko-cerovac/material.nvim',
    config = function()
      vim.cmd 'colorscheme material'
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
    setup = function()
      require('core.lazy_load').on_file_open 'indent-blankline.nvim'
    end,
    config = function()
      require('plugins.configs.others').blankline()
    end,
  }

  use {
    'kyazdani42/nvim-web-devicons',
    module = 'nvim-web-devicons',
    config = function()
      require('plugins.configs.others').devicons()
    end,
  }

  --------------------------------- Navigation
  use {
    'ibhagwan/fzf-lua',
    module = 'fzf-lua',
    cmd = 'fzf-lua',
    config = function()
      print 'TMP'
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    ft = 'alpha',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
      require 'plugins.configs.nvimtree'
    end,
  }

  --------------------------------- Editing,
  use {
    'lewis6991/gitsigns.nvim',
    ft = 'gitcommit',
    setup = function()
      require('core.lazy_load').gitsigns()
    end,
    config = function()
      require('plugins.configs.others').gitsigns()
    end,
  }

  use {
    'numToStr/Comment.nvim',
    module = 'Comment',
    keys = { 'gc', 'gb' },
    config = function()
      require('plugins.configs.others').comment()
    end,
  }

  --------------------------------- Etc.
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    cmd = 'ToggleTerm',
    config = function()
      require('plugins.configs.others').toggleterm()
    end,
  }

  use { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } }

  use { 'beauwilliams/focus.nvim', event = 'WinNew', }

  use { 'sindrets/winshift.nvim', after = 'focus.nvim', }

  use { 'TimUntersberger/neogit', cmd = 'Neogit', }

  use { 'danymat/neogen', cmd = 'Neogen' }
end)
