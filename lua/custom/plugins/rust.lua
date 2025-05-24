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
          -- rust-analyzer language server configuration
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
          },
        },
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true }

          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          --  incremental selection with tree_climber_rust
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua require("tree_climber_rust").init_selection()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'x', '<C-s>', '<cmd>lua require("tree_climber_rust").select_incremental()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'x', '<M-s>', '<cmd>lua require("tree_climber_rust").select_previous()<CR>', opts)

          vim.keymap.set('n', '<leader>rca', vim.cmd.RustLsp 'openCargo', { desc = '[R]ustLsp oprn[Ca]rgo.toml' })
          vim.keymap.set('n', '<leader>rod', vim.cmd.RustLsp 'openDocs', { desc = '[R]ustLsp [O]pen [D]ocs' })
          vim.keymap.set('n', '<leader>rjl', vim.cmd.RustLsp 'joinLines', { desc = '[R]ustLsp [J]oin [L]ines' })
        end,
      },
    }
  end,
}
