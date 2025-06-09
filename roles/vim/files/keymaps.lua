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

-- Delete a word backwards
-- keymap("n", "dw", 'vb"_d', opts)

-- yanke to the end of line
keymap("n", "Y", "y$", opts)

-- ESC twice to clear highlights
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- move cursor
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<C-a>", "^", opts)
keymap("n", "<C-e>", "$", opts)

-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- Automatically insert a space after a comma
keymap("i", ",", ",<Space>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- 0番レジスタを使いやすくした
-- keymap("v", "<C-p>", '"0p', opts)

-- File Explorer
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "ff", ":lua require('telescope.builtin').find_files()<CR>", term_opts)
keymap("n", "fg", ":lua require('telescope.builtin').live_grep()<CR>", term_opts)
keymap("n", "fb", ":lua require('telescope.builtin').buffers()<CR>", term_opts)
keymap("n", "fh", ":lua require('telescope.builtin').help_tags()<CR>", term_opts)

-- Copilot Chat
keymap("n", "<leader>ccp", ":lua ShowCopilotChatActionPrompt()<CR>", opts)

-- Avante
-- keymap("n", "<leader>ac", ":AvanteChat<CR>", opts)
-- keymap("n", "<leader>acc", ":AvanteClear<CR>", opts)

-- Call show_documentation func
-- keymap("n", "K", ":lua show_documentation()<CR>", opts)
