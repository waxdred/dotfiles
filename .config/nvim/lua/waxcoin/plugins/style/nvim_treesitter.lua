return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		-- the main branch does NOT support lazy-loading
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()

			-- ensure these language parsers are installed
			local ensure_installed = {
				"astro",
				"terraform",
				"cmake",
				"tsx",
				"yaml",
				"c",
				"bash",
				"ssh_config",
				"json",
				"cpp",
				"css",
				"fish",
				"gitignore",
				"lua",
				"go",
				"graphql",
				"http",
				"html",
				"javascript",
				"java",
				"typescript",
				"php",
				"rust",
				"scss",
				"markdown",
				"markdown_inline",
				"sql",
				"svelte",
				"zig",
			}

			local already_installed = require("nvim-treesitter.config").get_installed()
			local to_install = vim.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(already_installed, parser)
				end)
				:totable()
			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end

			-- enable highlighting + indentation per filetype
			-- (replaces the old highlight/indent options of the master branch)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			-- NOTE: `incremental_selection` no longer exists on the main branch.
			-- Neovim 0.12 ships a native equivalent: in normal mode press
			-- `v` to start visual, then `<C-Space>` is not built-in, but you can
			-- grow the selection with `viw`/`a`/`i` text objects, or rebind here
			-- if you want a custom incremental flow.
		end,
	},
}
