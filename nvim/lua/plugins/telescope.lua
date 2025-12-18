return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require "telescope.builtin"

        local function project_files()
            local is_git_repo = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == "true"
            if is_git_repo then
                builtin.git_files()
            else
                builtin.find_files()
            end
        end

        vim.keymap.set("n", "<leader>f", project_files, { desc = "Search project files" })
        vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Search files" })
        vim.keymap.set("n", "<leader>g", builtin.current_buffer_fuzzy_find,
            { desc = "List highlights in current file" })
        vim.keymap.set("n", "<leader>G", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>h", builtin.diagnostics, { desc = "List diagnostics" })
        vim.keymap.set("n", "<leader>H", function()
            builtin.diagnostics { bufnr = 0 }
        end, { desc = "List diagnostics in current file" })
        vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "List keymaps" })
    end
}
