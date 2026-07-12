-- Auto-install language servers.
-- mason-lspconfig v2 automatically enables installed servers via vim.lsp.enable,
-- so there is no setup_handlers loop anymore.
require("mason-lspconfig").setup { ensure_installed = { "lua_ls" } }

-- Per-server configuration uses the native vim.lsp.config API (Neovim 0.11+).
-- nvim-lspconfig ships the base config for each server; this merges on top.
vim.lsp.config("lua_ls", {
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
})

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
