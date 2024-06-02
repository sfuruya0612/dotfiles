local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- new tab
keymap("n", "gn", ":tabnew<Return>", opts)
-- move tab
keymap("n", "gh", "gT", opts)
-- keymap("n", "gl", "gt", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- Delete a word backwards
-- keymap("n", "dw", 'vb"_d', opts)

-- 行末までのヤンクにする
keymap("n", "Y", "y$", opts)

-- ESC*2 でハイライトやめる
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- move cursor
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<C-a>", "^", opts)
keymap("n", "<C-e>", "$", opts)

-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- コンマの後に自動的にスペースを挿入
keymap("i", ",", ",<Space>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- 0番レジスタを使いやすくした
keymap("v", "<C-p>", '"0p', opts)

-- Coc.nvim
keymap("n", "<C-n>", ":CocCommand explorer --root-strategies keep<CR>", opts)
keymap("n", "gd", "<Plug>(coc-definition)", {})
keymap("n", "gy", "<Plug>(coc-type-definition)", {})
keymap("n", "gi", "<Plug>(coc-implementation)", {})
keymap("n", "gr", "<Plug>(coc-references)", {})

-- Telescope
keymap("n", "ff", ":lua require('telescope.builtin').find_files()<CR>", term_opts)
keymap("n", "fg", ":lua require('telescope.builtin').live_grep()<CR>", term_opts)
keymap("n", "fb", ":lua require('telescope.builtin').buffers()<CR>", term_opts)
keymap("n", "fh", ":lua require('telescope.builtin').help_tags()<CR>", term_opts)

-- Call show_documentation func
keymap("n", "K", ":lua show_documentation()<CR>", opts)
