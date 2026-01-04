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

        vim.keymap.set("n", "<leader>;", function()
            local state = require "config.functions"
            if state.frame_enabled then
                virtcolumn.setup({ virtcolumn = "" })
            else
                virtcolumn.setup(opts)
            end
            ToggleFrame()
        end, { desc = "Toggle virtual column" })
        vim.keymap.set("n", "\\", opts.virtcolumn .. "|", { desc = "Jump to virtual column" })
    end
}
