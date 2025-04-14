return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    enable_check_bracket_line = false,
  },
  -- config = function()
  --   -- require('nvim-autopairs').setup {}
  --   --  add `(` after selecting a function or method
  --   local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  --   local cmp = require 'cmp'
  --   cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  -- end,
}
