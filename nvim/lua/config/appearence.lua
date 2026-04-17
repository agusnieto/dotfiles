vim.cmd.colorscheme('catppuccin')

-- disable mouse popup
vim.cmd [[
  aunmenu PopUp
  autocmd! nvim.popupmenu
]]

-- only treesitter
vim.cmd('syntax off')

-- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }) -- floating windows
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })  -- line numbers
