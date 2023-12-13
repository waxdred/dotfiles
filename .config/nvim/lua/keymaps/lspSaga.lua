local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Rename
keymap.set("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", opts)
-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Go to Definition
-- keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show line diagnostics you can pass argument ++unfocus to make
-- show_line_diagnostics float window unfocus
keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostic
-- also like show_line_diagnostics  support pass ++unfocus
keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Show buffer diagnostic
keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

-- Diagnostic jump can use `<c-o>` to jump back
keymap.set("n", "<leader>k", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "<leader>j", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Toggle Outline
keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

-- Hover Doc
-- if there has no hover will have a notify no information available
-- to disable it just Lspsaga hover_doc ++quiet
-- press twice it will jump into hover window
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
