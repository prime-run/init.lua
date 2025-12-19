local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

-- Ensure dynamic nodes update while editing insert nodes
ls.config.setup { update_events = 'TextChanged,TextChangedI' }

ls.add_snippets(
  'rust',
  ----------
  {
    s({
      trig = 'pr',
      dscr = 'print touple',
    }, {
      t 'println!("',
      i(1, ' '),
      t ' {:#?}" , (',
      i(2, 'somevalues'),
      t '));',
    }),
  },

  -------
  {
    s({
      trig = 'fn',
      dscr = 'fn todo!',
    }, {
      t 'fn ',
      i(1, 'sec'),
      t '(',
      i(2),
      t ') -> ',
      i(3, '()'),
      t { ' {', '\t' },
      i(4),
      t { '', '\ttodo!()' },
      t { '', '}' },
    }),
  }
)

ls.add_snippets('rust', {
  s({
    trig = 'stn',
    dscr = 'struct impl block and new() method',
  }, {
    t { '#[derive(Debug)]', '' },
    t 'struct ',
    i(1, 'Name'),
    t { ' {', '\t' },
    i(2, { 'f1: Type,', 'f2: Type,' }),
    t { '', '}', '', '' },
    t 'impl ',
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t { ' {', '\tfn new() -> Self {', '\t\tSelf {', '\t\t\t' },
    d(3, function(args, _, old_state)
      -- args[1] is a table of lines from i(2); join all lines for parsing
      local lines_tbl = args[1] or {}
      local fields = table.concat(lines_tbl, '\n')
      local nodes = {}
      local idx = 1
      local state = old_state or {}
      for line in (fields .. '\n'):gmatch '([^\n]*)\n' do
        local name = line:match '^%s*([%w_]+)%s*:'
        if name and #name > 0 then
          table.insert(nodes, t(name .. ': '))
          local prev = state[name]
          local inode
          if prev and prev.get_text then
            inode = i(idx, prev:get_text())
          else
            inode = i(idx, '')
          end
          table.insert(nodes, inode)
          state[name] = inode
          idx = idx + 1
          table.insert(nodes, t { ',', '\t\t\t' })
        end
      end
      if #nodes == 0 then
        nodes = { t '' }
      end
      local out = sn(nil, nodes)
      out.old_state = state
      return out
    end, { 2 }),
    t { '', '\t\t}', '\t}', '}' },
  }),
})
