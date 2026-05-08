local presets = function()
    vim.lsp.config("sourcekit", {
        filetypes = { "swift", "objc", "objcpp" },
    })
    vim.lsp.config("graphql", {
        filetypes = { "graphqls" },
    })
end

local set_autofmt = function(callback, buffer)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buffer,
        desc = "Autoformatting on save",
        callback = callback
    })
end

local extensions = function(client, buffer)
    if client.name == "markdown_oxide" then
        vim.api.nvim_create_autocmd("BufWritePost", {
            desc = "Format markdown tables",
            callback = function()
                vim.cmd "silent !markdown-table-formatter %"
            end
        })
    end

    if client.name == "vtsls" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        local vtsls_fmt = function() require("conform").format() end
        vim.keymap.set("n", "gf", vtsls_fmt, { desc = "Format with Prettier" })
        set_autofmt(vtsls_fmt, buffer)
    end
end

M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "saghen/blink.cmp" },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        presets()

        vim.lsp.enable "lua_ls"
        vim.lsp.enable "markdown_oxide"
        vim.lsp.enable "vtsls"
        vim.lsp.enable "html"
        vim.lsp.enable "cssls"
        vim.lsp.enable "ruff"
        vim.lsp.enable "pyright"
        vim.lsp.enable "clangd"
        vim.lsp.enable "omnisharp"
        vim.lsp.enable "jdtls"
        vim.lsp.enable "cmake"
        vim.lsp.enable "rust_analyzer"
        vim.lsp.enable "zls"
        vim.lsp.enable "gopls"
        vim.lsp.enable "sourcekit"
        vim.lsp.enable "sqruff"
        vim.lsp.enable "jsonls"
        vim.lsp.enable "protols"
        vim.lsp.enable "graphql"

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP settings set on attach",
            callback = function(args)
                local buffer = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                local mapset = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = buffer, silent = true, desc = desc })
                end
                local mapdel = function(mode, lhs)
                    if vim.fn.maparg(lhs, mode) ~= "" then
                        vim.keymap.del(mode, lhs)
                    end
                end

                mapdel("n", "grn")
                mapdel("n", "gra")
                mapdel("n", "grr")
                mapdel("n", "gri")
                mapdel("n", "grt")

                mapset("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help")
                mapset("n", "K", vim.lsp.buf.hover, "Hover documentation")
                mapset("n", "gd", vim.lsp.buf.definition, "Go to definition")
                mapset("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                mapset("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
                mapset("n", "gu", vim.lsp.buf.references, "Show references")
                mapset("n", "gs", vim.lsp.buf.document_symbol, "Show document symbols")
                mapset("n", "ga", vim.lsp.buf.code_action, "Show code actions")
                mapset("n", "gr", vim.lsp.buf.rename, "Rename symbol")

                extensions(client, buffer)

                local has_autofmt = client:supports_method("textDocument/formatting")
                if has_autofmt then
                    mapset("n", "gf", vim.lsp.buf.format, "Format file")
                    set_autofmt(function()
                        vim.lsp.buf.format { bufrn = buffer, id = client.id }
                    end, buffer)
                end
            end
        })
    end
}

return M
