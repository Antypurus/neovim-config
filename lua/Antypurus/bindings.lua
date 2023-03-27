vim.g.mapleader = " "

--file view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--save file
vim.keymap.set("n", "<c-s>", vim.cmd.write)
vim.keymap.set("i", "<c-s>", vim.cmd.write)

--window management
vim.api.nvim_set_keymap("n", "<leader>cc", ":q<CR>", {noremap=true})

-- reload nvim configurations
local init_lua_path = os.getenv("MYVIMRC")
vim.keymap.set("n", "<leader><c-r>", ":source " .. init_lua_path .. "<CR>")
