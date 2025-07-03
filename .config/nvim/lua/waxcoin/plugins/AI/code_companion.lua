return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		{ "stevearc/dressing.nvim", opts = {} },
		"rcarriga/nvim-notify",
	},
	-- TODO need make test
	opts = {
		strategies = {
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "anthropic",
			},
		},
		adapters = {},
	},
	config = function(_, opts)
		opts.adapters.anthropic = function()
			local api_key = os.getenv("ANTHROPIC_API_KEY")
			return require("codecompanion.adapters").extend("anthropic", {
				env = {
					api_key = api_key,
				},
			})
		end

		require("codecompanion").setup(opts)
	end,
}
