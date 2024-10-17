local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yml", "*.yaml", "*.ts", "*.js", "*tsx" },
  command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2"
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*tsx" },
  command = "let b:tsx_ext_found = 1"
})
