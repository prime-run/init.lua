return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  opts = {
    snippets = { preset = 'luasnip' },

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
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      list = {
        selection = { preselect = true, auto_insert = false },
      },
      keyword = {
        range = 'full',
      },
      menu = {
        min_width = 25,
        scrollbar = false,
        border = 'solid',
        draw = {
          padding = { 2, 2 },
          treesitter = { 'lsp' },
          columns = {
            -- { 'label', 'label_description', gap = 1 },
            { 'label', 'label_description', gap = 2 },
            { 'kind', 'source_name' },
            -- { 'kind_icon', 'kind' },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 150,
        draw = function(opts)
          if opts.item and opts.item.documentation then
            local out = require('pretty_hover.parser').parse(opts.item.documentation.value)
            opts.item.documentation.value = out:string()
          end

          opts.default_implementation(opts)
        end,
        window = {
          border = 'solid',
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
          min_width = 25,
          -- border = 'solid',
          -- scrollbar = false,
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    cmdline = {
      keymap = { preset = 'inherit' },
      completion = { menu = { auto_show = true } },
    },
    signature = { enabled = true, window = {
      border = 'padded',
      min_width = 15,
    } },
  },
  opts_extend = { 'sources.default' },
}
