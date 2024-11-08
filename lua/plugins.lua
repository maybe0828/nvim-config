-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    paccker_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")

    -------------------------- plugins -------------------------------------------
    -- nvim-tree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
    })

    -- bufferline
    use({
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    })

    -- lualine
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use("arkav/lualine-lsp-progress")

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    -- telescope extensions
    --use("nvim-telescope/telescope-ui-select.nvim")

    -- project
    --use("ahmedkhalf/project.nvim")

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- nvim-navic
    --use {
    --    "SmiteshP/nvim-navic",
    --    requires = "neovim/nvim-lspconfig"
    --}

    -- aerial
    use ("stevearc/aerial.nvim")

    -- nvim-scrollview
    --use ("dstein64/nvim-scrollview")

    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    -- terminal
    use("akinsho/toggleterm.nvim")

    -- nvim-autopairs
    use("windwp/nvim-autopairs")

    -- tidy.nvim
    use("mcauley-penney/tidy.nvim")

    -- alpha-nvim
    --use("goolord/alpha-nvim")

    -- git
    use("lewis6991/gitsigns.nvim")

    -- dashboard-nvim
    --use("glepnir/dashboard-nvim")

    -- surround
    --use("ur4ltz/surround.nvim")

    -- Comment
    --use("numToStr/Comment.nvim")

    -- heirline
    --use("rebelot/heirline.nvim")

    -- vimspector
    --use("puremourning/vimspector")
    --use("mfussenegger/nvim-dap")
    --use("theHamsta/nvim-dap-virtual-text")
    --use("rcarriga/nvim-dap-ui")
    --use("Pocco81/DAPInstall.nvim")
    --use("jbyuki/one-small-step-for-vimkind")
    --use("j-hui/fidget.nvim")

    --------------------- LSP --------------------
    use({
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    -- 补全
    use("hrsh7th/nvim-cmp")
    -- 补全源
    use({
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    })
    ---- 常见编程语言代码段
    --use("rafamadriz/friendly-snippets")
    ---- UI 增强
    use("onsails/lspkind-nvim")
    --use("tami5/lspsaga.nvim")
    ---- 代码格式化
    --use("mhartington/formatter.nvim")
    --use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    --use("mhartington/oceanic-next")
    -- gruvbox
    --use({
    --  "ellisonleao/gruvbox.nvim",
    --  requires = { "rktjmp/lush.nvim" },
    --})

    -- zephyr
    -- use("glepnir/zephyr-nvim")

    -- nord
    --use("shaunsingh/nord.nvim")

    -- onedark
    --use("ful1e5/onedark.nvim")

    -- nightfox
    --use("EdenEast/nightfox.nvim")

    -------------------------------------------------------
    if paccker_bootstrap then
        packer.sync()
    end
  end,
})
