return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
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
        goto_next_start = { [']m'] = '@function.outer' },
        goto_previous_start = { ['[m'] = '@function.outer' },

        goto_next = { [']i'] = '@conditional.outer' },
        goto_previous = { ['[i'] = '@conditional.inner' },
      },
    },
  },
}
