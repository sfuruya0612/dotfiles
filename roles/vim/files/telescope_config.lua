require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = require('telescope.actions').file_split,
        ["<C-v>"] = require('telescope.actions').file_vsplit
      }
    }
  }
}
