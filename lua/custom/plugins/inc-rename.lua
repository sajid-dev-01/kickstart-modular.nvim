return {
  {
    'smjonas/inc-rename.nvim',
    lazy = true,
    config = function()
      require('inc_rename').setup {}

      vim.keymap.set('n', '<leader>cR', function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end, { desc = 'IncRename: [c]ode [R]ename', expr = true })
    end,
  },
  --- Noice integration
  {
    'folke/noice.nvim',
    optional = true,
    opts = {
      presets = { inc_rename = true },
    },
  },
}
