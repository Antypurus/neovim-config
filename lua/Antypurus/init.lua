require 'Antypurus.bindings'
require 'Antypurus.plugins'
require 'Antypurus.color'

-- line numbers
vim.opt.nu = true
-- relative line numbers in normal mode and absolute
-- line numbers in edit mode, this should make things
-- easier overall when i need the absolute line number
vim.cmd [[
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
]]

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = true

-- long undos with undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- scrolloff
vim.opt.scrolloff = 8

-- update time
vim.opt.updatetime = 50

