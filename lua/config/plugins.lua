local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local lazy_ui = {
	-- If you are using a Nerd Font: set icons to an empty table which will use the
	-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
	icons = vim.g.have_nerd_font and {} or {
		cmd = "⌘",
		config = "🛠",
		event = "📅",
		ft = "📂",
		init = "⚙",
		keys = "🗝",
		plugin = "🔌",
		runtime = "💻",
		require = "🌙",
		source = "📄",
		start = "🚀",
		task = "📌",
		lazy = "💤 ",
	},
}

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},

	--lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
	},
	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-mini/mini.nvim" },

	-- autocomplete
	{ "saghen/blink.cmp", dependencies = {
		"L3MON4D3/LuaSnip",
	} },

	-- filetree
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},

	--git
	{ "lewis6991/gitsigns.nvim" },

	-- formatting
	{ "stevearc/conform.nvim" },
	{ "NMAC427/guess-indent.nvim", opts = {} },

	-- misc
	{ "folke/which-key.nvim" },
	{ "folke/todo-comments.nvim" },
	{ "theprimeagen/harpoon" },
	{ "kylechui/nvim-surround" },
	{ "vim-scripts/a.vim" },
	{ "wakatime/vim-wakatime" },
	{ "andweeb/presence.nvim" },

	-- themes
	{ "folke/tokyonight.nvim" },
}, lazy_ui)
