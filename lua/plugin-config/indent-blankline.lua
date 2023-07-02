-- https://github.com/lukas-reineke/indent-blankline.nvim
local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
    vim.notify("没有找到 indent_blankline")
    return
end

-- vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#404040 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#c0c0c0 gui=nocombine]]

indent_blankline.setup({
    -- 空行占位
    space_char_blankline = "",
    -- 竖线样式
    char = '¦'
    -- char = '┆'
    -- char = '│'
    -- char = "⎸",
    -- char = "▏",

    -- char = "",
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    -- space_char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    -- show_trailing_blankline_indent = false,
})
