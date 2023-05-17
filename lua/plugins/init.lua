require("lazy").setup {

  ------------------------------ Base
  "nvim-lua/plenary.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("core.utils").lazy_load "nvim-treesitter"
    end,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  ------------------------------ LSP
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("core.utils").lazy_load "nvim-lspconfig"
    end,
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  ------------------------------ Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = 'InsertEnter',
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-c>",
          next = "<C-n>",
          prev = "<C-p>"
        }
      }
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },

  ------------------------------ UI
  {
    'marko-cerovac/material.nvim',
    opts = function()
      return require "plugins.configs.material"
    end,
    config = function(_, opts)
      require("material").setup(opts)
      vim.cmd 'colorscheme material'
    end,
    lazy = false
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
      require("core.utils").lazy_load "indent-blankline.nvim"
    end,
    opts = function()
      return require("plugins.configs.others").blankline
    end,
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end,
  },

  { "nvim-tree/nvim-web-devicons", },

  { "onsails/lspkind.nvim" },

  ------------------------------ Navigation
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    cmd = "Telescope",
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension('fzf')
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },

  ------------------------------ Editing
  {
    "numToStr/Comment.nvim",
    keys = { "gcc", "gbc" },
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    dependencies = {
      {
        "folke/twilight.nvim",
        config = function()
          require("twilight").setup {
            dimming = {
              alpha = .5
            }
          }
        end
      }
    },
    config = function()
      require("zen-mode").setup()
    end
  },

  {
    'sunjon/shade.nvim',
    config = function()
      require("shade").setup {
        overlay_opacity = 60
      }
    end
  },

  {
    'karb94/neoscroll.nvim',
    config = function()
      require("neoscroll").setup {
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'}
      }
    end
  },

  ------------------------------ Misc.
  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = require('core.utils').lazy_gitsigns,
    opts = function()
      return require("plugins.configs.others").gitsigns
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  { 'akinsho/toggleterm.nvim', version = "*", config = true },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v" },
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}
