vim.g.mapleader = " "

-- file view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- save file
vim.keymap.set("n", "<c-s>", vim.cmd.write)
vim.keymap.set("i", "<c-s>", vim.cmd.write)

-- window management
vim.api.nvim_set_keymap("n", "<leader>cc", ":q<CR>", {
    noremap = true
})

-- moving code up and down
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", {
    noremap = true
})
vim.api.nvim_set_keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", {
    noremap = true
})
vim.keymap.set("n", "<A-Up>", "<Up>ddp<Up>")
vim.keymap.set("n", "<A-Down>", "ddp")

-- indent via Tab
vim.api.nvim_set_keymap("n", "<Tab>", ">>_", {
    noremap = true
})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<_", {
    noremap = true
})
vim.api.nvim_set_keymap("v", "<Tab>", ">>_", {
    noremap = true
})
vim.api.nvim_set_keymap("v", "<S-Tab>", "<<_", {
    noremap = true
})

-- paste over token
vim.keymap.set("x", "<leader>p", "\"_dP")

-- format file
vim.keymap.set("n", "<leader>ff", function()
    vim.lsp.buf.format()
end)

-- refactoring
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)

-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- clipboard
vim.api.nvim_set_keymap("n", "<C-v>", "\"+p", {
    noremap = true
})
vim.api.nvim_set_keymap("n", "<C-c>", "\"+y", {
    noremap = true
})
vim.api.nvim_set_keymap("n", "<C-x>", "\"+d", {
    noremap = true
})
vim.api.nvim_set_keymap("i", "<C-v>", "<Esc>\"+pa", {
    noremap = true
})

-- todo & note insertion
vim.keymap.set("n", "<A-t>", "a//TODO(Tiago):")
vim.keymap.set("i", "<A-t>", "//TODO(Tiago):")
vim.keymap.set("n", "<A-n>", "a//NOTE(Tiago):")
vim.keymap.set("i", "<A-n>", "//NOTE(Tiago):")

-- splits
vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>hs", vim.cmd.split)
vim.api.nvim_set_keymap("n", "<S-LEFT><S-LEFT>", "<C-w><Left>", {
    noremap = true
})
vim.api.nvim_set_keymap("n", "<S-RIGHT><S-RIGHT>", "<C-w><Right>", {
    noremap = true
})
vim.api.nvim_set_keymap("n", "<S-UP><S-UP>", "<C-w><Up>", {
    noremap = true
})
vim.api.nvim_set_keymap("n", "<S-DOWN><S-DOWN>", "<C-w><Down>", {
    noremap = true
})

-- home button handling
vim.keymap.set("n", "<Home>", "^")
vim.keymap.set("i", "<Home>", "<Esc>^i")

-- open terminal
vim.keymap.set("n", "<C-\\>", function()
    vim.cmd("FloatermToggle")
end)
