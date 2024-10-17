vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"

vim.wo.number = true

-- Setting providers
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/opt/homebrew/bin/python3.13"
vim.g.node_host_prog = "/opt/homebrew/bin/neovim-node-host"

function _G.show_documentation()
  if vim.tbl_contains({ "vim", "help" }, vim.bo.filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  else
    vim.fn["CocAction"]("doHover")
  end
end
