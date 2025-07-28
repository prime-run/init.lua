local function jump_to_buffer(n)
  local buffers = get_sorted_buffers()
  if #buffers >= n then
    vim.api.nvim_set_current_buf(buffers[n])
  end
end
