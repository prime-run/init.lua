require('luasnip.session.snippet_collection').clear_snippets 'rust'

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('rust', {
  s({
    trig = 'prto',
    dscr = 'Custom println! with two placeholders',
  }, {
    t 'println!("',
    i(1, ' '),
    t '{:#?}" , (',
    i(2, 'somevalues'),
    t '));',
  }),
})
