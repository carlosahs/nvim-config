call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mfussenegger/nvim-jdtls'

Plug 'ryanoasis/vim-devicons'

call plug#end()

lua << EOF
  local nvim_lsp = require('lspconfig')
  
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    local opts = { noremap=true, silent=true }
  
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  
  end
  
  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'pyright', 'clangd', 'texlab' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = '...' },
      ...
    }
  })
EOF


" Color scheme setup
set background=dark

if has("termguicolors")
  set termguicolors
endif

colorscheme nord

" lightline setup
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }

" General setup
let mapleader = " "
set number
set splitbelow
set splitright

" Navigation setup
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

nnoremap <Leader>fp :prev<CR>
nnoremap <Leader>fn :n<CR>
nnoremap <Leader>fa :args<CR>

" Terminal setup
tnoremap <Esc> <C-\><C-n>

tnoremap <C-Space>h <C-\><C-N><C-w>h
tnoremap <C-Space>j <C-\><C-N><C-w>j
tnoremap <C-Space>k <C-\><C-N><C-w>k
tnoremap <C-Space>l <C-\><C-N><C-w>l
inoremap <C-Space>h <C-\><C-N><C-w>h
inoremap <C-Space>j <C-\><C-N><C-w>j
inoremap <C-Space>k <C-\><C-N><C-w>k
inoremap <C-Space>l <C-\><C-N><C-w>l
nnoremap <C-Space>h <C-w>h
nnoremap <C-Space>j <C-w>j
nnoremap <C-Space>k <C-w>k
nnoremap <C-Space>l <C-w>l

autocmd Bufenter term://* startinsert
autocmd TermOpen * setlocal nonumber norelativenumber

" " NERDTree setup
" let g:NERDTreeDirArrowExpandable = '-'
" let g:NERDTreeDirArrowCollapsible = '|'
" 
" nnoremap <Leader>tF :NERDTreeFocus<CR>
" nnoremap <Leader>tn :NERDTree<CR>
" nnoremap <Leader>tt :NERDTreeToggle<CR>
" nnoremap <Leader>tf :NERDTreeFind<CR>

" vim-vsnip setup
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
