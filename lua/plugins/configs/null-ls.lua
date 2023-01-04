local present, null_ls = pcall(require, 'null-ls')
if not present then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    -- Python
    formatting.black,
    formatting.isort,
    diagnostics.flake8,
    -- Rust
    formatting.rustfmt,
    -- C/C++
    -- Lua
    formatting.stylua,
  },
  fallback_severity = vim.diagnostic.severity.INFO,
}
