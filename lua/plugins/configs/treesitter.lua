return {
  ensure_installed = {
    -- Program
    'c',
    'cpp',
    'bash',
    'rust',
    'lua',
    'java',
    -- Build
    'cmake',
    'make',
    'meson',
    'ninja',
    -- Git
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    -- Markup
    'markdown',
    'norg',
    -- Data
    'json',
    'yaml',
    'toml',
    -- Misc.
    'sql',
    'comment',
  },

  highlight = { enable = true, use_languagetree = true },

  indent = { enable = true },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },

    swap = {
      enable = true,
    },

    move = {
      enable = true,
    },
  },
}
