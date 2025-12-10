-- simple dashboard

local M = {}

-- ASCII art
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

-- keymaps (informative only) ",
local keymaps = {
  { key = "󱁐 ff", desc = "Find files" },
  { key = "󱁐 fg", desc = "Find text" },
  { key = "󱁐 fh", desc = "Browse :help" },
  { key = "q", desc = "Quit" },
}

-- Quote
local footer = [[

Debugging is twice as hard as writing the code in the
first place. Therefore, if you write the code as
cleverly as posible, you are, by definition,
not smart enough to debug it.

                    - Brian W. Kernighan
]]

-- Helper function to center a line horizontally
local function center_line(line, width)
  local line_length = vim.fn.strdisplaywidth(line)
  if line_length >= width then
    return line
  end
  local padding = math.floor((width - line_length) / 2)
  return string.rep(" ", padding) .. line
end

-- Store original window options
local original_win_opts = {}

-- Build content without centering
local function build_raw_content()
  local lines = {}

  -- Header (ASCII art)
  vim.list_extend(lines, vim.split(header, "\n"))

  --table.insert(lines, "")
  --table.insert(lines, "")

  -- Keymaps
  for _, map in ipairs(keymaps) do
    table.insert(lines, string.format("  %-20s %s", map.desc, map.key))
  end

  --table.insert(lines, "")
  --table.insert(lines, "")

  -- Footer (quote)
  vim.list_extend(lines, vim.split(footer, "\n"))

  return lines
end

-- Function to restore original window options
local function restore_win_opts(win)
  if original_win_opts[win] then
    for opt, value in pairs(original_win_opts[win]) do
      vim.wo[win][opt] = value
    end
    original_win_opts[win] = nil
  end
end

-- Function to set dashboard window options
local function set_dashboard_win_opts(win)
  -- Store original window options before changing them
  original_win_opts[win] = {
    number = vim.wo[win].number,
    relativenumber = vim.wo[win].relativenumber,
    cursorline = vim.wo[win].cursorline,
    signcolumn = vim.wo[win].signcolumn,
  }

  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].cursorline = false
  vim.wo[win].signcolumn = 'no'
end

-- Function to redraw the dashboard content
function M.redraw()
  local buf = vim.api.nvim_get_current_buf()

  -- Only redraw if this is a dashboard buffer
  if vim.bo[buf].filetype ~= 'dashboard' then
    return
  end

  local win = vim.api.nvim_get_current_win()
  local width = vim.api.nvim_win_get_width(win)
  local height = vim.api.nvim_win_get_height(win)

  -- Build and center content
  local raw_lines = build_raw_content()

  -- Center horizontally
  local centered_lines = {}
  for _, line in ipairs(raw_lines) do
    table.insert(centered_lines, center_line(line, width))
  end

  -- Center vertically
  local content_height = #centered_lines
  local padding = math.max(0, math.floor((height - content_height) / 2))

  local final_lines = {}
  for _ = 1, padding do
    table.insert(final_lines, "")
  end
  vim.list_extend(final_lines, centered_lines)

  -- Update buffer content
  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, final_lines)
  vim.bo[buf].modifiable = false
end

function M.open()
  -- Create scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_get_current_win()

  -- Configure buffer
  local buf_opts = {
    bufhidden = 'wipe',
    buftype = 'nofile',
    swapfile = false,
    filetype = 'dashboard',
    modifiable = false
  }

  for opt, value in pairs(buf_opts) do
    vim.bo[buf][opt] = value
  end

  vim.api.nvim_win_set_buf(win, buf)
  set_dashboard_win_opts(win)

  -- Initial draw and set up keymap
  M.redraw()
  vim.keymap.set('n', 'q', ':q<CR>', { buffer = buf, silent = true })
end

-- Set up autocmds
local dashboard_augroup = vim.api.nvim_create_augroup('Dashboard', { clear = true })

-- Restore window options when leaving dashboard buffer
local function on_buf_leave(args)
  if vim.bo[args.buf].filetype == 'dashboard' then
    restore_win_opts(vim.api.nvim_get_current_win())
  end
end

-- Clean up stored window options when dashboard is closed
local function on_buf_wipeout(args)
  if vim.bo[args.buf].filetype == 'dashboard' then
    for win, _ in pairs(original_win_opts) do
      if vim.api.nvim_win_is_valid(win) then
        restore_win_opts(win)
      end
    end
  end
end

vim.api.nvim_create_autocmd('VimResized', {
  group = dashboard_augroup,
  callback = M.redraw,
  desc = 'Redraw dashboard on window resize'
})

vim.api.nvim_create_autocmd('BufLeave', {
  group = dashboard_augroup,
  callback = on_buf_leave,
  desc = 'Restore window options when leaving dashboard'
})

vim.api.nvim_create_autocmd('BufWipeout', {
  group = dashboard_augroup,
  callback = on_buf_wipeout,
  desc = 'Clean up window options when dashboard is closed'
})

-- Open automatically with no args
vim.api.nvim_create_autocmd("VimEnter", {
  group = dashboard_augroup,
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte(vim.fn.line('$')) == -1 then
      M.open()
    end
  end,
})

return M
