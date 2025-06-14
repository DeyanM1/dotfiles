return {
  "github/copilot.vim",
  config = function()
    -- Optional: map Ctrl+L to accept suggestion
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end
}

