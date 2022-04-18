local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettier,
    formatting.black,
    formatting.isort,
    diagnostics.write_good.with { filetypes = { "markdown", "text" } },
    formatting.stylua,
    diagnostics.flake8,
    diagnostics.luacheck.with { extra_args = { '--globals vim' } },
  },
  fallback_severity = vim.diagnostic.severity.HINT,
}
