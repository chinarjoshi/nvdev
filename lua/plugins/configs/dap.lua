local dap = require("dap")
local map = require('core.utils').map

dap.adapters.codelldb = {
  type = 'server',
  port = 13000,
  executable = {
    command = '/home/c/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", 13000},
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

map('<M-c>', dap.continue)
map('<M-n>', dap.step_over)
map('<M-s>', dap.step_into)
map('<M-o>', dap.step_out)
map('<M-p>', dap.step_back)
map('<M-r>', dap.repl.open)
