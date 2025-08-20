return {
  -- Plugin manager
  {
    "folke/lazy.nvim",
    -- TODO: :LazyExtras command not found
    -- spec = {
    --   { import = "lazyvim.plugins.extras.lang.python" },
    --   { import = "lazyvim.plugins.extras.lang.typescript" },
    --   { import = "lazyvim.plugins.extras.lang.yaml" },
    --   { import = "lazyvim.plugins.extras.ai.copilot" },
    -- },
    -- automatically check for plugin updates
    checker = { enabled = true },
  },

  -- Font
  {
    "lambdalisue/nerdfont.vim",
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
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
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.opt.termguicolors = true
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
  },

  -- Auto close parentheses
  {
    "cohama/lexima.vim",
  },

  -- 括弧ペアの色分け
  {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = 1
    end
  },

  -- インデントガイド
  {
    "nathanaelkane/vim-indent-guides",
    config = function()
      vim.g.indent_guides_enable_on_vim_startup = 1
      vim.g.indent_guides_exclude_filetypes = { 'help' }
      vim.g.indent_guides_auto_colors = 0
    end
  },

  -- Comment in/out
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  -- Claude Code
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup({
        window = {
          split_ratio = 0.4,
          position = "rightbelow vsplit",
          enter_insert = true,
          hide_numbers = true,
          hide_signcolumn = true,
        },
      })
    end
  },


  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- require("copilot").setup()
      vim.g.copilot_node_command = "/opt/homebrew/bin/node"
      vim.g.copilot_filetypes = {
        confini = false,
        -- Avante = false,
        ["*"] = true,
      }
    end,
  },

  -- GitHub Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    build = "make tiktoken",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim"
    }
  },

  -- -- Emulate cursor AI IDE
  -- {
  --   "yetone/avante.nvim",
  --   enabled = true,
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false,
  --   build = "make",
  --   opts = {
  --     provider = "copilot",
  --     -- auto_suggestions_provider = "copilot",
  --     behaviour = {
  --       auto_suggestions = false,
  --       auto_set_highlight_group = true,
  --       auto_set_keymaps = true,
  --       auto_apply_diff_after_generation = true,
  --       support_paste_from_clipboard = true,
  --     },
  --     windows = {
  --       position = "right",
  --       width = 30,
  --       sidebar_header = {
  --         align = "center",
  --         rounded = false,
  --       },
  --       ask = {
  --         floating = true,
  --         start_insert = true,
  --         border = "rounded"
  --       }
  --     },
  --     copilot = {
  --       endpoint = "https://api.githubcopilot.com",
  --       model = "gemini-2.5-pro",
  --       max_tokens = 2000000,
  --     },
  --   },
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick",         -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",              -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Open terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        size = 30,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
      }
    end
  },

  -- Git操作
  {
    "tpope/vim-fugitive",
  },

  -- Gitの変更表示
  {
    "airblade/vim-gitgutter",
  },

  -- LSP
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
    },
  },

  -- {
  --   "mason-org/mason-lspconfig.nvim",
  --   opts = {},
  --   dependencies = {
  --     { "mason-org/mason.nvim", opts = {} },
  --     "neovim/nvim-lspconfig",
  --   },
  -- },

  -- mason-null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = "Mason",
  },

  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
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
      vim.g.previm_open_cmd = 'open -a Google\\ Chrome'
    end
  },
}
