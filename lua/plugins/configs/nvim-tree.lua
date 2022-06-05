local g = vim.g
local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

nvim_tree.setup {
  disable_netrw = true,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
