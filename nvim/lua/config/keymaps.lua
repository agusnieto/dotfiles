vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = 'Quickfix next' })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = 'Quickfix prev' })

-- oil
vim.keymap.set('n', '<leader>e', ':Oil<CR>', { desc = 'File manager' })

-- telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Search grep' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search help tags' })

require("telescope").setup{
  defaults = { mappings = { i = { ["<esc>"] = require("telescope.actions").close }}}}

-- terminal
vim.keymap.set("t", "<esc><esc>","<c-\\><c-n>", { desc = 'Escape terminal' })
vim.keymap.set("n", "<leader>ts", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0,7)
  end, { desc = 'Open terminal' })
