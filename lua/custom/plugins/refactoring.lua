return {
  {
    'ThePrimeagen/refactoring.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    -- stylua: ignore
    keys = {
      { '<leader>rf', function() require('refactoring').refactor 'Extract Function' end,         desc = 'Extract Function', mode = 'x' },
      { '<leader>rF', function() require('refactoring').refactor 'Extract Function To File' end, desc = 'Extract Function To File', mode = 'x' },
      { '<leader>rI', function() require('refactoring').refactor 'Inline Function' end,          desc = 'Inline Function', mode = 'x' },
      { '<leader>rv', function() require('refactoring').refactor 'Extract Variable' end,         desc = 'Extract Variable', mode = 'v' },
      { '<leader>ri', function() require('refactoring').refactor 'Inline Variable' end,          desc = 'Inline Variable', mode = { 'n', 'x' } },
      { '<leader>rb', function() require('refactoring').refactor 'Extract Block' end,            desc = 'Extract Block' },
      { '<leader>rB', function() require('refactoring').refactor 'Extract Block To File' end,    desc = 'Extract Block To File' },
      { '<leader>rP', function() require('refactoring').debug.printf { below = false } end,      desc = 'Debug Print' },
      { '<leader>rp', function() require('refactoring').debug.print_var { normal = true } end,   desc = 'Debug Print Variable' },
      { '<leader>rc', function() require('refactoring').debug.cleanup {} end,                    desc = 'Debug Cleanup' },
    },
    config = function()
      require('refactoring').setup {
        prompt_func_return_type = {
          go = true,
          java = true,
          cpp = true,
          c = true,
        },
        prompt_func_param_type = {
          go = true,
          java = true,
          cpp = true,
          c = true,
        },
        printf_statements = {},
        print_var_statements = {},
        show_success_message = true, -- shows a message with information about the refactor on success
        -- i.e. [Refactor] Inlined 3 variable occurrences
      }

      require('telescope').load_extension 'refactoring'
    end,
  },
}
