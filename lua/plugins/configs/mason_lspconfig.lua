return {
  ensure_installed = vim.g.language_servers,
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup {}
    end,

    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                [vim.fn.stdpath 'data' .. '/lazy/lazy.nvim/lua/lazy'] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      }
    end,
  }
}
