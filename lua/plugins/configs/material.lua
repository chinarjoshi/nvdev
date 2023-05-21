return {
  contrast = {
    terminal = true,
    sidebars = true,
    floating_windows = true,
    cursor_line = false,
    non_current_windows = false,
    filetypes = {},
  },
  styles = {
    comments = { italic = true },
  },
  plugins = {
    'dap',
    'gitsigns',
    'indent-blankline',
    'neorg',
    'nvim-cmp',
    'nvim-tree',
    'nvim-web-devicons',
    'telescope',
  },
  disable = {
    colored_cursor = true,
    background = true,
  },
  custom_highlights = {
    Comment = { fg = '#708094' },
  },
}
