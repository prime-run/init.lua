return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      -- local pattern = '([^:]+):(%d+):(%d+): %[([^%]]+)%] (.+)'
      -- local groups = { 'lnum', 'col', 'code', 'message' }
      -- local rumdl_parser = require('lint.parser').from_pattern(
      --   pattern,
      --   groups,
      --   {}, --TODO: maybe add severity maps later?
      --   { source = 'rumdl', severity = vim.diagnostic.severity.WARN }
      -- )
      --
      -- lint.linters.rumdl = {
      --   cmd = 'rumdl',
      --   stdin = false,
      --   append_fname = true,
      --   args = { 'check' },
      --   stream = 'stdout',
      --   ignore_exitcode = true,
      --   env = nil,
      --   parser = rumdl_parser,
      -- }
      --
      lint.linters.rumdl = {
        cmd = 'rumdl',
        stdin = false,
        append_fname = true,
        args = { 'check' },
        stream = 'stdout',
        ignore_exitcode = true,
        env = nil,
        parser = require('lint.parser').from_pattern('([^:]+):(%d+):(%d+): %[([^%]]+)%] (.+)', {
          'file',
          'lnum',
          'col',
          'code',
          'message',
        }, {}, {
          source = 'rumdl',
          severity = vim.diagnostic.severity.WARN,
        }),
      }

      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft['markdown'] = { 'markdownlint' }

      -- lint.linters_by_ft = {
      --   markdown = { 'rumdl', 'markdownlint' },
      -- }

      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      --
      -- You can disable the default linters by setting their filetypes to nil:
      lint.linters_by_ft['clojure'] = nil
      lint.linters_by_ft['dockerfile'] = nil
      lint.linters_by_ft['inko'] = nil
      lint.linters_by_ft['janet'] = nil
      lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      lint.linters_by_ft['rst'] = nil
      lint.linters_by_ft['ruby'] = nil
      lint.linters_by_ft['terraform'] = nil
      lint.linters_by_ft['text'] = nil

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
