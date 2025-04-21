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
      vim.g.indent_guides_exclude_filetypes = { 'help', 'coc-explorer' }
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

  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      require("copilot").setup({})
      vim.g.copilot_node_command = "/opt/homebrew/bin/node"
      vim.g.copilot_filetypes = {
        confini = false,
        Avante = false,
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

  -- Emulate cursor AI IDE
  {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    opts = {
      provider = "copilot",
      -- auto_suggestions_provider = "copilot",
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = true,
        support_paste_from_clipboard = true,
      },
      windows = {
        position = "right",
        width = 30,
        sidebar_header = {
          align = "center",
          rounded = false,
        },
        ask = {
          floating = true,
          start_insert = true,
          border = "rounded"
        }
      },
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gemini-2.5-pro",
        max_tokens = 2000000,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

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
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.opt.hidden = true
      vim.opt.backup = false
      vim.opt.writebackup = false
      vim.opt.cmdheight = 2

      vim.g.coc_global_extensions = {
        'coc-lists',
        'coc-git',
        'coc-explorer',
        'coc-snippets',
        'coc-json',
        'coc-yaml',
        'coc-elixir',
        'coc-go',
        'coc-rls',
        'coc-docker',
        'coc-markdownlint',
        'coc-prettier',
        'coc-tsserver',
        'coc-diagnostic',
        'coc-vimlsp',
        'coc-lua',
        'coc-sh',
        'coc-biome',
        '@yaegassy/coc-ruff',
        'coc-phpls',
      }
    end
  },

  -- Go言語
  {
    "fatih/vim-go",
    ft = { "go" },
    config = function()
      vim.cmd([[autocmd FileType go set autowrite]])

      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_methods = 1
      vim.g.go_highlight_structs = 1
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_variable_declarations = 1
      vim.g.go_highlight_variable_assignments = 0
      vim.g.go_highlight_string_spellcheck = 1
      vim.g.go_highlight_types = 1
      vim.g.go_highlight_function_parameters = 1
      vim.g.go_highlight_extra_types = 1

      vim.g.go_list_type = "quickfix"
      vim.g.go_fmt_command = "goimports"
      vim.g.go_metalinter_autosave = 1
      vim.g.go_metalinter_autosave_enabled = { "golint" }
      vim.g.go_term_mode = "split"
      vim.g.go_addtags_transform = "camelcase"
      vim.g.go_auto_type_info = 1

      vim.cmd([[autocmd FileType go set updatetime=100]])

      vim.g.go_play_open_browser = 0
      vim.g.go_auto_sameids = 1
    end
  },

  -- YAML
  {
    "stephpy/vim-yaml",
    ft = { "yml", "yaml" }
  },

  -- JavaScript
  {
    "pangloss/vim-javascript",
    ft = { "javascript", "javascript.jsx" }
  },

  {
    "maxmellon/vim-jsx-pretty",
    ft = { "javascript", "javascript.jsx" }
  },

  -- JSON
  {
    "elzr/vim-json",
    ft = { "json" },
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end
  },

  {
    "rhysd/vim-fixjson",
    ft = { "json" }
  },

  -- Markdown
  {
    "rcmdnk/vim-markdown",
    ft = { "markdown", "md" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_codeblock_syntax = 0
    end
  },

  {
    "kannokanno/previm",
    ft = { "markdown", "md" },
    config = function()
      vim.cmd([[autocmd BufRead,BufNewFile *.md set filetype=markdown]])
      vim.g.previm_open_cmd = 'open -a Google\\ Chrome'
    end
  },

  -- Erlang
  {
    "vim-erlang/vim-erlang-runtime",
    ft = { "erlang" }
  },

  {
    "vim-erlang/vim-erlang-compiler",
    ft = { "erlang" }
  },

  {
    "vim-erlang/vim-erlang-tags",
    ft = { "erlang" }
  },

  {
    "vim-erlang/vim-erlang-omnicomplete",
    ft = { "erlang" }
  },

  -- Elixir
  {
    "elixir-editors/vim-elixir",
    ft = { "elixir" }
  },

  -- Rust
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    config = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rust_clip_command = 'pbcopy'
    end
  },

  -- Terraform
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "tf", "hcl" },
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 1
    end
  },

  -- Jsonnet
  {
    "google/vim-jsonnet",
    ft = { "jsonnet" }
  },
}
