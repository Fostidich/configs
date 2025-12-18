return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            options = {
                globalstatus = true
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { { 'filename', path = 1 } },
                lualine_c = { 'diagnostics' },
                lualine_x = {},
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            }
        })
    end
}
