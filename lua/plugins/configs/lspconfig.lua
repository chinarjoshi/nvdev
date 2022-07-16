local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
local present, lspconfig = pcall(require, 'lspconfig')
if not (ok and present) then
  return
end

lsp_installer.setup()

local on_attach = function(client, _)
  if
    client.name == 'sumneko_lua'
    or client.name == 'jsonls'
    or client.name == 'tsserver'
  then
    client.resolved_capabilities.document_formatting = false
  end
end

for _, server in ipairs {
  'pyright',
  'sumneko_lua',
  'rust_analyzer',
  'clangd',
  'tsserver',
  'cssls',
  'html',
  'jsonls',
  'sqls',
} do
  lspconfig[server].setup { on_attach = on_attach }
end

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
}
