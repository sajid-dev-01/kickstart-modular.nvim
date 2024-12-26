return {
  'luukvbaal/statuscol.nvim',
  event = 'BufReadPre',
  config = function()
    local builtin = require 'statuscol.builtin'

    -- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

    require('statuscol').setup {
      segments = {
        { text = { '%s' }, click = 'v:lua.ScSa' },
        { text = { builtin.lnumfunc, ' ' }, condition = { true, builtin.not_empty }, click = 'v:lua.ScLa' },
        { text = { builtin.foldfunc, '  ' }, click = 'v:lua.ScFa' },
      },
    }
  end,
}
