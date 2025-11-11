return {
	"embark-theme/vim",
	name = "embark",
	enabled = true,
	lazy = false,
	priority = 1000,
	config = function()
	  vim.cmd.colorscheme("embark")
	end,
}
