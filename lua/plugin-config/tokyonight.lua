-- https://github.com/folke/tokyonight.nvim
local status, tokyonight = pcall(require, "tokyonight")
if not status then
    vim.notify("没有找到 tokyonight")
    return
end

tokyonight.setup({
    vim.cmd[[colorscheme tokyonight]]
})
