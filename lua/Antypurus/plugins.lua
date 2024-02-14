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

    -- status bar
    use 'windwp/windline.nvim'

    -- project tree view
    use 'preservim/nerdtree'
    -- use 'Xuyuanp/nerdtree-git-plugin'
    -- use 'ryanoasis/vim-devicons'
    use 'PhilRunninger/nerdtree-visual-selection'

    -- breadcrumb
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        }
    }

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

    -- LSP Zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

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

end)
