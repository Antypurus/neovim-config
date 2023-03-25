local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function()
	builtin.find_files({previewer=false})
end)
vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
