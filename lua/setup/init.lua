vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode
vim.opt.mouse = 'a'
-- it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)
-- vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.termguicolors = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
-- splits, :vsplit, :vs  | :split, :sp
vim.opt.splitright = true
vim.opt.splitbelow = true
--  display certain whitespace characters in the editor.
--  See `:help 'list' and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

--cursor line
vim.opt.cursorline = true
vim.opt.scrolloff = 5 -- trying to use zz more!

--clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>pv', ':e .<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>pp', vim.cmd.Oil)

vim.keymap.set('n', '<Tab>', 'o<Esc>', { noremap = true, silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
-- vim.keymap.set('i', '<C-i>', '<C-u>', { remap = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { remap = true, silent = true })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('v', '<leader>p', [["_dP]])
-- C and rust - middle finger to auto tag XD
vim.keymap.set({ 'i', 'n' }, '<M-;>', '<Esc>$a;<Esc>o')

vim.keymap.set('i', '<C-Right>', '<End>', { silent = true })
vim.keymap.set('i', '<C-Left>', '<Home>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>rep', function()
  local replacement = vim.fn.escape(vim.fn.getreg '.', '/\\&')
  vim.cmd('keeppatterns %s//' .. replacement .. '/g')
end, { desc = 'Replace all with last change' })

vim.keymap.set('n', '<leader>colt', function()
  vim.cmd.colorscheme 'tokyonight-moon'
end, { desc = 'Color Tokyo' })

vim.keymap.set('n', '<leader>colr', function()
  vim.cmd.colorscheme 'rose-pine'
end, { desc = 'Color Rose-pine' })

vim.keymap.set('i', '<C-c>', '<C-[><Esc>', { noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = '[T]elescope [g]it [s]tatus' })
vim.keymap.set('n', ';', ':')

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.fn.jobstart({ 'kitty', '@', 'set-spacing', 'padding-bottom=0' }, {
      detach = true,
    })
  end,
})
vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    vim.fn.jobstart({ 'kitty', '@', 'set-spacing', 'padding=default' }, {
      detach = true,
    })
  end,
})

-- vim.cmd [[autocmd BufRead,BufNewFile .zshenv set filetype=sh]]
-- vim.cmd [[autocmd BufRead,BufNewFile .zshrc set filetype=sh]]
