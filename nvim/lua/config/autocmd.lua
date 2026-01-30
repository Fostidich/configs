vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'WinNew', 'VimResized' }, {
    desc = "Set precise scrolloff for centered cursor",
    callback = function()
        -- FIXME: fucks up after comp menu drops down
        vim.o.scrolloff = math.floor((vim.api.nvim_win_get_height(0) - 1) / 2)
        vim.g.scrolloff = vim.o.scrolloff
    end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'WinNew' }, {
    desc = "Quit with q on readonly buffers",
    callback = function()
        if vim.bo.readonly then
            vim.keymap.set("n", "q", function()
                local listed = vim.fn.getbufinfo()
                if #listed <= 1 then
                    vim.cmd "quit"
                else
                    vim.cmd "bd"
                end
            end, { buffer = true, desc = "Close readonly window" })
        end
    end
})

vim.api.nvim_create_autocmd("CmdwinEnter", {
    desc = "Close commands history panel with q",
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank()
    end
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
