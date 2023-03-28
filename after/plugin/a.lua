vim.keymap.del("i", "<leader>is")
vim.keymap.del("i", "<leader>ihn")
vim.keymap.del("i", "<leader>ih")

-- header / source
vim.keymap.set("n", "<F4>", ":A<CR>")
vim.keymap.set("i", "<F4>", "<ESC>:A<CR>")

-- file under cursor
vim.keymap.set("n", "<F2>", ":IH<CR>")
vim.keymap.set("i", "<F2>", "<ESC>:IH<CR>")

