vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.cpp,*.cc,*.cxx,*.h,*.hh,*.hpp,*.hxx",
	callback = function(args)
		local bufnr = args.buf
		local filename = vim.api.nvim_buf_get_name(bufnr)

		-- Check if clang-format-14 is available
		if vim.fn.executable("clang-format-14") == 0 then
			vim.notify("clang-format-14 not found. Please install it.", vim.log.levels.WARN)
			return
		end

		-- Save cursor position
		local cursor_pos = vim.api.nvim_win_get_cursor(0)

		-- Run clang-format on the current file
		local cmd = "clang-format-14 -i " .. vim.fn.shellescape(filename)
		local success = pcall(vim.fn.system, cmd)

		if not success then
			vim.notify("clang-format failed to format " .. filename, vim.log.levels.ERROR)
			return
		end

		-- Reload the buffer to show formatted content
		vim.cmd("edit!")

		-- Restore cursor position (if possible)
		local new_line_count = vim.api.nvim_buf_line_count(bufnr)
		if cursor_pos[1] <= new_line_count then
			vim.api.nvim_win_set_cursor(0, cursor_pos)
		end
	end
})
