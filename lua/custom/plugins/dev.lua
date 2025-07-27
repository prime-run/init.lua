return {
  {
    dir = '~/Projects/lua/agents.nvim',

    config = function()
      local agents = require 'agents'
      local opts = {
        term = {
          position = 'right',
          width = 0.4,
        },
      }
      agents.setup(opts)
      -- agents.create_float { width = 0.8, height = 0.5 }
      -- agents.create_split { width = 0.3, position = 'left' }
    end,
  },
}
