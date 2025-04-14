return {
  -- 'supermaven-inc/supermaven-nvim',
  -- opts = {
  --   ignore_filetypes = { cpp = true, oil = true },
  --   keymaps = {
  --     accept_suggestion = '<Tab>',
  --     clear_suggestion = '<C-]>',
  --     accept_word = '<C-j>',
  --   },
  --   log_level = 'info',
  -- },

  -- {
  --   'github/copilot.vim',
  --   vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept()', { expr = true, silent = true, noremap = false }),
  -- },

  -------------
  -- {
  --   'github/copilot.vim',
  --   config = function() end,
  -- },

  -- {
  --   'Exafunction/windsurf.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   config = function()
  --     require('codeium').setup {
  --       -- Disable cmp source since we're only using virtual text
  --       enable_cmp_source = false,
  --       virtual_text = {
  --         enabled = true,
  --         -- These are the defaults
  --         manual = false,
  --         -- How long to wait before requesting completions
  --         idle_delay = 75,
  --         -- High priority to ensure it shows on top of other virtual text
  --         virtual_text_priority = 65535,
  --         -- Key bindings
  --         key_bindings = {
  --           -- accept = '<C-y>',
  --         },
  --       },
  --     }
  --   end,
  -- },
}
