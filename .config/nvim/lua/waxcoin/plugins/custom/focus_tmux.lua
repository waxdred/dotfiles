local M = {}

-- Configuration par défaut
M.config = {
	-- Utilisation des couleurs Catppuccin par défaut
	colors = {
		inactive_bg = vim.g.catppuccin_flavour == "mocha" and "#24273A" or "#24273A",
		active_bg = vim.g.catppuccin_flavour == "mocha" and "#3E4154" or "#3E4154",
	},
	-- Active par défaut
	enabled = true,
}

-- Fonction pour configurer le plugin
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- Création des highlight groups
	vim.api.nvim_command("hi ActiveWindow guibg=" .. M.config.colors.active_bg)
	vim.api.nvim_command("hi InactiveWindow guibg=" .. M.config.colors.inactive_bg)

	-- Création du groupe d'autocommandes
	local group = vim.api.nvim_create_augroup("FocusWindows", { clear = true })

	-- Lorsque Neovim regagne le focus
	vim.api.nvim_create_autocmd("FocusGained", {
		group = group,
		callback = function()
			if M.config.enabled then
				vim.wo.winhighlight = "Normal:ActiveWindow"
			end
		end,
	})

	-- Lorsque Neovim perd le focus
	vim.api.nvim_create_autocmd("FocusLost", {
		group = group,
		callback = function()
			if M.config.enabled then
				vim.wo.winhighlight = "Normal:InactiveWindow"
			end
		end,
	})

	-- Commande pour activer/désactiver le plugin
	vim.api.nvim_create_user_command("ToggleFocusWindows", function()
		M.config.enabled = not M.config.enabled
		if M.config.enabled then
			vim.notify("Focus Windows enabled")
		else
			vim.notify("Focus Windows disabled")
		end
	end, {})
end

return M
