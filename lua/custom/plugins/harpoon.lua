return {
  'ThePrimeagen/harpoon',
  lazy = true,
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>H',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[H]arpoon file',
    },
    {
      '<leader>h',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[h]arpoon quick menu',
    },
  },
}
