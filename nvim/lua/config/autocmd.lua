vim.api.nvim_create_autocmd({ "BufEnter" }, {
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
    desc = "Close commands panel with q",
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    end,
})

vim.api.nvim_create_autocmd({ "WinNew" }, {
    callback = function()
        if vim.fn.winnr("$") ~= 2 then return end
        if vim.fn.win_gettype(2) ~= "" then return end
        vim.api.nvim_win_set_width(0, 86)
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Remove trailing spaces on save",
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
