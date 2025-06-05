require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


require("mason-lspconfig").setup({
  ensure_installed = {
    "vimls",
    "ruff",
    "biome",
    "ts_ls",
    "markdown_oxide",
    "mdx_analyzer",
    "lua_ls",
    "jsonls",
    "jsonnet_ls",
    "yamlls",
    "dockerls",
    "bashls",
    "golangci_lint_ls",
    "gopls",
    "terraformls",
    "rust_analyzer",
    "elixirls",
    -- "erlangls"
  }
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

require("lspconfig").vimls.setup()
require("lspconfig").ruff.setup()
require("lspconfig").biome.setup()
require("lspconfig").ts_ls.setup()
require("lspconfig").markdown_oxide.setup()
require("lspconfig").mdx_analyzer.setup()
require("lspconfig").jsonls.setup()
require("lspconfig").jsonnet_ls.setup()
require("lspconfig").yamlls.setup()
require("lspconfig").dockerls.setup()
require("lspconfig").bashls.setup()
require("lspconfig").golangci_lint_ls.setup()
require("lspconfig").gopls.setup()
require("lspconfig").terraformls.setup()
require("lspconfig").rust_analyzer.setup()
require("lspconfig").elixirls.setup()

