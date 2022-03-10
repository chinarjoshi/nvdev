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

  orgmode = {
    org_agenda_files = { '~/my-orgs/**/*' },
    org_default_notes_file = '~/org/notes.org',
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
}

for _, module in
  ipairs {
    'nvim-autopairs',
    'lsp_signature',
    'gitsigns',
    'orgmode',
    'trouble',
    'todo-comments',
    'toggleterm',
    'neogit',
    'project_nvim',
    'sniprun',
    'luasnip',
    'luatab',
  }
do
  local ok, plugin = pcall(require, module)
  if not ok then
    return
  end
  plugin.setup(configs[module] or {})
end
