function DeletePreviousWord()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	if col == 0 then
		return
	end

	local line = vim.api.nvim_get_current_line()
	local pos = col

	local function is_word_char(c)
		return c:match("%w") ~= nil
	end

	-- Step 1: skip delimiters
	while pos > 0 and not is_word_char(line:sub(pos, pos)) do
		pos = pos - 1
	end

	-- Step 2: skip word
	while pos > 0 and is_word_char(line:sub(pos, pos)) do
		pos = pos - 1
	end

	local start_col = pos
	local end_col = col

	-- Delete text directly
	vim.api.nvim_buf_set_text(0, row - 1, start_col, row - 1, end_col, {})

	-- Move cursor
	vim.api.nvim_win_set_cursor(0, { row, start_col })
end
