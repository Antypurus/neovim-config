local M = {}
local keymapper = require("util.map")

local function reload_config()
	-- clear keybinds
	require("util.map").clear()

	-- reload modules
	for name, _ in pairs(package.loaded) do
		if name:match("^config") or name:match("^telescope") then
			package.loaded[name] = nil
		end
	end

	-- reload init.lua
	dofile(vim.env.MYVIMRC)
	vim.notify("Neovim configuration reloaded")
end

function M.setup()
	-- dynamic config reload
	keymapper.map("n", "<leader>rr", reload_config, "[R]eload Neovim config")

	-- Clear highlights on search when pressing <Esc> in normal mode
	keymapper.map("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- Save with Ctrl-s
	keymapper.map("n", "<C-s>", vim.cmd.write, "Write Changes")
	keymapper.map("i", "<C-s>", vim.cmd.write, "Write Changes")

	keymapper.map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

	-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
	-- or just use <C-\><C-n> to exit terminal mode
	keymapper.map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

	-- Split management and navigation
	keymapper.map("n", "<leader>vs", vim.cmd.vsplit, "Create [V]ertical Split")
	keymapper.map("n", "<leader>hs", vim.cmd.split, "Create [H]orizontal Split")
	keymapper.map("n", "<leader>cc", vim.cmd.quit, "[C]lose [C]urrent Window")
	keymapper.map("n", "<S-LEFT><S-LEFT>", "<C-w><Left>")
	keymapper.map("n", "<S-RIGHT><S-RIGHT>", "<C-w><Right>")
	keymapper.map("n", "<S-UP><S-UP>", "<C-w><Up>")
	keymapper.map("n", "<S-DOWN><S-DOWN>", "<C-w><Down>")

	-- moving code blocks
	keymapper.map("v", "<A-Down>", ":m '>+1<CR>gv=gv", "move code block down")
	keymapper.map("v", "<A-Up>", ":m '<-2<CR>gv=gv", "move code block up")
	keymapper.map("n", "<A-Up>", "<Up>ddp<Up>")
	keymapper.map("n", "<A-Down>", "ddp")
end

function M.setup_telescope(builtin)
	-- open files list
	keymapper.map("n", "<C-o>", function()
		builtin.find_files(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, "")

	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
	vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
	vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
	vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

	vim.keymap.set("n", "<leader>/", function()
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[/] Fuzzily search in current buffer" })

	vim.keymap.set("n", "<leader>sn", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[S]earch [N]eovim files" })
end

function M.setup_telescope_lsp(buf, builtin)
	-- Find references for the word under your cursor.
	vim.keymap.set("n", "<leader>gr", function()
		builtin.lsp_references({
			path_display = { "tail" },
		})
	end, {
		buffer = buf,
		desc = "[G]oto [R]eferences",
		remap = false,
	})

	-- Jump to the implementation of the word under your cursor.
	-- Useful when your language has ways of declaring types without an actual implementation.
	vim.keymap.set("n", "gri", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })

	-- Jump to the definition of the word under your cursor.
	-- This is where a variable was first declared, or where a function is defined, etc.
	-- To jump back, press <C-t>.
	vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

	-- Fuzzy find all the symbols in your current document.
	-- Symbols are things like variables, functions, types, etc.
	vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })

	-- Fuzzy find all the symbols in your current workspace.
	-- Similar to document symbols, except searches over your entire project.
	vim.keymap.set("n", "gW", builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = "Open Workspace Symbols" })

	-- Jump to the type of the word under your cursor.
	-- Useful when you're not sure what type a variable is and you want to see
	-- the definition of its *type*, not where it was *defined*.
	vim.keymap.set("n", "grt", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
end

function M.setup_lsp(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol" })

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client:supports_method("textDocument/inlayHint", event.buf) then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end, "[T]oggle Inlay [H]ints")
	end
end

M.conform = {
	{
		"<leader>ff",
		function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end,
		mode = "",
		desc = "[F]ormat buffer",
	},
}

return M
