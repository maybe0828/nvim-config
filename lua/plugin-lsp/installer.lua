-- https://github.com/williamboman/nvim-lsp-installer
local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
    vim.notify("没有找到 lsp_installer")
    return
end

lsp_installer.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- 自动安装 LanguageServers
for name, _ in pairs(lsp_servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end
