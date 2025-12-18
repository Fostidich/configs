return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require "harpoon"
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            { desc = "Pin a file" })
        vim.keymap.set("n", "<leader>s", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Show pinned files" })

        vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end,
            { desc = "Go to first pinned file" })
        vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end,
            { desc = "Go to second pinned file" })
        vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end,
            { desc = "Go to third pinned file" })
        vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end,
            { desc = "Go to fourth pinned file" })

        vim.keymap.set("n", "<leader>Q", function() harpoon:list():prev() end,
            { desc = "Go to previous pinned file" })
        vim.keymap.set("n", "<leader>W", function() harpoon:list():next() end,
            { desc = "Go to next pinned file" })
    end
}
