return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- harpoon menu
    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: List files" })

    -- clear list
    vim.keymap.set("n", "<leader>hc", function()
      harpoon:list():clear()
    end, { desc = "Harpoon: Clear list" })

    -- add file
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon: Add file" })

    -- go to 1 - 4
    vim.keymap.set("n", "<leader>hh", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon: File 1" })

    vim.keymap.set("n", "<leader>hj", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon: File 2" })

    vim.keymap.set("n", "<leader>hk", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon: File 3" })

    vim.keymap.set("n", "<leader>hl", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon: File 4" })

    -- prev/next
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Harpoon: Next file" })

    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Harpoon: Previous file" })

    -- list in telescope
    vim.keymap.set("n", "<leader>hf", function()
      local harpoon_files = harpoon:list()
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
	table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
	prompt_title = "Harpoon",
	finder = require("telescope.finders").new_table({
	  results = file_paths,
	}),
	previewer = require("telescope.config").values.file_previewer({}),
	sorter = require("telescope.config").values.generic_sorter({}),
      }):find()
    end, { desc = "Harpoon: Browse with Telescope" })
  end,
}
