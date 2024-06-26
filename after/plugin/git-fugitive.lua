vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>")
vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
vim.keymap.set("n", "<leader>gca", function()
    commit_message = vim.fn.input("Commit Message > ")
    commit_command = ":Git commit -am \"" .. commit_message .. "\""
    vim.cmd(commit_command)
end)
vim.keymap.set("n", "<leader>gps", ":Git push<CR>")

require('gitsigns').setup()
