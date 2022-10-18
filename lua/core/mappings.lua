local M = {}

M.general = {
  prefix = '<leader>',
  -- Hotkeys
  ['<space>'] = { require('core.utils').project_files, 'Project files' },
  ['<tab>'] = { 'Telescope projects', 'Projects' },
  ['/'] = { 'Telescope live_grep', 'Search' },
  [','] = { 'Telescope buffers', 'Buffers' },
  ['.'] = { 'Telescope find_files', 'Files' },
  ['*'] = { 'Telescope grep_string', 'Find word' },
  ['<cr>'] = { 'ToggleTerm', 'Terminal' },
  [';'] = { 'NvimTreeToggle', 'File-tree' },
  [']'] = { 'bn', 'Next buffer' },
  ['['] = { 'bp', 'Prev buffer' },
  ['}'] = { 'tabnext', 'Next tab' },
  ['{'] = { 'tabprevious', 'Prev tab' },
  q = { 'q', 'Quit' },
  Q = { 'q!', 'Quit' },
  s = { 'w', 'Save' },
  S = { 'w !sudo tee %', 'Sudo save' },
  m = { 'Mason', 'Mason' },
  t = {
    name = 'tab',
    n = { 'tabnew', 'New' },
    c = { 'tabclose', 'Close' },
    m = { 'tabmove', 'Move' },
  },
  p = { 'PackerSync', 'Package sync' },
  g = { 'Neogit', 'Git' },
  c = { 'TroubleToggle workspace_diagnostics', 'Workspace errors' },
  C = { 'TroubleToggle document_diagnostics', 'File errors' },
  d = {
    name = 'documentation',
    d = { 'Neogen', 'Function' },
    c = { 'Neogen class', 'Class' },
    f = { 'Neogen file', 'File' },
    t = { 'Neogen type', 'Type' },
  },
}

M.lsp = {
  prefix = 'g',
  d = { require('core.utils').toggle_diagnostics, 'Toggle diagnostics' },
  D = { vim.lsp.buf.definition, 'Definition' },
  e = {
    function()
      vim.diagnostic.open_float(0, { scope = 'line' })
    end,
    'Diagnostic',
  },
  f = { vim.lsp.buf.formatting, 'Format' },
  ['['] = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
  [']'] = { vim.diagnostic.goto_next, 'Next diagnostic' },
  i = { vim.lsp.buf.implementation, 'Implementaiton' },
  s = { vim.lsp.buf.signature_help, 'Signature' },
  t = { vim.lsp.buf.type_definition, 'Type' },
  n = { vim.lsp.buf.rename, 'Name' },
  a = { vim.lsp.buf.code_action, 'Action' },
  r = { vim.lsp.buf.references, 'References' },
}

return M
