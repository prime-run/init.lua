return {
  {
    'amrbashir/nvim-docs-view',
    lazy = true,
    cmd = 'DocsViewToggle',
    opts = {
      position = 'right',
      width = 60,
      vim.keymap.set('n', '<leader>do', function()
        vim.cmd 'DocsViewToggle'
      end, { desc = 'Lsp [D]ocs [O]pen in new buffer and focus' }),
    },
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {
      border = 'rounded',
      wrap = true,
      max_width = nil,
      max_height = nil,
      toggle = false,
      multi_server = true,
    },
  },
}
