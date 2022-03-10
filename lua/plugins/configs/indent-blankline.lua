local ok, blankline = pcall(require, 'indent_blankline')
if not ok then
  return
end

blankline.setup {
  indentLine_enabled = 1,
  char = '▏',
  filetype_exclude = {
    'help',
    'terminal',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
    'lsp-installer',
  },
  buftype_exclude = { 'terminal' },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}
