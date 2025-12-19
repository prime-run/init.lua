require 'setup'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {

  { 'vhyrro/luarocks.nvim', priority = 1000, config = true },
  { 'folke/lazydev.nvim', ft = 'lua', opts = { library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } } } },
  { import = 'main' },
  { import = 'custom.plugins' },
  -- { import = 'custom.themes' },
  -- <leader>sh snvim help
}

vim.cmd [[colorscheme prime-night]]
vim.cmd [[highlight TelescopeResultsBorder guibg=#1b1b1b guifg=#1b1b1b ]]
vim.cmd [[highlight TelescopeResultsNormal guibg=#1b1b1b ]]
vim.cmd [[highlight BlinkCmpMenu guibg=#1F1F1F ]]
vim.cmd [[highlight BlinkCmpMenuBorder guibg=#1F1F1F]]
vim.cmd [[highlight BlinkCmpDoc guibg=#1F1F1F]]
vim.cmd [[highlight BlinkCmpDocBorder guibg=#1F1F1F]]
vim.cmd [[highlight BlinkCmpSource guibg=None]]

-- vim: ts=2 sts=2 sw=2 et
