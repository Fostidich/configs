vim.diagnostic.config({
    virtual_text = {
        prefix = "·",
        spacing = 2,
        priority = 20
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

vim.keymap.set("n", "ge", function()
    vim.fn.setqflist({}, ' ')
    vim.diagnostic.setqflist()
end, { desc = "Show file diagnostics" })
vim.keymap.set("n", "gm", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
