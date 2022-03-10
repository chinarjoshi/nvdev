local cmd = vim.cmd
local colors = require 'hl_themes.onedark'

-- Foreground colors
for foreground, color in
  pairs {
    Comment = 'grey_fg',
    cursorlinenr = 'white',
    EndOfBuffer = 'black',
    FloatBorder = 'blue',
    CmpItemAbbr = 'white',
    CmpItemAbbrMatch = 'white',
    CmpItemKind = 'white',
    CmpItemMenu = 'white',
    LineNr = 'grey',
    NvimInternalError = 'red',
    VertSplit = 'one_bg2',
    StatusLineNC = 'one_bg3',
    IndentBlanklineChar = 'line',
    IndentBlanklineSpaceChar = 'line',
    DiagnosticHint = 'purple',
    DiagnosticError = 'red',
    DiagnosticWarn = 'yellow',
    DiagnosticInformation = 'green',
    DiagnosticInfo = 'blue',
    NvimTreeEmptyFolderName = 'folder_bg',
    NvimTreeEndOfBuffer = 'darker_black',
    NvimTreeFolderIcon = 'folder_bg',
    NvimTreeFolderName = 'folder_bg',
    NvimTreeGitDirty = 'red',
    NvimTreeIndentMarker = 'one_bg2',
    NvimTreeOpenedFolderName = 'folder_bg',
  }
do
  cmd('hi ' .. foreground .. ' guifg=' .. colors[color])
end

-- Background colors
for background, color in
  pairs {
    NormalFloat = 'darker_black',
    CursorLine = 'darker_black',
    Pmenu = 'one_bg',
    PmenuSbar = 'pmenu_bg',
    PmenuSel = 'nord_blue',
    PmenuThumb = 'darker_black',
    NvimTreeNormalNC = 'darker_black',
  }
do
  cmd('hi ' .. background .. ' guibg=' .. colors[color])
end

-- Both background and foreground colors
for both, color in
  pairs {
    RedOnBlack = { 'red', 'one_bg2' },
    DiffAdd = { 'green', 'NONE' },
    DiffChange = { 'blue', 'NONE' },
    DiffChangeDelete = { 'red', 'NONE' },
    DiffDelete = { 'red', 'NONE' },
    NvimTreeStatuslineNc = { 'darker_black', 'darker_black' },
    NvimTreeVertSplit = { 'darker_black', 'darker_black' },
    NvimTreeWindowPicker = { 'red', 'black2' },
    TelescopeResultsTitle = { 'black', 'black' },
  }
do
  cmd(
    'hi ' .. both .. ' guifg=' .. colors[color[1]] .. ' guibg=' .. (color[2] == 'NONE' and 'NONE' or colors[color[2]])
  )
end

if require('core.utils').vars.transparent then -- Transparency effects
  for _, color in
    ipairs {
      'Normal',
      'Folded',
      'NormalFloat',
      'NvimTreeNormal',
      'NvimTreeNormalNC',
      'NvimTreeStatusLineNC',
      'TelescopeBorder',
      'TelescopePrompt',
      'TelescopeResults',
      'TelescopePromptBorder',
      'TelescopePromptNormal',
      'TelescopeNormal',
      'TelescopePromptPrefix',
    }
  do
    cmd('hi ' .. color .. ' guibg=NONE')
  end
  cmd 'hi Folded guifg=NONE'
  cmd('hi Comment guifg=' .. colors['grey'])
  cmd('hi TelescopeBorder guifg=' .. colors['one_bg'])
  cmd('hi TelescopeResultsTitle guifg=' .. colors['black'] .. ' guibg=' .. colors['blue'])
  cmd('hi NvimTreeVertSplit guifg=' .. colors['grey'] .. ' guibg=NONE')
end
