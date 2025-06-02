return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		null_ls.setup({
			sources = {
				-- lua
				formatting.stylua,
				-- ruby
				diagnostics.rubocop,
				formatting.rubocop,
				-- js
				--diagnostics.eslint_d,
				formatting.prettier,
				-- python
        diagnostics.mypy,
				formatting.isort,
				--formatting.black,
				--diagnostics.pylint.with({
				--	diagnostic_config = { underline = false, virtual_text = false, signs = false },
				--	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				--}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
