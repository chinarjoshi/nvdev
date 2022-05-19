local ok, material = pcall(require, 'material')
local present, c = pcall(require, 'material.colors')
if not (ok and present) then
  return
end

material.setup {
  contrast = {
    sidebars = true,
    popup_menu = true,
  },
  contrast_filetypes = {
    'toggleterm',
    'packer',
  },
  italics = {
    comments = true,
  },
  disable = {
    colored_cursor = false,
  },
  custom_highlights = {
    CursorLine = { bg = '#0f1018' },
    PmenuSel = { fg = c.cyan, bg = c.selection },
    DiagnosticHint = { fg = c.purple },
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInformation = { fg = c.green },
    DiagnosticInfo = { fg = c.blue },
    RedOnBlack = { fg = c.red },
  },
}

vim.cmd 'colorscheme material'
