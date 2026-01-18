function ToggleQuickfix()
    local winid = vim.fn.getqflist({ winid = 0 }).winid
    if winid ~= 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

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

function ToggleWrap()
    local new_wrap = not vim.wo.wrap
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        vim.wo.wrap = new_wrap
        vim.api.nvim_set_current_win(win)
        vim.wo.wrap = new_wrap
    end
end

function ClearReg()
    for i = 0, 255 do
        pcall(vim.fn.setreg, string.char(i), {})
    end
end

function ToggleFrame()
    local state = require "config.state"
    if state.frame_enabled then
        vim.opt.nu = false
        vim.opt.relativenumber = false
        vim.opt.scrolloff = 0
        vim.opt.fillchars:append { eob = " " }
        state.frame_enabled = false
    else
        vim.opt.nu = true
        vim.opt.relativenumber = true
        vim.opt.scrolloff = state.scrolloff
        vim.opt.fillchars:append { eob = state.eob }
        state.frame_enabled = true
    end
    vim.cmd "Gitsigns toggle_signs"
    vim.cmd "redraw!"
end
