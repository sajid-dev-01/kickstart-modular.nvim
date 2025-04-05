-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>qo', vim.diagnostic.setloclist, { desc = '[Q]uickfix list [o]pen diagnostic' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- custom keymap
local map = vim.keymap.set

-- map('n', '<C-d>', '<C-d>zz')
-- map('n', '<C-u>', '<C-u>zz')

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

map('i', 'jj', '<ESC>')
-- insert mode navigation
map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- windows
map('n', '<leader>w', '<C-w>', { remap = true })
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- buffers
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- package manager
map('n', '<leader>pl', '<cmd>Lazy <cr>', { desc = '[L]azy plugin manager' })
map('n', '<leader>pm', '<cmd>Mason <cr>', { desc = '[M]ason package manager' })

-- vim: ts=2 sts=2 sw=2 et
