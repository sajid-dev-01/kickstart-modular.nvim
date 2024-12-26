-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
    },
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end,                      desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end,                      desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>xT", "<cmd>Trouble todo toggle<cr>",                                   desc = "Todo (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",                 desc = "[S]earch Todo/Fix/Fixme" },
      { "<leader>sT", "<cmd>TodoTelescope<cr>",                                         desc = "[S]earch all [T]odo" },
      { "<leader>ft", "<cmd>TodoFzfLua keywords=TODO,FIX,FIXME<cr>",                    desc = "[f]ind Todo/Fix/Fixme" },
      { "<leader>fT", "<cmd>TodoFzfLua<cr>",                                            desc = "[f]ind all [T]odo" },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
