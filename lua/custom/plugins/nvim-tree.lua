return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    init = function()
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
    end,
    opts = function()
      return {
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'
          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
          vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close directory')
        end,
        filters = { dotfiles = false },
        disable_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          width = 45,
          preserve_window_proportions = true,
          side = 'right',
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            git_placement = 'after',
            glyphs = {
              default = '󰈚',
              folder = {
                default = '',
                empty = '',
                empty_open = '',
                open = '',
                symlink = '',
              },
              git = { unmerged = '' },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 100,
        },
      }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = function()
      return {
        default_icon = { icon = '󰈚', name = 'Default' },
        js = { icon = '󰌞', name = 'js' },
        ts = { icon = '󰛦', name = 'ts' },
        lock = { icon = '󰌾', name = 'lock' },
        ['robots.txt'] = { icon = '󰚩', name = 'robots' },
      }
    end,
  },
}
