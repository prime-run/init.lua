return {
  'olimorris/onedarkpro.nvim',
  config = function()
    require('onedarkpro').setup {
      colors = {}, -- Override default colors or create your own
      highlights = {
        Comment = { italic = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
        BlinkCmpMenu = { bg = '#0d1117' }, -- GitHub dark background
        BlinkCmpMenuBorder = { fg = '#0a0e14', bg = '#0d1117' }, -- Slightly darker border
        BlinkCmpDoc = { bg = '#0d1117' }, -- GitHub dark background
        BlinkCmpDocBorder = { fg = '#0a0e14', bg = '#0d1117' }, -- Slightly darker border
      },
      styles = { -- For example, to apply bold and italic, use "bold,italic"
        types = 'NONE', -- Style that is applied to types
        methods = 'NONE', -- Style that is applied to methods
        numbers = 'NONE', -- Style that is applied to numbers
        strings = 'NONE', -- Style that is applied to strings
        comments = 'italic', -- Style that is applied to comments
        keywords = 'NONE', -- Style that is applied to keywords
        constants = 'NONE', -- Style that is applied to constants
        functions = 'NONE', -- Style that is applied to functions
        operators = 'NONE', -- Style that is applied to operators
        variables = 'NONE', -- Style that is applied to variables
        parameters = 'bold,italic', -- Style that is applied to parameters
        conditionals = 'NONE', -- Style that is applied to conditionals
        virtual_text = 'NONE', -- Style that is applied to virtual text
      },
      filetypes = { -- Override which filetype highlight groups are loaded
        c = true,
        comment = true,
        go = true,
        html = true,
        java = true,
        javascript = true,
        json = true,
        lua = true,
        markdown = true,
        php = true,
        python = true,
        ruby = true,
        rust = true,
        scss = true,
        toml = true,
        typescript = true,
        typescriptreact = true,
        vue = true,
        xml = true,
        yaml = true,
      },
      plugins = { -- Override which plugin highlight groups are loaded
        aerial = true,
        barbar = true,
        blink_cmp = false,
        codecompanion = true,
        copilot = true,
        dashboard = true,
        flash_nvim = true,
        gitgraph_nvim = true,
        gitsigns = true,
        hop = true,
        indentline = true,
        leap = true,
        lsp_saga = true,
        lsp_semantic_tokens = true,
        marks = true,
        mini_diff = true,
        mini_icons = true,
        mini_indentscope = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
        nvim_lsp = true,
        nvim_navic = true,
        nvim_notify = true,
        nvim_tree = true,
        nvim_ts_rainbow = true,
        op_nvim = true,
        packer = true,
        persisted = true,
        polygot = true,
        rainbow_delimiters = true,
        render_markdown = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = true,
        which_key = true,
        vim_dadbod_ui = true,
      },

      options = {
        cursorline = true, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        lualine_transparency = false, -- Center bar transparency?
        highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
      },
    }
  end,
}
