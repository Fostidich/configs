return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "lua",
                "javascript",
                "typescript",
                "html",
                "css",
                "python",
                "c",
                "cpp",
                "cmake",
                "java",
                "rust",
                "zig",
                "go",
                "swift"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
