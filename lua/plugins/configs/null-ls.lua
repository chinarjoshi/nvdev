local present, null_ls = pcall(require, 'null-ls')
if not present then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.black,
    formatting.isort,
    formatting.stylua,
    diagnostics.flake8,
    diagnostics.write_good.with { filetypes = { 'markdown', 'text' } },
    diagnostics.luacheck.with { extra_args = { '--globals vim' } },
  },
  fallback_severity = vim.diagnostic.severity.INFO,
}
