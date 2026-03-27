local M = {}

M._mappings = {}

function M.map(mode, bind, action, desc)
	desc = desc or ""
	mode = mode or "n"
	if type(mode) ~= "table" then
		vim.keymap.set(mode, bind, action, {
			desc = desc,
			remap = false,
		})
		table.insert(M._mappings, {
			mode = mode,
			bind = bind,
		})
	else
		for i, mode_i in ipairs(mode) do
			vim.keymap.set(mode_i, bind, action, {
				desc = desc,
				remap = false,
			})
			table.insert(M._mappings, {
				mode = mode[i],
				bind = bind,
			})
		end
	end
end

function M.clear()
	for _, map in ipairs(M._mappings) do
		pcall(vim.keymap.del, map.mode, map.bind)
	end

	M._mappings = {}
end

return M
