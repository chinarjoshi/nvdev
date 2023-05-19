local actions = require 'telescope.actions'

return {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<esc>'] = actions.close,
        ['<C-u>'] = false,
      },
    },
    preview = false,
    prompt_prefix = '   ',
    selection_caret = ' ',
    entry_prefix = ' ',
    initial_mode = 'insert',
  },

  pickers = {
    find_files = { theme = 'ivy' },
    git_files = { theme = 'ivy' },
    projects = { theme = 'ivy' },
    buffers = { theme = 'ivy' },
    grep_string = { theme = 'ivy' },
    live_grep = { theme = 'ivy' },
    diagnostics = { theme = 'ivy' },
  },
}
