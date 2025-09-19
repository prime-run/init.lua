--cargo run 'f-js'
return {
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'typescriptreact' },

    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('blink.cmp').get_lsp_capabilities(), {
        workspace = {
          didChangeWatchedFiles = { dynamicRegistration = true },
          configuration = true,
        },
      })

      require('typescript-tools').setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- disabled formatting in favor of null-ls or other stuff
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          -- TS-remaps
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = 'TS: ' .. desc })
          end

          --global remaps had inconsistency so here we are redefining them just for ts
          map('n', '<leader>toi', '<cmd>TSToolsOrganizeImports<CR>', 'Organize Imports')
          map('n', '<leader>tru', '<cmd>TSToolsRemoveUnused<CR>', 'Remove Unused')
          map('n', '<leader>tai', '<cmd>TSToolsAddMissingImports<CR>', 'Add Missing Imports')
          map('n', '<leader>trf', '<cmd>TSToolsRenameFile<CR>', 'Rename File')
          -- map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')

          local biome_group = vim.api.nvim_create_augroup('biome-fix', { clear = false })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = biome_group,
            buffer = bufnr,
            callback = function()
              if not vim.opt_local.modifiable:get() then
                return
              end
              local has_biome = false
              for _, c in pairs(vim.lsp.get_clients { bufnr = bufnr }) do
                if c.name == 'biome' then
                  has_biome = true
                  break
                end
              end
              if not has_biome then
                return
              end
              pcall(vim.lsp.buf.code_action, {
                context = { only = { 'source.fixAll' } },
                apply = true,
              })
              pcall(vim.lsp.buf.code_action, {
                context = { only = { 'source.organizeImports' } },
                apply = true,
              })
            end,
          })
        end,

        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = 'insert_leave',
          expose_as_code_action = { 'fix_all', 'add_missing_imports' },
          tsserver_file_preferences = {
            includeInlayParameterNameHints = 'literals',
            includeInlayVariableTypeHints = true,
            importModuleSpecifierPreference = 'project-relative',
          },
          tsserver_format_options = {
            insertSpaceAfterCommaDelimiter = true,
            insertSpaceAfterSemicolonInForStatements = true,
            semicolons = 'insert',
          },
        },
      }
    end,
  },
}
