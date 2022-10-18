local M = {}

M.map = function(key, map)
  vim.keymap.set('n', key, '<cmd>' .. map .. '<cr>', { noremap = true })
end

M.register_or_filter_keymap = function(prefix, value, is_register)
  if type(value[1]) == 'string' or type(value[1]) == 'function' then
    if is_register then
      if type(value[1]) == 'string' then
        value[1] = '<cmd>' .. value[1] .. '<cr>'
      end
      vim.keymap.set('n', prefix, value[1], { noremap = true })
    else
      value = value[2]
    end
    return
  end

  for k, v in pairs(value) do
    if type(v) ~= 'string' then
      M.register_or_filter_keymap(prefix .. k, v, is_register)
    end
  end
end

M.project_files = function()
  local is_git = pcall(require('telescope.builtin').git_files)
  if not is_git then
    vim.cmd ':Telescope projects theme=ivy'
  end
end

M.toggle_diagnostics = function()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end

M.lazy_load = function(tb)
  vim.api.nvim_create_autocmd(tb.events, {
    group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
    callback = function()
      if tb.condition() then
        vim.api.nvim_del_augroup_by_name(tb.augroup_name)

        if tb.plugin ~= 'nvim-treesitter' then
          vim.defer_fn(function()
            require('packer').loader(tb.plugin)
            if tb.plugin == 'nvim-lspconfig' then
              vim.cmd 'silent! do FileType'
            end
          end, 0)
        else
          require('packer').loader(tb.plugin)
        end
      end
    end,
  })
end

M.on_file_open = function(plugin_name)
  M.lazy_load {
    events = { 'BufRead', 'BufWinEnter', 'BufNewFile' },
    augroup_name = 'BeLazyOnFileOpen' .. plugin_name,
    plugin = plugin_name,
    condition = function()
      local file = vim.fn.expand '%'
      return file ~= 'NvimTree_1' and file ~= '[packer]' and file ~= ''
    end,
  }
end

M.gitsigns = function()
  vim.api.nvim_create_autocmd({ 'BufRead' }, {
    group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
    callback = function()
      vim.fn.system('git rev-parse ' .. vim.fn.expand '%:p:h')
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
        vim.schedule(function()
          require('packer').loader 'gitsigns.nvim'
        end)
      end
    end,
  })
end

return M
