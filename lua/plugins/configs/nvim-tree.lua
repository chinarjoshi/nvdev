local g = vim.g
local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0

nvim_tree.setup {
  disable_netrw = true,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
