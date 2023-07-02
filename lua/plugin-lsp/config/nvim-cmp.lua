-- https://github.com/hrsh7th/nvim-cmp
local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("没有找到 cmp")
    return
end

cmp.setup({
    eabled = true,
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)
            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)
            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- 窗口
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- 来源
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },
        -- For luasnip users.
        -- { name = 'luasnip' },
        --For ultisnips users.
        -- { name = 'ultisnips' },
        -- -- For snippy users.
        -- { name = 'snippy' },
        --{ name = "nvim_lsp_signature_help" },
    },
    {
        { name = "buffer" },
        { name = "path" },
    }),
    -- 快捷键
    mapping = require("keymaps").lsp_cmp(cmp),
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
