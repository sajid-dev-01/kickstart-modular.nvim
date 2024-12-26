return {
  'akinsho/toggleterm.nvim',
  lazy = true,
  cmd = { 'ToggleTerm' },
  init = function()
    -- for which key desc
    vim.keymap.set({ 'n', 't' }, '<leader>T', '', { desc = '[T]erminal' })

    vim.keymap.set({ 'n', 't' }, '<leader>Th', '<cmd>ToggleTerm direction=horizontal <cr>', { desc = 'terminal horizontal' })
    vim.keymap.set({ 'n', 't' }, '<leader>Tv', '<cmd>ToggleTerm direction=vertical <cr>', { desc = 'terminal vertical' })
    vim.keymap.set({ 'n', 't' }, '<leader>Tf', '<cmd>ToggleTerm direction=float <cr>', { desc = 'terminal floating' })
  end,
  opts = {
    float_opts = {
      border = 'curved',
    },
  },
}
