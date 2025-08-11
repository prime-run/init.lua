return {
  'prime-run/prime-night.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'prime-night'
    vim.cmd [[hi @punctuation.bracket guifg=yellow]]
    vim.cmd [[hi @keyword.import guifg=#7E50FF]]
    vim.keymap.set('n', '<leader>colt', function()
      vim.api.nvim_set_hl(0, 'LocalBg', { bg = '#131414' })
      vim.wo.winhighlight = 'Normal:LocalBg'
    end)
  end,
}
