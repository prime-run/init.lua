return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'typescript',
        'tsx',
        'javascript',
        'python',
        'html',
        'xml',
        'json',
        'rust',
        'go',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-s>',
          node_incremental = '<C-s>',
          scope_incremental = '<leader>st',
          node_decremental = '<M-s>',
        },
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Function textobjects
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            -- Parameter textobjects
            ['ap'] = '@parameter.outer',
            ['ip'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jump = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']i'] = '@indent.outer', -- For indentation-based blocks
            [']b'] = '@block.outer', -- General block
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[i'] = '@indent.outer',
            ['[b'] = '@block.outer',
          },
        },
      },
    }

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript', 'tsx' }
  end,
}
