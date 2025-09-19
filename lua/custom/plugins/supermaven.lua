return {

  'supermaven-inc/supermaven-nvim',
  -- lazy = true,
  -- sick of it's login prompts! on clone!
  -- load manually! it's logged in and started anyways!
  opts = {
    ignore_filetypes = { cpp = true, oil = true },
    keymaps = {
      accept_suggestion = '<M-y>',
      clear_suggestion = '<M-c>',
      accept_word = "<M-'>",
    },
    log_level = 'info',
  },
}
