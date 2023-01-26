local o = vim.opt
local g = vim.g
local au = vim.api.nvim_create_autocmd
local map = require('core.utils').map
local utils = require 'core.utils'
local maps = require 'core.mappings'

-- Minimalist UI adjustment
o.cursorline = true
o.laststatus = 0
o.cmdheight = 0
o.pumheight = 5
o.fillchars = { eob = ' ' }
o.clipboard = 'unnamedplus'
o.numberwidth = 2
o.ruler = false
o.number = true
o.relativenumber = true
o.linebreak = true
o.termguicolors = true
o.completeopt = 'menuone,noselect'
o.shortmess:append 'sI'
o.whichwrap:append '<>[]hl'

-- Smarter defaults
o.expandtab = true
o.smartindent = true
o.shiftwidth = 4
o.tabstop = 4
o.ignorecase = true
o.smartcase = true
o.mouse = 'a'
o.signcolumn = 'yes:1'
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.swapfile = false

-- Misc. global variables
g.mapleader = ' '
g.material_style = 'deep ocean'
g.copilot_no_tab_map = true
g.diagnostics_visible = true

-- Hotkeys
map('<ESC>', 'noh')
map('<C-s>', 'w')
map('<C-q>', 'q')
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.cmd [[imap <silent><script><silent><expr> <C-c> copilot#Accept("\<CR>")]]

utils.register_or_filter_keymap(maps.general.prefix, maps.general, true)
utils.register_or_filter_keymap(maps.lspconfig.prefix, maps.lspconfig, true)

for _, letter in ipairs { 'h', 'j', 'k', 'l' } do
  vim.keymap.set('n', '<C-' .. letter .. '>', '<C-w>' .. letter)
end

for _, dir in ipairs { 'up', 'down', 'left', 'right' } do
  vim.keymap.set('n', '<' .. dir .. '>', '<cmd>WinShift ' .. dir .. '<cr>')
end

au('BufWritePre <buffer>', {
  callback = function()
    vim.lsp.buf.format()
  end,
})

au('TermOpen term://*', {
  callback = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  end,
})

au('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})

-- Resume editing on same line
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
