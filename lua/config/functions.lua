function AddCppIncludeGuard()
	local filename = vim.fn.expand('%')
	if filename == '' then
		vim.notify('No file name detected', vim.log.levels.ERROR)
		return
	end
	local guard_name = filename
		-- :gsub('[^a-z0-9]', '_')
		:gsub('([a-z])([A-Z])', '%1_%2')
		:gsub('[^%w]', '_')
		:upper()
	-- -- Generate guard lines
	-- local guard_lines = {
	-- 	  '#ifndef ' .. guard_name,
	-- 	  '#define ' .. guard_name,
	-- 	  '',
	-- 	  '#endif // ' .. guard_name
	-- 	}
	--
	-- 	-- Get current buffer
	-- 	local buf = vim.api.nvim_get_current_buf()
	--
	-- 	-- Insert lines at beginning of file
	-- 	vim.api.nvim_buf_set_lines(buf, 0, 0, false, guard_lines)
	--
	-- 	-- Move cursor to line after #define
	-- 	vim.api.nvim_win_set_cursor(0, {3, 0})
	--
	-- 	vim.notify('Added include guard: ' .. guard_name, vim.log.levels.INFO)
	local buf = vim.api.nvim_get_current_buf()
	local line_count = vim.api.nvim_buf_line_count(buf)

	local first_line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ''
	if first_line:match('^#ifndef%s+' .. guard_name) then
		vim.notify('Include guard already exists: ' .. guard_name, vim.log.levels.WARN)
		return
	end

	vim.api.nvim_buf_set_lines(buf, 0, 0, false, {
		'#ifndef ' .. guard_name,
		'#define ' .. guard_name,
		'',
	})

	vim.api.nvim_buf_set_lines(buf, line_count + 3, line_count + 3, false, {
		'',
		'#endif  // ' .. guard_name,
	})

	vim.api.nvim_win_set_cursor(0, { 2, 0 })
	vim.notify('Added include guard: ' .. guard_name, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('CppIncludeGuard', AddCppIncludeGuard, {})
vim.keymap.set('n', '<leader>ig', AddCppIncludeGuard, { desc = 'Add C++ include guard' })

