local plugins = {
    { "fladson/vim-kitty" },
    { "neovim/nvim-lspconfig" },
    { "RRethy/vim-illuminate" },
    { "folke/tokyonight.nvim" },
    { "nmac427/guess-indent.nvim", config = true },
    {
        "ellisonleao/gruvbox.nvim",
        opts = { contrast = "soft" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = true,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    }
}

local pluginLoader = require("config.plugins.pluginloader")

pluginLoader.apply(plugins, require("config.plugins.alpha"))
pluginLoader.apply(plugins, require("config.plugins.autopairs"))
pluginLoader.apply(plugins, require("config.plugins.cmp"))
pluginLoader.apply(plugins, require("config.plugins.comment"))
pluginLoader.apply(plugins, require("config.plugins.harpoon"))
pluginLoader.apply(plugins, require("config.plugins.highlight_undo"))
pluginLoader.apply(plugins, require("config.plugins.leap"))
pluginLoader.apply(plugins, require("config.plugins.mason"))
pluginLoader.apply(plugins, require("config.plugins.neotree"))
pluginLoader.apply(plugins, require("config.plugins.notify"))
pluginLoader.apply(plugins, require("config.plugins.telescope"))
pluginLoader.apply(plugins, require("config.plugins.toggleterm"))
pluginLoader.apply(plugins, require("config.plugins.trouble"))

pluginLoader.applyIfCommandExists("flutter", plugins, require("config.plugins.flutter"))
pluginLoader.applyIfCommandExists("gcc", plugins, require("config.plugins.treesitter"))
pluginLoader.applyIfCommandExists("lazygit", plugins, require("config.plugins.lazygit"))

return plugins
