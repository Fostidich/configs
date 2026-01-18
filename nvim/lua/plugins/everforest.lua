return {
    "sainnhe/everforest",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "everforest"

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

        vim.cmd "highlight VirtColumn guifg=#343f44"
        vim.cmd "highlight SpellBad gui=underline guisp=#9da9a0"
    end,
}
