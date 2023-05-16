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
    comments = { italic = true}
  },
  plugins = {
    "indent-blankline",
    "gitsigns",
    "nvim-tree",
    "telescope",
    "nvim-web-devicons"
  },
  disable = {
      colored_cursor = true,
      background = true,
  },
  custom_highlights = {
    Comment = { fg = '#708094' },
  },
}
