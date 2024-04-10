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
            "branch",
        },
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 0,
                symbols = {
                    modified = '[M]',      -- Text to show when the file is modified.
                    readonly = '[R]',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                },
            },
            {
                "diff",
                colored = true,
                symbols = { -- Changes the symbols used by the diff.
                    added = '+',
                    modified = '~',
                    removed = '-'
                },
            },
            {
                "lsp_progress",
                spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
            },
        },
        lualine_x = {
            {
                "fileformat",
                symbols = {
                    unix = "unix",
                    dos = "dos",
                    mac = "mac",
                    --unix = '', -- e712
                    --dos = '',  -- e70f
                    --mac = '',  -- e711
                },
            },
            "encoding",
        },
        lualine_y = {
            {
                "filetype",
                icon_only = false,
            },
            "filesize",
        },
        lualine_z = {
            "progress",
            "location",
        },
    },
    winbar = {
        lualine_a = {
            "aerial"
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {
        "nvim-tree"
    },
})
