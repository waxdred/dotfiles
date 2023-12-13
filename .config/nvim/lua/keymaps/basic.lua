local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- mapping Lex
keymap.set("n", "<leader>rr", ":Ex<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)

-- mark
keymap.set("n", "<leader><leader>1", ":mark a <CR>", opts)
keymap.set("n", "<leader><leader>2", ":mark b <CR>", opts)
keymap.set("n", "<leader><leader>3", ":mark c <CR>", opts)
keymap.set("n", "<leader>1", "'a", opts)
keymap.set("n", "<leader>3", "'c", opts)
keymap.set("n", "<leader>2", "'b", opts)

-- open term
keymap.set("n", "<leader>tt", ":ToggleTerm size=20 cmd='fish'<CR>", opts)

-- mapping find replace word undercursor in all buffer
keymap.set("n", "<Leader>sed", ":bufdo %s/<C-r><C-w>//g<Left><Left>", opts)
keymap.set("n", "<Leader>se", ":s/<<C-r><C-w>>//g | update <Left><Left><Left><Left><Left><Left><Left><Left>", opts)

-- commante line

keymap.set("n", "<leader><leader>c", ":Commentary <CR>", opts)
--jump word
keymap.set("n", "<C-n>", ":JumpToNextOccurenteWord<CR>", opts)
-- running macro
keymap.set("n", "<leader>q", "@q", opts)
-- Save
keymap.set("n", "<leader>w", ":w<CR> :wa<CR>", opts)

-- mapping change viewport
keymap.set("n", "<TAB>", "<C-W><C-W>", opts)
keymap.set("n", "<S-TAB>", ":bn<CR>", opts)

-- add new line
keymap.set("n", "<leader>o", "o<Esc>", opts)
keymap.set("n", "O", "o<Esc>", opts)
