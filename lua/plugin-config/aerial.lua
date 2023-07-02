-- https://github.com/stevearc/aerial.nvim
local status, aerial = pcall(require, "aerial")
if not status then
    vim.notify("没有找到 aerial")
    return
end

aerial.setup({
    layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a list of mixed types.
        -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 10,
    },
    -- A list of all symbols to display. Set to false to display all symbols.
    -- This can be a filetype map (see :help aerial-filetype-map)
    -- To see all available values, see :help SymbolKind
    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Struct",
    },
})
