return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
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
      mode = 'n',
      desc = 'Format current buffer',
      silent = true,
    },
  },
  opts = {
    -- formatters = {
    --   rustfmt = {
    --     options = {
    --       default_edition = '2024',
    --     },
    --   },
    -- },

    default_format_opts = {
      lsp_format = 'fallback',
    },

    format_on_save = { timeout_ms = 750, lsp_format = 'fallback' },

    formatters_by_ft = {
      javascript = { 'prettier' },
      typescript = { 'biome' },
      javascriptreact = { 'biome' },
      typescriptreact = { 'biome' },
      css = { 'prettier' },
      html = {
        'prettier',
        args = {
          '--html-whitespace-sensitivity',
          'strict',
          '--print-width',
          '120',
          '--single-attribute-per-line',
          'true',
        },
      },
      json = { 'biome' },
      bash = { 'shfmt' },
      yaml = { 'yamlfmt' }, -- config file under : /home/prime/.config
      toml = { 'taplo' }, -- use TAPLO_CONFIG env to set global config file
      markdown = { 'markdownlint' },
      liquid = { 'prettier' },
      htmldjango = {
        'djlint',
      },

      lua = { 'stylua' },

      python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
    },
  },
}
