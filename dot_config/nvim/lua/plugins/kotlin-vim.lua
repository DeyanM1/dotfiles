return {
  "udalov/kotlin-vim",
  ft = { "kotlin" },
  init = function()
    vim.g.kotlin_no_default_mappings = true
    vim.g.kotlin_no_default_syntax = true
    vim.g.kotlin_no_default_indent = true
  end,
  config = function()
    require("kotlin").setup({
      -- Add your custom configuration here
    })
  end,
}
