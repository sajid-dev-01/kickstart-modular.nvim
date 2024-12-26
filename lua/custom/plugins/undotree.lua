return {
  'mbbill/undotree',
  lazy = true,
  config = function()
    vim.keymap.set('n', '<leader>uu', vim.cmd.UndotreeToggle, { desc = 'toggle [u]ndotree' })
  end,
}
