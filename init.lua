local present, impatient = pcall(require, 'impatient')

if present then
  impatient.enable_profile()
end

vim.opt.shadafile = 'NONE'

for _, module in
  ipairs {
    'core.settings',
    'core.mappings',
    'core.highlights',
    'plugins',
  }
do
  local ok, err = pcall(require, module)
  if not ok then
    error("\n\nError loading '" .. module .. "' in init.lua\n\n" .. err)
  end
end

vim.opt.shadafile = ''
