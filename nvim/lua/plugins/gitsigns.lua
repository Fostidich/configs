return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            current_line_blame = true,
        })
        vim.keymap.set("n", "gp", "<cmd>Gitsigns preview_hunk_inline<CR>")
        vim.keymap.set("n", "go", "<cmd>Gitsigns reset_hunk<CR>")
    end
}
