return {
  {
"folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  },
  {
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},
}
