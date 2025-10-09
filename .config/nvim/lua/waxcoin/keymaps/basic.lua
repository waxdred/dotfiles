local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- setup relative line numbers

vim.opt.number = true
vim.opt.relativenumber = true

-- mapping Lex
keymap.set("n", "<leader>rr", ":Ex<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)

keymap.set("n", "<leader><leader>h", ":help<CR>", opts)

-- mark
keymap.set("n", "<leader><leader>1", ":mark a <CR>", opts)
keymap.set("n", "<leader><leader>2", ":mark b <CR>", opts)
keymap.set("n", "<leader><leader>3", ":mark c <CR>", opts)
keymap.set("n", "<leader>1", "'a", opts)
keymap.set("n", "<leader>2", "'b", opts)
keymap.set("n", "<leader>3", "'c", opts)

-- open term
keymap.set("n", "<leader>tt", ":ToggleTerm size=20 cmd='fish'<CR>", opts)

-- mapping find replace word undercursor in all buffer
keymap.set("n", "<Leader>sed", ":bufdo %s/<C-r><C-w>//g<Left><Left>", opts)
keymap.set("n", "<Leader>se", ":s/<<C-r><C-w>>//g | update <Left><Left><Left><Left><Left><Left><Left><Left>", opts)

-- commande line
keymap.set("n", "<leader><leader>c", ":Commentary <CR>", opts)
--jump word
keymap.set("n", "<C-n>", ":JumpToNextOccurenteWord<CR>", opts)

-- Save
keymap.set("n", "<leader>w", ":w<CR> :wa<CR>", opts)

-- mapping change viewport
keymap.set("n", "<TAB>", "<C-W><C-W>", opts)
keymap.set("n", "<S-TAB>", ":bn<CR>", opts)

-- add new line
keymap.set("n", "<leader>o", "o<Esc>", opts)
keymap.set("n", "O", "o<Esc>", opts)

-- Open NeoTree
keymap.set("n", "<leader>ee", ":Neotree<CR>", opts)
keymap.set("n", "<leader>ef", ":Neotree close<CR>", opts)

-- Keymap navigation buffer
-- Aller à la fenêtre de gauche
keymap.set("n", "<C-H>", "<C-w>h", opts)
keymap.set("n", "<C-w>h", ":sp<CR>", opts)

-- Aller à la fenêtre de droite
keymap.set("n", "<C-L>", "<C-w>l", opts)

-- Aller à la fenêtre du haut
keymap.set("n", "<C-K>", "<C-w>k", opts)

-- Aller à la fenêtre du bas
keymap.set("n", "<C-J>", "<C-w>j", opts)

-- Split vertical
keymap.set("n", "<C-w>v", ":vsp<CR>", opts)

-- Close current window
keymap.set("n", "<leader>x", ":close<CR>", opts)

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Code Compagnion
keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>", opts)
keymap.set("v", "<leader>cc", ":CodeCompanionChat<CR>", opts)
keymap.set("n", "<leader>ca", ":CodeCompanionActions<CR>", opts)
keymap.set("v", "<leader>ca", ":CodeCompanionActions<CR>", opts)
keymap.set("n", "<leader>ci", ":CodeCompanionInline<CR>", opts)
