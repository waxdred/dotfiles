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
	config = function()
		require("codecompanion").setup({
			adapters = {
				ollama = function()
					local api_key = os.getenv("LLAMA_API_KEY")
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "https://ollama.waxmaker.app",
							api_key = api_key,
						},
						headers = {
							["Content-Type"] = "application/json",
							["Authorization"] = "Bearer ${api_key}",
						},
						parameters = {
							sync = true,
						},
						schema = {
							model = {
								default = "llama3.2",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
				agent = {
					adapter = "ollama",
				},
			},
		})
	end,
}
