-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color Schemes
    use 'EdenEast/nightfox.nvim'
    use 'xiyaowong/nvim-transparent'

    -- project tree view
    use 'preservim/nerdtree'

    -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- treesitter(doest a lot of nice things like highlighting and more)
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'

    -- file anchoring system
    use 'theprimeagen/harpoon'

    -- undo change management
    use 'mbbill/undotree'

    -- Git support
    use 'tpope/vim-fugitive'
end)
