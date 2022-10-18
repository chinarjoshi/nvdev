local present, lspconfig = pcall(require, 'lspconfig')
local present2, lsp_format = pcall(require, 'lsp-format')

if not present and present2 then
  return
end

lsp_format.setup()

local on_attach = function(client)
  if client.name == 'sumneko_lua'
      or client.name == 'jsonls'
      or client.name == 'tsserver'
      or client.name == 'pyright'
  then
    client.server_capabilities.document_formatting = false
  end

  lsp_format.on_attach(client)
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
  'jdtls',
} do
  lspconfig[server].setup { on_attach = on_attach }
end

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
}
