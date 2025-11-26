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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Lsp rename' })

