vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { desc = "Remove highlight" })
vim.keymap.set("x", "p", [["_dP]], { desc = "Substitute text" })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Unfocus from terminal" })

vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move selected text up" })

vim.keymap.set("v", ">", ">gv", { desc = "Indend visual block" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent visual block" })

vim.keymap.set("n", "L", "G$", { desc = "Last file char" })
vim.keymap.set("n", "H", "gg0", { desc = "First files char" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go up a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go down a page" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Append next line" })
vim.keymap.set("n", "G", "Gzz", { desc = "Append next line" })
vim.keymap.set("n", "n", "nzz", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous match" })

vim.keymap.set("n", "<C-p>", "<cmd>cprev<cr>", { desc = "Previous quickfix match" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { desc = "Next quickfix match" })
vim.keymap.set("n", "<leader>o", ToggleQuickfix, { desc = "Toggle Quickfix" })

vim.keymap.set("n", "<leader>,", ToggleWrap, { desc = "Toggle text wrap option" })
vim.keymap.set("n", ",", "mzo<esc>`z", { desc = "Print a new line" })
vim.keymap.set("n", ";", "mzO<esc>`z", { desc = "Print a new line" })
