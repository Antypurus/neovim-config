vim.g.NERDTreeWinPos = "left"
vim.g.NERDTreeShowHidden = 1

vim.keymap.set("n", "<c-n>", vim.cmd.NERDTreeToggle)
vim.keymap.set("i", "<c-n>", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<F1>", vim.cmd.NERDTreeFocus)
vim.keymap.set("i", "<F1>", vim.cmd.NERDTreeFocus)

