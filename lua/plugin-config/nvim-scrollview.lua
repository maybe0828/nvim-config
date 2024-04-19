-- https://github.com/dstein64/nvim-scrollview
local status, nvim_scrollview = pcall(require, "nvim-scrollview")
if not status then
    vim.notify("没有找到 nvim-scrollview")
    return
end

nvim_scrollview.setup({
})
