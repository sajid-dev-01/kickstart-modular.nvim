return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = ' ', key = 'b', desc = 'Browse Repo', action = ':lua Snacks.gitbrowse()' },
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        -- Used by the `header` section
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      -- item field formatters
      formats = {
        -- icon = function(item)
        --   if item.file and item.icon == 'file' or item.icon == 'directory' then
        --     return M.icon(item.file, item.icon)
        --   end
        --   return { item.icon, width = 2, hl = 'icon' }
        -- end,
        footer = { '%s', align = 'center' },
        header = { '%s', align = 'center' },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ':~')
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          local dir, file = fname:match '^(.*)/(.+)$'
          return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
        end,
      },
      sections = {
        { section = 'header' },
        {
          icon = ' ',
          title = 'Keymaps',
          section = 'keys',
          indent = 2,
          padding = 2,
        },
        {
          icon = ' ',
          title = 'Recent Files',
          section = 'recent_files',
          indent = 2,
          padding = 2,
        },
        {
          icon = ' ',
          title = 'Projects',
          section = 'projects',
          indent = 2,
          padding = 2,
        },
        -- function()
        --   local in_git = Snacks.git.get_root() ~= nil
        --   local cmds = {
        --     {
        --       title = 'Notifications',
        --       cmd = 'gh notify -s -a -n5',
        --       action = function()
        --         vim.ui.open 'https://github.com/notifications'
        --       end,
        --       key = 'n',
        --       icon = ' ',
        --       height = 5,
        --       enabled = true,
        --     },
        --     {
        --       title = 'Open Issues',
        --       cmd = 'gh issue list -L 3',
        --       key = 'i',
        --       action = function()
        --         vim.fn.jobstart('gh issue list --web', { detach = true })
        --       end,
        --       icon = ' ',
        --       height = 7,
        --     },
        --     {
        --       icon = ' ',
        --       title = 'Open PRs',
        --       cmd = 'gh pr list -L 3',
        --       key = 'P',
        --       action = function()
        --         vim.fn.jobstart('gh pr list --web', { detach = true })
        --       end,
        --       height = 7,
        --     },
        --     {
        --       icon = ' ',
        --       title = 'Git Status',
        --       cmd = 'git --no-pager diff --stat -B -M -C',
        --       height = 8,
        --     },
        --   }
        --   return vim.tbl_map(function(cmd)
        --     return vim.tbl_extend('force', {
        --       pane = 2,
        --       section = 'terminal',
        --       enabled = in_git,
        --       padding = 1,
        --       ttl = 5 * 60,
        --       indent = 3,
        --     }, cmd)
        --   end, cmds)
        -- end,
        { section = 'startup' },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { '<leader>un',  function() Snacks.notifier.hide() end,           desc = 'Dismiss All Notifications' },
    { '<leader>bD',  function() Snacks.bufdelete() end,               desc = 'Delete Buffer' },
    { '<leader>gg',  function() Snacks.lazygit() end,                 desc = 'Lazygit' },
    { '<leader>gb',  function() Snacks.git.blame_line() end,          desc = 'Git Blame Line' },
    { '<leader>gB',  function() Snacks.gitbrowse() end,               desc = 'Git Browse' },
    { '<leader>gf',  function() Snacks.lazygit.log_file() end,        desc = 'Lazygit Current File History' },
    { '<leader>gl',  function() Snacks.lazygit.log() end,             desc = 'Lazygit Log (cwd)' },
    { '<leader>crF', function() Snacks.rename() end,                  desc = 'Rename File' },
    { '<leader>ut',  function() Snacks.terminal() end,                desc = 'Toggle Terminal' },
    { ']]',          function() Snacks.words.jump(vim.v.count1) end,  desc = 'Next Reference', mode = { 'n', 't' } },
    { '[[',          function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
    {
      '<leader>N',
      desc = 'Neovim News',
      function()
        Snacks.win {
          file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = 'yes',
            statuscolumn = ' ',
            conceallevel = 3,
          },
        }
      end,
    },
  },
  init = function()
    -- stylua: ignore
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.animate():                                                                                   map '<leader>ua'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):              map '<leader>ub'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.diagnostics():                                                                               map '<leader>ud'
        Snacks.toggle.dim():                                                                                       map '<leader>uD'
        Snacks.toggle.inlay_hints():                                                                               map '<leader>uh'
        Snacks.toggle.indent():                                                                                    map '<leader>ui'
        Snacks.toggle.line_number():                                                                               map '<leader>ul'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):                                      map '<leader>uL'
        Snacks.toggle.scroll():                                                                                    map '<leader>us'
        Snacks.toggle.option('spell', { name = 'Spelling' }):                                                      map '<leader>uS'
        Snacks.toggle.treesitter():                                                                                map '<leader>uT'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):                                                           map '<leader>uw'
        Snacks.toggle.words():                                                                                     map '<leader>uW'
        Snacks.toggle.zoom():                                                                                      map '<leader>uz'
        Snacks.toggle.zen():                                                                                       map '<leader>uZ'
      end,
    })
  end,
}
