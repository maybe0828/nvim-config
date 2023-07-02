-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = false,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)
-- 单行移动
map("n", "j", "gj", opt);
map("n", "k", "gk", opt);
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)
-- 保存
map("n", "<A-w>", ":w<CR>", opt)
-- 关闭buffer窗口
map("n", "<A-c>", ":Bdelete %<CR>", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- Terminal相关
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)

------------------------------------------------------------------
-- plugins 快捷键
------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- aerial --
map("n", "<F3>", ":AerialToggle right<CR>", opt)

-- nvim-tree --
map("n", "<F2>", ":NvimTreeToggle<CR>", opt)
map("n", "<A-+>", ":NvimTreeResize +20<CR>", opt)
map("n", "<A-->", ":NvimTreeResize -20<CR>", opt)

-- bufferline --
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-o>", ":BufferLineCloseOthers<CR>", opt)

-- gitsigns --
map("n", "<A-?>", ":Gitsigns toggle_current_line_blame<CR>", opt)

-- telescope --
map("n", "<A-f>f", ":Telescope find_files<CR>", opt)
map("n", "<A-f>g", ":Telescope live_grep<CR>", opt)
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
        -- 历史记录
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        -- 预览窗口上下滚动
        ["<A-u>"] = "preview_scrolling_up",
        ["<A-d>"] = "preview_scrolling_down",
    },
}

-- lsp --
-- nvim-cmp 自动补全
pluginKeys.lsp_cmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
        -- 上一个
        --["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        --["<C-j>"] = cmp.mapping.select_next_item(),
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }
end

return pluginKeys
