vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"

vim.wo.number = true

-- Disable unused providers for faster startup
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Set provider paths
vim.g.python3_host_prog = "/opt/homebrew/bin/python3.13"
vim.g.node_host_prog = "/opt/homebrew/bin/neovim-node-host"
