return {
  'pmizio/typescript-tools.nvim',
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    settings = {
      tsserver_max_memory = '1024', -- MB
      separate_diagnostic_server = true,
      expose_as_code_action = 'all',
      jsx_close_tag = {
        enable = true,
        filetypes = { 'javascriptreact', 'typescriptreact' },
      },
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        -- includeInlayFunctionParameterTypeHints = true,
        -- includeInlayVariableTypeHints = true,
        -- includeInlayFunctionLikeReturnTypeHints = true,
        -- includeInlayPropertyDeclarationTypeHints = true,
        quotePreference = 'double',
      },
      tsserver_format_options = {
        tabSize = 2,
        indentSize = 2,
        indentStyle = 'Smart',
        convertTabsToSpace = true,
        trimTrailingWhitespace = true,
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
  },
  config = function(_, opts)
    require('typescript-tools').setup(opts)

    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
    end

    map('n', '<leader>cF', '<cmd>TSToolsFixAll <cr>', '[F]ix all')

    -- refactor keymaps
    map('n', '<leader>cr', '', '[c]ode [r]efactor')
    map('n', '<leader>cru', '<cmd>TSToolsRemoveUnused <cr>', 'remove [u]nused')
    map('n', '<leader>crf', '<cmd>TSToolsRenameFile <cr>', 'rename [f]ile')

    -- import keymaps
    map('n', '<leader>ci', '', '[c]ode [i]mport')
    map('n', '<leader>cia', '<cmd>TSToolsAddMissingImports <cr>', '[a]dd missing import')
    map('n', '<leader>cio', '<cmd>TSToolsOrganizeImports <cr>', '[o]rganize import')
    map('n', '<leader>cis', '<cmd>TSToolsSortImport <cr>', '[s]ort import')
    map('n', '<leader>cir', '<cmd>TSToolsRemoveUnusedImports <cr>', '[r]emove unused import')

    -- source keymaps
    map('n', '<leader>cd', '<cmd>TSToolsGoToSourceDefinition <cr>', '[c]ode [d]efinition')
  end,
}
