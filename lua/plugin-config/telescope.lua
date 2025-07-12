-- https://github.com/nvim-telescope/telescope.nvim
local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("没有找到 telescope")
    return
end

telescope.setup({
    defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = "insert",
        -- vertical , center , cursor
        --layout_strategy = "horizontal",
        layout_strategy = "vertical",
        wrap_results = true,
        -- 窗口内快捷键
        mappings = require("keymaps").telescopeList,
        --path_display = {
        --    "smart",
        --},
        preview = true,
    },
    pickers = {
        find_files = {
            -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
            layout_config = {
                width = 0.95, -- 增大窗口宽度(默认0.8)
                height = 0.95, -- 增大窗口高度(默认0.8)
            },
        },
        live_grep = {
            layout_config = {
                width = 0.95, -- 增大窗口宽度(默认0.8)
                height = 0.95, -- 增大窗口高度(默认0.8)
            }.
        },
    },
})
