-- simple dashboard made by me
local M = {}

local header = [[
  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          
   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       
         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     
          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    
         ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   
  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  
 ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   
⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  
⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ 
     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     
      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     
]]

local keymaps = {
  { key = "<leader>ff", desc = "Find files" },
  { key = "<leader>fg", desc = "Find text" },
  { key = "<leader>ha", desc = "Harpoon add" },
  { key = "<leader>hf", desc = "Harpoon find" },
  { key = "<leader>ef", desc = "File explorer" },
}

local footer = [[

Debugging is twice as hard as writing the code in the
first place. Therefore, if you write the code as
cleverly as posible, you are, by definition,
not smart enough to debug it.

                    - Brian W. Kernighan
]]

local function center_line(line, width)
  local line_length = vim.fn.strdisplaywidth(line)
  if line_length >= width then
    return line
  end
  local padding = math.floor((width - line_length) / 2)
  return string.rep(" ", padding) .. line
end

local original_win_opts = {}

function M.redraw()
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()

  if vim.bo[buf].filetype ~= 'dashboard' then
    return
  end

  local width = vim.api.nvim_win_get_width(win)
  local height = vim.api.nvim_win_get_height(win)

  local lines = {}

  for line in header:gmatch("[^\n]+") do
    table.insert(lines, line)
  end

  for _, map in ipairs(keymaps) do
    local line = string.format("  %-20s %s", map.desc, map.key)
    table.insert(lines, line)
  end

  for line in footer:gmatch("[^\n]+") do
    table.insert(lines, line)
  end

  local centered_lines = {}
  for _, line in ipairs(lines) do
    table.insert(centered_lines, center_line(line, width))
  end

  local content_height = #centered_lines
  local padding = math.floor((height - content_height) / 2)

  local final_lines = {}
  for _ = 1, padding do
    table.insert(final_lines, "")
  end
  for _, line in ipairs(centered_lines) do
    table.insert(final_lines, line)
  end

  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, final_lines)
  vim.bo[buf].modifiable = false
end

local function restore_win_opts(win)
  if original_win_opts[win] then
    for opt, value in pairs(original_win_opts[win]) do
      vim.wo[win][opt] = value
    end
    original_win_opts[win] = nil
  end
end

function M.open()
  local buf = vim.api.nvim_create_buf(false, true)

  vim.bo[buf].bufhidden = 'wipe'
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = 'dashboard'

  local win = vim.api.nvim_get_current_win()

  original_win_opts[win] = {
    number = vim.wo[win].number,
    relativenumber = vim.wo[win].relativenumber,
    cursorline = vim.wo[win].cursorline,
    signcolumn = vim.wo[win].signcolumn,
  }

  vim.api.nvim_win_set_buf(win, buf)
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].cursorline = false
  vim.wo[win].signcolumn = 'no'

  M.redraw()

  vim.keymap.set('n', 'q', ':q<CR>', { buffer = buf, silent = true })
end

local dashboard_augroup = vim.api.nvim_create_augroup('Dashboard', { clear = true })

vim.api.nvim_create_autocmd('VimResized', {
  group = dashboard_augroup,
  callback = M.redraw,
  desc = 'Redraw dashboard on window resize'
})

vim.api.nvim_create_autocmd('BufLeave', {
  group = dashboard_augroup,
  callback = function(args)
    if vim.bo[args.buf].filetype == 'dashboard' then
      local win = vim.api.nvim_get_current_win()
      restore_win_opts(win)
    end
  end,
  desc = 'Restore window options when leaving dashboard'
})

vim.api.nvim_create_autocmd('BufWipeout', {
  group = dashboard_augroup,
  callback = function(args)
    if vim.bo[args.buf].filetype == 'dashboard' then
      for win, _ in pairs(original_win_opts) do
        if vim.api.nvim_win_is_valid(win) then
          restore_win_opts(win)
        end
      end
    end
  end,
  desc = 'Restore window options when dashboard is closed'
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = dashboard_augroup,
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte(vim.fn.line('$')) == -1 then
      M.open()
    end
  end,
})

return M
