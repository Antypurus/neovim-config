local M = {}

M._mappings = {}

function M.map(mode, bind, action, desc)
	desc = desc or ""
	vim.keymap.set(mode, bind, action, {
		desc = desc,
		remap = false,
	})
	table.insert(M._mappings, {
		mode = mode,
		bind = bind,
	})
end

function M.clear()
	for _, map in ipairs(M._mappings) do
		pcall(vim.keymap.del, map.mode, map.bind)
	end

	M._mappings = {}
end

return M
