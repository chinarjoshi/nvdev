local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

local on_attach = function(client, _)
  if client.name == 'sumneko_lua'
    or client.name == 'jsonls'
    or client.name == 'tsserver'
    or client.name == 'pyright'
  then
    client.server_capabilities.document_formatting = false
  end
end

lspconfig['sumneko_lua'].setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

for _, server in ipairs {
  'pyright',
  'rust_analyzer',
  'clangd',
  'tsserver',
  'cssls',
  'html',
  'jsonls',
} do
  lspconfig[server].setup { on_attach = on_attach }
end

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
}
