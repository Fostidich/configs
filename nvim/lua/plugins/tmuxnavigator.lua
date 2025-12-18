return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate to tmux pane left" })
        vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate to tmux pane down" })
        vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate to tmux pane up" })
        vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate to tmux pane right" })
    end
}
