-- https://github.com/nvim-treesitter/nvim-treesitter
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {
        "java",
        "c",
        "cpp",
        "json",
        "bash",
        "cmake",
        "kotlin",
        "xml",
        "yaml",
    },
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },
    ignore_install = { "norg" },
})
