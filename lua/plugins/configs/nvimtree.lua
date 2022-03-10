local g = vim.g
local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat { ':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??' }

g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    deleted = '',
    ignored = '◌',
    renamed = '➜',
    staged = '✓',
    unmerged = '',
    unstaged = '✗',
    untracked = '★',
  },
  folder = {
    default = '',
    empty = '',
    empty_open = '',
    open = '',
    symlink = '',
    symlink_open = '',
  },
}

nvim_tree.setup {
  nvim_tree_quit_on_open = true,
  open_on_setup = false,
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    allow_resize = true,
    width = 30,
  },
  git = {
    enable = false,
    ignore = true,
  },
}
