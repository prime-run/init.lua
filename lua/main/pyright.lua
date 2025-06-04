return {
  require('lspconfig').pyright.setup {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          ignore = { '*' },
        },
      },
    },
  },
  require('lspconfig').djlsp.setup {
    filetypes = { 'html', 'htmldjango' },
  },
  require('lspconfig').html.setup {
    filetypes = { 'html', 'htmldjango' },
  },
}
