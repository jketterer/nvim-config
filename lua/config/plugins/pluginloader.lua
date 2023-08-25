local loader = {}

function loader.apply(plugins, newPlugin)
    table.insert(plugins, newPlugin)
end

function loader.applyIfCommandExists(command, plugins, newPlugin)
    if vim.fn.executable(command) == 1 then
        loader.apply(plugins, newPlugin)
    end
end

return loader
