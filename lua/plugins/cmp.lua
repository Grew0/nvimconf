return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",       -- C++
				"pyright",      -- Python
				"bash-language-server", -- Bash
				"typescript-language-server", -- JS/TS
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer",       -- Buffer completions
			"hrsh7th/cmp-path",         -- Path completions
			"saadparwaiz1/cmp_luasnip", -- Snippets support
			"L3MON4D3/LuaSnip",         -- Snippet engine
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip'
		},
	},
}
-- return {
-- 	{
-- 		'hrsh7th/nvim-cmp',
-- 		dependencies = {
-- 			{ 'hrsh7th/cmp-nvim-lsp' },
-- 			{ 'hrsh7th/cmp-buffer' },
-- 			{ 'hrsh7th/cmp-path' },
-- 			{ 'hrsh7th/cmp-cmdline' },
-- 			{ 'hrsh7th/cmp-vsnip' },
-- 			{ 'hrsh7th/vim-vsnip' },
-- 		}
-- 	},
--
-- 	{
-- 		'neovim/nvim-lspconfig',
-- 		opts = {
-- 			servers = {
-- 				ast_grep = {},
-- 			}
-- 		}
-- 	}
-- }
