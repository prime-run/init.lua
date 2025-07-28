function GetWindowAndBufferInfo(buf_id)
  local current_win_id = vim.api.nvim_get_current_win()
  print('Current window ID: ' .. current_win_id)

  local target_buf_id = buf_id or vim.api.nvim_get_current_buf()
  print('Using buffer ID: ' .. target_buf_id .. ' to find its window.')

  local win_id_from_buf = vim.fn.bufwinid(target_buf_id)

  if win_id_from_buf ~= -1 then
    print('Found window ID ' .. win_id_from_buf .. ' associated with buffer ' .. target_buf_id)
  else
    print('Buffer ' .. target_buf_id .. ' is not currently open in any window.')
  end

  local windows_for_buffer = {}
  for _, win_id in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win_id) == target_buf_id then
      table.insert(windows_for_buffer, win_id)
    end
  end

  if #windows_for_buffer > 0 then
    print('All window(s) displaying buffer ' .. target_buf_id .. ': ' .. table.concat(windows_for_buffer, ', '))
  else
    print('No windows found displaying buffer ' .. target_buf_id)
  end
end

function FocusWindowByID(win_id)
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_set_current_win(win_id)
    print('Focused window ID: ' .. win_id)
  else
    print 'Invalid or missing window ID provided.'
  end
end
