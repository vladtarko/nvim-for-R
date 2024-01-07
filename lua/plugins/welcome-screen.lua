return {
	-- dashboard to greet
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
        [[                                  __]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h<cr>"),
				dashboard.button("q", "🗶  > Quit NVIM", ":qa<CR>")
			}

			local fortune = require("alpha.fortune")
			dashboard.section.footer.val = fortune({
				fortune_list = {
					{ "You otter be proud of yourself!", "", "— 🦦" },
					{ "Hello from the otter slide!", "", "— Otterdele" },
					{ "To otter space!", "", "— 🦦" },
					{ "What if I say I'm not like the otters?", "", "— Foo Fighters" },
				},
			})

			-- Send config to alpha
			alpha.setup(dashboard.opts)
		end,
	},
}
