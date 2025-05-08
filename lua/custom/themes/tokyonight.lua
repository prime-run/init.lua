return {
  {
    'folke/tokyonight.nvim',

    config = function()
      local tokyonight = require 'tokyonight'

      tokyonight.setup {
        style = 'moon',
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          sidebars = 'dark',
          floats = 'dark',
        },

        on_highlights = function(highlights, theme_colors)
          local custom_palette = {
            float_bg = '#02010d',
            cmp_bg = '#0D1117',
            float_border_fg = '#0D4D4D',
            cmp_border_fg = '#0D4D4D',
          }

          local common_float_border_style = {
            fg = custom_palette.float_border_fg,
            bg = custom_palette.float_bg,
          }

          local common_cmp_item_style = {
            bg = custom_palette.cmp_bg,
          }

          local common_cmp_border_style = {
            fg = custom_palette.cmp_border_fg,
            bg = custom_palette.cmp_bg,
          }

          highlights.NormalFloat = {
            bg = custom_palette.float_bg,
          }

          highlights.FloatBorder = common_float_border_style
          highlights.BlinkCmpMenu = common_cmp_item_style
          highlights.BlinkCmpMenuBorder = common_cmp_border_style
          highlights.BlinkCmpDoc = common_cmp_item_style
          highlights.BlinkCmpDocBorder = common_cmp_border_style

          highlights.TelescopeNormal = {
            bg = custom_palette.float_bg,
          }

          highlights.TelescopePromptBorder = common_float_border_style
          highlights.TelescopeResultsBorder = common_float_border_style
          highlights.TelescopePreviewBorder = common_float_border_style
        end,
      }

      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },
}
