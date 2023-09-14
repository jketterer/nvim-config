require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler
        require("lspconfig")[server_name].setup {}
    end,

    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            -- Suppress "Global vim is undefined"
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
