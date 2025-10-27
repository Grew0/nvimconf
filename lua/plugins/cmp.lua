return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "clangd", "pyright", "bash-language-server", "typescript-language-server" },
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

