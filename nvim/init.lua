local HOME = os.getenv("HOME")

-- Set leader
vim.g.mapleader = ','

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 1

-- Create backup folder for persistent undo
local backup_dir = HOME..'/.local/share/nvim/backups'
vim.fn.mkdir(backup_dir, 'p')
vim.opt.undodir = backup_dir
vim.opt.undofile = true

-- Options
vim.opt.termguicolors = true
vim.opt.encoding = 'utf-8'
vim.opt.background = 'light'
vim.opt.cursorline = true
vim.opt.modelines = 0
vim.opt.breakindent = true
vim.opt.showbreak = '..'
vim.opt.linebreak = true
vim.opt.backup = false
vim.opt.hidden = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smartindent = true
vim.opt.ruler = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.gdefault = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.colorcolumn = '120'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.wildignore = '*.swp,*.bak,*.pyc'
vim.opt.title = true
vim.opt.comments = 's0:/*,mb:**,ex:*/,://'
vim.opt.diffopt = 'iwhite,vertical'
vim.opt.list = true
vim.opt.listchars = { tab = '>~', trail = '.', extends = '#', nbsp= '.' }
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.sidescroll = 5
vim.opt.spell = false
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 2
vim.opt.laststatus = 2
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'

-- Plugins
vim.cmd('packadd packer.nvim')
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'

  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-endwise'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-repeat'

  use 'junegunn/gv.vim'
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'junegunn/vim-slash'
  use 'junegunn/vim-peekaboo'
  use 'junegunn/vim-easy-align'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  use 'nvim-lualine/lualine.nvim'
  use 'kdheepak/tabline.nvim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-context'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
  use 'ray-x/navigator.lua'
  use 'ray-x/lsp_signature.nvim'

  use 'ggandor/leap.nvim'
  use 'j-hui/fidget.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'bogado/file-line'
  use 'kshenoy/vim-signature'
  use 'mhinz/vim-signify'
  use 'embear/vim-localvimrc'
  use 'roxma/vim-paste-easy'
  use 'rhysd/vim-clang-format'
  use 'amal-khailtash/vim-xdc-syntax'

  use 'NLKNguyen/papercolor-theme'
end)

-- Colors
vim.cmd('colorscheme PaperColor')

-- Functions
function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Config
require('leap').add_default_mappings()
require('nvim-web-devicons').setup{}
require('tabline').setup{}
require('nvim-tree').setup{}
require('nvim-treesitter.configs').setup{}
require('treesitter-context').setup{}
require('telescope').setup{}
require('guihua.maps').setup{}
require('navigator').setup{}
require('lsp_signature').setup{}
require('fidget').setup{}
require('indent_blankline').setup{}

require('cmp').setup{
  snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end },
  sources = { { name = 'nvim_lsp' }, { name = 'vsnip' } }
}

require('lualine').setup{
  options = {
    theme = 'PaperColor',
    section_separators = '',
    component_separators = ''
  }
}

require('tabline').setup{
  options = {
    section_separators = {'', ''},
    component_separators = {'', ''}
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig').verible.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'verible-verilog-ls', '--rules_config_search=true' }
}

-- EasyAlign
vim.cmd([[
let g:easy_align_delimiters = {
\ '(': {
\     'pattern': '(',
\     'left_margin': 1,
\     'right_margin': 0
\   }
\ }
]])

-- Goyo
vim.g.goyo_width = 120
vim.g.goyo_height = '100%'
vim.g.goyo_linenr = 1

-- Highlights
vim.fn.matchadd('Todo', 'TODO:\\?')
vim.fn.matchadd('Todo', 'FIXME:\\?')
vim.fn.matchadd('Todo', 'DEBUG:\\?')
vim.fn.matchadd('Todo', 'NOTES\\?:\\?')
vim.fn.matchadd('ErrorMsg', '^\\(<\\|=\\|>\\)\\{7\\}\\([^=].\\+\\)\\?$') -- git changes

-- Autocmds
vim.api.nvim_create_autocmd({'BufWritePre'}, {command = ':%s/\\s\\+$//e'}) -- trim whitespace
vim.api.nvim_create_autocmd({'BufEnter'}, {command = 'if (winnr("$") == 1 && &buftype == "quickfix") | q | endif'})

-- Key mapping
keymap('n', '<space>e', vim.diagnostic.open_float)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<space>q', vim.diagnostic.setloclist)

keymap('n', '<C-N>', ':NvimTreeToggle<CR>')
keymap('n', '<C-M-N>', ':NvimTreeFindFileToggle<CR>')

keymap('n', '<tab>', ':b#<CR>')
keymap('n', '<C-L>', ':bnext<CR>')
keymap('n', '<C-H>', ':bprevious<CR>')
keymap('n', '<C-Q>', ':bdelete<CR>')
keymap('n', '<C-W><C-J>', ':exe "resize +5"<CR>')
keymap('n', '<C-W><C-K>', ':exe "resize -5"<CR>')
keymap('n', '<C-W><C-L>', ':exe "vertical resize +5"<CR>')
keymap('n', '<C-W><C-H>', ':exe "vertical resize -5"<CR>')

keymap({'n', 'x'}, 'gea', ':EasyAlign')

keymap('t', '<leader>e', '<C-\\><C-n>')

keymap('n', '<leader>k', function() vim.lsp.buf.signature_help() end)

keymap('n', '<C-P>', require('telescope.builtin').git_files)
keymap('n', '<leader>ff', require('telescope.builtin').find_files)
keymap('n', '<leader>fg', require('telescope.builtin').live_grep)
keymap('n', '<leader>fb', require('telescope.builtin').buffers)
keymap('n', '<leader>fh', require('telescope.builtin').help_tags)
keymap('n', '<leader>fm', require('telescope.builtin').marks)
keymap('n', '<leader>fl', require('telescope.builtin').current_buffer_fuzzy_find)
keymap('n', '<leader>fh', require('telescope.builtin').oldfiles)
