local o = vim.opt
local g = vim.g
local au = vim.api.nvim_create_autocmd
local map = require('core.utils').map
local utils = require 'core.utils'
local maps = require 'core.mappings'

-- Options
o.laststatus = 0
o.cmdheight = 0
o.clipboard = 'unnamedplus'
o.cursorline = true
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.fillchars = { eob = ' ' }
o.completeopt = 'menuone,noselect'
o.ignorecase = true
o.smartcase = true
o.pumheight = 10
o.linebreak = true
o.mouse = 'a'
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false
o.signcolumn = 'yes:1'
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.swapfile = false
o.shortmess:append 'sI'
o.whichwrap:append '<>[]hl'

-- Global variables
g.mapleader = ' '
g.material_style = 'deep ocean'
g.copilot_no_tab_map = true
g.diagnostics_visible = false

map('<ESC>', 'noh')
map('<C-s>', 'w')
map('<C-q>', 'q')
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.cmd [[imap <silent><script><silent><expr> <C-c> copilot#Accept("\<CR>")]]

utils.register_or_filter_keymap(maps.general.prefix, maps.general, true)
utils.register_or_filter_keymap(maps.lsp.prefix, maps.lsp, true)

for _, letter in ipairs { 'h', 'j', 'k', 'l' } do
  vim.keymap.set('n', '<C-' .. letter .. '>', '<C-w>' .. letter)
end

for _, dir in ipairs { 'up', 'down', 'left', 'right' } do
  vim.keymap.set('n', '<' .. dir .. '>', '<cmd>WinShift ' .. dir .. '<cr>')
end

au('TermOpen term://*', {
  callback = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  end,
})

au('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

au('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})

au('FileType', {
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.cmd [[au BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

-- disable some builtin vim plugins
local default_plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'syntax',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
}

for _, plugin in pairs(default_plugins) do
  g['loaded_' .. plugin] = 1
end

local default_providers = {
  'node',
  'perl',
  'python3',
  'ruby',
}

for _, provider in ipairs(default_providers) do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end
