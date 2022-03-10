local ok, telescope = pcall(require, 'telescope')
local present, actions = pcall(require, 'telescope.actions')
if not (ok and present) then
  return
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['C-j'] = actions.move_selection_next,
        ['C-k'] = actions.move_selection_previous,
        ['<esc>'] = actions.close,
      },
    },
    preview = false,
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      preview_cutoff = 120,
    },
    file_ignore_patterns = require('core.utils').vars.file_ignore_patterns,
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
  },
}

pcall(telescope.load_extension, 'projects')
