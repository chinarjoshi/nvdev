local ok, colorizer = pcall(require, 'colorizer')
local present, material = pcall(require, 'material')
if not (ok and present) then
  return
end

colorizer.setup()

material.setup()
vim.g.material_style = 'deep ocean'
vim.cmd 'colorscheme material'
