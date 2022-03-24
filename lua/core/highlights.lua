local cmd = vim.cmd
local c = require 'material.colors'

cmd('hi PmenuSel guifg=' .. c.cyan .. ' guibg=' .. c.selection)
cmd('hi DiagnosticHint guifg=' .. c.purple)
cmd('hi DiagnosticError guifg=' .. c.red)
cmd('hi DiagnosticWarn guifg=' .. c.yellow)
cmd('hi DiagnosticInformation guifg=' .. c.green)
cmd('hi DiagnosticInfo guifg=' .. c.blue)
cmd('hi RedOnBlack guifg=' .. c.red)
cmd('hi Comment gui=italic')
cmd('hi StatusLineNC gui=underline')
