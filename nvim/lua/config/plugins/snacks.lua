return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      width = 60,
      preset = {
	pick = "telescope.nvim",
	keys = {
	  { key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
	  { key = "n", desc = "New File", action = ":ene | startinsert" },
	  { key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
	  { key = "p", desc = "Packages", action = ":Lazy" },
	  { key = "q", desc = "Quit", action = ":qa" },
	},
	header =
	  [[
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
      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
      },
      formats = {
	key = function(item)
	  return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
	end,
      },
      sections = {
	{ section = "header" },
	{ section = "keys", gap = 0, padding = 1 },
	{
	  text = { { string.rep("─", 60), hl = "SnacksDashboardFooter" } },
	  padding = 1,
	},
	{
	  section = "terminal",
	  cmd = "echo 'Debugging is twice as hard as writing the code in the'"
	  .. "&& echo 'first place. Therefore, if you write the code as'"
	  .. "&& echo 'cleverly as posible, you are, by definition,'"
	  .. "&& echo 'not smart enough to debug it.'"
	  .. "&& echo ''"
	  .. "&& echo '                    - Brian W. Kernighan'",
	  padding = 1,
	},
      },
    }
  }
}
