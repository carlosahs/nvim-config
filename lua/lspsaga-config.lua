local saga = require('lspsaga')

saga.init_lsp_saga()

local KeyMaps = require('utils.keymaps')
local nnoremap = KeyMaps.nnoremap

-- lsp finder
nnoremap('gh', ':Lspsaga lsp_finder<CR>')

-- hover doc
nnoremap('K', ':Lspsaga hover_doc<CR>')
nnoremap('<C-F>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
nnoremap('<C-B>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- rename
nnoremap('<Space>cn', ':Lspsaga rename<CR>')

-- diagnostics
nnoremap('<Space>sd', ':Lspsaga show_line_diagnostics<CR>')
