return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        local languages = {
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
        }

        ts.setup({})
        ts.install(languages)

        -- Automatically enable Tree-sitter for installed languages
        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end
}
