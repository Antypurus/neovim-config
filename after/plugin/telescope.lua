local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "ThirdParty",
            "build",
            ".cache",
        },
        wrap_results = true,
        prompt_prefix = "",
        path_display = "smart"
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}

vim.keymap.set('n', '<C-p>', function()
	builtin.find_files({previewer=false})
end)
vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
