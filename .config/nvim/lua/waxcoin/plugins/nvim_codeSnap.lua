return {
	"mistricky/codesnap.nvim",
	lazy = true,
	build = "make",
	cmd = "CodeSnapPreviewOn",
	opts = {
		mac_window_bar = true,
		opacity = true,
		watermark = "CodeSnap.nvim",
		preview_title = "CodeSnap.nvim",
		editor_font_family = "CaskaydiaCove Nerd Font",
		watermark_font_family = "Pacifico",
	},
	config = function(_, opts)
		require("codesnap").setup(opts)
	end,
}
