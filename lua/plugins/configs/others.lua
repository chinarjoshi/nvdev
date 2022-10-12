local configs = {
  trouble = {
    height = 20,
    width = 50,
  },

  ['todo-comments'] = {
    highlight = {
      keyword = 'wide',
    },
  },
  toggleterm = { size = 15 },
  bufferline = {
    options = {
      mode = 'tabs',
      always_show_bufferline = false,
      show_close_icon = false,
      show_buffer_close_icons = false,
      enforce_regular_tabs = true,
      modified_icon = '',
    },
  },
  ['nvim-treesitter.configs'] = {
    ensure_installed = 'all',
    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
    autopairs = { enable = true },
  },
  neogen = {
    snippet_engine = 'luasnip',
  },
  focus = {
    signcolumn = false,
    excluded_filetypes = { 'NvimTree', 'Trouble' },
    excluded_buftypes = { 'NvimTree', 'prompt' },
  },
}
for _, module in ipairs {
  'nvim-autopairs',
  'nvim-treesitter.configs',
  'gitsigns',
  'trouble',
  'todo-comments',
  'toggleterm',
  'neogit',
  'project_nvim',
  'bufferline',
  'colorizer',
  'lsp-format',
  'iswap',
  'neogen',
  'focus',
  'winshift',
} do
  local ok, plugin = pcall(require, module)
  if ok then
    plugin.setup(configs[module] or {})
  end
end

local ok, luasnip = pcall(require, 'luasnip')
if ok then
  luasnip.config.set_config { history = true, updateevents = 'TextChanged,TextChangedI' }
end
