require('plugins.packer').startup(function(use)
  for _, plugin in
    ipairs {
      -------------------------------- Base
      { 'wbthomason/packer.nvim', cmd = { 'PackerSync', 'PackerStatus' } },
      { 'nvim-treesitter/nvim-treesitter', event = 'BufWinEnter', run = ':TSUpdate' },
      { 'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle' },
      { 'ibhagwan/fzf-lua', module = 'fzf-lua' },
      { 'ahmedkhalf/project.nvim', module = 'project_nvim' },
      { 'folke/which-key.nvim', module = 'which-key' },
      { 'nvim-lua/plenary.nvim' },
      { 'lewis6991/impatient.nvim' },
      { 'nathom/filetype.nvim' },

      -------------------------------- LSP,
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'jose-elias-alvarez/null-ls.nvim',
      'lukas-reineke/lsp-format.nvim',

      -------------------------------- Maintainance
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      "jayp0521/mason-nvim-dap.nvim",
      "jayp0521/mason-null-ls.nvim",
      { "RubixDev/mason-update-all", cmd = 'MasonUpdateAll' },

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
      { 'michaelb/sniprun', cmd = 'SnipRun' },
      'Vimjas/vim-python-pep8-indent',

      --------------------------------- Aesthetic,
      'marko-cerovac/material.nvim',
      'kyazdani42/nvim-web-devicons',
      'akinsho/bufferline.nvim',
      'norcalli/nvim-colorizer.lua',
      'lukas-reineke/indent-blankline.nvim',

      --------------------------------- Etc.
      { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm', tag = '*' },
      { 'beauwilliams/focus.nvim', module = 'focus' },
      { 'sindrets/winshift.nvim', cmd = 'WinShift' },
      { 'mizlan/iswap.nvim', cmd = 'ISwap' },
      { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } },
      { 'TimUntersberger/neogit', cmd = 'Neogit' },
      { 'danymat/neogen', cmd = 'Neogen' }
    }
  do
    -- If lazyloader for plugin is not specified, then lazyload on BufRead
    use(type(plugin) == 'string' and { plugin, event = 'BufWinEnter' } or plugin)
    -- use(plugin)
  end
end)
