vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.schedule(function()
                require("oil").open()
            end)
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Remove trailing spaces",
    callback = function()
        if vim.b.has_autofmt then return end
        vim.cmd([[%s/\s\+$//e]])
        local last_nonblank = vim.fn.prevnonblank(vim.fn.line("$"))
        local last_line = vim.fn.line("$")
        if last_line > last_nonblank + 1 then
            vim.api.nvim_buf_set_lines(0, last_nonblank, last_line, false, { "" })
        elseif last_line == last_nonblank then
            vim.api.nvim_buf_set_lines(0, last_line, last_line, false, { "" })
        end
    end,
})
