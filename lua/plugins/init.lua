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
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim',
      'lukas-reineke/lsp-format.nvim',
      'ray-x/lsp_signature.nvim',
      'onsails/lspkind-nvim',

      -------------------------------- Completion,
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'windwp/nvim-autopairs',

      --------------------------------- Editing,
      'ggandor/lightspeed.nvim',
      'tpope/vim-surround',
      'tpope/vim-commentary',
      'tpope/vim-repeat',
      'folke/todo-comments.nvim',
      'lewis6991/gitsigns.nvim',
      'michaelb/sniprun',

      --------------------------------- Aesthetic,
      'marko-cerovac/material.nvim',
      'feline-nvim/feline.nvim',
      'kyazdani42/nvim-web-devicons',
      'akinsho/bufferline.nvim',
      'norcalli/nvim-colorizer.lua',
      'lukas-reineke/indent-blankline.nvim',

      --------------------------------- Etc.
      { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm' },
      { 'https://gitlab.com/yorickpeterse/nvim-window.git', module = 'nvim-window' },
      { 'beauwilliams/focus.nvim', module = 'focus' },
      { 'sindrets/winshift.nvim', cmd = 'WinShift' },
      { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } },
      { 'TimUntersberger/neogit', cmd = 'Neogit' },
    }
  do
    -- If lazyloader for plugin is not specified, then lazyload on BufRead
    use(type(plugin) == 'string' and { plugin, event = { 'BufRead', 'BufNewFile' } } or plugin)
  end
end)
