return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require "oil"

        vim.keymap.set("n", "<leader>D", function()
            oil.open_float(nil, { preview = { enabled = true } })
        end, { desc = "Open Oil in float with preview" })
        vim.keymap.set("n", "<leader>d", function()
            local util = require("oil.util")
            oil.open()
            util.run_after_load(0, function()
                oil.open_preview()
            end)
        end, { desc = "Open Oil with preview" })

        oil.setup({
            default_file_explorer = true,
            columns = {},
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            constrain_cursor = "name",
            watch_for_changes = true,
            keymaps = {
                ["<leader>d"] = { "actions.close", mode = "n", desc = "Open file explorer in float" },
                ["<leader>D"] = { "actions.close", mode = "n", desc = "Open file explorer" },
                ["<esc>"] = { "actions.close", mode = "n", desc = "Close file explorer" },
                ["q"] = { "actions.close", mode = "n", desc = "Close file explorer" },
                ["<cr>"] = { "actions.select", mode = "n", desc = "Open file or folder" },
                ["L"] = { "actions.select", mode = "n", desc = "Open file or folder" },
                ["<bs>"] = { "actions.parent", mode = "n", desc = "Go to parent folder" },
                ["H"] = { "actions.parent", mode = "n", desc = "Go to parent folder" },
                ["<C-p>"] = { "actions.preview", mode = 'n', desc = "Show preview" },
                ["<C-.>"] = { "actions.toggle_hidden", mode = "n", desc = "Toggle hidden files" },
                ["<C-h>"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
                ["<C-l>"] = false,
            },
            use_default_keymaps = true,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, _)
                    return name:match("^%.") ~= nil
                end,
                is_always_hidden = function(name, _)
                    return name == "." or name == ".." or name == ".DS_Store"
                end,
            },
            float = {
                padding = 10,
                preview_split = "right",
            },
        })
    end
}
