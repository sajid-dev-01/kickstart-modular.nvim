return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local config = require 'fzf-lua.config'
    local actions = require 'fzf-lua.actions'

    -- Quickfix
    config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
    config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
    config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
    config.defaults.keymap.fzf['ctrl-x'] = 'jump'
    config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
    config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
    config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
    config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'

    local img_previewer ---@type string[]?
    for _, v in ipairs {
      { cmd = 'ueberzug', args = {} },
      { cmd = 'chafa', args = { '{file}', '--format=symbols' } },
      { cmd = 'viu', args = { '-b' } },
    } do
      if vim.fn.executable(v.cmd) == 1 then
        img_previewer = vim.list_extend({ v.cmd }, v.args)
        break
      end
    end

    return {
      fzf_colors = true,
      -- fzf_opts = { ['--no-scrollbar'] = true },
      previewers = {
        builtin = {
          extensions = {
            ['png'] = img_previewer,
            ['jpg'] = img_previewer,
            ['jpeg'] = img_previewer,
            ['gif'] = img_previewer,
            ['webp'] = img_previewer,
          },
          ueberzug_scaler = 'fit_contain',
        },
      },
      ui_select = { prompt = ' ' },
      files = {
        cwd_prompt = false,
        actions = {
          ['ctrl-h'] = { actions.toggle_hidden },
        },
        -- cmd = "find . -type f -printf '%P\n'",
        find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts = [[--color=never --files --hidden --no-ignore --follow -g "!.git" -g "!node_modules"]],
        fd_opts = [[--color=never --type f --hidden --no-ignore --follow --exclude .git --exclude node_modules]],
      },
      grep = {
        actions = {
          ['ctrl-h'] = { actions.toggle_hidden },
        },
        grep_opts = '--exclude-dir .git --exclude-dir node_modules --binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e',
        rg_opts = '-g "!.git" -g "!node_modules" --hidden --no-ignore --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
      },
    }
  end,
  -- stylua: ignore
  keys = {
    { '<c-j>', '<c-j>', ft = 'fzf', mode = 't', nowait = true },
    { '<c-k>', '<c-k>', ft = 'fzf', mode = 't', nowait = true },
    -- git
    -- { '<leader>fgf', '<cmd>FzfLua git_files<cr>',                               desc = 'Find Files (git-files)' },
    -- { '<leader>fgc', '<cmd>FzfLua git_commits<CR>',                             desc = 'Commits' },
    -- { '<leader>fgs', '<cmd>FzfLua git_status<CR>',                              desc = 'Status' },
    -- search
    { '<leader>fa', '<cmd>FzfLua autocmds<cr>',                                 desc = '[f]ind [a]uto Commands' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>',                                  desc = '[f]ind [b]uffers' },
    { '<leader>fc', '<cmd>FzfLua commands<cr>',                                 desc = '[f]ind [c]ommands' },
    { '<leader>fd', '<cmd>FzfLua diagnostics_document<cr>',                     desc = '[f]ind document [d]iagnostics' },
    { '<leader>fD', '<cmd>FzfLua diagnostics_workspace<cr>',                    desc = '[f]ind workspace [D]iagnostics' },
    { '<leader>ff', '<cmd>FzfLua files<cr>',                                    desc = '[f]ind [f]iles' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>',                                desc = '[f]ind [g]rep (cwd)' },
    { '<leader>fG', '<cmd>FzfLua live_grep_glob<cr>',                           desc = '[f]ind [G]rep with (rg --blob)' },
    { '<leader>fh', '<cmd>FzfLua help_tags<cr>',                                desc = '[f]ind [h]elp Pages' },
    { '<leader>fH', '<cmd>FzfLua highlights<cr>',                               desc = '[f]ind [H]ighlight Groups' },
    { '<leader>fj', '<cmd>FzfLua jumps<cr>',                                    desc = '[f]ind [j]umplist' },
    { '<leader>fk', '<cmd>FzfLua keymaps<cr>',                                  desc = '[f]ind [k]ey Maps' },
    { '<leader>fl', '<cmd>FzfLua loclist<cr>',                                  desc = '[f]ind [l]ocation List' },
    { '<leader>fm', '<cmd>FzfLua man_pages<cr>',                                desc = '[f]ind [m]an Pages' },
    { '<leader>fr', '<cmd>FzfLua oldfiles<cr>',                                 desc = '[f]ind [r]ecent' },
    { '<leader>fR', '<cmd>FzfLua resume<cr>',                                   desc = '[f]ind [R]esume' },
    { '<leader>fq', '<cmd>FzfLua quickfix<cr>',                                 desc = '[f]ind [q]uickfix List' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>',                               desc = '[f]ind [w]ord under cursor' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>',                               desc = '[f]ind [W]ORD under cursor' },
    { '<leader>fw', '<cmd>FzfLua grep_visual<cr>', mode = 'v',                  desc = '[f]ind [w]ord selection' },
    { '<leader>f,', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = '[f]ind buffers' },
    { '<leader>f/', '<cmd>FzfLua grep_curbuf<cr>',                              desc = '[f]ind in buffer' },
    { '<leader>f:', '<cmd>FzfLua command_history<cr>',                          desc = '[f]ind command History' },
    { '<leader>f"', '<cmd>FzfLua registers<cr>',                                desc = '[f]ind registers' },
    { "<leader>f'", '<cmd>FzfLua marks<cr>',                                    desc = '[f]ind marks' },
  },
}
