function ToggleQuickfix()
    local winid = vim.fn.getqflist({ winid = 0 }).winid
    if winid ~= 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

vim.api.nvim_create_user_command("ToggleQuickfix", ToggleQuickfix, {})

function SoloBuf()
    local current_buf = vim.fn.bufnr()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    for _, buf in ipairs(bufs) do
        if buf.bufnr ~= current_buf then
            vim.cmd("bdelete " .. buf.bufnr)
            print("Closed buffer " .. buf.bufnr)
        end
    end
    print("Left open buffer " .. current_buf)
end

vim.api.nvim_create_user_command("SoloBuf", SoloBuf, {})

function ToggleWrap()
    local new_wrap = not vim.wo.wrap
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        vim.wo.wrap = new_wrap
        vim.api.nvim_set_current_win(win)
        vim.wo.wrap = new_wrap
    end
end

vim.api.nvim_create_user_command("ToggleWrap", ToggleWrap, {})
