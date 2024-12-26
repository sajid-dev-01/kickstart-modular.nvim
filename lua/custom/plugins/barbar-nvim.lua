return {
  'romgrk/barbar.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    vim.keymap.set('n', '<S-l>', '<cmd>BufferNext<cr>', { desc = 'Next Buffer' })
    vim.keymap.set('n', '<S-h>', '<cmd>BufferPrevious<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<cr>', { desc = 'Next Buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferPrevious<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', '<leader>bd', '<cmd>BufferClose<cr>', { desc = '[b]uffer [d]elete' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferCloseAllButCurrent<cr>', { desc = '[b]uffer delete [o]thers' })
    vim.keymap.set('n', '<leader>bn', '<Cmd>BufferMoveNext<CR>', { desc = '[b]uffer move [n]ext' })
    vim.keymap.set('n', '<leader>bp', '<Cmd>BufferMovePrevious<CR>', { desc = '[b]uffer move [p]revious' })
  end,
  opts = {
    animation = true,
  },
}
