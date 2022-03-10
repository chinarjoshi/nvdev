local args = {
  focus = {
    signcolumn = false,
    excluded_filetypes = { 'NvimTree', 'Trouble' },
    excluded_buftypes = { 'NvimTree', 'prompt' },
  },
  ['nvim-window'] = {
    chars = { 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';' },
    normal_hl = 'RedOnBlack',
    border = 'none',
  },
}
for _, name in
  ipairs {
    'stabilize',
    'focus',
    'winshift',
    'nvim-window',
  }
do
  local ok, plugin = pcall(require, name)
  if not ok then
    return
  end
  plugin.setup(args[name])
end
