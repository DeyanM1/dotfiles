vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.python3_host_prog = "/usr/bin/python3"


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,  -- keep it in normal mode only
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99


vim.keymap.set("i", "jk", "<esc>", {})
vim.keymap.set("n", ";", ":", {})

-- Navigate vim panes bettter
vim.keymap.set("n", "<c-k>", "win.cmd k<CR>")
vim.keymap.set("n", "<c-j>", "win.cmd j<CR>")
vim.keymap.set("n", "<c-h>", "win.cmd h<CR>")
vim.keymap.set("n", "<c-l>", "win.cmd l<CR>")


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.clipboard = nil



