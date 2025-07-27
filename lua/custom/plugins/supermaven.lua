return {
  'supermaven-inc/supermaven-nvim',
  opts = {
    ignore_filetypes = { cpp = true, oil = true },
    keymaps = {
      accept_suggestion = '<M-y>',
      clear_suggestion = '<M-c>',
      accept_word = "<M-'>",
    },
    log_level = 'info',
  },

  --   'olimorris/codecompanion.nvim',
  --   opts = {
  --
  --     adapters = {
  --       anthropic = function()
  --         return require('codecompanion.adapters').extend('anthropic', {
  --           env = {
  --             api_key = 'MY_OTHER_ANTHROPIC_KEY',
  --           },
  --         })
  --       end,
  --     },
  --   },
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
}
