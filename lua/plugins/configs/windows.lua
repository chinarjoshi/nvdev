local args = {
  focus = {
    signcolumn = false,
    excluded_filetypes = { 'NvimTree', 'Trouble' },
    excluded_buftypes = { 'NvimTree', 'prompt' },
  },
}
for _, name in
  ipairs {
    'focus',
    'winshift',
  }
do
  local ok, plugin = pcall(require, name)
  if not ok then
    return
  end
  plugin.setup(args[name])
end
