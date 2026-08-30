local presets = function()
    vim.lsp.config("sourcekit", {
        filetypes = { "swift", "objc", "objcpp" },
    })
    vim.lsp.config("graphql", {
        filetypes = { "graphqls" },
    })
    vim.filetype.add({
        extension = { gltf = "json", },
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
                vim.cmd "silent !prettier --write --prose-wrap always %"
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

        vim.lsp.enable "lua_ls"         -- LUA: lua-language-server (brew)
        vim.lsp.enable "jsonls"         -- JSON: vscode-json-languageserver (npm: vscode-langservers-extracted)
        vim.lsp.enable "html"           -- HTML: vscode-html-languageserver (npm: vscode-langservers-extracted)
        vim.lsp.enable "cssls"          -- CSS: vscode-css-languageserver (npm: vscode-langservers-extracted)
        vim.lsp.enable "vtsls"          -- JS/TS: vtsls (npm: @vtsls/language-server)
        vim.lsp.enable "clangd"         -- C/CPP: clangd (brew: llvm)
        vim.lsp.enable "omnisharp"      -- C#: omnisharp (.local)
        vim.lsp.enable "ruff"           -- PYTHON: ruff (pipx)
        vim.lsp.enable "pyright"        -- PYTHON: pyright-langserver (npm: pyright)
        vim.lsp.enable "rust_analyzer"  -- RUST: rust-analyzer (rustup)
        vim.lsp.enable "gopls"          -- GO: gopls (go)
        vim.lsp.enable "sourcekit"      -- SWIFT: sourcekit-lsp (xcrun)
        vim.lsp.enable "sqruff"         -- SQL: sqruff (brew)
        vim.lsp.enable "markdown_oxide" -- MD: markdown-oxide (brew)
        vim.lsp.enable "glsl_analyzer"  -- GSLS: glsl_analyzer (.local)

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

                client.server_capabilities.semanticTokensProvider = nil

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
