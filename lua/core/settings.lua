local o = vim.opt
local cmd = vim.cmd
local g = vim.g

-- Global options
o.completeopt = 'menuone,noselect'
o.clipboard = 'unnamedplus'
o.fillchars = { eob = ' ' }
o.foldmethod = 'marker'
o.termguicolors = true
o.smartindent = true
o.signcolumn = 'yes:1'
o.lazyredraw = true
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.expandtab = true
o.smartcase = true
o.timeoutlen = 400
o.showmatch = true
o.linebreak = true
o.swapfile = false
o.undofile = true
o.numberwidth = 2
o.synmaxcol = 240
o.shiftwidth = 4
o.pumheight = 20
o.hidden = true
o.number = true
o.history = 100
o.title = true
o.tabstop = 4
o.mouse = 'a'
o.cul = true
o.shortmess:append 'sI'
o.whichwrap:append '<>[]hl'
o.listchars:append 'space:⋅'
o.listchars:append 'eol:↴'
g.material_style = require('core.utils').vars.theme
g.python3_host_prog = '/usr/bin/python3'
g.mapleader = ' '
g.vista_icon_indent = '["╰─▸ ", "├─▸ "]'
g.vista_default_executive = 'ctags'

-- Autocommands
cmd "au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}"
cmd [[let g:vista#renderer#icons = { "function": "\u0192", "variable":
\ "uf00d", "prototype": "\uf013", "macro": "\uf00b" }]]
cmd [[au BufWinEnter,WinEnter,TermEnter * if (bufname('%') == "NvimTree" ||
\ stridx(bufname('%'), "term") != -1) | set laststatus=0 | else | set laststatus=2 | endif]]
cmd 'let g:vista#renderer#enable_icon = 1'
cmd 'au BufEnter * set fo-=c fo-=r fo-=o'
cmd 'au BufLeave term://* stopinsert'
cmd 'au TermOpen * startinsert'

-- Builtin plugins to disable
for _, plugin in
  ipairs {
    'netrwFileHandlers',
    'spellfile_plugin',
    'getscriptPlugin',
    'netrwSettings',
    'vimballPlugin',
    '2html_plugin',
    'netrwPlugin',
    'getscript',
    'tarPlugin',
    'zipPlugin',
    'rrhelper',
    'vimball',
    'matchit',
    'logipat',
    'netrw',
    'gzip',
    'tar',
    'zip',
  }
do
  g['loaded_' .. plugin] = 1
end
