require('lazy').setup({

  ------------------------------ Base
  { 'nvim-lua/plenary.nvim' },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    init = function()
      require('core.utils').lazy_load 'nvim-treesitter'
    end,
    cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    opts = function()
      return require 'plugins.configs.treesitter'
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  ------------------------------ LSP
  { 'neovim/nvim-lspconfig' },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          require('mason').setup()
        end,
      },
    },
    opts = function()
      return require 'plugins.configs.mason_lspconfig'
    end,
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)
    end,
    lazy = false,
  },

  ------------------------------ Debugging + Testing
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require 'plugins.configs.dapui'
        end
      },

      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require('nvim-dap-virtual-text').setup()
        end,
      },

      {
        'mfussenegger/nvim-dap-python',
        config = function()
          require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
        end,
      },

      {
        'nvim-telescope/telescope-dap.nvim',
        config = function()
          require('telescope').load_extension 'dap'
        end,
      },
    },
    keys = { '<M-c>', '<M-b>' },
    config = function()
      require 'plugins.configs.dap'
    end,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-python',
      'rouge8/neotest-rust',
    },
    config = function()
      require('neotest').setup {
        require 'neotest-python',
        require 'neotest-rust',
      }
    end,
  },

  ------------------------------ Completion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
        config = function(_, opts)
          require('plugins.configs.others').luasnip(opts)
        end,
      },

      {
        'windwp/nvim-autopairs',
        opts = {
          fast_wrap = {},
          disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        config = function(_, opts)
          require('nvim-autopairs').setup(opts)
          local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
          require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
      },

      {
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
      },
    },
    opts = function()
      return require 'plugins.configs.cmp'
    end,
    config = function(_, opts)
      require('cmp').setup(opts)
    end,
  },

  {
    -- 'zbirenbaum/copilot.lua',
    -- event = 'InsertEnter',
    -- opts = {
    --   suggestion = {
    --     auto_trigger = true,
    --     keymap = { accept = '<C-c>' },
    --   },
    -- },
    -- config = function(_, opts)
    --   require('copilot').setup(opts)
    --   require("copilot.suggestion").toggle_auto_trigger()
    -- end,
  },

  ------------------------------ UI
  {
    'marko-cerovac/material.nvim',
    opts = function()
      return require 'plugins.configs.material'
    end,
    config = function(_, opts)
      require('material').setup(opts)
      vim.cmd 'colorscheme material'
    end,
    lazy = false,
    priority = 1000,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    init = function()
      require('core.utils').lazy_load 'indent-blankline.nvim'
    end,
    opts = function()
      return require('plugins.configs.others').blankline
    end,
    config = function(_, opts)
      require('ibl').setup(opts)
    end,
  },

  {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
    opts = { mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' } },
    config = function(_, opts)
      require('neoscroll').setup(opts)
    end,
  },

  { 'nvim-tree/nvim-web-devicons' },

  { 'onsails/lspkind.nvim' },

  ------------------------------ Navigation
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = function()
      return require 'plugins.configs.telescope'
    end,
    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)
      telescope.load_extension 'fzf'
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    opts = { actions = { open_file = { quit_on_open = true } } },
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end,
  },

  ------------------------------ Editing
  {
    'numToStr/Comment.nvim',
    keys = { 'gcc', 'gbc' },
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
    end
  },

  {
    'Wansmer/treesj',
    config = function()
      require('treesj').setup()
    end,
  },

  ------------------------------ Misc.
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
      },
    },
    config = function(_, opts)
      require('neorg').setup(opts)
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    ft = { 'gitcommit', 'diff' },
    init = require('core.utils').lazy_gitsigns,
    opts = function()
      return require('plugins.configs.others').gitsigns
    end,
    config = function(_, opts)
      local gs = require 'gitsigns'
      gs.setup(opts)
      -- vim.keymap.set('n', '}', gs.next_hunk)
      -- vim.keymap.set('n', '{', gs.prev_hunk)
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    cmd = 'ToggleTerm',
  },

  {
    'folke/which-key.nvim',
    keys = { ' ', 'g' },
    config = function(_, opts)
      local which_key = require 'which-key'
      local mappings = require 'core.mappings'
      which_key.setup(opts)
      which_key.register(mappings.general, { prefix = ' ' })
      which_key.register(mappings.lsp, { prefix = 'g' })
    end,
  },

  {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup()
    end,
  },
}, require 'plugins.configs.lazy_nvim')
