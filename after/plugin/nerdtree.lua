vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeShowHidden = 1

vim.keymap.set("n", "<c-n>", ":Neotree right toggle<CR>")
vim.keymap.set("i", "<c-n>", ":Neotree right toggle<CR>")
vim.keymap.set("n", "<F1>", ":Neotree focus<CR>")
vim.keymap.set("i", "<F1>", ":Neotree focus<CR>")
