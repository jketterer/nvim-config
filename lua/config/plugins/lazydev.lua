local plugin = {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        -- Projects with their own .luarc.json (e.g. LÖVE games) describe their
        -- own runtime, so keep the Neovim API types out of them.
        enabled = function(root_dir)
            return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
        end,
    },
}

return plugin
