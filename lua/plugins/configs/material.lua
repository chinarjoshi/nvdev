local present, material = pcall(require, 'material')

if not present then
  return
end
material.setup {
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
    "trouble",
    "nvim-web-devicons"
  },
  disable = {
      colored_cursor = true,
  },
  custom_highlights = {
    Comment = { fg = '#708094' },
  },
}

vim.cmd 'colorscheme material'
