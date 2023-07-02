-- https://github.com/neovim/nvim-lspconfig
local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for name, _ in pairs(lsp_servers) do
    lspconfig[name].setup {
        capabilities = capabilities,
    }
end
