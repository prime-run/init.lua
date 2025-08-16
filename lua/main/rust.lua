return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  dependencies = {
    'adaszko/tree_climber_rust.nvim',
  },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            imports = {
              granularity = {
                group = 'module',
              },
              prefix = 'self',
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = false,
                useParameterNames = true,
              },
            },
          },
        },
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true }

          --  incremental selection with tree_climber_rust
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua require("tree_climber_rust").init_selection()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'x', '<C-s>', '<cmd>lua require("tree_climber_rust").select_incremental()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'x', '<M-s>', '<cmd>lua require("tree_climber_rust").select_previous()<CR>', opts)

          -- Corrected keymap definitions for buffer-local keymaps
          vim.api.nvim_buf_set_keymap(
            bufnr,
            'n',
            '<leader>rca',
            ':RustLsp openCargo<CR>',
            { desc = '[R]ustLsp open[Ca]rgo.toml', noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rod', ':RustLsp openDocs<CR>', { desc = '[R]ustLsp [O]pen [D]ocs', noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rjl', ':RustLsp joinLines<CR>', { desc = '[R]ustLsp [J]oin [L]ines', noremap = true, silent = true })
        end,
      },
    }
  end,
}
