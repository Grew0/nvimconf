return {
    'goolord/alpha-nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
		local dashboard = require("alpha.themes.dashboard")
		-- Set header

		local variants = require("config.alphatitles");
		math.randomseed(os.clock())
		dashboard.section.header.val = variants[math.random(#variants)];

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button( "n", "  > New file" , ":ene<CR>"),
			dashboard.button( "f", "󰈞  > Find file", "Telescope find_files<CR>"),
			dashboard.button( "r", "󱋡  > Recent file"   , ":Telescope oldfiles<CR>"),
			dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button( "t", "  > Terminal" , ":ene<CR>:terminal<CR>i"),
			dashboard.button( "q", "󰜺  > Quit NVIM", ":qa<CR>"),
		}

        require'alpha'.setup(dashboard.opts)
    end
};
