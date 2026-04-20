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

function ReloadConfig()
  -- Clear user config modules
  for name, _ in pairs(package.loaded) do
    if name:match('^user') or
       name:match('^plugins') or
       name:match('^config') or
       name:match('^custom') then
      package.loaded[name] = nil
    end
  end

  -- Clear any reload-specific modules
  package.loaded['reload'] = nil

  -- Reload main config
  vim.cmd('luafile ' .. vim.env.MYVIMRC)

  -- Optional: Run after-reload hooks
  vim.cmd('doautocmd User ConfigReloaded')

  print('✓ Neovim config reloaded')
end


vim.api.nvim_create_user_command('CppIncludeGuard', AddCppIncludeGuard, {})
vim.api.nvim_create_user_command('ReloadConfig', ReloadConfig, {})
vim.keymap.set('n', '<leader>ig', AddCppIncludeGuard, { desc = 'Add C++ include guard' })

