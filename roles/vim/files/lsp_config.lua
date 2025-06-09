local lsp_servers = {
	"lua_ls",
	"vimls",
	"ruff",
	"biome",
	"ts_ls",
	"markdown_oxide",
	"mdx_analyzer",
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
}

local formatters = {
	"stylua",
	"prettier",
	"ruff_format",
	"biome",
	"shfmt",
	"gofumpt",
	"terraform_fmt",
}

local diagnostics = {
	"ruff",
	"eslint_d",
	"tsserver",
	"jsonlint",
	"yamllint",
	"dockerfile_lint",
	"bashate",
	"golangci_lint",
	"terraform_validate",
	"elixir_ls",
}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
})

local lsp_config = require("lspconfig")
for _, lsp_server in ipairs(lsp_servers) do
	lsp_config[lsp_server].setup({
		root_dir = function(fname)
			return lsp_config.util.find_git_ancestor(fname) or vim.fn.getcwd()
		end,
	})
end

require("mason-null-ls").setup({
	automatic_setup = true,
	ensure_installed = vim.tbl_flatten({ formatters, diagnostics }),
	handlers = {},
})

local null_ls = require("null-ls")
local formatting_sources = {}
for _, tool in ipairs(formatters) do
	table.insert(formatting_sources, null_ls.builtins.formatting[tool])
end

local diagnostics_sources = {}
for _, tool in ipairs(diagnostics) do
	table.insert(diagnostics_sources, null_ls.builtins.diagnostics[tool])
end

null_ls.setup({
	diagnostics_format = "[#{m}] #{s} (#{c})",
	sources = vim.tbl_flatten({ formatting_sources, diagnostics_sources }),
})

require("lspsaga").setup({
	symbol_in_winbar = {
		separator = "  ",
	},
})
