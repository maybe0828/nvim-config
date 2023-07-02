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

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
    },
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
                    vim.diagnostic.disable(nil, nil)
                }
            },
        })
    end,
})
