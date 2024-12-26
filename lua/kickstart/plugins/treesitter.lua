return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        enabled = false,
        opts = {
          max_lines = 5,
          multiline_threshold = 1,
        },
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        init = function()
          local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

          vim.keymap.set({ 'x', 'o' }, 'gL', '', { desc = '' })

          vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
          vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
        end,
      },
    },
    init = function()
      -- blank keymap for keymap desc
      vim.keymap.set('n', '<leader>ra', '', { desc = '[r]efactor [a]rgument' })
      vim.keymap.set('n', '<leader>rm', '', { desc = '[r]efactor [m]ethod' })
      vim.keymap.set('n', '<cr>', '', { desc = 'Incremental nodes selecting' })
    end,
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<cr>',
          node_incremental = '<cr>',
          scope_incremental = false,
          node_decremental = '<Bs>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['a='] = { query = '@assignment.outer', desc = 'outer assignment' },
            ['i='] = { query = '@assignmrepeat_last_movent.inner', desc = 'inner assignment' },
            ['L='] = { query = '@assignment.lhs', desc = 'left side of assignment' },
            ['R='] = { query = '@assignment.rhs', desc = 'right side of assignment' },

            ['ac'] = { query = '@class.outer', desc = 'outer class' },
            ['ic'] = { query = '@class.inner', desc = 'inner class' },
            ['af'] = { query = '@function.outer', desc = 'outer method/function' },
            ['if'] = { query = '@function.inner', desc = 'inner method/function' },
            ['au'] = { query = '@call.outer', desc = 'outer function call' },
            ['iu'] = { query = '@call.inner', desc = 'inner function call' },
            ['ai'] = { query = '@conditional.outer', desc = 'outer conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'inner conditional' },
            ['aa'] = { query = '@parameter.outer', desc = 'outer argument/parameter' },
            ['ia'] = { query = '@parameter.inner', desc = 'inner argument/parameter' },
            ['al'] = { query = '@loop.outer', desc = 'outer loop' },
            ['il'] = { query = '@loop.inner', desc = 'inner loop' },

            ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>ran'] = '@parameter.inner', -- swap parameters/argument with next
            ['<leader>rmn'] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>rap'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>rmp'] = '@function.outer', -- swap function with previous
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
