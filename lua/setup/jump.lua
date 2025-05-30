function Jumpiiii()
  vim.cmd 'stopinsert'
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor_pos[1], cursor_pos[2]
  local line = vim.api.nvim_get_current_line()
  local text_after_cursor = line:sub(col + 2)

  if text_after_cursor == '' then
    vim.api.nvim_feedkeys('a', 'n', false)

    return
  end

  local targets = { ')', '}', ']', '>', '"', "'", '`' }
  local min_pos = math.huge

  for _, target in ipairs(targets) do
    local pos = text_after_cursor:find(target, 1, true)
    if pos and pos < min_pos then
      min_pos = pos
    end
  end
  if min_pos < math.huge then
    vim.api.nvim_win_set_cursor(0, { row, col + min_pos + 1 })
  end
  vim.api.nvim_feedkeys('a', 'n', false)
end

vim.keymap.set('i', '<C-l>', Jumpiiii, { desc = 'Jump ', silent = true, nowait = true })
