local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = false,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

-- language servers
lsp.ensure_installed({
	'rust_analyzer',
	'clangd',
	'lua_ls',
	'bashls',
	'cmake',
	'grammarly',
	'jsonls',
	'pylsp',
	'yamlls'
})

-- code completion
local completion = require 'cmp'
local completion_selector = {behavior = completion.SelectBehavior.Select}
local completion_keymappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = completion.mapping.confirm({select = true}),
	['<C-Space>'] = completion.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = completion_keymappings
})

-- code navigation keybinds
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  --vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- setup finalization
lsp.nvim_workspace()
lsp.setup()
