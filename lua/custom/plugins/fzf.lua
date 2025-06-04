return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
  -- FIX: HAD TO BE BUILT FROM SOUCE MANUALLY! IGNORE ABOVE BUILD COMMAND!
  -- luarocks issues might be! just build form source!
  require('telescope').setup {
    extensions = {},
  },
  require('telescope').load_extension 'fzf',
}
