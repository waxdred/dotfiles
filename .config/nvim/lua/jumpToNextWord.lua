vim.api.nvim_create_user_command("JumpToNextOccurenteWord", function()
    local word = vim.fn.expand("<cword>")
    vim.api.nvim_command(string.format("/%s", word))
end, {})
