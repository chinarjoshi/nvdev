local M = {}

local ts = require 'telescope.builtin'
local gs = require 'gitsigns'
local nt = require 'neotest'

M.general = {
  -- Hotkeys
  ['<space>'] = { ts.git_files, 'Project files' },
  ['<tab>'] = {
    function()
      ts.diagnostics { bufnr = 0 }
    end,
    'File diagnostics',
  },
  ['\\'] = { ts.diagnostics, 'Workspace diagnostics' },
  ['/'] = { ts.live_grep, 'Search' },
  [','] = { ts.buffers, 'Buffers' },
  ['.'] = { ts.find_files, 'Files' },
  ['*'] = { ts.grep_string, 'Grep word' },
  ['<cr>'] = { ':ToggleTerm size=25<cr>', 'Terminal' },
  [';'] = { ':NvimTreeToggle<cr>', 'File-tree' },
  q = { ':q<cr>', 'Quit' },
  Q = { ':q!<cr>', 'Quit' },
  s = { ':w<cr>', 'Save' },
  S = { ':w !sudo tee %<cr>', 'Sudo save' },
  m = { ':Mason<cr>', 'Mason' },
  n = {
    name = 'Notes',
  },
  t = { nt.run.run, 'Run nearest test' },
  T = { function() nt.run.run(vim.fn.expand '%') end, 'Run test file' },
  p = { require('lazy').home, 'Package sync' },
  j = { require('treesj').toggle, 'Join/split list' },
  g = {
    name = 'Git',
    s = { gs.stage_hunk, 'Stage hunk' },
    S = { gs.stage_buffer, 'Stage file' },
    u = { gs.undo_stage_hunk, 'Undo stage hunk' },
    p = { gs.preview_hunk, 'Preview change' },
    r = { gs.reset_hunk, 'Reset hunk' },
    R = { gs.reset_buffer, 'Reset file' },
    d = { gs.diffthis, 'Diff file' },
    t = { gs.toggle_deleted, 'Toggle deletions' },
    b = { gs.blame_line, 'Blame line' },
  },
  d = { require('dapui').toggle, 'Debug' },
  -- D = { function() nt.run.run { strategy = 'dap' } end, 'Debug test' },
  D = { vim.diagnostic.disable, 'Debug' },
  z = { require('zen-mode').toggle, 'Zen mode' },
}

M.lsp = {
  d = { vim.diagnostic.open_float, 'Diagnostic' },
  D = { vim.lsp.buf.definition, 'Definition' },
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
