-- https://github.com/hrsh7th/nvim-cmp
local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("没有找到 cmp")
    return
end

local kind_icons = {
    -- Class = '🅒',
    Class = "∴",
    -- Color = '☀',
    -- Color = '⛭',
    Color = "🖌",
    -- Constant = 'π',
    Constant = "𝜋",
    Constructor = "⬡",
    -- Constructor = '⌬',
    -- Constructor = '⎔',
    -- Constructor = '⚙',
    -- Constructor = 'ᲃ',
    Enum = "",
    EnumMember = "",
    Event = "",
    -- Field = '→',
    -- Field = '∴',
    --Field = '🠶',
    Field = "",
    File = "",
    Folder = "",
    Function = "ƒ",
    -- Function = 'λ',
    Interface = "",
    --Keyword = '🗝',
    Keyword = "",
    Method = "𝘮",
    -- Method = 'λ',
    --Module = '📦',
    Module = "",
    Operator = "≠",
    -- Operator = '±',
    -- Property = '::',
    Property = "∷",
    -- Reference = '⌦',
    Reference = "⊷",
    -- Reference = '⊶',
    -- Reference = '⊸',
    -- Snippet = '',
    -- Snippet = '↲',
    -- Snippet = '♢',
    -- Snippet = '<>',
    Snippet = "{}",
    Struct = "",
    --Text = '#',
    -- Text = '♯',
    -- Text = 'ⅵ',
    -- Text = "¶",
    -- Text = "𝒯",
    Text = "𝓣",
    -- Text = "𐄗",
    TypeParameter = "×",
    Unit = "()",
    -- Value           =
    -- Variable = '𝛼',
    -- Variable = 'χ',
    Variable = "𝓧",
    -- Variable = '𝛸',
    -- Variable = 'α',
    -- Variable = '≔',
  }
  -- other symbols that might be useful for something: -- ⊕ † ፨ ᯾ ⁂ ∎ ∹ ☖ ⚐ 🕮 🗈 🗉 🗈 🗉 ⬠  ⬡  ⮺  ⮻ ⯐  ⯒ ⟡ ✐  ✎ ꒾꙳ ꥟ ⤙ ⤚ ⤛ ⤜

cmp.setup({
    eabled = true,
    preselect = cmp.PreselectMode.None,
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
    experimental = {
        ghost_text = false,
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
        { name = "calc" },
        { name = "buffer" },
        { name = "path" },
        { name = "spell" },
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                -- omni = "[VimTex]",
                omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
                nvim_lsp = "[LSP]",
                vsnip = "[Snippet]",
                buffer = "[Buffer]",
                spell = "[Spell]",
                latex_symbols = "[Symbols]",
                cmdline = "[CMD]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    --enable catppuccin integration
    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
        },
    },
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
