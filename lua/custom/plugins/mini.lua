return {
  'echasnovski/mini.nvim',
  config = function()
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
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
