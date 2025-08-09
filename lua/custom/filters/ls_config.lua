vim.keymap.set('n', '<leader>fhc', function()
  require('telescope.builtin').find_files {
    cwd = vim.fn.expand '~/.config',
    find_command = { 'fd', '.', '--type', 'd', '--max-depth', '1', '--hidden' },
    prompt_title = '~/.config',
    previewer = false,
    attach_mappings = function(_, map)
      -- local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'

      local function change_to_dir(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local cwd = action_state.get_current_picker(prompt_bufnr).cwd
        local full_path = cwd .. '/' .. selection.value
        vim.cmd('cd ' .. vim.fn.fnameescape(full_path))
        -- vim.cmd 'Oil'
        -- require('oil.actions').cd.callback()
      end
      map('n', '<CR>', change_to_dir)
      return true
    end,
  }
end, { desc = '[F]find [C]infig dir' })
