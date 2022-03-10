require('plugins.packer').startup(function(use)
  for _, plugin in
    ipairs {
      -------------------------------- Base
      { 'wbthomason/packer.nvim', cmd = { 'PackerSync', 'PackerStatus' } },
      { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
      { 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeFocus' } },
      { 'nvim-telescope/telescope.nvim', module = 'telescope', cmd = 'Telescope' },
      { 'ahmedkhalf/project.nvim', cmd = 'Telescope projects' },
      { 'folke/which-key.nvim', module = 'which-key' },
      { 'lewis6991/impatient.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nathom/filetype.nvim' },

      -------------------------------- LSP,
      { 'neovim/nvim-lspconfig', module = 'lspconfig' },
      { 'jose-elias-alvarez/null-ls.nvim', module = 'null-ls' },
      { 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' },
      { 'folke/lsp-colors.nvim', after = 'nvim-lspconfig' },
      { 'williamboman/nvim-lsp-installer', module = 'nvim-lsp-installer' },
      { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } },
      { 'onsails/lspkind-nvim', after = 'nvim-cmp' },

      -------------------------------- Completion,
      { 'hrsh7th/nvim-cmp', after = 'friendly-snippets' },
      { 'hrsh7th/cmp-nvim-lua', after = 'cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path', after = 'cmp-buffer' },
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },

      --------------------------------- Snippets,
      { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' },
      { 'rafamadriz/friendly-snippets', module = 'cmp_nvim_lsp', event = 'BufRead' },
      { 'michaelb/sniprun', cmd = 'SnipRun' },

      --------------------------------- Git,
      { 'lewis6991/gitsigns.nvim', opt = true },
      { 'TimUntersberger/neogit', cmd = 'Neogit' },

      --------------------------------- Editing,
      { 'ggandor/lightspeed.nvim', event = 'BufRead' },
      { 'tpope/vim-surround', event = 'BufRead' },
      { 'tpope/vim-commentary', event = 'BufRead' },
      { 'tpope/vim-repeat', event = 'BufRead' },
      { 'folke/todo-comments.nvim', module = 'todo-comments' },

      --------------------------------- Windows and Splits,
      { 'luukvbaal/stabilize.nvim', event = 'BufRead' },
      { 'https://gitlab.com/yorickpeterse/nvim-window.git', module = 'nvim-window' },
      { 'beauwilliams/focus.nvim', module = 'focus' },
      { 'sindrets/winshift.nvim', cmd = 'WinShift' },
      { 'alvarosevilla95/luatab.nvim' },

      --------------------------------- Aesthetic,
      { 'NvChad/nvim-base16.lua' },
      { 'feline-nvim/feline.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'NvChad/nvim-colorizer.lua', event = 'BufRead' },

      --------------------------------- Etc.
      { 'windwp/nvim-autopairs', after = 'nvim-cmp' },
      { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm' },
      { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' },
      { 'nvim-orgmode/orgmode', ft = 'org', require = 'akinsho/org-bullets.nvim' },
      { 'liuchengxu/vista.vim', cmd = 'Vista' },
      { 'ellisonleao/glow.nvim', cmd = 'Glow' },
      { 'mizlan/iswap.nvim', cmd = { 'ISwap', 'ISwapWith' } },
      { 'andymass/vim-matchup', opt = true },
    }
  do
    use(plugin)
  end
end)
