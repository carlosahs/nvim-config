local KeyMaps = {}

-- keymaps with opts
function KeyMaps.noremap_opts(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function KeyMaps.nnoremap_opts(lhs, rhs, opts)
  KeyMaps.noremap_opts('n', lhs, rhs, opts)
end

function KeyMaps.tnoremap_opts(lhs, rhs, opts)
  KeyMaps.noremap_opts('t', lhs, rhs, opts)
end

-- keymaps with default opts
function KeyMaps.noremap(mode, lhs, rhs)
  KeyMaps.noremap_opts(mode, lhs, rhs, { noremap = true, silent = true })
end

function KeyMaps.nnoremap(lhs, rhs) KeyMaps.noremap('n', lhs, rhs) end
function KeyMaps.tnoremap(lhs, rhs) KeyMaps.noremap('t', lhs, rhs) end

return KeyMaps
