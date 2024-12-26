return {
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPost',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'roobert/tailwindcss-colorizer-cmp.nvim',
        opts = { color_square_width = 2 },
      },
    },
    opts = function(_, opts)
      opts.formatting = {
        format = require('tailwindcss-colorizer-cmp').formatter,
      }
    end,
  },
}
