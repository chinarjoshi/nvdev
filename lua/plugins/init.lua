require('plugins.packer').startup(function(use)
  -------------------------------- Base
  use {
    'wbthomason/packer.nvim',
    -- cmd = { 'PackerSync', 'PackerStatus' },
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
      require('core.utils').on_file_open 'nvim-treesitter'
    end,
    run = ':TSUpdate',
    config = function()
      require 'plugins.configs.treesitter'
    end,
  }

  -------------------------------- LSP,
  use {
    'neovim/nvim-lspconfig',
    setup = function()
      require('core.utils').on_file_open 'null-ls.nvim'
    end,
    config = function()
      require 'plugins.configs.lspconfig'
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    setup = function()
      require('core.utils').on_file_open 'null-ls.nvim'
    end,
    config = function()
      require 'plugins.configs.null-ls'
    end,
  }

  use {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = function()
      require('mason').setup()
    end,
  }

 -------------------------------- Completion
  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require 'plugins.configs.cmp'
    end,
  }

  use {
    'rafamadriz/friendly-snippets',
    module = { 'cmp', 'cmp_nvim_lsp' },
    event = 'InsertEnter',
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.others').autopairs()
    end,
  }

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-autopairs',
    config = function()
      require('plugins.configs.others').luasnip()
    end,
  }

  use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' }
  use { 'hrsh7th/cmp-path', after = 'cmp-nvim-lsp' }

  use {
    'github/copilot.vim',
    after = 'cmp-path',
  }

  --------------------------------- Aesthetic
  use {
    'marko-cerovac/material.nvim',
    config = function()
      require('plugins.configs.material')
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    setup = function()
      require('core.utils').on_file_open 'indent-blankline.nvim'
    end,
    config = function()
      require('plugins.configs.others').blankline()
    end,
  }

  use {
    'kyazdani42/nvim-web-devicons',
    module = 'nvim-web-devicons',
  }

  use {
    'onsails/lspkind.nvim',
    module = 'lspkind',
  }

  --------------------------------- Navigation
  use {
    'ibhagwan/fzf-lua',
    cmd = 'Fzf',
    config = function()
      require 'plugins.configs.fzf'
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
      require('nvim-tree').setup {
        actions = { open_file = { quit_on_open = true } },
      }
    end,
  }

  --------------------------------- Editing,
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'RRethy/nvim-treesitter-textsubjects',
    after = 'nvim-treesitter',
  }

  use {
    'numToStr/Comment.nvim',
    module = 'Comment',
    keys = { 'gc', 'gb' },
    config = function()
      require('Comment').setup()
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

  use {
    'lewis6991/gitsigns.nvim',
    ft = 'gitcommit',
    setup = function()
      require('core.utils').gitsigns()
    end,
    config = function()
      require('plugins.configs.others').gitsigns()
    end,
  }

  use {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' },
    config = function()
      require('trouble').setup { height = 50 }
    end,
  }
end)
