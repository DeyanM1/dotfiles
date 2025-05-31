return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
  },

  config = function()
    require("neo-tree").setup({
      window = {
        width = 25,
      }

    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left <CR>")
    vim.keymap.set("n", "<C-b>", ":Neotree filesystem close <CR>")
  end
}

