local ok, colorizer = pcall(require, 'colorizer')
local present, base16 = pcall(require, 'base16')
if not (ok and present) then
  return
end

colorizer.setup({ '*' }, {
  RGB = true,
  RRGGBB = true,
  names = false,
  RRGGBBAA = false,
  rgb_fn = false,
  hsl_fn = false,
  css = false,
  css_fn = false,
  mode = 'background',
})

base16(base16.themes(require('core.utils').vars.theme), true)
package.loaded['core.highlights' or false] = nil
require 'core.highlights'
