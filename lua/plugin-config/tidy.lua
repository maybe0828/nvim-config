-- https://github.com/mcauley-penney/tidy.nvim
local status, tidy = pcall(require, "tidy")
if not status then
    vim.notify("没有找到 tidy.nvim")
    return
end

tidy.setup({
    opts = {
        enabled_on_save = true
    }
})
