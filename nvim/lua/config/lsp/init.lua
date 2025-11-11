require("config.lsp.lua_ls")
require("config.lsp.pyright")
require("config.lsp.clangd")
require("config.lsp.bashls")

-- :help vim.diagnostic
vim.diagnostic.config({
  underline = true,
  virtual_lines = false,
  virtual_text = {
    spacing = 4,
    prefix = '',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅙',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '󰮥',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
})

-- :help lsp-defaults
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)		-- go def
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)		-- go decla
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)		-- go impl
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)		-- go ref

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)			-- hover info

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)		-- lsp rename
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)	-- diag float
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)	-- diag buffer
  end
})
