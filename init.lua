-- 基础配置
require('basic')

-- 快捷键映射
require("keymaps")

-- 自动命令
require("autocmds")

-- Packer插件管理(run checkhealth)
require("plugins")

-- 插件配置
require("plugin-config.aerial")
require("plugin-config.bufferline")
require("plugin-config.gitsigns")
require("plugin-config.indent-blankline")
require("plugin-config.lualine")
require("plugin-config.nvim-autopairs")
require("plugin-config.nvim-scrollview")
require("plugin-config.nvim-tree")
require("plugin-config.nvim-treesitter")
require("plugin-config.telescope")
require("plugin-config.toggleterm")
require("plugin-config.tokyonight")

-- 内置LSP
require("plugin-lsp.setup")
