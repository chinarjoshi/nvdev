-- For debugging after initial package installation
for _, plugin in
  ipairs {
    --  Base
    'packer',
    'nvim-tree',
    'telescope',
    'project_nvim',
    'which-key',
    'plenary',
    'impatient',
    'filetype',

    -- LSP
    'lspconfig',
    'nvim-lsp-installer',
    'null-ls',
    'lsp-format',
    'lsp_signature',
    'lspkind',

    -- Completion
    'cmp',
    'luasnip',

    -- Editing
    'lightspeed',
    'todo-comments',
    'gitsigns',
    'sniprun',

    -- Aestetic
    'material',
    'feline',
    'nvim-web-devicons',
    'bufferline',
    'colorizer',

    -- Etc
    'neogit',
    'nvim-window',
    'focus',
    'winshift',
    'nvim-autopairs',
    'toggleterm',
    'trouble',
    'indent_blankline',
  }
do
  require(plugin)
end
