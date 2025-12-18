return {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = "transparent",
                floats = "transparent",
            },
        })

        vim.cmd.colorscheme "tokyonight"

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

        vim.cmd "highlight LineNr guifg=#7aa2f7"
        vim.cmd "highlight LineNrAbove guifg=#16161e"
        vim.cmd "highlight LineNrBelow guifg=#16161e"

        vim.cmd "highlight VirtColumn guifg=#7aa2f7"
        vim.cmd "highlight SpellBad gui=underline guisp=#565f89"
    end
}
