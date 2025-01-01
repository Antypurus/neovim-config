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
    use 'tomasiser/vim-code-dark'
    use 'sekke276/dark_flat.nvim'
    use 'm15a/nvim-srcerite'
    use 'sainnhe/sonokai'
    use 'Shatur/neovim-ayu'

    -- status bar
    use 'windwp/windline.nvim'

    -- project tree view
    use 'preservim/nerdtree'
    use 'ryanoasis/vim-devicons'
    use 'PhilRunninger/nerdtree-visual-selection'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- treesitter(doest a lot of nice things like highlighting and more)
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'

    -- file anchoring system
    use 'theprimeagen/harpoon'

    -- undo change management
    use 'mbbill/undotree'

    -- Git support
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- surround
    use 'kylechui/nvim-surround'

    -- A - for switching between source and header files
    use 'vim-scripts/a.vim'

    -- wakatime
    use 'wakatime/vim-wakatime'

    -- discord presence
    use 'andweeb/presence.nvim'

    -- terminal integration
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup{
            open_mapping = "<C-\\>"
        }
    end}
    use 'voldikss/vim-floaterm'

    -- lsps
    use 'williamboman/mason.nvim'

    -- lsp configurator
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind.nvim"

    -- autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

end)
