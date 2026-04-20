 -- Tab keys --
vim.keymap.set('n', 'H', "gT", { desc = 'Go to left tab' })
vim.keymap.set('n', 'L', "gt", { desc = 'Go to right tab' })
vim.keymap.set('n', '<leader>t', ":tabnew<enter>", { desc = 'Fast open new tab' })

 -- Terminal keys --
vim.keymap.set('n', '<leader>T', ":tabnew<enter>:terminal<enter>i", { desc = 'Fast open terminal tab' })
vim.keymap.set('t', '<c-n>', "<c-\\><c-n>", { desc = 'Faster way to exit terminal mode' })

-- Open greped
vim.keymap.set('n', '<leader><c-o>', "0\"oyt:f:l\"lye:tabe <C-r>o<enter>:<C-r>l<enter>", { desc = 'Fast open terminal tab' });

-- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count = -1}) end, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count = 1}) end, { desc = 'Next diagnostic' })

-- Rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Lsp rename' })

-- Update tab
vim.keymap.set('n', '<leader><c-l>', function() vim.cmd("tabnew % | exe \"normal \\<c-o>\" | tabp | tabclose") end, { desc = 'Lsp rename' })

-- Push without overriting
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without overwriting register' })

-- Delete swap file
vim.keymap.set('n', 'grds', function()
  local swapfile = vim.fn.swapname(vim.api.nvim_get_current_buf())
  if swapfile ~= "" and vim.fn.filereadable(swapfile) == 1 then
    vim.fn.delete(swapfile)
    print("Deleted swap file: " .. swapfile)
  else
    print("No swap file found for current buffer")
  end
end, { desc = 'Delete swap file for current buffer' })

vim.keymap.set("n", "<leader>c" , vim.lsp.buf.code_action);
