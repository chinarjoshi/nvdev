local ok, key = pcall(require, 'which-key')
local utils = require 'core.utils'

--- Global mappings
local mappings = {
  -- Hotkeys
  ['<space>'] = { 'lua require("core.utils").project_files()', 'Find file in project' },
  ['<tab>'] = { 'Telescope projects theme=ivy layout_config={height=15}', 'Projects' },
  ['/'] = { 'Telescope live_grep theme=ivy layout_config={height=15}', 'Search project' },
  [','] = { 'Telescope buffers theme=ivy layout_config={height=15}', 'Switch buffer' },
  ['.'] = { 'Telescope find_files theme=ivy layout_config={height=15}', 'Find file' },
  ['*'] = { 'Telescope grep_string theme=ivy layout_config={height=15}', 'Search word under cursor' },
  ['<cr>'] = { 'ToggleTerm', 'Open terminal' },
  [';'] = { 'NvimTreeFindFileToggle', 'File-tree' },
  ['\\'] = { 'noh', 'Clear search' },
  ['-'] = { [[%s/\s\+$//e]], 'Clear whitespace' },
  [']'] = { 'bn', 'Next buffer' },
  ['['] = { 'bp', 'Previous buffer' },
  ['}'] = { 'tabnext', 'Next tab' },
  ['{'] = { 'tabprevious', 'Previous tab' },
  -- Quitting
  q = {
    name = 'quit',
    q = { 'q', 'Quit' },
    f = { 'qa!', 'Force quit' },
    r = { 'Restart' },
    w = { 'wqa', 'Write and quit' },
  },
  -- Files
  f = {
    name = 'file',
    f = { 'Telescope oldfiles theme=ivy layout_config={height=15}', 'Opened files' },
    s = { 'w', 'Save' },
    p = { 'lua require("core.utils").config_files()', 'Edit configuration' },
    t = { 'NvimTreeFindFileToggle', 'Tree' },
    c = { '%y+', 'Copy file' },
  },
  -- Search
  s = {
    name = 'search',
    s = { 'Telescope current_buffer_fuzzy_find theme=ivy layout_config={height=15}', 'Current buffer' },
    t = { 'TodoTelescope theme=ivy preview=10', 'TODOs' },
    v = { 'Vista', 'Vista' },
  },
  -- Tabs
  t = { name = 'tab', n = { 'tabnew', 'New' }, c = { 'tabclose', 'Close' }, m = { 'tabmove', 'Move' } },
  r = { 'SnipRun', 'Run snippet' },
  -- Plugin manager
  p = {
    name = 'plugins',
    p = { 'PackerSync', 'Sync' },
    s = { 'PackerStatus', 'Status' },
    c = { 'PackerCompile', 'Compile' },
    r = { 'PackerProfile', 'Profile' },
    u = { 'PackerUpdate', 'Update' },
    i = { 'PackerInstall', 'Install' },
    l = { 'PackerClean', 'Clean' },
  },
  g = {
    name = 'git',
    g = { 'Neogit', 'Magit' },
    c = { 'Telescope git_commits preview=10', 'Commits' },
    b = { 'Telescope git_branches preview=10', 'Branches' },
    s = { 'Telescope git_status preview=10', 'Status' },
    t = { 'Telescope git_stash preview=10', 'Stash' },
    f = { 'Telescope git_bcommits preview=10', 'Commits in current file' },
  },
  -- Windows
  w = {
    name = 'window',
    W = { 'WinShift swap', 'Swap' },
    c = { 'wincmd c', 'Delete' },
    s = { 'wincmd s', 'Hori split' },
    v = { 'wincmd v', 'Vert split' },
    h = { 'wincmd h', 'Left' },
    j = { 'wincmd j', 'Down' },
    k = { 'wincmd k', 'Up' },
    l = { 'wincmd l', 'Right' },
    H = { 'WinShift left', 'Shift left' },
    J = { 'WinShift down', 'Shift down' },
    K = { 'WinShift up', 'Shift down' },
    L = { 'WinShift right', 'Shift down' },
  },
  -- Code actions
  c = {
    name = 'code',
    c = { 'TroubleToggle document_diagnostics', 'Document diagnostics' },
    w = { 'TroubleToggle workspace_diagnostics', 'Workspace diagnostics' },
    r = { 'TroubleToggle lsp_references', 'References' },
    d = { 'lua require("cmp").setup.buffer { enabled = false }', 'Disable completion' },
    e = { 'lua require("cmp").setup.buffer { enabled = true }', 'Enable completion' },
    t = { 'TroubleToggle lsp_type_definitions', 'Type definitions' },
    a = { 'Telescope lsp_code_actions theme=ivy layout_config={height=15}', 'Actions' },
  },

  d = {
    name = 'documentation',
    d = {'Neogen', 'Function' },
    c = {'Neogen class', 'Class' },
    f = {'Neogen file', 'File' },
    t = {'Neogen type', 'Type' },
  }
}

local lsp = {
  d = { 'lua require("core.utils").toggle_diagnostics()', 'Toggle diagnostics' },
  D = { 'lua vim.lsp.buf.definition()', 'Definition' },
  e = { 'lua vim.diagnostic.open_float(0, {scope="line"})', 'Diagnostic' },
  f = { 'lua vim.lsp.buf.formatting()', 'Format' },
  ['['] = { 'lua vim.diagnostic.goto_prev()', 'Previous diagnostic' },
  [']'] = { 'lua vim.diagnostic.goto_next()', 'Next diagnostic' },
  i = { 'lua vim.lsp.buf.implementation()', 'Implementaiton' },
  s = { 'lua vim.lsp.buf.signature_help()', 'Signature' },
  w = {
    name = 'workspace',
    a = { 'lua vim.lsp.buf.add_workspace_folder()', 'Add' },
    r = { 'lua vim.lsp.buf.remove_workspace_folder()', 'Remove' },
    l = { 'lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))', 'List' },
  },
  t = { 'lua vim.lsp.buf.type_definition()', 'Type' },
  n = { 'lua vim.lsp.buf.rename()', 'Name' },
  a = { 'lua vim.lsp.buf.code_action()', 'Action' },
  r = { 'lua vim.lsp.buf.references()', 'References' },
}

utils.rep(mappings)
utils.rep(lsp)
if ok then
  key.register(mappings, { prefix = '<leader>' })
  key.register(lsp, { prefix = 'g' })
end

utils.map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
for _, dir in ipairs { 'up', 'down', 'left', 'right' } do
  utils.map('<' .. dir .. '>', '<cmd>WinShift ' .. dir .. '<cr>')
end
for _, letter in ipairs { 'h', 'j', 'k', 'l' } do
  utils.map('<C-' .. letter .. '>', '<C-w>' .. letter)
end
vim.cmd 'nnoremap ; :'
vim.cmd 'nnoremap : ;'
vim.cmd [[imap <silent><script><silent><expr> <C-a> copilot#Accept("\<CR>")]]

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
