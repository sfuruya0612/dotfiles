local dein_dir = vim.fn.expand("~/.vim/cache")
local dein_repo_dir = dein_dir .. "/repos/github.com/Shougo/dein.vim"

if vim.fn.has("nvim") == 1 then
  dein_dir = vim.fn.expand("~/.config/nvim/cache")
end

if not string.find(vim.o.runtimepath, "/dein.vim") then
  if vim.fn.isdirectory(dein_repo_dir) == 0 then
    vim.fn.system({ "git", "clone", "https://github.com/Shougo/dein.vim", dein_repo_dir })
  end
  vim.o.runtimepath = dein_repo_dir .. "," .. vim.o.runtimepath
end

if vim.fn["dein#load_state"](dein_dir) == 1 then
  vim.fn["dein#begin"](dein_dir)
  vim.g.dein_plugin_dir = vim.fn.expand("~/.config/nvim")
  -- vim.fn["dein#add"]("EdenEast/nightfox.nvim")
  vim.fn["dein#load_toml"](vim.g.dein_plugin_dir .. "/dein.toml", { lazy = 0 })
  vim.fn["dein#load_toml"](vim.g.dein_plugin_dir .. "/dein_lazy.toml", { lazy = 1 })
  vim.fn["dein#end"]()
  vim.fn["dein#save_state"]()
end

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

if vim.fn["dein#check_install"]() == 1 then
  vim.fn["dein#install"]()
end
