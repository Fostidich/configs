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

        config.register_frame_callback(function()
            if config.frame_enabled then
                virtcolumn.setup({ virtcolumn = "" })
            else
                virtcolumn.setup(opts)
            end
        end)

        vim.keymap.set("n", "\\", opts.virtcolumn .. "|", { desc = "Jump to virtual column" })
    end
}
