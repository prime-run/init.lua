--TODO:Update this config! holly molly blink is moving fast gg ++++
return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  opts = {
    -- snippets = { preset = 'luasnip' },
    keymap = {
      preset = 'default',
      ['<C-e>'] = {},
      ['<C-space>'] = {
        function(cmp)
          cmp.show { providers = { 'snippets' } }
        end,
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
    },

    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    completion = {
      list = {
        selection = { preselect = true, auto_insert = false },
      },
      keyword = {
        range = 'full',
      },
      menu = {
        border = 'solid',
        -- min_width = 50,
        scrollbar = false,
        draw = {
          padding = { 1, 2 },
          treesitter = { 'lsp' },
          columns = {
            -- { 'label', 'label_description', gap = 1 },
            { 'label', 'label_description', gap = 1 },
            { 'kind', 'kind_icon', 'source_name' },
            -- { 'kind_icon', 'kind' },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 150,
        window = {
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
          min_width = 15,
          -- border = 'solid',
          -- scrollbar = false,
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true, window = {
      border = 'padded',
      min_width = 15,
    } },
  },
  opts_extend = { 'sources.default' },
}
