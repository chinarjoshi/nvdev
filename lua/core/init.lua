local opt = vim.opt
local g = vim.g

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
  vim.fn.sign_define(hl, { text = '', texthl = hl, numhl = hl })
end

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
