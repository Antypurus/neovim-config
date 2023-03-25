vim.g.mapleader = " "

--file view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--save file
vim.keymap.set("n", "<c-s>", ":write<CR>")
vim.keymap.set("i", "<c-s>", "<Esc>:write<CR>a")
