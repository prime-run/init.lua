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
          -- sidebars = 'dark',
          -- floats = 'dark',
        },

        on_highlights = function(highlights)
          local prompts = '#1A1A22'
          local mid = '#000000'
          local darkest = '#05050A'
          local sec = '#CA001E'
          local prompts_drk = '#0F0F14'

          highlights.TelescopePromptNormal = { fg = '#FFFFFF', bg = prompts }
          highlights.TelescopePromptBorder = { fg = prompts, bg = prompts }
          highlights.TelescopePromptTitle = {}
          highlights.TelescopePromptPrefix = { fg = '#C586C0', bold = true }

          -- highlights.TelescopePreviewNormal = { fg = '#A0C0D0', bg = mid }
          -- highlights.TelescopePreviewBorder = { fg = mid, bg = mid }
          highlights.TelescopePreviewNormal = { fg = '#A0C0D0', bg = prompts }
          highlights.TelescopePreviewBorder = { fg = prompts, bg = prompts }
          highlights.TelescopePreviewTitle = {}

          highlights.TelescopeResultsNormal = { fg = '#A0C0D0', bg = darkest }
          highlights.TelescopeResultsBorder = { fg = darkest, bg = darkest }
          highlights.TelescopeResultsTitle = {}

          highlights.TelescopeSelection = { fg = '#FFFFFF', bg = '#252530' }

          highlights.TelescopeMatching = { fg = '#C586C0', bold = true }

          ------CMP
          highlights.CmpPmenu = { fg = '#A0C0D0', bg = '#07070F' }
          highlights.CmpPmenuSel = { fg = '#FFFFFF', bg = '#252530' }
          highlights.CmpPmenuBorder = { fg = '#07070F', bg = '#07070F' }
          highlights.CmpPmenuSbar = { bg = '#0A0A10' }
          highlights.CmpPmenuThumb = { bg = '#4A4A4A' }

          highlights.CmpItemAbbr = { fg = '#A0C0D0' }
          highlights.CmpItemAbbrMatch = { fg = '#C586C0', bold = true }
          highlights.CmpItemKind = { fg = '#7FD1E0' }
          highlights.CmpItemKindFunction = { fg = '#A0C0D0' }
          highlights.CmpItemKindMethod = { fg = '#A0C0D0' }
          highlights.CmpItemKindVariable = { fg = '#FFC66D' }
          highlights.CmpItemKindKeyword = { fg = '#C586C0' }
          highlights.CmpItemKindSnippet = { fg = '#A0C0D0' }
          highlights.CmpItemKindProperty = { fg = '#C586C0' }
          highlights.CmpItemKindField = { fg = '#FFC66D' }
          highlights.CmpItemKindEnum = { fg = '#80D4A0' }
          highlights.CmpItemKindInterface = { fg = '#7FD1E0' }
          highlights.CmpItemKindText = { fg = '#A0C0D0' }
          highlights.CmpItemKindClass = { fg = '#80D4A0' }
          highlights.CmpItemMenu = { fg = '#607080' }

          highlights.CmpDoc = { fg = '#A0C0D0', bg = '#05050A' }
          highlights.CmpDocBorder = { fg = '#05050A', bg = '#05050A' }

          highlights.BlinkCmpDoc = { fg = '#A0C0D0', bg = prompts }
          highlights.BlinkCmpDocBorder = { fg = prompts, bg = prompts }

          highlights.BlinkCmpMenu = { fg = '#A0C0D0', bg = prompts_drk }
          highlights.BlinkCmpMenuBorder = { fg = '#A0C0D0', bg = prompts_drk }

          highlights.BlinkCmpLabelMatch = { fg = '#C586C0', bold = true }

          --------global
          highlights.FloatBorder = { fg = prompts_drk, bg = prompts_drk }
          highlights.NormalFloat = { fg = '#A0C0D0', bg = prompts_drk }

          highlights.DiagnosticUnnecessary = {
            fg = '#8E92AB',
            bg = 'NONE',
          }
          -- inlay
          highlights.LspInlayHint = {
            bg = 'NONE',
            fg = '#3D4267',
          }
        end,
      }

      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },
}
