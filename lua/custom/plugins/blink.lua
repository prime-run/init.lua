return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  opts = {
    snippets = { preset = 'luasnip' },

    keymap = {
      preset = 'default',
      -- ['<C-e>'] = {},
      ['<C-e>'] = {
        function(cmp)
          cmp.show { providers = { 'snippets' } }
        end,
      },

      ['<C-r>'] = {
        function(cmp)
          cmp.show { providers = { 'LSP' } }
        end,
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
    },

    sources = {
      providers = {
        snippets = {
          max_items = 4,
          score_offset = -10,
        },
      },
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      -- ghost_text = {
      --   enabled = true },
      list = {
        selection = { preselect = true, auto_insert = false },
      },
      keyword = {
        range = 'full',
        -- range = 'prefix',
      },
      menu = {
        min_width = 25,
        scrollbar = false,
        border = 'solid',
        draw = {
          padding = 1,
          gap = 4,
          treesitter = { 'lsp' },
          columns = {
            -- { 'label', 'label_description', gap = 1 },
            { 'label', 'label_description', gap = 1 },
            { 'kind', 'source_name', gap = 1 },
            -- { 'kind_icon', 'kind' },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 150,
        treesitter_highlighting = true,

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
          scrollbar = false,
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
