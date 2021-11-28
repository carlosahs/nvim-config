local KeyMaps = {}

-- easy keymaps
function noremap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function KeyMaps.nnoremap(lhs, rhs) noremap('n', lhs, rhs) end
function KeyMaps.tnoremap(lhs, rhs) noremap('t', lhs, rhs) end

return KeyMaps
