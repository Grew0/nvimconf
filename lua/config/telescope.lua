local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', 'gd', "<c-w><c-]><c-w>T", { desc = 'LSP definitions' })
-- vim.keymap.set('n', 'gD', builtin.lsp_definitions, { desc = 'LSP definitions' })
vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'LSP references' })
 -- vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
 -- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
