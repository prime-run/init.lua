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
          local darkest = '#ffffff'
          local sec = '#CA001E'
          local prompts_drk = '#0F0F14'

          -- highlights.Normal = { bg = '#020811' }
          highlights.TelescopePromptNormal = { fg = '#FFFFFF', bg = prompts }
          highlights.TelescopePromptBorder = { fg = prompts, bg = prompts }
          highlights.TelescopePromptTitle = {}
          highlights.TelescopePromptPrefix = { fg = '#C586C0', bold = true }

          -- highlights.TelescopePreviewNormal = { fg = '#A0C0D0', bg = mid }
          -- highlights.TelescopePreviewBorder = { fg = mid, bg = mid }
          highlights.TelescopePreviewNormal = { fg = '#A0C0D0', bg = prompts }
          highlights.TelescopePreviewBorder = { fg = prompts, bg = prompts }
          highlights.TelescopePreviewTitle = {}

          highlights.TelescopeResultsNormal = { bg = '#1F1F1F' }
          highlights.TelescopeResultsBorder = { bg = '#1F1F1F' }

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

          highlights.DiagnosticVirtualTextHint = { bg = '#25270e', fg = '#FFBA03' }
          highlights.DiagnosticVirtualTextError = { bg = '#130707', fg = '#FF0000' }
          highlights.DiagnosticHint = { fg = '#009955' }

          --------global
          highlights.FloatBorder = { fg = '#1F1F1F', bg = '#1F1F1F' }
          highlights.NormalFloat = { fg = '#1F1F1F', bg = '#1F1F1F' }

          highlights.DiagnosticUnnecessary = {
            fg = '#000000',
            bg = 'NONE',
          }
          -- inlay
          highlights.LspInlayHint = {
            bg = 'NONE',
            fg = '#3D4267',
          }

          -- Fidget

          highlights.LineNrAbove = { fg = '#017DC5' }
          highlights.LineNrBelow = { fg = '#017DC5' }
          -- highlights.String = { fg = '#00a67d' }
          -- highlights.property = { fg = '#00a67d' }
        end,
      }

      vim.cmd.colorscheme 'tokyonight-moon'
      vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#F3C623' })
      vim.api.nvim_set_hl(0, '@module', { fg = '#00FF9c' })
    end,
  },
}
