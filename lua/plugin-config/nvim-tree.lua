-- https://github.com/kyazdani42/nvim-tree.lua
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

nvim_tree.setup({
    auto_reload_on_write = true,
    disable_netrw = true,
    update_cwd = true,
    view = {
        width = 30,
        cursorline = true,
        side = "left",
        hide_root_folder = false,
        number = false,
        relativenumber = false,
    },
    renderer = {
        add_trailing = false,
    },
    update_focused_file = {
        enable = true,
    },
    git = {
        enable = false,
    },
    filters = {
        -- 隐藏 .文件
        dotfiles = true,
    },
    actions = {
        use_system_clipboard = true,
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
})
