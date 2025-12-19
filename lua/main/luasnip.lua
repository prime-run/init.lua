return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  opts = {
    history = false,
    require('luasnip.loaders.from_lua').load {
      paths = { vim.fn.expand '~/.config/nvim/lua/custom/filters' },
    },
  },
  vim.keymap.set({ 'i', 's' }, '<C-l>', function()
    require('luasnip').jump(1)
  end, { silent = true }),
  vim.keymap.set({ 'i', 's' }, '<C-h>', function()
    require('luasnip').jump(-1)
  end, { silent = true }),
}
