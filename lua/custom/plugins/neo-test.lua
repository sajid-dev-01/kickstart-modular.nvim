return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'mfussenegger/nvim-dap',
      optional = true,
      -- stylua: ignore
      keys = {
        { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest" },
      },
    },
    -- adapters
    { 'fredrikaverpil/neotest-golang', ft = 'go' },
    { 'marilari88/neotest-vitest', ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' } },
    { 'haydenmeade/neotest-jest', ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' } },
  },
  -- stylua: ignore
  keys = {
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files (Neotest)" },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last (Neotest)" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (Neotest)" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
  },
  config = function()
    ---@diagnostic disable: missing-fields
    require('neotest').setup {
      adapters = {
        require 'neotest-golang',
        require 'neotest-vitest',
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}
