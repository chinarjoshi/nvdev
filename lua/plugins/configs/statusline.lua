local ok, feline = pcall(require, 'feline')
if not ok then
  return
end

local lsp = require 'feline.providers.lsp'
local lsp_severity = vim.diagnostic.severity
local api = vim.api
local colors = {
  white = '#abb2bf',
  black = '#11121D',
  one_bg = '#191a25',
  one_bg2 = '#21222d',
  grey = '#222126',
  grey_fg = '#3e3f4a',
  grey_fg2 = '#454651',
  red = '#be4d65',
  pink = '#fe6D85',
  green = '#73a176',
  nord_blue = '#648ce1',
  blue = '#7199ee',
  yellow = '#d7a65f',
  dark_purple = '#9071c9',
  teal = '#519aba',
  orange = '#f6955b',
  cyan = '#38a89d',
  statusline_bg = '#151621',
  lightbg = '#262732',
  lightbg2 = '#1c1d28',
}

local statusline_style = {
  left = '',
  right = ' ',
  main_icon = '  ',
  locked_icon = '  ',
  vi_mode_icon = ' ',
}

local file_name = {
  provider = function()
    local filename = vim.fn.expand '%:t'
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    local extension = vim.fn.expand '%:e'
    local icon = require('nvim-web-devicons').get_icon(filename, extension) or ' '
    return ' ' .. icon .. ' ' .. dir_name .. '/' .. filename .. ' '
  end,
  hl = function()
    return {
      fg = vim.bo.modified and colors.red or colors.green,
      bg = colors.lightbg,
    }
  end,

  right_sep = {
    str = statusline_style.right,
    hl = { fg = colors.lightbg, bg = colors.lightbg2 },
  },
}
local inactive_file_name = {
  provider = function()
    local filename = vim.fn.expand '%:t'
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    local extension = vim.fn.expand '%:e'
    local icon = require('nvim-web-devicons').get_icon(filename, extension) or ' '
    return ' ' .. icon .. ' ' .. dir_name .. '/' .. filename .. ' '
  end,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = {
    fg = colors.grey_fg2,
    bg = colors.lightbg,
  },
  right_sep = {
    str = statusline_style.right,
    hl = { fg = colors.lightbg, bg = colors.lightbg2 },
  },
}

local diff = {
  add = {
    provider = 'git_diff_added',
    hl = {
      fg = colors.grey_fg2,
      bg = colors.lightbg2,
    },
    icon = ' ',
  },

  change = {
    provider = 'git_diff_changed',
    hl = {
      fg = colors.grey_fg2,
      bg = colors.lightbg2,
    },
    icon = ' 柳',
  },
  remove = {
    provider = 'git_diff_removed',
    hl = {
      fg = colors.grey_fg2,
      bg = colors.lightbg2,
    },
    icon = '  ',
  },
  separator = {
    provider = statusline_style.right,
    hl = {
      fg = colors.lightbg2,
      bg = colors.statusline_bg,
    },
  },
}

local git_branch = {
  provider = 'git_branch',
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = {
    fg = colors.grey_fg2,
    bg = colors.statusline_bg,
  },
  icon = '  ',
}

local diagnostic = {
  error = {
    provider = 'diagnostic_errors',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.ERROR)
    end,

    hl = { fg = colors.red },
    icon = '  ',
  },

  warning = {
    provider = 'diagnostic_warnings',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.WARN)
    end,
    hl = { fg = colors.yellow },
    icon = '  ',
  },

  hint = {
    provider = 'diagnostic_hints',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.HINT)
    end,
    hl = { fg = colors.blue },
    icon = '  ',
  },

  info = {
    provider = 'diagnostic_info',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.INFO)
    end,
    hl = { fg = colors.green },
    icon = '  ',
  },
}

local lsp_icon = {
  provider = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
      local clients = {}
      for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        clients[#clients + 1] = client.name
      end
      return '  ' .. clients[#clients]
    else
      return ''
    end
  end,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
}

local tabpages = {
  provider = function()
    if api.nvim_list_tabpages()[2] ~= nil then
      local length = 0
      for _ in ipairs(api.nvim_list_tabpages()) do
        length = length + 1
      end
      return '    ' .. api.nvim_tabpage_get_number(0) .. '/' .. length
    else
      return ''
    end
  end,

  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
}

local inactive_diagnostic = {
  error = {
    provider = 'diagnostic_errors',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.ERROR)
    end,

    hl = { fg = colors.grey_fg2 },
    icon = '  ',
  },

  warning = {
    provider = 'diagnostic_warnings',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.WARN)
    end,
    hl = { fg = colors.grey_fg2 },
    icon = '  ',
  },

  hint = {
    provider = 'diagnostic_hints',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.HINT)
    end,
    hl = { fg = colors.grey_fg2 },
    icon = '  ',
  },

  info = {
    provider = 'diagnostic_info',
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.INFO)
    end,
    hl = { fg = colors.grey_fg2 },
    icon = '  ',
  },
}

-- components are divided in 3 sections
local components = {
  active = {
    {
      file_name,
      diff.add,
      diff.change,
      diff.remove,
      diff.separator,
      diagnostic.error,
      diagnostic.warning,
      diagnostic.hint,
      diagnostic.info,
    },
    {
      tabpages,
    },
    {
      lsp_icon,
      git_branch,
    },
  },
  inactive = {
    {
      inactive_file_name,
      diff.add,
      diff.change,
      diff.remove,
      diff.separator,
      inactive_diagnostic.error,
      inactive_diagnostic.warning,
      inactive_diagnostic.hint,
      inactive_diagnostic.info,
    },
    {
      tabpages,
    },
    {
      lsp_icon,
      git_branch,
    },
  },
}

feline.setup {
  theme = {
    bg = colors.statusline_bg,
    fg = colors.fg,
  },
  components = components,
}
