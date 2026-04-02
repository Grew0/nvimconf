local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'LSP references' })

local function open_marked_as_tabs(prompt_bufnr)
  local state = require('telescope.actions.state')
  local actions = require('telescope.actions')
  local multi = state.get_current_picker(prompt_bufnr):get_multi_selection()
  actions.close(prompt_bufnr)
  if #multi == 0 then multi = { state.get_selected_entry() } end
  for _, entry in ipairs(multi) do
    vim.cmd('tabedit ' .. (entry.filename or entry.path or entry.value or entry[1]))
  end
  for _, entry in ipairs(multi) do
    vim.cmd('tabprevious')
  end
    vim.cmd('tabnext')
end


local function smart_qflist(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()

  if vim.tbl_isempty(multi) then
    actions.send_to_qflist(prompt_bufnr)
  else
    actions.send_selected_to_qflist(prompt_bufnr)
  end

  actions.open_qflist(prompt_bufnr)
end

require('telescope').setup({
  defaults = {
    mappings = {
      i = { 
		  ["<C-t>"] = open_marked_as_tabs,
		  ["<C-q>"] = smart_qflist,
	  },
      n = {
		  ["<C-t>"] = open_marked_as_tabs,
		  ["<C-q>"] = smart_qflist,
	  },
    }
  }
})
