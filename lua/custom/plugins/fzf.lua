return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
  -- FIX: HAD TO BE BUILT FROM SOUCE MANUALLY! IGNORE ABOVE BUILD COMMAND!
  -- luarocks issues might be! just build form source!
  require('telescope').setup {
    extensions = {
      -- fzf = {
      --   fuzzy = true, -- false will only do exact matching
      --   override_generic_sorter = true, -- override the generic sorter
      --   override_file_sorter = true, -- override the file sorter
      --   case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      --   -- the default case_mode is "smart_case"
      -- },
    },
  },
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  -- require('telescope').load_extension 'fzy_native',
  require('telescope').load_extension 'fzf',
}
