return {
  'prime-run/prime-night.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'prime-night'
    vim.cmd [[hi @punctuation.bracket guifg=yellow]]
    vim.cmd [[hi @keyword.import guifg=#7E50FF]]
  end,
}
