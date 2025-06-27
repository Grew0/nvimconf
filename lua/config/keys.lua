 -- Tab keys --
vim.keymap.set('n', 'H', "gT", { desc = 'Go to left tab' })
vim.keymap.set('n', 'L', "gt", { desc = 'Go to right tab' })
vim.keymap.set('n', '<leader>t', ":tabnew<enter>", { desc = 'Fast open new tab' })

 -- Terminal keys --
vim.keymap.set('n', '<leader>T', ":tabnew<enter>:terminal<enter>i", { desc = 'Fast open terminal tab' })
vim.keymap.set('t', '<c-n>', "<c-\\><c-n>", { desc = 'Faster way to exit terminal mode' })
