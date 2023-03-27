local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- anchor management
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>ar", mark.rm_file)

-- anchor menu
vim.keymap.set("n", "<leader>hp", ui.toggle_quick_menu)

-- anchor quick navigation
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
