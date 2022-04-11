local c = require 'material.colors'

local configs = {
  ['nvim-autopairs'] = { fast_wrap = {} },
  lsp_signature = {
    floating_window = false,
    fix_pos = true,
    hint_enable = true,
    hint_prefix = ' ',
    hint_scheme = 'String',
    hi_parameter = 'Search',
  },
  gitsigns = {
    signs = {
      add = { hl = 'DiffAdd', text = '│', numhl = 'GitSignsAddNr' },
      change = { hl = 'DiffChange', text = '│', numhl = 'GitSignsChangeNr' },
      delete = { hl = 'DiffDelete', text = '│', numhl = 'GitSignsDeleteNr' },
      topdelete = { hl = 'DiffDelete', text = '‾', numhl = 'GitSignsDeleteNr' },
      changedelete = { hl = 'DiffChangeDelete', text = '~', numhl = 'GitSignsChangeNr' },
    },
  },
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
    }
  },
  material = {
    contrast = {
      sidebars = true,
      popup_menu = true,
    },
    italics = {
      comments = true,
    },
    custom_highlights = {
      CursorLine = { bg = '#0f1018'},
      PmenuSel = { fg = c.cyan, bg = c.selection },
      DiagnosticHint = { fg = c.purple },
      DiagnosticError = { fg = c.red },
      DiagnosticWarn = { fg = c.yellow },
      DiagnosticInformation = { fg = c.green },
      DiagnosticInfo = { fg = c.blue },
      RedOnBlack = { fg = c.red },
    }
  },
}

for _, module in
  ipairs {
    'nvim-autopairs',
    'lsp_signature',
    'gitsigns',
    'trouble',
    'todo-comments',
    'toggleterm',
    'neogit',
    'project_nvim',
    'bufferline',
    'colorizer',
    'material',
  }
do
  local ok, plugin = pcall(require, module)
  if ok then
    plugin.setup(configs[module] or {})
  end
end

local ok, luasnip = pcall(require, 'luasnip')
if ok then
  luasnip.config.set_config { history = true, updateevents = 'TextChanged,TextChangedI' }
end

vim.cmd 'colorscheme material'
