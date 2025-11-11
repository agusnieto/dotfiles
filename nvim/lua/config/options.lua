vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.node_host_prog = '/usr/bin/neovim-node-host'

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
