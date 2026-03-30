local M = {}
local keymapper = require("util.map")

require("util.delete")

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

	keymapper.map("n", "<leader>qf", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

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

	-- home button handling
	keymapper.map("n", "<Home>", "^")
	keymapper.map("i", "<Home>", "<Esc>^i")

	-- format
	keymapper.map("n", "<leader>ff", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, "[F]ormat buffer")

	-- filetree
	keymapper.map("n", "<C-n>", ":Neotree toggle filesystem right<CR>")

	-- word deletion
	keymapper.map("i", "<A-BS>", DeletePreviousWord, "Delete Previsous Word")
end

function M.setup_telescope(builtin)
	-- open files list
	keymapper.map("n", "<C-o>", function()
		builtin.find_files(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, "")

	keymapper.map("n", "<C-f>", function()
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, "[/] Fuzzily search in current buffer")
	keymapper.map("n", "<leader><C-f>", builtin.live_grep, "[S]earch by [G]rep")

	keymapper.map("n", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
	keymapper.map("n", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
	keymapper.map("n", "<leader>sf", builtin.find_files, "[S]earch [F]iles")
	keymapper.map("n", "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
	keymapper.map({ "n", "v" }, "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
	keymapper.map("n", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
	keymapper.map("n", "<leader>sr", builtin.resume, "[S]earch [R]esume")
	keymapper.map("n", "<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
	keymapper.map("n", "<leader>sc", builtin.commands, "[S]earch [C]ommands")
	keymapper.map("n", "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
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
	keymapper.map("n", "<F2>", vim.lsp.buf.rename, "Rename Symbol")

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	keymapper.map({ "n", "x" }, "gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction")

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	keymapper.map("n", "grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client:supports_method("textDocument/inlayHint", event.buf) then
		keymapper.map("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end, "[T]oggle Inlay [H]ints")
	end
end

return M
