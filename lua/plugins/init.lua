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
      { 'williamboman/nvim-lsp-installer', module = 'nvim-lsp-installer' },
      { 'jose-elias-alvarez/null-ls.nvim', module = 'null-ls' },
      { 'lukas-reineke/lsp-format.nvim', after = 'nvim-lspconfig' },
      { 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' },
      { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } },
      { 'onsails/lspkind-nvim', after = 'nvim-cmp' },

      -------------------------------- Completion,
      { 'hrsh7th/nvim-cmp', after = 'friendly-snippets' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' },
      { 'hrsh7th/cmp-path', after = 'cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
      { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' },
      { 'rafamadriz/friendly-snippets', module = 'cmp_nvim_lsp', event = 'BufRead' },

      --------------------------------- Editing,
      { 'ggandor/lightspeed.nvim', event = 'BufRead' },
      { 'tpope/vim-surround', event = 'BufRead' },
      { 'tpope/vim-commentary', event = 'BufRead' },
      { 'tpope/vim-repeat', event = 'BufRead' },
      { 'folke/todo-comments.nvim', module = 'todo-comments' },
      { 'lewis6991/gitsigns.nvim', opt = true },
      { 'TimUntersberger/neogit', cmd = 'Neogit' },

      --------------------------------- Windows and Splits,
      { 'https://gitlab.com/yorickpeterse/nvim-window.git', module = 'nvim-window' },
      { 'beauwilliams/focus.nvim', module = 'focus' },
      { 'sindrets/winshift.nvim', cmd = 'WinShift' },
      { 'akinsho/bufferline.nvim' },

      --------------------------------- Aesthetic,
      { 'marko-cerovac/material.nvim' },
      { 'feline-nvim/feline.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'norcalli/nvim-colorizer.lua', event = 'BufRead' },

      --------------------------------- Etc.
      { 'windwp/nvim-autopairs', after = 'nvim-cmp' },
      { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm' },
      { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' },
      { 'liuchengxu/vista.vim', cmd = 'Vista' },
    }
  do
    use(plugin)
  end
end)
