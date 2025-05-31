return {
    "blindFS/vim-taskwarrior",
    lazy = false,
    ft = { "task", "txt" },
    config = function()
      -- Optional: custom keymaps or setup
      vim.keymap.set("n", "<leader>tw", ":Taskwarrior<CR>", { desc = "Open Taskwarrior" })
    end,
}
