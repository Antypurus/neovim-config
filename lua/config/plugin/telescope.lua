local keymaps = require("config.keymaps")

require("telescope").setup({
	defaults = {
		wrap_results = true,
		file_ignore_patterns = {
			"ThirdParty",
			"build",
			".cache",
		},
	},
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
})

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
keymaps.setup_telescope(builtin)

-- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
-- it is better explained there). This allows easily switching between pickers if you prefer using something else!
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
	callback = function(event)
		keymaps.setup_telescope_lsp(event.buf, builtin)
	end,
})
