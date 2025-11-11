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

	  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	  -- Using this option may slow down your editor, and you may see some duplicate highlights.
	  -- Instead of true it can also be a list of languages
	  additional_vim_regex_highlighting = false,
	},
      }
    end
  }
}
