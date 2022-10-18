local present, treesitter = pcall(require, 'nvim-treesitter.configs')
if not present then
  return
end

local options = {
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },
}

treesitter.setup(options)
