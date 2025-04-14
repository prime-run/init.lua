return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false, -- Ensure it's loaded immediately
  priority = 1000, -- Load before other plugins
  config = function()
    require('rose-pine').setup {
      variant = 'moon', -- "auto", "main", "moon", or "dawn"
      dark_variant = 'moon', -- Best for blurred terminals
      extend_background_behind_borders = true,

      styles = {
        bold = true,
        italic = true,
        transparency = true, -- Enable transparency for blurred terminal
      },

      highlight_groups = {
        TelescopePromptNormal = { fg = '#A0C0D0', bg = '#1A1A22' }, -- Lighter prompt background
        TelescopePromptBorder = { fg = '#1A1A22', bg = '#1A1A22' },
        TelescopePromptTitle = { fg = '#A0C0D0', bg = '#05050A' },
        TelescopePromptPrefix = { fg = '#C586C0', bold = true },

        TelescopePreviewNormal = { fg = '#A0C0D0', bg = '#05050A' }, -- Preview as is (very dark blue/black)
        TelescopePreviewBorder = { fg = '#05050A', bg = '#05050A' },
        TelescopePreviewTitle = { fg = '#A0C0D0', bg = '#05050A' },

        TelescopeResultsNormal = { fg = '#A0C0D0', bg = '#07070F' }, -- Even darker results background
        TelescopeResultsBorder = { fg = '#07070F', bg = '#07070F' },
        TelescopeResultsTitle = { fg = '#A0C0D0', bg = '#05050A' },

        TelescopeSelection = { fg = '#FFFFFF', bg = '#252530' },

        TelescopeMatching = { fg = '#C586C0', bold = true },

        -- nvim-cmp highlights, adjusted for seamless appearance
        CmpPmenu = { fg = '#A0C0D0', bg = '#07070F' },
        CmpPmenuSel = { fg = '#FFFFFF', bg = '#252530' },
        CmpPmenuBorder = { fg = '#07070F', bg = '#07070F' }, -- Should match CmpPmenu bg
        CmpPmenuSbar = { bg = '#0A0A10' },
        CmpPmenuThumb = { bg = '#4A4A4A' },

        CmpItemAbbr = { fg = '#A0C0D0' },
        CmpItemAbbrMatch = { fg = '#C586C0', bold = true },
        CmpItemKind = { fg = '#7FD1E0' },
        CmpItemKindFunction = { fg = '#A0C0D0' },
        CmpItemKindMethod = { fg = '#A0C0D0' },
        CmpItemKindVariable = { fg = '#FFC66D' },
        CmpItemKindKeyword = { fg = '#C586C0' },
        CmpItemKindSnippet = { fg = '#A0C0D0' },
        CmpItemKindProperty = { fg = '#C586C0' },
        CmpItemKindField = { fg = '#FFC66D' },
        CmpItemKindEnum = { fg = '#80D4A0' },
        CmpItemKindInterface = { fg = '#7FD1E0' },
        CmpItemKindText = { fg = '#A0C0D0' },
        CmpItemKindClass = { fg = '#80D4A0' },
        CmpItemMenu = { fg = '#607080' },

        CmpDoc = { fg = '#A0C0D0', bg = '#05050A' }, -- Matches NormalFloat bg
        CmpDocBorder = { fg = '#05050A', bg = '#05050A' }, -- Matches NormalFloat bg and CmpDoc bg

        -- BlinkCmp specific highlights, now matching the common float bg for seamlessness
        BlinkCmpDoc = { fg = '#A0C0D0', bg = '#05050A' }, -- Matches NormalFloat bg
        BlinkCmpDocBorder = { fg = '#05050A', bg = '#05050A' }, -- Matches NormalFloat bg and BlinkCmpDoc bg
        BlinkCmpMenu = { fg = '#A0C0D0', bg = '#07070F' }, -- Matches CmpPmenu bg
        BlinkCmpLabelMatch = { fg = '#C586C0', bold = true },
        FloatBorder = { fg = '#A0C0D0', bg = '#07070F' }, -- For generic floating window borders (e.g., used by CMP docs)
        BlinkCmpMenuBorder = { fg = '#A0C0D0', bg = '#07070F' },
      },
    }

    vim.cmd 'colorscheme rose-pine'
  end,
}
