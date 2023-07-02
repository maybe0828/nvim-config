-- https://github.com/akinsho/bufferline.nvim
local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
    return
end

vim.o.termguicolors = true
vim.opt.termguicolors = true

bufferline.setup({
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- 使用 nvim 内置 LSP
        --diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        ---@diagnostic disable-next-line: unused-local
        --diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --    local s = " "
        --    for e, n in pairs(diagnostics_dict) do
        --        local sym = e == "error" and " " or (e == "warning" and " " or "")
        --        s = s .. n .. sym
        --    end
        --    return s
        --end,
    },
})
