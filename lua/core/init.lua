-- For inital package loading
for _, plugin in
  ipairs {
    'packer',
    'nvim-tree',
    'telescope',
    'project_nvim',
    'which-key',
    'plenary',
    'impatient',
    'filetype',
    'lspconfig',
    'null-ls',
    'lsp_signature',
    'nvim-lsp-installer',
    'trouble',
    'cmp',
    'luasnip',
    'sniprun',
    'gitsigns',
    'neogit',
    'lightspeed',
    'todo-comments',
    'nvim-window',
    'stabilize',
    'focus',
    'winshift',
    'feline',
    'colorizer',
    'nvim-autopairs',
    'toggleterm',
    'indent-blankline',
    'glow',
  }
do
  require(plugin)
end
