require('plugins.packer').startup(function(use)
  for _, plugin in
    ipairs {
      -------------------------------- Base
      { 'wbthomason/packer.nvim', cmd = { 'PackerSync', 'PackerStatus' } },
      { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
      { 'kyazdani42/nvim-tree.lua' },
      { 'nvim-telescope/telescope.nvim', module = 'telescope', cmd = 'Telescope' },
      { 'ahmedkhalf/project.nvim', cmd = 'Telescope projects' },
      { 'folke/which-key.nvim', module = 'which-key' },
      { 'lewis6991/impatient.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nathom/filetype.nvim' },

      -------------------------------- LSP,
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim',
      'lukas-reineke/lsp-format.nvim',
      'onsails/lspkind-nvim',

      -------------------------------- Completion,
      'github/copilot.vim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'windwp/nvim-autopairs',

      --------------------------------- Editing,
      'tpope/vim-surround',
      'tpope/vim-commentary',
      'tpope/vim-repeat',
      'folke/todo-comments.nvim',
      'lewis6991/gitsigns.nvim',
      'michaelb/sniprun',
      'Vimjas/vim-python-pep8-indent',

      --------------------------------- Aesthetic,
      'marko-cerovac/material.nvim',
      'feline-nvim/feline.nvim',
      'kyazdani42/nvim-web-devicons',
      'akinsho/bufferline.nvim',
      'norcalli/nvim-colorizer.lua',
      'lukas-reineke/indent-blankline.nvim',

      --------------------------------- Etc.
      { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm', tag = 'v1.*' },
      { 'beauwilliams/focus.nvim', module = 'focus' },
      { 'sindrets/winshift.nvim', cmd = 'WinShift' },
      { 'mizlan/iswap.nvim', cmd = 'ISwap' },
      { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } },
      { 'TimUntersberger/neogit', cmd = 'Neogit' },
      { 'danymat/neogen', cmd = 'Neogen' }
    }
  do
    -- If lazyloader for plugin is not specified, then lazyload on BufRead
    use(type(plugin) == 'string' and { plugin, event = { 'BufRead', 'BufNewFile' } } or plugin)
  end
end)
