local backup_dir = vim.fn.stdpath('data')..'/backups'
vim.fn.mkdir(backup_dir, 'p')

vim.opt.undodir = backup_dir
vim.opt.undofile = true
vim.opt.undolevels = 9999

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.backspace = { 'eol', 'indent', 'start' }
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.breakindentopt = 'sbr'
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '120'
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }
vim.opt.conceallevel = 0
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.diffopt = { 'iwhite', 'vertical' }
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.foldenable = false
vim.opt.foldlevel = 2
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 10
vim.opt.gdefault = true
vim.opt.hidden = false
vim.opt.history = 9999
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = '>-', trail = '.', extends = '#', nbsp= '.' }
vim.opt.modelines = 0
vim.opt.mps = '(:),{:},[:],<:>'
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showbreak = '..'
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showtabline = 2
vim.opt.sidescroll = 5
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = false
vim.opt.softtabstop = 2
vim.opt.spell = false
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.visualbell = true
vim.opt.wildignore = { '*.swp', '*.bak', '*.pyc' }
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest:full'
vim.opt.wrap = true
vim.opt.writebackup = false
