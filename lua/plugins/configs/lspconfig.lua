local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then
  return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local opt = capabilities.textDocument.completion.completionItem
opt.documentationFormat = { 'markdown', 'plaintext' }
opt.snippetSupport = true
opt.preselectSupport = true
opt.insertReplaceSupport = true
opt.labelDetailsSupport = true
opt.deprecatedSupport = true
opt.commitCharactersSupport = true
opt.tagSupport = { valueSet = { 1 } }
opt.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

local on_attach = function(client, _)
  if client.name == 'sumneko_lua' or client.name == 'jsonls' then
    client.resolved_capabilities.document_formatting = false
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if server.name == 'sumneko_lua' then
    local sumneko = { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
    opts = vim.tbl_deep_extend('force', sumneko, opts)
  end
  server:setup(opts)
end)

require('lspconfig').gopls.setup { on_attach = on_attach }

vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'single',
})
