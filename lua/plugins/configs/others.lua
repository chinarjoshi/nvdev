local M = {}

M.autopairs = function()
  local present1, autopairs = pcall(require, 'nvim-autopairs')
  local present2, cmp = pcall(require, 'cmp')

  if not (present1 and present2) then
    return
  end

  local options = {
    fast_wrap = {},
  }

  autopairs.setup(options)

  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

M.blankline = function()
  local present, blankline = pcall(require, 'indent_blankline')

  if not present then
    return
  end

  local options = {
    indentLine_enabled = 1,
    filetype_exclude = {
      'help',
      'terminal',
      'alpha',
      'packer',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
      'mason',
      '',
    },
    buftype_exclude = { 'terminal' },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    -- show_current_context = true,
    -- show_current_context_start = true,
  }

  blankline.setup(options)
end

M.luasnip = function()
  local present, luasnip = pcall(require, 'luasnip')

  if not present then
    return
  end

  local options = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  }

  luasnip.config.set_config(options)
  require('luasnip.loaders.from_vscode').lazy_load { paths = vim.g.luasnippets_path or '' }
  require('luasnip.loaders.from_vscode').lazy_load()

  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      if
        require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
      then
        require('luasnip').unlink_current()
      end
    end,
  })
end

M.material = function()
  local present, material = pcall(require, 'material')

  if not present then
    return
  end
  material.setup {
    contrast = {
      sidebars = true,
      popup_menu = true,
    },
    italics = { comments = true },
    custom_highlights = {
      Comment = { fg = '#708094' },
    },
  }

  vim.cmd 'colorscheme material'
end

M.focus = function()
  local present, focus = pcall(require, 'focus')
  if not present then
    return
  end

  focus.setup {
    excluded_filetypes = { 'fzf', 'NvimTree' },
    signcolumn = false
  }
end

return M
