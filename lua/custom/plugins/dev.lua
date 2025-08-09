return {
  {
    dir = '~/Projects/lua/agents.nvim',

    config = function()
      local agents = require 'agents'
      local opts = {
        agent = 'gemini',
        keep_focus = false,
        term = {
          position = 'right',
          width = 0.55,
        },
      }
      agents.setup(opts)
    end,
  },
}
