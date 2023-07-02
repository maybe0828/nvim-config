-- https://github.com/windwp/nvim-autopairs
local status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status then
    vim.notify("没有找到 nvim-autopairs")
    return
end

nvim_autopairs.setup({
})
