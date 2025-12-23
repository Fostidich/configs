return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>", { desc = "Navigate to tmux pane left" })
        vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>", { desc = "Navigate to tmux pane down" })
        vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>", { desc = "Navigate to tmux pane up" })
        vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>", { desc = "Navigate to tmux pane right" })
    end
}
