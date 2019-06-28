" Create backup folder for persistent undo
silent !mkdir -p ~/.config/nvim/backups

" Options
set termguicolors
set undodir=~/.config/nvim/backups
set undofile
set encoding=utf-8
set background=dark
set hidden
set cursorline
set modelines=0
set nobackup
set nowritebackup
set noswapfile
set wrap
set history=9999
set undolevels=9999
set number
set numberwidth=5
set autoindent
set copyindent
set smartindent
set ruler
set incsearch
set hlsearch
set autoread
set visualbell
set noerrorbells
set showmatch
set showcmd
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set backspace=indent,eol,start
set expandtab
set nosmarttab
"set textwidth=120
set colorcolumn=120
set ignorecase
set smartcase
set splitright
set wildignore=*.swp,*.bak,*.pyc
set pastetoggle=<F2>
set title
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set scrolloff=3
set sidescrolloff=5
set sidescroll=5
set nospell
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set signcolumn=yes
set clipboard+=unnamedplus
"set iskeyword-=_
"set mouse=a
set statusline=%<\ %n:%f\ %m%r
set statusline+=%#warningmsg#%{fugitive#statusline()}%*
set statusline+=%=line:\ %l\/%L,\ col:\ %c%V\ (%P)\ 0x%B

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'plasticboy/vim-markdown'
Plug 'lyuts/vim-rtags'
Plug 'elzr/vim-json'
Plug 'moll/vim-bbye'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'skielbasa/vim-material-monokai'
Plug 'thaerkh/vim-indentguides'
Plug 'wltr/systemverilog.vim'
Plug 'rhysd/vim-clang-format'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'tweekmonster/deoplete-clang2'

call plug#end()

" Colors
colorscheme material-monokai

" Trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Read external file changes
autocmd BufEnter,FocusGained,CursorHold,CursorHoldI * :checktime

" Close if quickfix is the last window
autocmd BufEnter * if (winnr('$') == 1 && &buftype == 'quickfix') | q | endif

" Close if NERDTree is the last window
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

" Use tabs with Makefiles
autocmd FileType make setlocal noexpandtab

" Don't use Tagbar with VHDL
autocmd FileType vhdl let b:tagbar_ignore = 1

" Highlight todos
"call matchadd('Todo', '\s\+$')
call matchadd('Todo', 'TODO')
call matchadd('Todo', 'TODO:')
call matchadd('Todo', 'FIXME')
call matchadd('Todo', 'FIXME:')
call matchadd('Todo', 'DEBUG')
call matchadd('Todo', 'DEBUG:')
call matchadd('Todo', 'NOTE')
call matchadd('Todo', 'NOTE:')
call matchadd('Todo', 'NOTES')
call matchadd('Todo', 'NOTES:')

" Define new leader key
let mapleader = ','

" File explorer style
let g:netrw_liststyle = 1

" Airline
let g:airline_theme = 'materialmonokai'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

" Goyo
let g:goyo_width = 120
let g:goyo_height = '100%'

" Use Rg for Ctrl-P
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
endif

" Use Rg instead of Ack
let g:ackprg = 'rg --vimgrep --no-heading'
cnoreabbrev rg Ack

" Misc
let g:NERDTreeWinSize = 40
let g:tagbar_width = 40
let g:vim_json_syntax_conceal = 0
let g:deoplete#enable_at_startup = 1

" EasyMotion highlighting
hi link EasyMotionTarget2First Number
hi link EasyMotionTarget2Second Number

" Use ii instead of ESC
imap ii <Esc>

" Increment and decrement numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Buffer navigation
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprevious<CR>

" Buffer resizing
nnoremap <C-W><C-K> :exe "resize +5"<CR>
nnoremap <C-W><C-J> :exe "resize -5"<CR>
nnoremap <C-W><C-L> :exe "vertical resize +5"<CR>
nnoremap <C-W><C-H> :exe "vertical resize -5"<CR>

" Close buffer without closing window
nnoremap <C-X> :Bdelete<CR>

" Go to last buffer
nnoremap <tab> :b#<CR>

" Use ctags with Ctrl-P
nnoremap <leader>. :CtrlPTag<CR>

" Use tjump with Ctrl-P
nnoremap <C-]> :CtrlPtjump<CR>
vnoremap <C-]> :CtrlPtjumpVisual<CR>

" Use current search for Ack
nnoremap <leader>8 :AckFromSearch!<CR>

" Toggle NERD Tree
nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <C-M-N> :NERDTreeFind<CR>

" Toggle TagBar
nnoremap <C-M-M> :TagbarToggle<CR>

" EasyAlign
xnoremap ga :EasyAlign
nnoremap ga :EasyAlign

" Exit terminal mode
if has('nvim')
  tnoremap <leader>e <C-\><C-n>
endif
