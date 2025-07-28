return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.jump').setup {
      delay = {
        highlight = 2500000000,
        idle_stop = 1000000000,
      },
    }
    require('mini.ai').setup { n_lines = 500 }
    require('mini.bracketed').setup {
      -- buffer = { suffix = 'b', options = {} },
      -- comment = { suffix = 'c', options = {} },
      -- conflict = { suffix = 'x', options = {} },
      -- diagnostic = { suffix = 'd', options = {} },
      -- file = { suffix = 'f', options = {} },
      -- indent = { suffix = 'i', options = {} },
      jump = { suffix = 'j', options = {} },
      -- location = { suffix = 'l', options = {} },
      -- oldfile = { suffix = 'o', options = {} },
      -- quickfix = { suffix = 'q', options = {} },
      -- treesitter = { suffix = 't', options = {} },
      -- undo = { suffix = 'u', options = {} },
      -- window = { suffix = 'w', options = {} },
      -- yank = { suffix = 'y', options = {} },
    }
    require('mini.surround').setup {
      custom_surroundings = {
        ['('] = { output = { left = '(', right = ')' } },
        ['['] = { output = { left = '[', right = ']' } },
        ['{'] = { output = { left = '{', right = '}' } },
        ['<'] = { output = { left = '<', right = '>' } },
        ["'"] = { output = { left = "'", right = "'" } },
        ['"'] = { output = { left = '"', right = '"' } },
        ['`'] = { output = { left = '`', right = '`' } },
      },
      mappings = {
        add = 'sa',
      },
    }
  end,
}
