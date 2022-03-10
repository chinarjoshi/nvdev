local ok, cmp = pcall(require, 'cmp')
local present, luasnip = pcall(require, 'luasnip')
if not (ok and present) then
  return
end

cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
require('luasnip.loaders.from_vscode').load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { 'kind', 'abbr' },
    format = function(entry, vim_item)
      local icons = require 'plugins.configs.lspkind_icons'
      vim_item.kind = string.format('%s', icons[vim_item.kind])
      return vim_item
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp', max_item_count = 15 },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
  },
  experimental = {
    ghost_text = true,
  },
}
