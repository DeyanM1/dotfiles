return { 
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8', 
    dependencies = { 
      'nvim-lua/plenary.nvim' 
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc= "Find Files"})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc= "Grep Files"})
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {desc = "Recent Files"})
      vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Search in current file" })

      vim.keymap.set("n", "<leader>gs", builtin.git_status, {desc = "Git status"})
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, {desc = "Git commits"})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require ("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
