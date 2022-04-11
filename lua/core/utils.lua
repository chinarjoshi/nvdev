local M = {}

-- Easy config variables to set
M.vars = {
  theme = 'deep ocean', -- deep ocean, oceanic, palenight, lighter, darker
  transparent = false,
  file_ignore_patterns = {
    'theme/*',
    'highlighters/*',
  },
}

-- Replace each leaf node of a tree with <cmd>_<cr> for which-key (Readability)
M.rep = function(table)
  if type(table[1]) == 'string' then
    table[1] = '<cmd>' .. table[1] .. '<cr>'
  elseif type(table) == 'table' then
    for _, v in pairs(table) do
      M.rep(v)
    end
  end
end

-- More readable map function
M.map = function(key, command)
  vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
end

-- Auto load all lua files in configs directory
M.loadall = function()
  local ok, scan = pcall(require, 'plenary.scandir')
  if not ok then
    return
  end
  for _, file in ipairs(scan.scan_dir '/home/c/dotfiles/nvim/lua/plugins/configs') do
    local ok, err = pcall(dofile, file)
    if not ok then
      error('Error loading ' .. file .. '\n\n' .. err)
    end
  end
end

-- Fallback to telescope.find_files when not in git directory
M.project_files = function()
  local opts = require('telescope.themes').get_ivy { layout_config = { height = 15 } }
  local ok = pcall(require('telescope.builtin').git_files, opts)
  if not ok then
    require('telescope.builtin').find_files(opts)
  end
end

return M
