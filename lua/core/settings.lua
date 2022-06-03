local o = vim.opt
local g = vim.g

--- Global options
o.completeopt = 'menuone,noselect' -- Setup auto-completion
o.clipboard = 'unnamedplus' -- Use system clipboard
o.fillchars = { eob = ' ' } -- Don't show ~ at EOF
o.foldmethod = 'marker' -- Show marker when folding code
o.termguicolors = true -- Use 24 bit color display
o.signcolumn = 'yes:1' -- Force 1 column wide signcolumn
o.smartindent = true -- Use language aware indentation
o.lazyredraw = true -- Don't redraw idle screen (performance)
o.splitbelow = true -- Auto focus on vertical split
o.splitright = true -- Auto focus on horizontal split
o.ignorecase = true -- Use lowercase insensitive searching
o.smartcase = true -- Use case sensitive searching when using uppercase
o.expandtab = true -- Enable more powerful tab completion
o.timeoutlen = 400 -- Set timeout in ms for mappings
o.showmatch = true -- Highlight search results
o.linebreak = true -- Wrap long line on last word, not last character
o.swapfile = false -- Don't create frustrating swapfile
o.undofile = true -- Create persistent edit history
o.numberwidth = 2 -- Minimum length of number column
o.synmaxcol = 240 -- Maximum length line for syntax highlighting (performance)
o.shiftwidth = 4 -- Default spaces for shifting with >>
o.pumheight = 20 -- Max height for pop up menu
o.hidden = true -- Don't unload buffers when not visible
o.number = true -- Show line numbers
o.history = 100 -- Only remember past 100 commands
o.title = true -- Set title based on file name
o.tabstop = 4 -- Tab = 4 spaces
o.mouse = 'a' -- Enable mouse usage
o.cul = true -- Enable cursorline
o.shortmess:append 'sI' -- Don't show the intro blurb when no file
g.material_style = require('core.utils').vars.theme -- Theme style
g.python3_host_prog = '/usr/bin/python3' -- Default location of python (performance)
g.mapleader = ' ' -- Space as leader key
g.vista_icon_indent = '["╰─▸ ", "├─▸ "]' -- Vista plugin visual enhancement
g.vista_default_executive = 'ctags' -- Use ctags to generate tag list

--- Autocommands:
-- Don't show statusline on and terminal
-- Tab = 2 spaces for these languages
-- Highlight text on yank
-- Format on save
-- Don't make new comment on enter
-- Make terminal always in insert mode
vim.cmd [[
  au TermEnter,WinEnter * if (&filetype == "toggleterm") | set laststatus=0 | else | set laststatus=2 | endif
  au FileType json,xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}
  au BufEnter * set fo-=c fo-=r fo-=o
  au BufLeave term://* stopinsert
  au TermOpen * startinsert
]]
-- au BufWritePre * lua vim.lsp.buf.formatting_sync()

-- Builtin plugins to disable (performance)
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
