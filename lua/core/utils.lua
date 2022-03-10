local M = {}

M.rep = function(table)
  if type(table[1]) == 'string' then
    table[1] = '<cmd>' .. table[1] .. '<cr>'
  elseif type(table) == 'table' then
    for _, v in pairs(table) do
      M.rep(v)
    end
  end
end

M.map = function(key, command)
  vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
end

M.loadall = function()
  local scan = require('plenary.scandir').scan_dir
  for _, file in ipairs(scan '/home/c/dotfiles/nvim/lua/plugins/configs') do
    local ok, err = pcall(dofile, file)
    if not ok then
      error('Error loading ' .. file .. '\n\n' .. err)
    end
  end
end

M.vars = {
  theme = 'onedark',
  transparent = false,
  file_ignore_patterns = {
    'theme/*',
    'highlighters/*',
  },
}

return M
