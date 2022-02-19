local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "|< Dotfiles >|",
		cwd = "~/.Dotfiles/",
	})
end

M.fourty_two = function()
	require("telescope.builtin").find_files({
		prompt_title = "|< 42 >|",
		cwd = "~/42/",
	})
end

M.current_dir = function()
	local pwd = vim.fn.getcwd()
	require("telescope.builtin").find_files({
		prompt_title = "|< Current >|",
		cwd = pwd,
	})
end

return M
