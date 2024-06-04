-- Auto-install language servers
require("mason-lspconfig").setup { ensure_installed = { "lua_ls" } }

-- Configure language servers
require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler
        require("lspconfig")[server_name].setup {}
    end,

    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Suppress "Global vim is undefined"
                        globals = { "vim" },
                        -- Suppress "Same file is required under a different name"
                        disable = { "different-requires" }
                    }
                }
            }
        }
    end,
}

-- Run callback after LSP attaches to buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = function(description)
            return {
                buffer = ev.buf,
                desc = description
            }
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
        vim.keymap.set("n", "gm", vim.lsp.buf.implementation, opts("Go to implementation"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("LSP Hover"))
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("LSP Signature Help"))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))

        vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format { async = true }
        end, opts("Format"))
    end,
})
