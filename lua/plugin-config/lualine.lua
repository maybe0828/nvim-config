-- https://github.com/nvim-lualine/lualine.nvim
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
        section_separators = {
            left = "", right = ""
        },
        component_separators = {
            left = "", right = ""
        },
        globalstatus = true,
    },
    sections = {
        lualine_a = {"mode"},
        --lualine_b = {"branch", "diff", "diagnostics"},
        lualine_b = {
            "filename",
            "diff",
            {
                "lsp_progress",
                spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
            },
        },
        lualine_c = {
            "filetype",
        },
        lualine_x = {
            "aerial",
            {
                "fileformat",
                symbols = {
                    unix = "unix",
                    dos = "dos",
                    mac = "mac",
                },
            },
            "encoding",
        },
        lualine_y = {"progress"},
        lualine_z = {"location"},
    },
    extensions = {
        "nvim-tree"
    },
})
