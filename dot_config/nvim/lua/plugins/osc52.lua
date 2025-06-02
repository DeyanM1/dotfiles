return {
  'ojroques/nvim-osc52',
  config = function()
    require('osc52').setup {
      silent = false,
        trim= false,
  }

    vim.api.nvim_create_autocmd('TextYankPost', {
      callback = function()
        require('osc52').copy_register('+')
      end,
    })
  end
}
