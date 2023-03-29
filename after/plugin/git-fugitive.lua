vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>")
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
vim.keymap.set("n", "<leader>gca", function()
    commit_message = vim.fn.input("Commit Message > ")
    commit_command = ":Git commit -am \"" .. commit_message .. "\"<CR>"
    vim.cmd(commit_command)
end)
