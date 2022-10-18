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
      require('core.utils').on_file_open 'nvim-treesitter'
    end,
    run = ':TSUpdate',
    config = function()
      require 'plugins.configs.treesitter'
    end,
  }

  use {
    'folke/which-key.nvim',
    keys = { '<leader>', 'g' },
    config = function()
      require 'plugins.configs.whichkey'
    end,
  }

  -------------------------------- LSP,
  use {
    'neovim/nvim-lspconfig',
    opt = true,
    setup = function()
      require('core.utils').on_file_open 'nvim-lspconfig'
    end,
    config = function()
      require 'plugins.configs.lspconfig'
    end,
  }

  use {
    'lukas-reineke/lsp-format.nvim',
    after = 'nvim-lspconfig',
  }

  use {
    'mfussenegger/nvim-dap',
    module = 'dapui',
  }

  use {
    'rcarriga/nvim-dap-ui',
    after = 'nvim-dap',
    config = function()
      require('dapui').setup()
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    opt = true,
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
    'rafamadriz/friendly-snippets',
    module = { 'cmp', 'cmp_nvim_lsp' },
    event = 'InsertEnter',
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require 'plugins.configs.cmp'
    end,
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
      require('plugins.configs.others').material()
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
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
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    module = 'telescope',
    config = function()
      require 'plugins.configs.telescope'
    end,
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    after = 'telescope.nvim',
    run = 'make',
    config = function()
      require('telescope').load_extension 'fzf'
    end,
  }

  use {
    'ahmedkhalf/project.nvim',
    after = 'telescope.nvim',
    config = function()
      require('project_nvim').setup()
      require('telescope').load_extension 'projects'
    end,
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
    'lewis6991/gitsigns.nvim',
    ft = 'gitcommit',
    setup = function()
      require('core.utils').gitsigns()
    end,
    config = function()
      require('gitsigns').setup()
    end,
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
      require('toggleterm').setup()
    end,
  }

  use {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' },
    config = function()
      require('trouble').setup()
    end,
  }

  use {
    'beauwilliams/focus.nvim',
    event = 'WinNew',
    config = function()
      require('plugins.configs.others').focus()
    end,
  }

  use {
    'sindrets/winshift.nvim',
    after = 'focus.nvim',
    config = function()
      require('winshift').setup()
    end,
  }

  use {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = function()
      require('neogit').setup()
    end,
  }
end)
