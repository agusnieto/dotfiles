return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
	ensure_installed = {
	  -- neovim default
	  "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
	  -- languages
	  "bash", "c_sharp", "java", "javadoc", "sql",
	  -- web
	  "css", "html", "javascript", "typescript", "xml" ,
	  -- files
	  "desktop", "diff", "dockerfile", "editorconfig", "json", "nginx", "properties", "toml", "typst", "yaml"
	},
	highlight = {
	  enable = true,
	  -- no vim regex
	  additional_vim_regex_highlighting = false,
	},
      }
    end
  }
}
