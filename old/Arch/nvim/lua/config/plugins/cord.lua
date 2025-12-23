return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  config = function()
    require('cord').setup {
      editor = {
	tooltip = 'Hyperextensible Vim-based text editor'
      },
      text = {
	editing = 'Editing a file',
	viewing = 'Viewing a file',
	workspace = ' ',
      },
    }
  end
}
