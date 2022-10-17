local M = {}

M.map = function(key, map)
    vim.api.nvim_set_keymap('n', key, map, { noremap = true })
end

M.alter_keymap = function(prefix, value, fn)
    if type(value[1]) == 'string' or type(value[1]) == 'function' then
        if type(value[1]) == 'string' then
            value[1] = '<cmd>' .. value[1] .. '<cr>'
        end
        fn(prefix, value)
        return
    end

    for k, v in pairs(value) do
        if type(v) ~= 'string' then
            M.alter_keymap(prefix .. k, v, fn)
        end
    end
end

M.register = function(key, value) vim.keymap.set('n', key, value[1], { noremap = true }) end

M.filter = function(_, value) value = value[2] end

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
