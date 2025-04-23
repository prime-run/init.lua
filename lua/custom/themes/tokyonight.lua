return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        style = 'moon', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,
        terminal_colors = true,
        styles = {
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          lualine_bold = true,
          -- sidebars = 'dark', -- style for sidebars, see below
          floats = 'dark', -- style for floating windows
        },
        on_highlights = function(highlights, colors)
          -- Set a very dark background for all floats
          highlights.NormalFloat = {
            bg = '#02010d', -- Slightly darker than #05090F
          }

          -- Set dark cyan borders for all floats
          highlights.FloatBorder = {
            fg = '#0D4D4D', -- Dark cyan
            bg = '#02010d', -- Match the background
          }

          -- Also customize Telescope specifically to ensure consistency
          highlights.TelescopeNormal = {
            bg = '#02010d',
          }
          highlights.TelescopePromptBorder = {
            fg = '#0D4D4D',
            bg = '#02010d',
          }
          highlights.TelescopeResultsBorder = {
            fg = '#0D4D4D',
            bg = '#02010d',
          }
          highlights.TelescopePreviewBorder = {
            fg = '#0D4D4D',
            bg = '#02010d',
          }

          -- Customize cmp (completion) floats
          highlights.CmpDocumentation = {
            bg = '#02010d',
          }
          highlights.CmpDocumentationBorder = {
            fg = '#0D4D4D',
            bg = '#02010d',
          }
        end,
      }
      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },
}
