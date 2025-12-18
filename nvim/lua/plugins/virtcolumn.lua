return {
    "lukas-reineke/virt-column.nvim",
    opts = {
        char = "·",
        highlight = "VirtColumn",
        virtcolumn = "80",
    },
    config = function(_, opts)
        local virtcolumn = require("virt-column")
        virtcolumn.setup(opts)

        local enabled = true
        local scrolloff = vim.opt.scrolloff
        vim.keymap.set("n", "\\", opts.virtcolumn .. "|", { desc = "Jump to virtual column" })
        vim.keymap.set("n", "<leader>;", function()
            if enabled then
                virtcolumn.setup({ virtcolumn = "" })
                vim.opt.nu = false
                vim.opt.relativenumber = false
                vim.opt.scrolloff = 0
                enabled = false
            else
                virtcolumn.setup(opts)
                vim.opt.nu = true
                vim.opt.relativenumber = true
                vim.opt.scrolloff = scrolloff
                enabled = true
            end
            vim.cmd "Gitsigns toggle_signs"
            vim.cmd "redraw!"
        end, { desc = "Toggle virtual column" })
    end
}
