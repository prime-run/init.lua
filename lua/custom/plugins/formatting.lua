return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>ff',
      function()
        -- require('conform').format { async = false }
        if vim.opt_local.modifiable:get() then
          vim.cmd.write()
        else
          print "it's readonly"
        end
      end,
      mode = '',
      desc = 'Format current buffer',
      silent = true,
    },
  },
  opts = {
    formatters = {
      rustfmt = {
        options = {
          default_edition = '2024',
        },
      },
    },

    default_format_opts = {
      lsp_format = 'fallback',
    },

    format_on_save = { timeout_ms = 750, lsp_format = 'fallback' },

    formatters_by_ft = {
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      toml = { 'taplo' },
      markdown = { 'markdownlint' },
      graphql = { 'prettier' },
      liquid = { 'prettier' },

      lua = { 'stylua' },

      python = { 'ruff' },
    },
  },
  -- vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
  --   require('conform').format {
  --     lsp_fallback = true,
  --     async = false,
  --     timeout_ms = 1000,
  --   }
  --   vim.cmd.write()
  -- end, { desc = 'Format file or range (in visual mode)' }),
}
