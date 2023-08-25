local cmp = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "dcampos/nvim-snippy",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-n'] = cmp.mapping.scroll_docs(4),  -- Down
                ['<C-Space'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            snippet = {
                expand = function(args)
                    require("snippy").expand_snippet(args.body)
                end
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "snippy" },
            },
        })
    end
}

return cmp;
