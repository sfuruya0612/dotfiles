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

-- Global config: set git repository as root marker for all servers
vim.lsp.config("*", {
	root_markers = { ".git" },
})

-- Enable each LSP server
for _, lsp_server in ipairs(lsp_servers) do
	vim.lsp.enable(lsp_server)
end

-- conform.nvim setup (formatter)
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
		javascript = { "prettier", "biome", stop_after_first = true },
		typescript = { "prettier", "biome", stop_after_first = true },
		javascriptreact = { "prettier", "biome", stop_after_first = true },
		typescriptreact = { "prettier", "biome", stop_after_first = true },
		json = { "prettier", "biome", stop_after_first = true },
		css = { "prettier" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		go = { "gofumpt" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- nvim-lint setup (linter)
require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	json = { "jsonlint" },
	yaml = { "yamllint" },
	dockerfile = { "hadolint" },
}

-- Auto-run linter
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("lspsaga").setup({
	symbol_in_winbar = {
		separator = "  ",
	},
})
