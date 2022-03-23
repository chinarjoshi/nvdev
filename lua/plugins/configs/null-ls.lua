local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.stylua,
    formatting.black,
    formatting.prettier,
    -- formatting.rustfmt,
    -- formatting.clang_format,
    -- diagnostics.cppcheck,
    diagnostics.flake8,
    diagnostics.luacheck.with { extra_args = { '--globals vim' } },
  },
}
