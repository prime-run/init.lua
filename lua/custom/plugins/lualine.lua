return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local colors = {
      blue = '#3d59a1',
      green = '#76FF03',
      violet = '#FF61EF',
      yellow = '#FFDA7B',
      red = '#FF1744',
      fg = '#c3ccdc',
      bg = '#112638',
      inactive_bg = '#2c3043',
      semilightgray = '#6c6f93',
      kitty = '#9ABBE6',
    }

    local the_theme = {
      normal = {
        a = { bg = colors.blue, fg = 'white' },
        b = { bg = colors.kitty, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg },
        b = { bg = colors.kitty, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    lualine.setup {
      options = {
        theme = the_theme,
        always_show_tabline = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = ' ', right = ' ' },
        fmt = string.lower,
      },

      extensions = { 'oil' },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
            padding = 1,
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          {
            'filename',
            path = 1,
            separator = { left = '', right = '' },
            padding = 1,
          },
        },

        lualine_c = {
          {
            'diagnostics',

            sources = { 'nvim_diagnostic' },

            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {

              error = 'DiagnosticError',
              warn = 'DiagnosticWarn',
              info = 'DiagnosticInfo',
              hint = 'DiagnosticHint',
            },
            symbols = { error = '', warn = '', info = '', hint = '' },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },

          {
            'lsp_status',
            icon = '',
            symbols = {
              spinner = { '󰝲', '', '' },
              done = '󰄭',
              separator = '   ',
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
          },
          'branch',
          'diff',
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
