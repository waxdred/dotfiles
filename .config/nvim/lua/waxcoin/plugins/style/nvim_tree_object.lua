return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
			},
			move = {
				set_jumps = true, -- whether to set jumps in the jumplist
			},
		})

		local select = require("nvim-treesitter-textobjects.select")
		local move = require("nvim-treesitter-textobjects.move")

		-- select keymaps: { lhs, query, desc }
		local selects = {
			{ "a=", "@assignment.outer", "Select outer part of an assignment" },
			{ "i=", "@assignment.inner", "Select inner part of an assignment" },
			{ "l=", "@assignment.lhs", "Select left hand side of an assignment" },
			{ "r=", "@assignment.rhs", "Select right hand side of an assignment" },
			{ "a:", "@property.outer", "Select outer part of an object property" },
			{ "i:", "@property.inner", "Select inner part of an object property" },
			{ "l:", "@property.lhs", "Select left part of an object property" },
			{ "r:", "@property.rhs", "Select right part of an object property" },
			{ "aa", "@parameter.outer", "Select outer part of a parameter/argument" },
			{ "ia", "@parameter.inner", "Select inner part of a parameter/argument" },
			{ "ai", "@conditional.outer", "Select outer part of a conditional" },
			{ "ii", "@conditional.inner", "Select inner part of a conditional" },
			{ "al", "@loop.outer", "Select outer part of a loop" },
			{ "il", "@loop.inner", "Select inner part of a loop" },
			{ "af", "@function.outer", "Select outer part of a method/function definition" },
			{ "if", "@function.inner", "Select inner part of a method/function definition" },
			{ "ac", "@class.outer", "Select outer part of a class" },
			{ "ic", "@class.inner", "Select inner part of a class" },
		}
		for _, m in ipairs(selects) do
			vim.keymap.set({ "x", "o" }, m[1], function()
				select.select_textobject(m[2], "textobjects")
			end, { desc = m[3] })
		end

		-- move keymaps: { lhs, fn, query, desc }
		local moves = {
			{ "]f", move.goto_next_start, "@call.outer", "Next function call start" },
			{ "]m", move.goto_next_start, "@function.outer", "Next method/function def start" },
			{ "]c", move.goto_next_start, "@class.outer", "Next class start" },
			{ "]i", move.goto_next_start, "@conditional.outer", "Next conditional start" },
			{ "]l", move.goto_next_start, "@loop.outer", "Next loop start" },
			{ "[f", move.goto_previous_start, "@call.outer", "Prev function call start" },
			{ "[m", move.goto_previous_start, "@function.outer", "Prev method/function def start" },
			{ "[c", move.goto_previous_start, "@class.outer", "Prev class start" },
			{ "[i", move.goto_previous_start, "@conditional.outer", "Prev conditional start" },
			{ "[l", move.goto_previous_start, "@loop.outer", "Prev loop start" },
		}
		for _, m in ipairs(moves) do
			vim.keymap.set({ "n", "x", "o" }, m[1], function()
				m[2](m[3], "textobjects")
			end, { desc = m[4] })
		end
	end,
}
