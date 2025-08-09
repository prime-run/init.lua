return {
  --
  -- TODO:
  -- single require mini stuff
  'nvim-telescope/telescope.nvim',
  -- event = 'VimEnter',
  tag = '0.1.8',
  -- branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', lazy = true, enabled = true },
    { 'jvgrootveld/telescope-zoxide' },
  },
  config = function()
    -- local ignore_patterns = require('tmp').get_vimignore_patterns()
    require('telescope').setup {
      defaults = {
        horizontal_padding = 5,
        vertical_padding = 5,
        prompt_prefix = ' ❯ ',
        -- preview_cutoff = 10,
        color_devicons = true,
        --   mappings = {
        -- i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        file_ignore_patterns = {
          'node_modules/',
          '.git/',
          '__pycache__/',
          '%.o',
          '%.a',
          '%.out',
          '%.class',
          '%.pdf',
          '%.mkv',
          '%.mp4',
          '%.zip',
          '%.jpg',
          '%.jpeg',
          '%.png',
          '%.gif',
          '%.webp',
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        zoxide = {
          prompt_title = 'dvd me',
          mappings = {
            ['<C-j>'] = {
              action = function(selection)
                vim.cmd.tcd(selection.path)
                vim.schedule(function()
                  vim.cmd 'e .'
                end)
              end,
            },
            -- ["<C-s>"] = { action = z_utils.create_basic_command("split") },
            -- ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
            -- ['<C-e>'] = { action = require('telescope._extensions.zoxide.utils').create_basic_command 'edit' },
            -- ["<C-f>"] = {
            --   keepinsert = true,
            --   action = function(selection)
            --     builtin.find_files({ cwd = selection.path })
            --   end,
            -- },
          },
        },
      },
    }

    local t = require 'telescope'
    pcall(t.load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.fd, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fc', t.extensions.zoxide.list)
    vim.keymap.set('n', '<leader>sq', function()
      builtin.diagnostics(require('telescope.themes').get_ivy {
        layout_config = {
          height = 20,
        },
        prompt_title = '',
        preview_title = '',
        result_title = '',
        initial_mode = 'normal',
      })
    end, { desc = '[S]earch Recent Files ("." for repeat)' })

    vim.keymap.set('n', '<leader><leader>', function()
      builtin.current_buffer_fuzzy_find {
        fuzzy = false,
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
        layout_config = {
          width = 0.5,
          height = 0.7,
          prompt_position = 'top',
        },
        previewer = false,
      }
    end, { desc = '[/] NON Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>b', function()
      builtin.buffers(require('telescope.themes').get_dropdown {
        sort_mru = true,
        ignore_current_buffer = true,
        previewer = false,
        initial_mode = 'normal',
        attach_mappings = function(prompt_bufnr, map)
          map('i', '<Tab>', 'move_selection_next')
          map('i', '<S-Tab>', 'move_selection_previous')
          return true
        end,
      })
    end, { desc = '[ ] Find existing buffers' })

    local function get_sorted_buffers()
      local buffers = {}
      local current = vim.fn.bufnr()
      for _, bufnr in ipairs(vim.fn.getbufinfo { buflisted = 1 }) do
        if bufnr.bufnr ~= current then
          table.insert(buffers, bufnr.bufnr)
        end
      end
      table.sort(buffers, function(a, b)
        return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
      end)

      return buffers
    end

    local function jump_to_buffer(n)
      local buffers = get_sorted_buffers()
      if #buffers >= n then
        vim.api.nvim_set_current_buf(buffers[n])
      end
    end

    vim.api.nvim_create_user_command('Bjump', function(opts)
      local n = tonumber(opts.args)
      if n then
        jump_to_buffer(n)
      end
    end, {
      nargs = 1,
      desc = 'Bjump to n',
    })

    vim.keymap.set('n', '<leader>1', function()
      jump_to_buffer(1)
    end, { desc = 'Jump to previous buffer' })

    vim.keymap.set('n', '<leader>2', function()
      jump_to_buffer(2)
    end, { desc = 'Jump to second most recent buffer' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find {
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = 'top',
        },
        previewer = false,
      }
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    require('custom.filters.rg_filters').setup()
  end,
}
