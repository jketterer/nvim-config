-- LÖVE prints "Error: file.lua:N: msg" followed by a stack traceback. Keep the
-- error and the traceback frames from project files; drop bracketed frames such
-- as [love "boot.lua"] and [C].
local love_errorformat = table.concat({
    "Error: Syntax error: %f:%l: %m",
    "Error: %f:%l: %m",
    "%-G%\\s%#[%.%#",
    "%\\s%#%f:%l: in %m",
    "%-G%.%#",
}, ",")

local function love_task()
    for _, task in ipairs(require("overseer").list_tasks()) do
        if task.name == "love" then
            return task
        end
    end
end

local function toggle_output()
    local task = love_task()
    if not task then
        vim.notify("LÖVE is not running", vim.log.levels.WARN)
        return
    end
    local bufnr = task:get_bufnr()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_buf(win) == bufnr then
            vim.api.nvim_win_close(win, false)
            return
        end
    end
    require("overseer").run_action(task, "open hsplit")
end

local plugin = {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle" },
    keys = {
        { "<leader>rr", function() require("overseer").run_task({ name = "love" }) end, desc = "Run/restart LÖVE" },
        { "<leader>ro", toggle_output,                                                    desc = "Toggle LÖVE output" },
        {
            "<leader>rs",
            function()
                local task = love_task()
                if task then
                    task:stop()
                end
            end,
            desc = "Stop LÖVE",
        },
    },
    config = function()
        local overseer = require("overseer")
        overseer.setup()

        -- Offered only in a LÖVE project: a directory with both main.lua and conf.lua.
        overseer.register_template({
            name = "love",
            generator = function(search, cb)
                local root = vim.fs.root(search.dir, "conf.lua")
                if not root or not vim.uv.fs_stat(root .. "/main.lua") then
                    return cb({})
                end
                cb({
                    {
                        name = "love",
                        builder = function()
                            return {
                                name = "love",
                                cmd = { "love", "." },
                                cwd = root,
                                components = {
                                    { "on_output_quickfix", errorformat = love_errorformat, open_on_match = true },
                                    "unique",
                                    "default",
                                },
                            }
                        end,
                    },
                })
            end,
        })
    end,
}

return plugin
