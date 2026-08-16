return {
	-- Font
	{
		"lambdalisue/nerdfont.vim",
		event = "VeryLazy",
	},

	-- Colorscheme
	{
		"folke/tokyonight.nvim",
		-- make sure we load this during startup if it is your main colorscheme
		lazy = false,
		-- make sure to load this before all the other start plugins
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
		keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
		},
		config = function()
			require("nvim-tree").setup()
			vim.opt.termguicolors = true
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},

	-- Auto close parentheses
	{
		"cohama/lexima.vim",
		event = "InsertEnter",
	},

	-- 括弧ペアの色分け
	{
		"luochen1990/rainbow",
		event = "BufReadPre",
		config = function()
			vim.g.rainbow_active = 1
		end,
	},

	-- インデントガイド
	{
		"nathanaelkane/vim-indent-guides",
		event = "BufReadPre",
		config = function()
			vim.g.indent_guides_enable_on_vim_startup = 1
			vim.g.indent_guides_exclude_filetypes = { "help" }
			vim.g.indent_guides_auto_colors = 0
		end,
	},

	-- Comment in/out
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.g.copilot_node_command = "/opt/homebrew/bin/node"
			vim.g.copilot_filetypes = {
				confini = false,
				["*"] = true,
			}
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
			{ "fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-s>"] = require("telescope.actions").file_split,
							["<C-v>"] = require("telescope.actions").file_vsplit,
						},
					},
				},
			})
		end,
	},

	-- Open terminal
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ [[<c-\>]], desc = "Toggle terminal" },
		},
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require("toggleterm").setup({
				size = 30,
				open_mapping = [[<c-\>]],
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 1,
				start_in_insert = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
			})
		end,
	},

	-- Git操作
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},

	-- Gitの変更表示
	{
		"airblade/vim-gitgutter",
		event = "BufReadPre",
	},

	-- LSP
	{
		"mason-org/mason.nvim",
		event = "BufReadPre",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
	},

	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- lspsaga
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufRead", "BufNewFile" },
	},

	-- Markdown Preview
	{
		"kannokanno/previm",
		ft = { "markdown", "md" },
		config = function()
			vim.cmd([[autocmd BufRead,BufNewFile *.md set filetype=markdown]])
			vim.g.previm_open_cmd = "open -a Google\\ Chrome"
		end,
	},

	-- Marp
	{
		"nwiizo/marp.nvim",
		ft = { "markdown", "md" },
		config = function()
			require("marp").setup({
				marp_command = "npx @marp-team/marp-cli@latest",
				debug = false,
				server_mode = false,
			})
		end,
	},
}
