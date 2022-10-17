local ok, which_key = pcall(require, 'which-key')
if not ok then
  return
end

local utils = require 'core.utils'
local maps = require 'core.mappings'

which_key.setup {
  ignore_missing = true,
  window = {
    margin = { 0, 0, 0, 0 },
    padding = { 0, 0, 0, 0 },
    winblend = 0,
    border = 'single',
  },
  layout = {
    height = { min = 1, max = 15 },
    width = { min = 1, max = 50 },
    spacing = 1,
  },
  key_labels = {
    ['<space>'] = 'SPC',
    ['<CR>'] = 'RET',
    ['<Tab>'] = 'TAB',
  },
  spelling = { enabled = true },
  presets = {
    operators = false,
    motions = false,
    text_objects = false,
    windows = false,
    nav = false,
    g = false,
  },
}

for _, value in pairs(maps) do
    utils.alter_keymap('', value, utils.filter)
    which_key.register(value, { prefix = value.prefix })
end
