return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  keys = {
    -- stylua: ignore
    { '-', function() require('oil').toggle_float('') end, desc = 'Open Oil in parent dir', },
    { '<leader>-', function () require('oil').toggle_float() end, desc = 'Open oil in current dir'}
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['<Esc>'] = { callback = 'actions.close', mode = 'n' },
    },
  },
}
