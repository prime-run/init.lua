vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.mouse = 'a'
vim.opt.showmode = false
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)
-- vim.opt.breakindent = true
vim.o.tabstop = 2
vim.o.swapfile = false
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.autoread = true
-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes:1'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
--  See `:help 'list' and `:help 'listchars'`
vim.opt.list = false
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

--cursor line
vim.opt.cursorline = true
vim.opt.scrolloff = 5 -- trying to use zz more!

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>pv', ':e .<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>pp', vim.cmd.Oil)

vim.keymap.set('n', '<Tab>', 'o<Esc>', { noremap = true, silent = true })

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
-- vim.keymap.set('i', '<C-i>', '<C-u>', { remap = true })
-- vim.keymap.set('i', '<C-v>', '<C-r>+', { remap = true, silent = true })

vim.keymap.set('i', '<c-a><c-a>', '<C-o>$', { noremap = true, silent = true })
vim.keymap.set('i', '<c-i><c-i>', '<C-o>^', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('v', '<leader>p', [["_dP]])
vim.keymap.set('n', '<leader>Y', 'v$"+y')

vim.keymap.set({ 'i', 'n' }, '<M-;>', '<Esc>$a;<Esc>o')

vim.keymap.set('i', '<C-Right>', '<End>', { silent = true })
vim.keymap.set('i', '<C-Left>', '<Home>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { silent = true })

-- vim.keymap.set('n', '<Esc>0', '^')
vim.keymap.set('n', '<M-a>', '@a')

vim.keymap.set('n', '<leader>rep', function()
  local replacement = vim.fn.escape(vim.fn.getreg '.', '/\\&')
  vim.cmd('keeppatterns %s//' .. replacement .. '/g')
end, { desc = 'Replace all with last change' })

-- vim.keymap.set('n', '<leader>colt', function()
--   vim.cmd.colorscheme 'tokyonight-moon'
-- end, { desc = 'Color Tokyo' })

vim.keymap.set('i', '<C-c>', '<C-[><Esc>', { noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = '[T]elescope [g]it [s]tatus' })
-- vim.keymap.set('n', ';', ':')
-- vim.keymap.set('n', "'", ';')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.fn.jobstart({ 'alacritty', 'msg', 'config', '--window-id', '-1', 'window.padding.y=0' }, {
      detach = true,
    })

    vim.fn.jobstart({ 'alacritty', 'msg', 'config', '--window-id', '-1', 'window.padding.x=0' }, {
      detach = true,
    })
  end,
})

vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    -- alacritty msg config --window-id -1 window.padding.y=1
    vim.fn.jobstart({ 'alacritty', 'msg', 'config', '--window-id', '-1', 'window.padding.y=20' }, {
      detach = true,
    })

    vim.fn.jobstart({ 'alacritty', 'msg', 'config', '--window-id', '-1', 'window.padding.x=20' }, {
      detach = true,
    })
  end,
})

-- NOTE: sick of all plugin take over that tab!
vim.keymap.set({ 'i', 's' }, '<Tab>', '<Tab>', { noremap = true, silent = true, desc = 'Insert Tab' })

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'CursorHold' }, {
--   group = vim.api.nvim_create_augroup('auto-checktime', { clear = true }),
--   pattern = '*',
--   desc = 'Auto checktime',
--   callback = function()
--     if vim.fn.mode() ~= 'c' and vim.bo.modifiable then
--       vim.cmd 'checktime'
--     end
--   end,
-- })
