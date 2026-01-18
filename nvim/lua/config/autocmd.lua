vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Open file explorer with no args",
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

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'WinNew', 'VimResized' }, {
    desc = "Set precis scrolloff for centered cursor",
    callback = function()
        vim.o.scrolloff = math.floor((vim.api.nvim_win_get_height(0) - 1) / 2)
        require("config.state").scrolloff = vim.o.scrolloff
    end,
})
