local telescope = require("telescope")

telescope.setup {
  pickers = {
    find_files = {
      theme = "ivy",
    }
  }
}

local nnoremap_opts = require("utils.keymaps").nnoremap_opts

nnoremap_opts("<Space>P", 
              "<cmd>lua require('telescope.builtin').find_files()<CR>",
              { noremap = true })
nnoremap_opts("<Space>F", 
              "<cmd>lua require('telescope.builtin').live_grep()<CR>",
              { noremap = true })
nnoremap_opts("<Space>B", 
              "<cmd>lua require('telescope.builtin').buffers()<CR>",
              { noremap = true })
