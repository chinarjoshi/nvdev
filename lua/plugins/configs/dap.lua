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
      return vim.env.DEBUG_EXECUTABLE
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.bashdb = {
  type = 'executable';
  command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
  name = 'bashdb';
}

dap.configurations.sh = {
  {
    type = 'bashdb';
    request = 'launch';
    name = "Launch file";
    showDebugOutput = true;
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
    trace = true;
    file = "${file}";
    program = "${file}";
    cwd = '${workspaceFolder}';
    pathCat = "cat";
    pathBash = "/bin/bash";
    pathMkfifo = "mkfifo";
    pathPkill = "pkill";
    args = {};
    env = {};
    terminalKind = "integrated";
  }
}

local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  api.nvim_set_keymap('n', 'K', '<Cmd>lua require("dapui").eval()<CR>', { silent = true })
  api.nvim_set_keymap('v', 'K', '<Cmd>lua require("dapui").eval()<CR>', { silent = true })
end

map('<M-b>', dap.toggle_breakpoint)
map('<M-c>', dap.continue)
map('<M-n>', dap.step_over)
map('<M-s>', dap.step_into)
map('<M-o>', dap.step_out)
map('<M-p>', dap.step_back)
map('<M-r>', dap.repl.open)
map('<M-l>', dap.run_last)
map('<M-d>', dap.disconnect)
