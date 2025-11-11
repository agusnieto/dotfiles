vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Terminal
vim.keymap.set("t", "<esc><esc>","<c-\\><c-n>")
vim.keymap.set("n", "<leader>ts", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0,7)
end, { desc = 'Terminal: Open split' }
)
