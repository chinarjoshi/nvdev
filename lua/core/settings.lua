local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

-- Global options
for key, option in
  pairs {
    completeopt = 'menuone,noselect',
    shadafile = vim.opt.shadafile,
    clipboard = 'unnamedplus',
    fillchars = { eob = ' ' },
    foldmethod = 'marker',
    termguicolors = true,
    smartindent = true,
    signcolumn = 'yes:1',
    lazyredraw = true,
    splitbelow = true,
    splitright = true,
    ignorecase = true,
    expandtab = true,
    smartcase = true,
    timeoutlen = 400,
    showmatch = true,
    linebreak = true,
    swapfile = false,
    undofile = true,
    numberwidth = 2,
    synmaxcol = 240,
    shiftwidth = 4,
    hidden = true,
    number = true,
    history = 100,
    title = true,
    tabstop = 4,
    mouse = 'a',
    cul = true,
  }
do
  opt[key] = option
end

-- Autocommands
for _, auto in
  ipairs {
    "au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}",
    [[let g:vista#renderer#icons = { "function": "\u0192", "variable":
    \ "uf00d", "prototype": "\uf013", "macro": "\uf00b" }]],
    [[au BufWinEnter,WinEnter,TermEnter * if (bufname('%') == "NvimTree" ||
    \ stridx(bufname('%'), "term") != -1) | set laststatus=0 | else | set laststatus=2 | endif]],
    'let g:vista#renderer#enable_icon = 1',
    'au BufEnter * set fo-=c fo-=r fo-=o',
    'au BufLeave term://* stopinsert',
    'hi StatusLineNC gui=underline',
    'au TermOpen * startinsert',
    'hi Comment gui=italic',
  }
do
  cmd(auto)
end

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

g.python3_host_prog = '/usr/bin/python3'
g.mapleader = ' '
g.vista_icon_indent = '["╰─▸ ", "├─▸ "]'
g.vista_default_executive = 'ctags'
opt.shortmess:append 'sI'
opt.whichwrap:append '<>[]hl'
opt.listchars:append 'space:⋅'
opt.listchars:append 'eol:↴'
