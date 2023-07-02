-- https://github.com/akinsho/toggleterm.nvim
local status, toggleterm = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
    return
end

toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    open_mapping = [[<c-\>]],
    start_in_insert = true,
})
