require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
    -- clangd setup
    clangd = function()
        local lspconfig = require('lspconfig')
        lspconfig.clangd.setup {
            cmd = { "clangd", "--header-insertion=never" },
        }
    end,
})

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    mapping = cmp.mapping.preset.insert({
        -- Simple tab complete
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item({ behavior = 'select' })
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),

        -- Go to previous item
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
})
