local M = {}

M.blankline = {
  buftype_exclude = { 'terminal' },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

M.luasnip = function(opts)
  require('luasnip').config.set_config(opts)
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

return M
