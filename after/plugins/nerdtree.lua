vim.g.NERDTreeWinPos = "left"
vim.g.NERDTreeShowHidden = 1

vim.keymap.set("n", "<c-n>", ":NERDTreeToggle<CR>")
vim.keymap.set("i", "<c-n>", "<Esc>:NERDTreeToggle<CR>")
vim.keymap.set("n", "<F1>", ":NERDTreeFocus<CR>")
vim.keymap.set("i", "<F1>", "<Esc>:NERDTreeFocus<CR>")

