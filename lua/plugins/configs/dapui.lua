local dapui = require('dapui')

dapui.setup {
  layouts = { {
      elements = { {
          id = "stacks",
          size = 0.25
        }, {
          id = "breakpoints",
          size = 0.25
        }, {
          id = "console",
          size = 0.5
        } },
      position = "left",
      size = 35
    }, {
      elements = { {
          id = "scopes",
          size = 0.5
        }, {
          id = "watches",
          size = 0.5
        } },
      position = "bottom",
      size = 10
    } },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
}
-- require('dap').listeners.after.event_initialized["dapui_config"] = dapui.open
