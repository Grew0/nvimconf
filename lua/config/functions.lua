function AddCppIncludeGuard()
	local filename = vim.fn.expand('%:t')
	if filename == '' then
		vim.notify('No file name detected', vim.log.levels.ERROR)
		return
	end
	local guard_name = filename
		:gsub('[^a-z0-9]', '_')
		:gsub('([a-z])([A-Z])', '%1_%2')
		:gsub('[^%w]', '_')
		:upper()
	-- Generate guard lines
	local guard_lines = {
		  '#ifndef ' .. guard_name,
		  '#define ' .. guard_name,
		  '',
		  '#endif // ' .. guard_name
		}

		-- Get current buffer
		local buf = vim.api.nvim_get_current_buf()

		-- Insert lines at beginning of file
		vim.api.nvim_buf_set_lines(buf, 0, 0, false, guard_lines)

		-- Move cursor to line after #define
		vim.api.nvim_win_set_cursor(0, {3, 0})

		vim.notify('Added include guard: ' .. guard_name, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('CppIncludeGuard', AddCppIncludeGuard, {})
vim.keymap.set('n', '<leader>ig', AddCppIncludeGuard, { desc = 'Add C++ include guard' })

