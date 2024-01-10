return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"?",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
		},
		{
			"<leader>xx",
			function()
				require("telescope.builtin").diagnostics(require("telescope.themes").get_dropdown({}))
			end,
		},
		{
			"<leader>;",
			function()
				require("telescope.builtin").find_files({
					cwd = require("lazy.core.config").options.root,
				})
			end,
			desc = "Find Plugin File",
		},
		{
			"<leader>bg",
			function()
				local builtin = require("telescope.builtin")
				builtin.git_files()
			end,
			desc = "Find from git",
		},
		{
			"<leader>bf",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end,
			desc = "Lists files in your current working directory, respects .gitignore",
		},
		{
			"<leader>br",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep()
			end,
			desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
		},
		{
			"<leader>bb",
			function()
				local builtin = require("telescope.builtin")
				builtin.buffers()
			end,
			desc = "Lists open buffers",
		},
		{
			";t",
			function()
				local builtin = require("telescope.builtin")
				builtin.help_tags()
			end,
			desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
		},
		{
			";s",
			function()
				local builtin = require("telescope.builtin")
				builtin.treesitter()
			end,
			desc = "Lists Function names, variables, from Treesitter",
		},
		{
			"sf",
			function()
				local telescope = require("telescope")

				local function telescope_buffer_dir()
					return vim.fn.expand("%:p:h")
				end

				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end,
			desc = "Open File Browser with the path of the current buffer",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
