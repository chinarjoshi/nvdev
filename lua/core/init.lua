local opt = vim.opt
local g = vim.g
local map = require('core.utils').map

--- Options
-- UI adjustments
opt.laststatus = 0
opt.showmode = false
opt.cursorline = true
opt.cmdheight = 0
opt.pumheight = 5
opt.numberwidth = 2
opt.ruler = false
opt.number = true
opt.linebreak = true
opt.termguicolors = true
opt.shortmess:append 'sI'
opt.whichwrap:append '<>[]hl'
opt.signcolumn = 'yes:1'
opt.fillchars = { eob = ' ' }
opt.scrolloff = 5
g.material_style = 'deep ocean'

-- Smarter editing defaults
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartcase = true
opt.smartindent = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.formatoptions:remove { 'c', 'r', 'o' }
g.mapleader = ' '
vim.cmd [[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif]]

-- Performance/IO
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400

-- Disable default providers
for _, provider in ipairs { 'node', 'perl', 'python3', 'ruby' } do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.stdpath 'data' .. '/mason/bin'

--- LSP
g.language_servers = {
  'pyright',
  'clangd',
  'rust_analyzer',
  'lua_ls',
  'jdtls',
  'bashls',
  'cmake',
}

for _, type in ipairs { 'Error', 'Warn', 'Hint', 'Info' } do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = '', numhl = hl })
end
vim.fn.sign_define("DapBreakpoint", { text = "" })

vim.diagnostic.config {
  virtual_text = false,
  underline = true,
}

--- Autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Don't list quickfix buffers
autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- 2 space tab filetypes
autocmd('FileType', {
  pattern = 'lua,js,html,json',
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end,
})

--- Hotkeys
map('<ESC>', ':noh<CR>')
map('K', vim.lsp.buf.hover)
for _, letter in ipairs { 'h', 'j', 'k', 'l' } do
  map('<C-' .. letter .. '>', '<C-w>' .. letter)
end

local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

autocmd('TermOpen', {
  pattern = 'term://*',
  callback = set_terminal_keymaps,
})
