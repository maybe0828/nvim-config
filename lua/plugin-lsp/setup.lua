-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
lsp_servers = {
    --sumneko_lua = require("plugin-lsp.language.lua"),
    --clangd = require("plugin-lsp.language.clangd"),
    --jdtls = require("plugin-lsp.language.java"),
    --bashls = require("plugin-lsp.language.bash"),
    --pyright = require("plugin-lsp.language.python"),
    --jsonls = require("plugin-lsp.language.json"),
}

require("plugin-lsp.installer")
require("plugin-lsp.lspconfig")

-- config配置
require("plugin-lsp.config.nvim-cmp")
require("plugin-lsp.config.lspkind")
