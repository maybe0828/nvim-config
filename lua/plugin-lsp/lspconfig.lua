-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig
local mason_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "B", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>F", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "jdtls",
    },
    automatic_installation = true,
})

mason_lspconfig.setup_handlers({
    function (server_name)
        lspconfig[server_name].setup{}
    end,

    -- language config --
    ["clangd"] = function ()
        lspconfig.clangd.setup({
            settings = {
                clangd = {
                    vim.diagnostic.config({
                        virtual_text = false,
                        signs = false,
                        severity_sort = true,
                        update_in_insert = false,
                        underline = false,
                        float = {
                            border = "rounded",
                            source = "always",
                            header = "",
                            prefix = "",
                        },
                    }),
                },
            },
            on_attach = on_attach,
            flags = lsp_flags,
        })
    end,

    ["jdtls"] = function ()
        lspconfig.jdtls.setup({
            cmd = {
                'jdtls', '--java-executable=/usr/bin/java'
            },
        })
    end,
})
