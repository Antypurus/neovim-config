local cmp = require 'cmp'
local lspkind = require('lspkind')

-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', {
    bg = 'NONE',
    strikethrough = true,
    fg = '#808080'
})
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', {
    bg = 'NONE',
    fg = '#569CD6'
})
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', {
    link = 'CmpIntemAbbrMatch'
})
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', {
    bg = 'NONE',
    fg = '#9CDCFE'
})
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', {
    link = 'CmpItemKindVariable'
})
vim.api.nvim_set_hl(0, 'CmpItemKindText', {
    link = 'CmpItemKindVariable'
})
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', {
    bg = 'NONE',
    fg = '#C586C0'
})
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', {
    link = 'CmpItemKindFunction'
})
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', {
    bg = 'NONE',
    fg = '#D4D4D4'
})
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', {
    link = 'CmpItemKindKeyword'
})
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', {
    link = 'CmpItemKindKeyword'
})

local select_opts = {
    behavior = cmp.SelectBehavior.Select
}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Left>'] = cmp.mapping.abort(),
        ['<Right>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                end
                cmp.confirm()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s", "c"})
    }),
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, {
        name = 'vsnip'
    }}, {{
        name = 'buffer'
    }}),
    formatting = {
        format = lspkind.cmp_format()
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{
        name = 'git'
    } -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {{
        name = 'buffer'
    }})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{
        name = 'buffer'
    }}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{
        name = 'path'
    }}, {{
        name = 'cmdline'
    }}),
    matching = {
        disallow_symbol_nonprefix_matching = false
    }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
    capabilities = capabilities,
    cmd = {"clangd", "--header-insertion=never"}
}


-- setup rust lsp
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
